#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module E17
    module ECORE
        #
        extend FFI::Library
        #
        callback :ecore_pipe_cb, [:pointer, :pointer, :int], :void
        callback :ecore_select_function, [:int, :pointer, :pointer, :pointer, :pointer], :int
        #
        ffi_lib 'ecore'
        [
            # http://docs.enlightenment.org/auto/ecore/group__Ecore__Group.html
            [ :ecore_init, [ ], :int],
            [ :ecore_shutdown, [], :int],
            [ :ecore_pipe_add, [:ecore_pipe_cb, :pointer], :pointer],
            [ :ecore_pipe_del, [:pointer], :pointer],
            [ :ecore_pipe_read_close, [:pointer], :void],
            [ :ecore_pipe_write_close, [:pointer], :void],
            [ :ecore_pipe_write, [:pointer, :pointer, :int], :bool],
            # http://docs.enlightenment.org/auto/ecore/group__Ecore__Main__Loop__Group.html
            [ :ecore_main_loop_iterate, [], :void],
            [ :ecore_main_loop_begin, [], :void],
            [ :ecore_main_loop_quit, [], :void],
            [ :ecore_main_loop_select_func_set, [], :void],  # TODO spec
            [ :ecore_main_loop_select_func_get, [], :void],  # TODO spec
#            EAPI void   ecore_main_fd_handler_prepare_callback_set (Ecore_Fd_Handler *fd_handler, Ecore_Fd_Prep_Cb func, const void *data) # TODO
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
            alias pipe_add ecore_pipe_add
            alias pipe_del ecore_pipe_del
            alias pipe_read_close ecore_pipe_read_close
            alias pipe_write_close ecore_pipe_write_close
            alias pipe_write ecore_pipe_write
            #
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
