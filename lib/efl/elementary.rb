#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/evas'
#
module Efl
    module Elm
        extend Efl::FFIHelper
        steal_ffitype Efl::Evas, :evas_smart_cb
        steal_ffitype Efl::Evas, :evas_load_error
        steal_ffitype Efl::Evas, :evas_callback_type
        steal_ffitype Efl::Evas, :evas_object_box_data_p
    end
end
#
require 'efl/ffi/elementary'
#
Efl::Evas::REvasObject.search_paths << [Efl::Elm,'elm_'].freeze
#
module Efl
    module Elm
        #
        class << self
            def init *args
                a = args.select { |e| e.is_a? String }
                return Efl::Elm.elm_init 0, FFI::MemoryPointer::NULL if a.length==0
                ptr = FFI::MemoryPointer.new :pointer, a.length
                a.each_with_index do |s,i|
                    ptr[i].write_pointer FFI::MemoryPointer.from_string(s)
                end
                Efl::Elm.elm_init a.length, ptr
            end
        end
        #
        class ElmWin
            include Efl::ClassHelper
            @search_paths = [ [Efl::Elm,'elm_win_'].freeze, [Efl::Elm,'elm_'].freeze ]
            def initialize parent, title, type=:elm_win_basic
                @evas_object = Efl::Evas::REvasObject.new Efl::Elm.elm_win_add parent, title, type
                @ptr = @evas_object.to_ptr
                yield self,@evas_object if block_given?
            end
            def add e
                eo = Efl::Evas::REvasObject.new Efl::Elm.send "elm_#{e}_add", @ptr
                yield eo if block_given?
                eo
            end
            def smart_callback_add event_str, cb, data=FFI::MemoryPointer::NULL
                Efl::Evas.evas_object_smart_callback_add @ptr, event_str, cb, data
            end
        end
        #
    end
end
#
# EOF
