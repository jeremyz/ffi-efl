#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/evas'
require 'efl/native/elementary'
#
module Efl
    #
    module Native
        #
        class ElmGenlistItemClassStruct < FFI::Struct
            layout  :item_style,        :pointer,
                    :label_get,         :pointer,
                    :icon_get,          :pointer,
                    :state_get,         :pointer,
                    :del,               :pointer,
                    :moved,             :pointer,
                    :mode_item_style,   :pointer
        end
        #
    end
    #
    module Elm
        #
        def self.version
            Native::VersionStruct.new(Native.elm_version)
        end
        #
        module Helper
            def self.included kls
                def kls.constructor meth
                    self.class_eval <<-EOF
                    def initialize ptr, &block
                        if ptr.is_a? FFI::Pointer
                            super ptr, &block
                        else
                            super Native.method(:#{meth}), ptr, &block
                        end
                    end
                    EOF
                end
            end
        end
        #
        class << self
            def init *args
                a = args.select { |e| e.is_a? String }
                a << __FILE__ if a.length==0
                ptr = FFI::MemoryPointer.new :pointer, a.length
                a.each_with_index do |s,i|
                    ptr[i].write_pointer FFI::MemoryPointer.from_string(s)
                end
                Native.elm_init a.length, ptr
            end
        end
        #
        class ElmObject < Efl::Evas::REvasObject
            #
            search_prefixes 'elm_object_'
            #
            def smart_callback_add event_str, cb, data=FFI::MemoryPointer::NULL
                Native.evas_object_smart_callback_add @ptr, event_str, cb, data
            end
            #
            def text_set label
                Native.elm_object_part_text_set @ptr, nil, label
            end
            alias :text= :text_set
            #
            def text_get
                Native.elm_object_part_text_get @ptr, nil
            end
            alias :text :text_get
            #
            def content_set content
                Native.elm_object_part_content_set @ptr, nil, content
            end
            alias :content= :content_set
            #
            def content_get
                Native.elm_object_part_content_get @ptr, nil
            end
            alias :content :content_get
            #
            def content_unset
                Native.elm_object_part_content_unset @ptr, nil
            end
            #
            def parent_widget_get
                ElmObject.new Native.elm_object_parent_widget_get @ptr
            end
            alias :parent_widget :parent_widget_get
        end
        #
        ####################################################################################
        #
        class ElmActionSlider < ElmObject
            #
            @as_pos = Native.enum_type :elm_actionslider_pos
            class << self
                attr_reader :as_pos
            end
            #
            include Helper
            constructor :elm_actionslider_add
            search_prefixes 'elm_actionslider_'
            #
            def texts_set l=nil, c=nil, r=nil
                l,c,r = *l if l.is_a? Array
                Native.elm_object_part_text_set @ptr, "left", l
                Native.elm_object_part_text_set @ptr, "center", c
                Native.elm_object_part_text_set @ptr, "right", r
            end
            alias :texts= :texts_set
            def indicator_set str
                p = self.class.as_pos
                v = (
                     case str
                     when 'l'
                         p[:elm_actionslider_left]
                     when 'c'
                         p[:elm_actionslider_center]
                     when 'r'
                         p[:elm_actionslider_right]
                     else
                         p[:elm_actionslider_none]
                     end
                    )
                Native.elm_actionslider_indicator_pos_set @ptr, v
            end
            alias :indicator= :indicator_set
            def enabled_set str
                p = self.class.as_pos
                v = p[:elm_actionslider_none]
                v |= p[:elm_actionslider_left] if str=~/l/
                v |= p[:elm_actionslider_center] if str=~/c/
                v |= p[:elm_actionslider_right] if str=~/r/
                v |= p[:elm_actionslider_all] if str=~/a/
                Native.elm_actionslider_enabled_pos_set @ptr, v
            end
            alias :enabled= :enabled_set
            def magnet_set str
                p = self.class.as_pos
                v = p[:elm_actionslider_none]
                v |= p[:elm_actionslider_left] if str=~/l/
                v |= p[:elm_actionslider_center] if str=~/c/
                v |= p[:elm_actionslider_right] if str=~/r/
                v |= p[:elm_actionslider_all] if str=~/a/
                Native.elm_actionslider_magnet_pos_set @ptr, v
            end
            alias :magnet= :magnet_set
            #
            def setup t=[], i='l', m='a', e='a'
                texts_set *t
                indicator_set i
                magnet_set m
                enabled_set e
            end
        end
        #
        class ElmAnchorBlock < ElmObject
            #
            include Helper
            constructor :elm_anchorblock_add
            search_prefixes 'elm_anchorblock_'
        end
        #
        class ElmAnchorView < ElmObject
            #
            include Helper
            constructor :elm_anchorview_add
            search_prefixes 'elm_anchorview_'
        end
        #
        class ElmBg < ElmObject
            #
            include Helper
            constructor :elm_bg_add
            search_prefixes 'elm_bg_'
            #
            def file_get
                f = FFI::MemoryPointer.new :pointer
                g = FFI::MemoryPointer.new :pointer
                Native.elm_bg_file_get @ptr, f, g
                [ f.read_pointer.read_string, g.read_pointer.read_string ]
            end
            alias :file :file_get
            def color_get
                r = FFI::MemoryPointer.new :int
                g = FFI::MemoryPointer.new :int
                b = FFI::MemoryPointer.new :int
                Native.elm_bg_color_get @ptr, r, g, b
                [ r.read_int, g.read_int, b.read_int ]
            end
            alias :color :color_get
        end
        #
        class ElmBox < ElmObject
            #
            include Helper
            constructor :elm_box_add
            search_prefixes 'elm_box_'
            #
            def padding_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                Native::elm_box_padding_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
            alias :padding :padding_get
            #
            def align_get
                x = FFI::MemoryPointer.new :float
                y = FFI::MemoryPointer.new :float
                Native::elm_box_align_get @ptr, x, y
                [ x.read_float, y.read_float ]
            end
            alias :align :padding_get
            #
            def children_get
                Efl::EinaList::REinaList.new Native.elm_box_children_get @ptr
            end
            alias :children :children_get
        end
        #
        class ElmBubble < ElmObject
            #
            include Helper
            constructor :elm_bubble_add
            search_prefixes 'elm_bubble_'
        end
        #
        class ElmButton < ElmObject
            #
            include Helper
            constructor :elm_button_add
            search_prefixes 'elm_button_'
            #
        end
        #
        class ElmCalendar < ElmObject
            #
            include Helper
            constructor :elm_calendar_add
            search_prefixes 'elm_calendar_'
            #
        end
        #
        class ElmCheck < ElmObject
            #
            include Helper
            constructor :elm_check_add
            search_prefixes 'elm_check_'
            #
        end
        #
        class ElmClock < ElmObject
            #
            include Helper
            constructor :elm_clock_add
            search_prefixes 'elm_clock_'
        end
        #
        class ElmColorSelector < ElmObject
            #
            include Helper
            constructor :elm_colorselector_add
            search_prefixes 'elm_colorselector_'
            #
        end
        #
        class ElmDiskSelector < ElmObject
            #
            include Helper
            constructor :elm_diskselector_add
            search_prefixes 'elm_diskselector_'
            #
            def item_selected_set it, b
                Native::elm_diskselector_item_selected_set it, b
            end
            alias :item_selected= :item_selected_set
        end
        #
        class ElmDiskSelectorItem < ElmObject
            #
            search_prefixes 'elm_diskselector_item_'
            #
            def data_get
                Native::elm_diskselector_item_data_get @ptr
            end
            alias :data :data_get
        end
        #
        class ElmEntry < ElmObject
            #
            include Helper
            constructor :elm_entry_add
            search_prefixes 'elm_entry_'
            #
        end
        #
        class ElmFileSelector < ElmObject
            #
            include Helper
            constructor :elm_fileselector_add
            search_prefixes 'elm_fileselector_'
        end
        #
        class ElmFileSelectorButton < ElmObject
            #
            include Helper
            constructor :elm_fileselector_button_add
            search_prefixes 'elm_fileselector_button_'
        end
        #
        class ElmFileSelectorENtry < ElmObject
            #
            include Helper
            constructor :elm_fileselector_entry_add
            search_prefixes 'elm_fileselector_entry_'
        end
        #
        class ElmFlip < ElmObject
            #
            include Helper
            constructor :elm_flip_add
            search_prefixes 'elm_flip_'
        end
        #
        class ElmFlipSelector < ElmObject
            #
            include Helper
            constructor :elm_flipselector_add
            search_prefixes 'elm_flipselector_'
            #
            def item_append label, cb, data
                ElmFlipSelectorItem.new Native::elm_flipselector_item_append @ptr, label, cb, data
            end
            #
            def selected_item_get
                ElmFlipSelectorItem.new Native::elm_flipselector_selected_item_get @ptr
            end
            alias :selected_item :selected_item_get
        end
        #
        class ElmFlipSelectorItem < ElmObject
            #
            search_prefixes 'elm_flipselector_item_'
            #
        end
        #
        class ElmFrame < ElmObject
            #
            include Helper
            constructor :elm_frame_add
            search_prefixes 'elm_frame_'
        end
        #
        class ElmGenGrid < ElmObject
            #
            include Helper
            constructor :elm_gengrid_add
            search_prefixes 'elm_gengrid_'
        end
        #
        class ElmGenList < ElmObject
            #
            include Helper
            constructor :elm_genlist_add
            search_prefixes 'elm_genlist_'
            #
        end
        #
        class ElmGestureLayer < ElmObject
            #
            include Helper
            constructor :elm_gesture_layer_add
            search_prefixes 'elm_gesture_layer_'
        end
        #
        class ElmGlView < ElmObject
            #
            include Helper
            constructor :elm_glview_add
            search_prefixes 'elm_glview_'
            #
        end
        #
        class ElmGrid < ElmObject
            #
            include Helper
            constructor :elm_grid_add
            search_prefixes 'elm_grid_'
            #
        end
        #
        class ElmHover < ElmObject
            #
            include Helper
            constructor :elm_hover_add
            search_prefixes 'elm_hover_'
            #
        end
        #
        class ElmHoverSel < ElmObject
            #
            include Helper
            constructor :elm_hoversel_add
            search_prefixes 'elm_hoversel_'
            #
            def item_add label, icon_file=nil, icon_type=:elm_icon_none, cb=nil, data=nil
                ElmHoverselItem.new Native::elm_hoversel_item_add @ptr, label, icon_file, icon_type, cb, data
            end
        end
        #
        class ElmHoverSelItem < ElmObject
            #
            search_prefixes 'elm_hoversel_item_'
            #
        end
        #
        class ElmIcon < ElmObject
            #
            include Helper
            constructor :elm_icon_add
            search_prefixes 'elm_icon_'
            #
            def scale_set args
                Native.elm_icon_scale_set @ptr, *args
            end
            alias :scale= :scale_set
        end
        #
        class ElmImage < ElmObject
            #
            include Helper
            constructor :elm_image_add
            search_prefixes 'elm_image_'
            #
        end
        #
        class ElmIndex < ElmObject
            #
            include Helper
            constructor :elm_index_add
            search_prefixes 'elm_index_'
            #
        end
        #
        class ElmInWin < ElmObject
            #
            search_prefixes 'elm_win_inwin_', 'elm_win_'
            #
            def initialize parent, &block
                super Native.method(:elm_win_inwin_add), parent, &block
            end
            #
        end
        #
        class ElmLabel < ElmObject
            #
            include Helper
            constructor :elm_label_add
            search_prefixes 'elm_label_'
            #
        end
        #
        class ElmLayout < ElmObject
            #
            include Helper
            constructor :elm_layout_add
            search_prefixes 'elm_layout_'
            #
            def edje_get &block
                Efl::Edje::REdje.new Native.method(:elm_layout_edje_get), @ptr, &block
            end
            alias :edje :edje_get
        end
        #
        class ElmList < ElmObject
            #
            include Helper
            constructor :elm_list_add
            search_prefixes 'elm_list_'
            #
            def item_append label, left_icon=nil, right_icon=nil, cb=nil, data=nil
                ElmListItem.new Native::elm_list_item_append @ptr, label, left_icon, right_icon, cb, data
            end
        end
        #
        class ElmListItem < ElmObject
            #
            search_prefixes 'elm_list_item_'
            #
            def data_get
                Native::elm_list_item_data_get @ptr
            end
            alias :data :data_get
        end
        #
        class ElmMenu < ElmObject
            #
            include Helper
            constructor :elm_menu_add
            search_prefixes 'elm_menu_'
            #
        end
        #
        class ElmMenuItem < ElmObject
            #
            include Helper
            constructor :elm_menu_item_add
            search_prefixes 'elm_menu_item_'
            #
        end
        #
        class ElmMenuItemSeparator < ElmObject
            #
            include Helper
            constructor :elm_menu_item_separator_add
            search_prefixes 'elm_menu_item_separator_'
            #
        end
        #
        class ElmNaviFrame < ElmObject
            #
            include Helper
            constructor :elm_naviframe_add
            search_prefixes 'elm_naviframe_'
            #
        end
        #
        class ElmNotify < ElmObject
            #
            include Helper
            constructor :elm_notify_add
            search_prefixes 'elm_notify_'
            #
        end
        #
        class ElmPager < ElmObject
            #
            include Helper
            constructor :elm_pager_add
            search_prefixes 'elm_pager_'
            #
        end
        #
        class ElmPanel < ElmObject
            #
            include Helper
            constructor :elm_panel_add
            search_prefixes 'elm_panel_'
            #
        end
        #
        class ElmPanes < ElmObject
            #
            include Helper
            constructor :elm_panes_add
            search_prefixes 'elm_panes_'
            #
        end
        #
        class ElmPlayer < ElmObject
            #
            include Helper
            constructor :elm_player_add
            search_prefixes 'elm_player_'
            #
        end
        #
        class ElmPhoto < ElmObject
            #
            include Helper
            constructor :elm_photo_add
            search_prefixes 'elm_photo_'
        end
        #
        class ElmPhotoCam < ElmObject
            #
            include Helper
            constructor :elm_photocam_add
            search_prefixes 'elm_photocam_'
        end
        #
        class ElmProgressBar < ElmObject
            #
            include Helper
            constructor :elm_progressbar_add
            search_prefixes 'elm_progressbar_'
        end
        #
        class ElmRadio < ElmObject
            #
            include Helper
            constructor :elm_radio_add
            search_prefixes 'elm_radio_'
            #
        end
        #
        class ElmScroller < ElmObject
            #
            include Helper
            constructor :elm_scroller_add
            search_prefixes 'elm_scroller_'
            #
        end
        #
        class ElmSeparator < ElmObject
            #
            include Helper
            constructor :elm_separator_add
            search_prefixes 'elm_separator_'
            #
        end
        #
        class ElmSlider < ElmObject
            #
            include Helper
            constructor :elm_slider_add
            search_prefixes 'elm_slider_'
            #
        end
        #
        class ElmSlideshow < ElmObject
            #
            include Helper
            constructor :elm_slideshow_add
            search_prefixes 'elm_slideshow_'
            #
        end
        #
        class ElmSpinner < ElmObject
            #
            include Helper
            constructor :elm_spinner_add
            search_prefixes 'elm_spinner_'
            #
        end
        #
        class ElmTable < ElmObject
            #
            include Helper
            constructor :elm_table_add
            search_prefixes 'elm_table_'
        end
        #
        class ElmThumb < ElmObject
            #
            include Helper
            constructor :elm_thumb_add
            search_prefixes 'elm_thumb_'
        end
        #
        class ElmToolbar < ElmObject
            #
            include Helper
            constructor :elm_toolbar_add
            search_prefixes 'elm_toolbar_'
        end
        #
        class ElmVideo < ElmObject
            #
            include Helper
            constructor :elm_video_add
            search_prefixes 'elm_video_'
        end
        #
        class ElmWin < ElmObject
            #
            search_prefixes 'elm_win_'
            #
            def initialize parent, title, type=:elm_win_basic, &block
                super Native.method(:elm_win_add), parent, title, type, &block
            end
            def inwin_add
                ElmInWin.new @ptr
            end
            def screen_position_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                Native.elm_win_screen_position_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
            alias :screen_position :screen_position_get
        end
        #
    end
end
#
# EOF
