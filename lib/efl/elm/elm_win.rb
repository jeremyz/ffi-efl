#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_win'
#
module Efl
    #
    module Elm
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
