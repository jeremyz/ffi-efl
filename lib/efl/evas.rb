#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module EFL
    module EVAS
        #
        extend FFI::Library
        #
        callback :evas_async_events_put_cb, [:pointer, :int, :pointer], :void
        #
        ffi_lib 'evas'
        [
            # http://docs.enlightenment.org/auto/evas/group__Evas__Group.html
            [ :evas_init, [], :int],
            [ :evas_shutdown, [], :int],
            [ :evas_alloc_error, [], :int],
            [ :evas_async_events_fd_get, [], :int],
            [ :evas_async_events_process, [], :int],
            [ :evas_async_events_put, [:pointer, :int, :pointer, :evas_async_events_put_cb], :bool],
        ].each do |func|
            begin
                attach_function *func
            rescue Object => e
                puts "Could not attach #{func} #{e.message}"
            end
        end
        #
        ALLOC_ERROR_NONE = 0
        ALLOC_ERROR_FATAL = 1
        ALLOC_ERROR_RECOVERED = 2
        #
        class << self
            alias init evas_init
            alias shutdown evas_shutdown
            alias alloc_error evas_alloc_error
            alias async_events_fd_get evas_async_events_fd_get
            alias async_events_process evas_async_events_process
            alias async_events_put evas_async_events_put
        end
        #
    end
end
#
# EOF
