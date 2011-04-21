#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/evas'
require 'efl/elementary/elementary-ffi'
#
module Efl
    module Elm
        #
        class << self
            def init *args
                a = args.select { |e| e.is_a? String }
                return Efl::API.elm_init 0, FFI::MemoryPointer::NULL if a.length==0
                ptr = FFI::MemoryPointer.new :pointer, a.length
                a.each_with_index do |s,i|
                    ptr[i].write_pointer FFI::MemoryPointer.from_string(s)
                end
                Efl::API.elm_init a.length, ptr
            end
        end
        #
        class ElmWin < Efl::Evas::EvasObject
            attr_reader :evas_object
            def initialize parent, title, type=:elm_win_basic
                @evas_object = Evas::EvasObject.new Efl::API.elm_win_add parent, title, type
                yield self if block_given?
            end
            def add e
                eo = Evas::EvasObject.new Efl::API.send "elm_#{e}_add", @evas_object.ptr
                yield eo if block_given?
                eo
            end
            def smart_callback_add event_str, cb, data=FFI::MemoryPointer::NULL
                Efl::API.evas_object_smart_callback_add @evas_object.ptr, event_str, cb, data
            end
            def method_missing m, *args, &block
                [ 'elm_win_', 'elm_' ].each do |s|
                    sym = s+m.to_s
                    return Efl::API.send( sym, @evas_object.ptr, *args, &block ) if Efl::API.respond_to? sym
                end
                Efl::API.send m
            end
        end
        #
    end
end
#
# EOF
