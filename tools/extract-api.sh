#! /bin/bash
#
P=$(dirname $0)
#
[ $# -gt 0 -a "$1" == "-x" ] && SMASH="Yes"
#
CURRENT=$P/api
PREV=$P/api-prev
NEXT=$P/api-next
INCLUDE=$(pkg-config --variable=includedir ecore)
#
[ ! -d $NEXT ] && mkdir $NEXT
[ ! -d $PREV ] && mkdir $PREV
[ ! -d $CURRENT ] && mkdir $CURRENT
#
rm *-diff 2>/dev/null
#
if [ "$SMASH" == "Yes" ]; then
    rm -fr $PREV &&  cp -R $CURRENT $PREV || exit 1
else
    PREV=$CURRENT
    echo "no -x argument, won't override previous data"
    echo "new api will be stored in $NEXT"
fi
#
for header in \
    "${INCLUDE}/eina-1/eina/eina_types.h" \
    "${INCLUDE}/eina-1/eina/eina_main.h" \
    "${INCLUDE}/eina-1/eina/eina_log.h" \
    "${INCLUDE}/eina-1/eina/eina_list.h" \
    "${INCLUDE}/eina-1/eina/eina_hash.h" \
    "${INCLUDE}/eet-1/Eet.h" \
    "${INCLUDE}/edje-1/Edje.h" \
    "${INCLUDE}/evas-1/Evas.h" \
    "${INCLUDE}/evas-1/Evas_GL.h" \
    "${INCLUDE}/ecore-1/Ecore.h" \
    "${INCLUDE}/ecore-1/Ecore_Con.h" \
    "${INCLUDE}/ecore-1/Ecore_Input.h" \
    "${INCLUDE}/ecore-1/Ecore_Getopt.h" \
    "${INCLUDE}/ecore-1/Ecore_Evas.h" \
    "${INCLUDE}/ecore-1/Ecore_Fb.h" \
    "${INCLUDE}/ecore-1/Ecore_File.h" \
    "${INCLUDE}/elementary-0/Elementary.h" \
    ; do
    #
    if [ ! -e "$header" ]; then
        echo "$header not found, we won't generate bindings for this header."
    continue
    fi
    #
    DIR=$(dirname $header)
    FILE=$(basename $header)
    #
    for what in functions enums types callbacks variables; do
        F=$FILE-$what
        cat $header | sed -r -n -f $P/sed-$what > $NEXT/$F
        if [ -f $PREV/$F ]; then
            diff -u0 $PREV/$F $NEXT/$F > $P/$F-diff
            N=$(cat $P/$F-diff | wc -l)
            [ $N -eq 0 ] && rm $P/$F-diff || echo "see $P/$F-diff"
        fi
    done
    #
done
#
if [ "$SMASH" == "Yes" ]; then
    rm -fr $CURRENT && mv $NEXT $CURRENT || exit 1
fi
