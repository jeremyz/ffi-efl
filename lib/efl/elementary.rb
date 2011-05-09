#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/evas'
require 'efl/native/elementary'
#
module Efl
    module Elm
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
        class ElmWin < Efl::Evas::REvasObject
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
        class ElmInWin < Efl::Evas::REvasObject
            #
            search_prefixes 'elm_win_inwin_', 'elm_win'
            #
            def initialize parent, &block
                super Native.method(:elm_win_inwin_add), parent, &block
            end
        end
        #
        class ElmBg < Efl::Evas::REvasObject
            #
            search_prefixes 'elm_bg_'
            #
            def initialize parent, &block
                super Native.method(:elm_bg_add), parent, &block
            end
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
        class ElmLabel < Efl::Evas::REvasObject
            #
            search_prefixes 'elm_label_'
            #
            def initialize parent, &block
                super Native.method(:elm_label_add), parent, &block
            end
        end
        #
        class ElmPager < Efl::Evas::REvasObject
            #
            search_prefixes 'elm_pager_'
            #
            def initialize parent, &block
                super Native.method(:elm_pager_add), parent, &block
            end
        end
        #
        class ElmPanel < Efl::Evas::REvasObject
            #
            search_prefixes 'elm_panel_'
            #
            def initialize parent, &block
                super Native.method(:elm_panel_add), parent, &block
            end
        end
        #
    end
end
#
# EOF
