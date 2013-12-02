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
ELM_INCLUDE_DIR=$(find ${INCLUDE} -name elementary-* | sort | tail -n1)
#
for header in \
    "${INCLUDE}/eina-1/eina/eina_types.h" \
    "${INCLUDE}/eina-1/eina/eina_xattr.h" \
    "${INCLUDE}/eina-1/eina/eina_main.h" \
    "${INCLUDE}/eina-1/eina/eina_log.h" \
    "${INCLUDE}/eina-1/eina/eina_list.h" \
    "${INCLUDE}/eina-1/eina/eina_hash.h" \
    "${INCLUDE}/eina-1/eina/eina_file.h" \
    "${INCLUDE}/eet-1/Eet.h" \
    "${INCLUDE}/evas-1/Evas.h" \
    "${INCLUDE}/evas-1/Evas_GL.h" \
    "${INCLUDE}/ecore-1/Ecore.h" \
    "${INCLUDE}/ecore-1/Ecore_Con.h" \
    "${INCLUDE}/ecore-1/Ecore_Input.h" \
    "${INCLUDE}/ecore-1/Ecore_Getopt.h" \
    "${INCLUDE}/ecore-1/Ecore_Evas.h" \
    "${INCLUDE}/ecore-1/Ecore_Fb.h" \
    "${INCLUDE}/ecore-1/Ecore_File.h" \
    "${INCLUDE}/eio-1/Eio.h" \
    "${INCLUDE}/embryo-1/Embryo.h" \
    "${INCLUDE}/edje-1/Edje.h" \
    "${INCLUDE}/efreet-1/Efreet.h" \
    "${INCLUDE}/efreet-1/efreet_base.h" \
    "${INCLUDE}/efreet-1/efreet_icon.h" \
    "${INCLUDE}/efreet-1/efreet_desktop.h" \
    "${INCLUDE}/efreet-1/efreet_menu.h" \
    "${INCLUDE}/efreet-1/efreet_uri.h" \
    "${INCLUDE}/efreet-1/efreet_ini.h" \
    "${INCLUDE}/efreet-1/efreet_utils.h" \
    "${INCLUDE}/efreet-1/Efreet_Mime.h" \
    "${INCLUDE}/efreet-1/Efreet_Trash.h" \
    "${INCLUDE}/e_dbus-1/E_DBus.h" \
    "${INCLUDE}/e_dbus-1/E_Notify.h" \
    "${INCLUDE}/e_dbus-1/E_Notification_Daemon.h" \
    "${INCLUDE}/e_dbus-1/E_Bluez.h" \
    "${INCLUDE}/e_dbus-1/E_Hal.h" \
    "${INCLUDE}/e_dbus-1/E_Ofono.h" \
    "${INCLUDE}/e_dbus-1/E_Ukit.h" \
    "${INCLUDE}/e_dbus-1/connman0_7x/E_Connman.h" \
    "${INCLUDE}/eeze-1/Eeze.h" \
    "${INCLUDE}/eeze-1/Eeze_Disk.h" \
    "${INCLUDE}/eeze-1/Eeze_Net.h" \
    "${INCLUDE}/emotion-1/Emotion.h" \
    "${INCLUDE}/ethumb-1/Ethumb.h" \
    "${INCLUDE}/ethumb-1/Ethumb_Client.h" \
    "${INCLUDE}/ethumb-1/Ethumb_Plugin.h" \
    "${ELM_INCLUDE_DIR}/Elementary.h" \
    "${ELM_INCLUDE_DIR}/elm_general.h" \
    "${ELM_INCLUDE_DIR}/elm_tooltip.h" \
    "${ELM_INCLUDE_DIR}/elm_object.h" \
    "${ELM_INCLUDE_DIR}/elm_object_item.h" \
    "${ELM_INCLUDE_DIR}/elc_ctxpopup.h" \
    "${ELM_INCLUDE_DIR}/elc_fileselector_button.h" \
    "${ELM_INCLUDE_DIR}/elc_fileselector_entry.h" \
    "${ELM_INCLUDE_DIR}/elc_fileselector.h" \
    "${ELM_INCLUDE_DIR}/elc_hoversel.h" \
    "${ELM_INCLUDE_DIR}/elc_multibuttonentry.h" \
    "${ELM_INCLUDE_DIR}/elc_naviframe.h" \
    "${ELM_INCLUDE_DIR}/elc_popup.h" \
    "${ELM_INCLUDE_DIR}/elm_actionslider.h" \
    "${ELM_INCLUDE_DIR}/elm_app.h" \
    "${ELM_INCLUDE_DIR}/elm_authors.h" \
    "${ELM_INCLUDE_DIR}/elm_bg.h" \
    "${ELM_INCLUDE_DIR}/elm_box.h" \
    "${ELM_INCLUDE_DIR}/elm_bubble.h" \
    "${ELM_INCLUDE_DIR}/elm_button.h" \
    "${ELM_INCLUDE_DIR}/elm_cache.h" \
    "${ELM_INCLUDE_DIR}/elm_calendar.h" \
    "${ELM_INCLUDE_DIR}/elm_check.h" \
    "${ELM_INCLUDE_DIR}/elm_clock.h" \
    "${ELM_INCLUDE_DIR}/elm_cnp.h" \
    "${ELM_INCLUDE_DIR}/elm_colorselector.h" \
    "${ELM_INCLUDE_DIR}/elm_config.h" \
    "${ELM_INCLUDE_DIR}/elm_conform.h" \
    "${ELM_INCLUDE_DIR}/elm_cursor.h" \
    "${ELM_INCLUDE_DIR}/elm_datetime.h" \
    "${ELM_INCLUDE_DIR}/elm_dayselector.h" \
    "${ELM_INCLUDE_DIR}/elm_debug.h" \
    "${ELM_INCLUDE_DIR}/elm_diskselector.h" \
    "${ELM_INCLUDE_DIR}/elm_entry.h" \
    "${ELM_INCLUDE_DIR}/elm_finger.h" \
    "${ELM_INCLUDE_DIR}/elm_flip.h" \
    "${ELM_INCLUDE_DIR}/elm_flipselector.h" \
    "${ELM_INCLUDE_DIR}/elm_focus.h" \
    "${ELM_INCLUDE_DIR}/elm_frame.h" \
    "${ELM_INCLUDE_DIR}/elm_gengrid.h" \
    "${ELM_INCLUDE_DIR}/elm_gen.h" \
    "${ELM_INCLUDE_DIR}/elm_genlist.h" \
    "${ELM_INCLUDE_DIR}/elm_gesture_layer.h" \
    "${ELM_INCLUDE_DIR}/elm_getting_started.h" \
    "${ELM_INCLUDE_DIR}/elm_glview.h" \
    "${ELM_INCLUDE_DIR}/elm_grid.h" \
    "${ELM_INCLUDE_DIR}/elm_hover.h" \
    "${ELM_INCLUDE_DIR}/elm_icon.h" \
    "${ELM_INCLUDE_DIR}/elm_image.h" \
    "${ELM_INCLUDE_DIR}/elm_index.h" \
    "${ELM_INCLUDE_DIR}/elm_intro.h" \
    "${ELM_INCLUDE_DIR}/elm_inwin.h" \
    "${ELM_INCLUDE_DIR}/elm_label.h" \
    "${ELM_INCLUDE_DIR}/elm_layout.h" \
    "${ELM_INCLUDE_DIR}/elm_list.h" \
    "${ELM_INCLUDE_DIR}/elm_mapbuf.h" \
    "${ELM_INCLUDE_DIR}/elm_menu.h" \
    "${ELM_INCLUDE_DIR}/elm_mirroring.h" \
    "${ELM_INCLUDE_DIR}/elm_need.h" \
    "${ELM_INCLUDE_DIR}/elm_notify.h" \
    "${ELM_INCLUDE_DIR}/elm_panel.h" \
    "${ELM_INCLUDE_DIR}/elm_panes.h" \
    "${ELM_INCLUDE_DIR}/elm_photocam.h" \
    "${ELM_INCLUDE_DIR}/elm_photo.h" \
    "${ELM_INCLUDE_DIR}/elm_plug.h" \
    "${ELM_INCLUDE_DIR}/elm_progressbar.h" \
    "${ELM_INCLUDE_DIR}/elm_radio.h" \
    "${ELM_INCLUDE_DIR}/elm_scale.h" \
    "${ELM_INCLUDE_DIR}/elm_scroller.h" \
    "${ELM_INCLUDE_DIR}/elm_scroll.h" \
    "${ELM_INCLUDE_DIR}/elm_segment_control.h" \
    "${ELM_INCLUDE_DIR}/elm_separator.h" \
    "${ELM_INCLUDE_DIR}/elm_slider.h" \
    "${ELM_INCLUDE_DIR}/elm_slideshow.h" \
    "${ELM_INCLUDE_DIR}/elm_spinner.h" \
    "${ELM_INCLUDE_DIR}/elm_store.h" \
    "${ELM_INCLUDE_DIR}/elm_table.h" \
    "${ELM_INCLUDE_DIR}/elm_theme.h" \
    "${ELM_INCLUDE_DIR}/elm_thumb.h" \
    "${ELM_INCLUDE_DIR}/elm_toolbar.h" \
    "${ELM_INCLUDE_DIR}/elm_transit.h" \
    "${ELM_INCLUDE_DIR}/elm_video.h" \
    "${ELM_INCLUDE_DIR}/elm_web.h" \
    "${ELM_INCLUDE_DIR}/elm_widget.h" \
    "${ELM_INCLUDE_DIR}/elm_win.h" \
    ; do
    #
    if [ ! -e "$header" ]; then
        echo "$header not found, we won't generate bindings for this header."
        continue
    else
        echo "extracting API from $header"
    fi
    #
    DIR=$(dirname $header)
    FILE=$(basename $header)
    BASE=${header%.h}
    #
    for what in functions enums types callbacks variables; do
        F=$FILE-$what
        sed -r -n -f "$P/sed-$what" $header > $NEXT/$F
        for more_header in "${BASE}_common.h" "${BASE}_legacy.h"; do
            [ -e $more_header ] && sed -r -n -f "$P/sed-$what" $more_header >> $NEXT/$F
        done
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
