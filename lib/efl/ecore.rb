#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module EFL
    module ECORE
        #
        extend FFI::Library
        #
        callback:ecore_select_function, [ :int, :pointer, :pointer, :pointer, :pointer], :int
        #
        ffi_lib 'ecore'
        functions = [
            [ :ecore_init, [ ], :int ],
            [ :ecore_shutdown, [], :int ],
            [ :ecore_main_loop_iterate, [], :void],
            [ :ecore_main_loop_begin, [], :void],
            [ :ecore_main_loop_quit, [], :void],
            [ :ecore_main_loop_select_func_set, [], :void],  # TODO spec
            [ :ecore_main_loop_select_func_get, [], :void],  # TODO spec
        ].each do |func|
            begin
                attach_function *func
            rescue Object => e
                puts "Could not attach #{func} #{e.message}"
            end
        end
        #
        class << self
            alias init ecore_init
            alias shutdown ecore_shutdown
            alias main_loop_iterate ecore_main_loop_iterate
            alias main_loop_begin ecore_main_loop_begin
            alias main_loop_quit ecore_main_loop_quit
            alias main_loop_select_func_set ecore_main_loop_select_func_set
            alias main_loop_select_func_get ecore_main_loop_select_func_get
        end
        #
    end
end
#
# EOF
