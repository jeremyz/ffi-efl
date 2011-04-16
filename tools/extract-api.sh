#! /bin/bash
#
# TODO : use pkg-config
#
INCLUDE=$(pkg-config --libs ecore |gawk '{ print substr($1,3) }' | sed s/lib/include/)
#
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
    [ -f $FILE ] && mv $FILE $FILE.prev
    #
    cat $header | sed -n -f sed-functions > $FILE
    cat $header | sed -r -n -f sed-enums > $FILE-enum
    cat $header | sed -r -n -f sed-structs > $FILE-structs
    #
    if [ -f $FILE.prev ]; then
        diff -u0 $FILE.prev $FILE > $FILE-diff
        N=$(cat $FILE-diff | wc -l)
        [ $N -eq 0 ] && rm $FILE-diff
    fi
    #
done
