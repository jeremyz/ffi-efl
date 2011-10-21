#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elementary'
require 'efl/edje'
require 'efl'
#
PREFIX=`pkg-config --variable=prefix ecore`.strip
if PREFIX.empty?
    puts "unable to determine Efl::PREFIX using pkg-config, images will not be available"
end
PACKAGE_DATA_DIR = File.join PREFIX, 'share', 'elementary'

Dir.glob( File.join File.dirname(__FILE__), 'tests', '*.rb').each do |f|
    load f
end
#
include Efl;
#
TESTS = [
    [ 'Bg Plain', :test_bg_plain ],
    [ 'Bg Image', :test_bg_image ],
    [ 'Bg Options', :test_bg_options ],
    [ 'Icon Transparent', :test_icon ],
    [ 'Icon Animation', :test_icon_animated ],
    [ 'Box Vert', :test_box_vert ],
    [ 'Box Vert 2', :test_box_vert2 ],
    [ 'Box Horiz', :test_box_horiz ],
    [ 'Box Transition', :test_box_transition ],
    [ 'Buttons', :test_button ],
    [ 'Transit', :test_transit ],
    [ 'Transit 2', :test_transit2 ],
    [ 'Transit 3', :test_transit3 ],
    [ 'Transit 4', :test_transit4 ],
    [ 'Transit 5', :test_transit5 ],
    [ 'Transit 6', :test_transit6 ],
    [ 'Transit 7', :test_transit7 ],
    [ 'Transit 8', :test_transit8 ],
    [ 'Transit 9', :test_transit9 ],
    [ 'File Selector Button', :test_fileselector_button ],
    [ 'File Selector Entry', :test_fileselector_entry ],
    [ 'Toggles', :test_toggle ],
    [ 'Table', :test_table ],
    [ 'Table Homogeneous', :test_table2 ],
    [ 'Table 3', :test_table3 ],
    [ 'Table 4', :test_table4 ],
    [ 'Table 5', :test_table5 ],
    [ 'Table 6', :test_table6 ],
    [ 'Clock', :test_clock ],
    [ 'Clock 2', :test_clock2 ],
    [ 'Layout', :test_layout ],
    [ 'Hover', :test_hover ],
    [ 'Hover 2', :test_hover2 ],
    [ 'Entry', :test_entry ],
    [ 'Entry Scrolled', :test_entry_scrolled ],
    [ 'Entry 3', :test_entry3 ],
    [ 'Entry 4', :test_entry4 ],
    [ 'Entry 5', :test_entry5 ],
    [ 'Entry Notepad', :test_entry_notepad ],
    [ 'Anchorview', :test_anchorview ],
    [ 'Anchorblock', :test_anchorblock ],
    [ 'Toolbar', :test_toolbar ],
    [ 'Toolbar 2', :test_toolbar2 ],
    [ 'Toolbar 3', :test_toolbar3 ],
    [ 'Toolbar 4', :test_toolbar4 ],
    [ 'Toolbar 5', :test_toolbar5 ],
    [ 'Toolbar 6', :test_toolbar6 ],
    [ 'Hoversel', :test_hoversel ],
    [ 'List', :test_list ],
    [ 'List - Horizontal', :test_list_horizontal ],
    [ 'List 2', :test_list2 ],
    [ 'List 3', :test_list3 ],
    [ 'List 4', :test_list4 ],
    [ 'List 5', :test_list5 ],
    [ 'Inwin', :test_inwin ],
    [ 'Inwin 2', :test_inwin2 ],
    [ 'Scaling', :test_scaling ],
    [ 'Scaling 2', :test_scaling2 ],
    [ 'Slider', :test_slider ],
    [ 'Actionslider', :test_actionslider ],
    [ 'Genlist', :test_genlist ],
    [ 'Genlist 2', :test_genlist2 ],
    [ 'Genlist 3', :test_genlist3 ],
    [ 'Genlist 4', :test_genlist4 ],
    [ 'Genlist 5', :test_genlist5 ],
    [ 'Genlist 7', :test_genlist7 ],
    [ 'Genlist Tree', :test_genlist6 ],
    [ 'Genlist Group', :test_genlist8 ],
    [ 'Genlist Group Tree', :test_genlist9 ],
    [ 'Genlist Mode', :test_genlist10 ],
    [ 'Genlist Reorder Mode', :test_genlist11 ],
    [ 'Genlist Eio', :test_eio ],
    [ 'GenGrid', :test_gengrid ],
    [ 'GenGrid 2', :test_gengrid2 ],
    [ 'Checks', :test_check ],
    [ 'Radios', :test_radio ],
    [ 'Pager', :test_pager ],
    [ 'Pager Slide', :test_pager_slide ],
    [ 'Window States', :test_win_state ],
    [ 'Window States 2', :test_win_state2 ],
    [ 'Progressbar', :test_progressbar ],
    [ 'File Selector', :test_fileselector ],
    [ 'Separator', :test_separator ],
    [ 'Scroller', :test_scroller ],
    [ 'Scroller 2', :test_scroller2 ],
    [ 'Spinner', :test_spinner ],
    [ 'Index', :test_index ],
    [ 'Index 2', :test_index2 ],
    [ 'Photocam', :test_photocam ],
    [ 'Photo', :test_photo ],
    [ 'Thumb', :test_thumb ],
    [ 'Icon Desktops', :test_icon_desktops ],
    [ 'Notify', :test_notify ],
    [ 'Slideshow', :test_slideshow ],
    [ 'Menu', :test_menu ],
    [ 'Panel', :test_panel ],
    [ 'Panes', :test_panes ],
    [ 'Map', :test_map ],
    [ 'Weather', :test_weather ],
    [ 'Flip', :test_flip ],
    [ 'Flip 2', :test_flip2 ],
    [ 'Flip 3', :test_flip3 ],
    [ 'Flip Interactive', :test_flip4 ],
    [ 'Flip Page', :test_flip_page ],
    [ 'Label', :test_label ],
    [ 'Conformant', :test_conformant ],
    [ 'Conformant 2', :test_conformant2 ],
    [ 'Multi Touch', :test_multi ],
    [ 'Floating Objects', :test_floating ],
    [ 'Launcher', :test_launcher ],
    [ 'Launcher 2', :test_launcher2 ],
    [ 'Launcher 3', :test_launcher3 ],
    [ 'Animation', :test_anim ],
    [ 'Calendar', :test_calendar ],
    [ 'Calendar 2', :test_calendar2 ],
    [ 'Tooltip', :test_tooltip ],
    [ 'Tooltip2', :test_tooltip2 ],
    [ 'Cursor', :test_cursor ],
    [ 'Cursor 2', :test_cursor2 ],
    [ 'Cursor 3', :test_cursor3 ],
    [ 'Focus', :test_focus ],
    [ 'Focus 2', :test_focus2 ],
    [ 'Focus 3', :test_focus3 ],
    [ 'Flip Selector', :test_flipselector ],
    [ 'Disk Selector', :test_diskselector ],
    [ 'Color Selector', :test_colorselector ],
    [ 'Ctxpopup', :test_ctxpopup ],
    [ 'Bubble', :test_bubble ],
    [ 'Segment Control', :test_segment_control ],
    [ 'Store', :test_store ],
    [ 'Window Inline', :test_win_inline ],
    [ 'Grid', :test_grid ],
    [ 'GLViewSimple', :test_glview_simple ],
    [ 'GLView', :test_glview ],
    [ '3D', :test_3d ],
    [ 'Gesture Layer', :test_gesture_layer ],
    [ 'Naviframe', :test_naviframe ],
    [ 'Factory', :test_factory ],
]
#
class TestWin < Elm::ElmWin
    #
    def initialize name, title
        super FFI::MemoryPointer::NULL, name
        self.title = title
        feed
        smart_callback_add 'delete,request', method(:on_delete)
    end
    #
    def feed
        @bg = Elm::ElmBg.new self do |bg|
            bg.size_hint_weight_expand
            resize_object_add bg
            bg.show
        end
        @bx0 = Elm::ElmBox.new self do |bx|
            bx.size_hint_weight_expand
            resize_object_add bx
            bx.show
        end
        @fr =  Elm::ElmFrame.new self do |fr|
            fr.text = 'Information'
            @bx0.pack_end fr
            fr.show
        end
        Elm::ElmLabel.new self do |lb|
            lb.text = 'Please select a test from the list below<br>by clicking the test button to show the<br>test window.'
            @fr.content = lb
            lb.show
        end
        Elm::ElmCheck.new self do |tg|
            tg.style = 'toggle'
            tg.text = 'UI-Mirroring:'
            tg.state = Native.elm_mirrored_get
            tg.smart_callback_add 'changed', method(:tg_changed)
            @bx0.pack_end tg
            tg.show
        end
        @li = Elm::ElmList.new self do |li|
            li.always_select_mode = true
            li.size_hint_weight_expand
            li.size_hint_align_set_fill
            @bx0.pack_end li
        end
        @idx = Elm::ElmIndex.new self do |idx|
            idx.smart_callback_add 'delay,changed', method(:index_changed)
            idx.size_hint_weight_expand
            resize_object_add idx
            idx.show
        end
        ch = nil
        TESTS.sort.each do |l,m|
            icon = nil
            if Tests.respond_to? m
                icon = Elm::ElmIcon.new self
                icon.file = "#{PACKAGE_DATA_DIR}/images/icon_00.png", nil
                icon.size_hint_min = 20,20
            end
            it = @li.item_append l, nil, icon, method(:try_test), FFI::MemoryPointer.from_string(m.to_s)
            it.del_cb_set method(:free_list_item)
            if l[0]!=ch
                ch = l[0]
                @idx.item_append ch.to_s, it
            end
        end
        @idx.item_go 0
        @li.go
        @li.show
    end
    #
    def try_test data, evas_obj, event_info
        fct = data.read_string
        begin
            Tests.send fct
        rescue NoMethodError
            puts "#{fct} not implemeneted yet"
        end
    end
    #
    def tg_changed data, evas_obj, event_info
        Native.elm_mirrored_set Native.elm_check_state_get evas_obj
    end
    #
    def index_changed data, evas_obj, event_info
        Native.elm_list_item_show event_info
    end
    #
    def free_list_item data, evas_obj, event_info
        # free FFI::MemoryPointer.from_string m.to_s
        data.free
    end
    #
    def on_delete data, evas_object, event_info
        Elm.exit
    end
end
#
def elm_main
    win = TestWin.new 'test_elementary', 'Elementary Tests'
    win.evas_object_resize 320, 480
    win.show
end
#
Elm.init
#
Native.elm_app_info_set elm_main, 'elementary', 'images/logo.png'
#
Elm.run
Elm.shutdown
#
# EOF
