#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/evas'
require 'efl/native/elementary'
#
Efl::Evas::REvasObject.search_prefixes << 'elm_'   # append not prepend !
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
        class ElmWin
            include Efl::ClassHelper
            search_prefixes 'elm_win_', 'elm_'
            def initialize parent, title, type=:elm_win_basic
                @evas_object = Evas::REvasObject.new Native.elm_win_add parent, title, type
                @ptr = @evas_object.to_ptr
                yield self,@evas_object if block_given?
            end
            def add e
                eo = Evas::REvasObject.new Native.send "elm_#{e}_add", @ptr
                yield eo if block_given?
                eo
            end
            def smart_callback_add event_str, cb, data=FFI::MemoryPointer::NULL
                Native.evas_object_smart_callback_add @ptr, event_str, cb, data
            end
        end
        #
    end
end
#
# EOF
