#! /bin/bash
#
CURRENT=$(dirname $0)/api
PREV=$(dirname $0)/api-prev
INCLUDE=$(pkg-config --libs ecore |gawk '{ print substr($1,3) }' | sed s/lib/include/)
#
[ ! -d $PREV ] && mkdir $PREV
[ ! -d $CURRENT ] && mkdir $CURRENT
rm *-diff 2>/dev/null
#
for header in \
    "${INCLUDE}/eet-1/Eet.h" \
    "${INCLUDE}/edje-1/Edje.h" \
    "${INCLUDE}/evas-1/Evas.h" \
    "${INCLUDE}/evas-1/Evas_GL.h" \
    "${INCLUDE}/ecore-1/Ecore.h" \
    "${INCLUDE}/ecore-1/Ecore_Con.h" \
    "${INCLUDE}/ecore-1/Ecore_Evas.h" \
    "${INCLUDE}/ecore-1/Ecore_Fb.h" \
    "${INCLUDE}/ecore-1/Ecore_File.h" \
    "${INCLUDE}/elementary-0/Elementary.h" \
    ; do
    #
    DIR=$(dirname $header)
    FILE=$(basename $header)
    #
    mv $CURRENT/$FILE-* $PREV/ 2>/dev/null
    #
    for what in functions enums structs callbacks; do
        cat $header | sed -r -n -f sed-$what > $CURRENT/$FILE-$what
    done
    #
    for F in $FILE-funcs $FILE-enums $FILE-structs ; do
        if [ -f $PREV/$F ]; then
            diff -u0 $PREV/$F $CURRENT/$F > $F-diff
            N=$(cat $F-diff | wc -l)
            [ $N -eq 0 ] && rm $F-diff
        fi
    done
    #
done
