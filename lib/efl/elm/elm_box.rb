#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_box'
#
module Efl
    #
    module Elm
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
                Native.elm_box_padding_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
            alias :padding :padding_get
            #
            def align_get
                x = FFI::MemoryPointer.new :float
                y = FFI::MemoryPointer.new :float
                Native.elm_box_align_get @ptr, x, y
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
    end
end
#
# EOF
