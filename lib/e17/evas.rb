#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/ffi_helper'
#
module E17
    module EVAS
        #
        extend FFIHelper
        extend FFI::Library
        #
        ffi_lib 'evas'
        #
        enum :evas_alloc_error, [:none,0,:fatal,:recovered]
        #
        callback :evas_async_events_put_cb, [:pointer, :int, :pointer], :void
        #
        fcts = [
            # http://docs.enlightenment.org/auto/evas/group__Evas__Group.html
            [ :evas_init, [], :int],
            [ :evas_shutdown, [], :int],
            [ :evas_alloc_error, [], :evas_alloc_error],
            [ :evas_async_events_fd_get, [], :int],
            [ :evas_async_events_process, [], :int],
            [ :evas_async_events_put, [:pointer, :int, :pointer, :evas_async_events_put_cb], :bool],
        ]
        #
        attach_fcts fcts
        #
        create_aliases 'evas_'.length, fcts
        #
    end
end
#
# EOF
