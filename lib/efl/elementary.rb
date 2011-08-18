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
                return Native.elm_init 0, FFI::MemoryPointer::NULL if a.length==0
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
            def text_set label
                Native.elm_object_text_part_set @ptr, nil, label
            end
            #
            def text_get
                Native.elm_object_text_part_get @ptr, nil
            end
            #
            def content_set content
                Native.elm_object_content_part_set @ptr, nil, content
            end
            #
            def content_get
                Native.elm_object_content_part_get @ptr, nil
            end
            #
            def content_unset
                Native.elm_object_content_part_unset @ptr, nil
            end
            #
        end
        #
        class ElmWin < ElmObject
            #
            search_prefixes 'elm_win_'
            #
            def initialize parent, title, type=:elm_win_basic, &block
                super Native.method(:elm_win_add), parent, title, type, &block
            end
            def smart_callback_add event_str, cb, data=FFI::MemoryPointer::NULL
                Native.evas_object_smart_callback_add @ptr, event_str, cb, data
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
        class ElmInWin < ElmObject
            #
            search_prefixes 'elm_win_inwin_', 'elm_win_'
            #
            def initialize parent, &block
                super Native.method(:elm_win_inwin_add), parent, &block
            end
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
        class ElmLabel < ElmObject
            #
            include Helper
            constructor :elm_label_add
            search_prefixes 'elm_label_'
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
        class ElmNotify < ElmObject
            #
            include Helper
            constructor :elm_notify_add
            search_prefixes 'elm_notify_'
            #
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
        class ElmHoversel < ElmObject
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
        class ElmHoverselItem < ElmObject
            #
            search_prefixes 'elm_hoversel_item_'
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
        class ElmButton < ElmObject
            #
            include Helper
            constructor :elm_button_add
            search_prefixes 'elm_button_'
            #
        end
        #
        class ElmGenlist < ElmObject
            #
            include Helper
            constructor :elm_genlist_add
            search_prefixes 'elm_genlist_'
            #
        end
        #
    end
end
#
# EOF
