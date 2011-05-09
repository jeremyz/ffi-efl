#! /bin/bash
#
P=$(dirname $0)
#
[ $# -gt 0 -a "$1" == "-x" ] && SMASH="Yes"
#
CURRENT=$P/api
PREV=$P/api-prev
INCLUDE=$(pkg-config --variable=includedir ecore)
#
if [ ! -d $CURRENT ]; then
    mkdir $CURRENT
elif [ "$SMASH" == "Yes" ]; then
    rm -fr $PREV *-diff 2>/dev/null
    mv $CURRENT $PREV && mkdir $CURRENT || exit 1
else
    echo "no -x argument, won't override previous data"
fi
[ ! -d $PREV ] && mkdir $PREV
#
for header in \
    "${INCLUDE}/eina-1/eina/eina_types.h" \
    "${INCLUDE}/eina-1/eina/eina_main.h" \
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
    for what in functions enums types callbacks; do
        F=$FILE-$what
        cat $header | sed -r -n -f $P/sed-$what > $CURRENT/$F
        if [ -f $PREV/$F ]; then
            diff -u0 $PREV/$F $CURRENT/$F > $P/$F-diff
            N=$(cat $P/$F-diff | wc -l)
            [ $N -eq 0 ] && rm $P/$F-diff || echo "see $P/$F-diff"
        fi
    done
    #
done
