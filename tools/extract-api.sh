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
    "${INCLUDE}/eina-1/eina/eina_xattr.h" \
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
    "${INCLUDE}/EMap.h" \
    "${INCLUDE}/elementary-0/Elementary.h" \
    "${INCLUDE}/elementary-0/elm_general.h" \
    "${INCLUDE}/elementary-0/elm_tooltip.h" \
    "${INCLUDE}/elementary-0/elm_object.h" \
    "${INCLUDE}/elementary-0/elm_object_item.h" \
    "${INCLUDE}/elementary-0/elc_ctxpopup.h" \
    "${INCLUDE}/elementary-0/elc_fileselector_button.h" \
    "${INCLUDE}/elementary-0/elc_fileselector_entry.h" \
    "${INCLUDE}/elementary-0/elc_fileselector.h" \
    "${INCLUDE}/elementary-0/elc_hoversel.h" \
    "${INCLUDE}/elementary-0/elc_multibuttonentry.h" \
    "${INCLUDE}/elementary-0/elc_naviframe.h" \
    "${INCLUDE}/elementary-0/elm_actionslider.h" \
    "${INCLUDE}/elementary-0/elm_app.h" \
    "${INCLUDE}/elementary-0/elm_authors.h" \
    "${INCLUDE}/elementary-0/elm_bg.h" \
    "${INCLUDE}/elementary-0/elm_box.h" \
    "${INCLUDE}/elementary-0/elm_bubble.h" \
    "${INCLUDE}/elementary-0/elm_button.h" \
    "${INCLUDE}/elementary-0/elm_cache.h" \
    "${INCLUDE}/elementary-0/elm_calendar.h" \
    "${INCLUDE}/elementary-0/elm_check.h" \
    "${INCLUDE}/elementary-0/elm_clock.h" \
    "${INCLUDE}/elementary-0/elm_cnp.h" \
    "${INCLUDE}/elementary-0/elm_colorselector.h" \
    "${INCLUDE}/elementary-0/elm_config.h" \
    "${INCLUDE}/elementary-0/elm_conform.h" \
    "${INCLUDE}/elementary-0/elm_cursor.h" \
    "${INCLUDE}/elementary-0/elm_debug.h" \
    "${INCLUDE}/elementary-0/elm_diskselector.h" \
    "${INCLUDE}/elementary-0/elm_engine.h" \
    "${INCLUDE}/elementary-0/elm_entry.h" \
    "${INCLUDE}/elementary-0/elm_factory.h" \
    "${INCLUDE}/elementary-0/elm_finger.h" \
    "${INCLUDE}/elementary-0/elm_flip.h" \
    "${INCLUDE}/elementary-0/elm_flipselector.h" \
    "${INCLUDE}/elementary-0/elm_focus.h" \
    "${INCLUDE}/elementary-0/elm_fonts.h" \
    "${INCLUDE}/elementary-0/elm_frame.h" \
    "${INCLUDE}/elementary-0/elm_gengrid.h" \
    "${INCLUDE}/elementary-0/elm_genlist.h" \
    "${INCLUDE}/elementary-0/elm_gesture_layer.h" \
    "${INCLUDE}/elementary-0/elm_getting_started.h" \
    "${INCLUDE}/elementary-0/elm_glview.h" \
    "${INCLUDE}/elementary-0/elm_grid.h" \
    "${INCLUDE}/elementary-0/elm_hover.h" \
    "${INCLUDE}/elementary-0/elm_icon.h" \
    "${INCLUDE}/elementary-0/elm_image.h" \
    "${INCLUDE}/elementary-0/elm_index.h" \
    "${INCLUDE}/elementary-0/elm_intro.h" \
    "${INCLUDE}/elementary-0/elm_label.h" \
    "${INCLUDE}/elementary-0/elm_layout.h" \
    "${INCLUDE}/elementary-0/elm_list.h" \
    "${INCLUDE}/elementary-0/elm_mapbuf.h" \
    "${INCLUDE}/elementary-0/elm_map.h" \
    "${INCLUDE}/elementary-0/elm_menu.h" \
    "${INCLUDE}/elementary-0/elm_mirroring.h" \
    "${INCLUDE}/elementary-0/elm_need.h" \
    "${INCLUDE}/elementary-0/elm_notify.h" \
    "${INCLUDE}/elementary-0/elm_pager.h" \
    "${INCLUDE}/elementary-0/elm_panel.h" \
    "${INCLUDE}/elementary-0/elm_panes.h" \
    "${INCLUDE}/elementary-0/elm_password.h" \
    "${INCLUDE}/elementary-0/elm_photocam.h" \
    "${INCLUDE}/elementary-0/elm_photo.h" \
    "${INCLUDE}/elementary-0/elm_plug.h" \
    "${INCLUDE}/elementary-0/elm_progressbar.h" \
    "${INCLUDE}/elementary-0/elm_radio.h" \
    "${INCLUDE}/elementary-0/elm_route.h" \
    "${INCLUDE}/elementary-0/elm_scale.h" \
    "${INCLUDE}/elementary-0/elm_scroller.h" \
    "${INCLUDE}/elementary-0/elm_scroll.h" \
    "${INCLUDE}/elementary-0/elm_segment_control.h" \
    "${INCLUDE}/elementary-0/elm_separator.h" \
    "${INCLUDE}/elementary-0/elm_slider.h" \
    "${INCLUDE}/elementary-0/elm_slideshow.h" \
    "${INCLUDE}/elementary-0/elm_spinner.h" \
    "${INCLUDE}/elementary-0/elm_store.h" \
    "${INCLUDE}/elementary-0/elm_table.h" \
    "${INCLUDE}/elementary-0/elm_theme.h" \
    "${INCLUDE}/elementary-0/elm_thumb.h" \
    "${INCLUDE}/elementary-0/elm_toolbar.h" \
    "${INCLUDE}/elementary-0/elm_transit.h" \
    "${INCLUDE}/elementary-0/elm_video.h" \
    "${INCLUDE}/elementary-0/elm_web.h" \
    "${INCLUDE}/elementary-0/elm_widget.h" \
    "${INCLUDE}/elementary-0/elm_win.h" \
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
        sed -r -n -f "$P/sed-$what" $header > $NEXT/$F
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
