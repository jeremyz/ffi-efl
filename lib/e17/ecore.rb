#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/ffi_helper'
#
module E17
    module ECORE
        #
        extend FFIHelper
        extend FFI::Library
        #
        ffi_lib 'ecore'
        #
        typedef :pointer, :data
        typedef :pointer, :ecore_pipe
        typedef :pointer, :ecore_fd_handler
        #
        callback :ecore_pipe_cb, [:data, :pointer, :int], :void
        callback :ecore_select_function, [:int, :pointer, :pointer, :pointer, :pointer], :int
        callback :ecore_fd_prep_cb, [:data, :pointer], :void
        #
        fcts = [
            # http://docs.enlightenment.org/auto/ecore/group__Ecore__Group.html
            [ :ecore_init, [], :int],
            [ :ecore_shutdown, [], :int],
            [ :ecore_pipe_add, [:ecore_pipe_cb, :data], :ecore_pipe],
            [ :ecore_pipe_del, [:ecore_pipe], :data],
            [ :ecore_pipe_read_close, [:ecore_pipe], :void],
            [ :ecore_pipe_write_close, [:ecore_pipe], :void],
            [ :ecore_pipe_write, [:ecore_pipe, :pointer, :int], :bool],
            # http://docs.enlightenment.org/auto/ecore/group__Ecore__Main__Loop__Group.html
            [ :ecore_main_loop_iterate, [], :void],
            [ :ecore_main_loop_begin, [], :void],
            [ :ecore_main_loop_quit, [], :void],
            [ :ecore_main_loop_select_func_set, [:ecore_select_function], :void],                           # TODO spec
            [ :ecore_main_loop_select_func_get, [], :ecore_select_function],                                # TODO spec
            [ :ecore_main_fd_handler_prepare_callback_set, [:ecore_fd_handler, :ecore_fd_prep_cb, :data], :void], # TODO spec
        ]
        #
        attach_fcts fcts
        #
        create_aliases 'ecore_'.length, fcts
        #
        class EcorePipe
            def initialize cb, data
                @ptr = ECORE.ecore_pipe_add cb, data
            end
            def del; ECORE.ecore_pipe_del @ptr; end
            def read_close; ECORE.ecore_pipe_read_close @ptr; end
            def write_close; ECORE.ecore_pipe_write_close @ptr; end
            def write data
                ECORE.ecore_pipe_write @ptr, FFI::MemoryPointer.from_string(data.to_s), data.to_s.length+1
            end
        end
    end
end
#
# EOF
