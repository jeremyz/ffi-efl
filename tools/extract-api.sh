#! /bin/bash

for header in \
    '/opt/e17/include/eet-1/Eet.h' \
    '/opt/e17/include/edje-1/Edje.h' \
    '/opt/e17/include/evas-1/Evas.h' \
    '/opt/e17/include/evas-1/Evas_GL.h' \
    '/opt/e17/include/ecore-1/Ecore.h' \
    '/opt/e17/include/ecore-1/Ecore_Con.h' \
    '/opt/e17/include/ecore-1/Ecore_Evas.h' \
    '/opt/e17/include/ecore-1/Ecore_Fb.h' \
    '/opt/e17/include/ecore-1/Ecore_File.h' \
    '/opt/e17/include/elementary-0/Elementary.h' \
    ; do
    #
    DIR=$(dirname $header)
    FILE=$(basename $header)
    #
    [ -f $FILE-diff ] && rm $FILE-diff
    [ -f $FILE ] && mv $FILE $FILE.prev
    # loop1 : fix EAPI with return type on separate line
    # loop2 : fix EAPI with multilines arguments
    cat $header | sed -ne ':loop1;/EAPI.*[^;]$/N;s/\n//;s/ \{2,\}/ /g;t loop1;' -e ':loop2;/,$/N;s/,\n/ /;s/ \{2,\}/ /g;t loop2;' -e 's/^ *EAPI/EAPI/p' > $FILE
    # sed  -r 's/EAPI ([a-zA-Z][a-zA-Z_ ]*[a-zA-Z]( \*+ ?| ))([a-z[a-z_0-9]*[a-z]) ?\(([a-zA-Z0-9_ \*,\.]+)\) */#\1#\3#\4#/' > $FILE
    #
    if [ -f $FILE.prev ]; then
        diff -u0 $FILE.prev $FILE > $FILE-diff
        N=$(cat $FILE-diff | wc -l)
        [ $N -eq 0 ] && rm $FILE-diff
    fi
    #
done
