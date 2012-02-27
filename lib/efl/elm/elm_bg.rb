#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_bg'
#
module Efl
    #
    module Elm
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
    end
end
#
# EOF
