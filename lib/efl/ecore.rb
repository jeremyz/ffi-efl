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
        ffi_lib 'ecore'
        functions = [
            [ :ecore_init, [ ], :int ],
            [ :ecore_shutdown, [], :int ],
            [ :ecore_main_loop_begin, [], :void],
            [ :ecore_main_loop_quit, [], :void],
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
            alias main_loop_begin ecore_main_loop_begin
            alias main_loop_quit ecore_main_loop_quit
        end
        #
    end
end
#
# EOF
