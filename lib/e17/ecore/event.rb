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
#        enum :ecore_signals, [:none,0,:signal_user,:signal_hup,:signal_exit,:signal_power,:signal_realtime]
        EVENT_NONE = 0
        EVENT_SIGNAL_USER     = 1 # User signal event
        EVENT_SIGNAL_HUP      = 2 # Hup signal event
        EVENT_SIGNAL_EXIT     = 3 # Exit signal event
        EVENT_SIGNAL_POWER    = 4 # Power signal event
        EVENT_SIGNAL_REALTIME = 5 # Realtime signal event
        EVENT_COUNT = 6
        #
        typedef :pointer, :ecore_event
        typedef :pointer, :ecore_event_filter
        typedef :pointer, :ecore_event_handler
        #
        callback :ecore_end_cb, [:pointer, :pointer], :void
        callback :ecore_data_cb, [:pointer], :pointer
        callback :ecore_filter_cb, [:pointer, :pointer, :int, :pointer], :bool
        callback :ecore_event_handler_cb, [:pointer, :int, :pointer], :bool
        #
        fcts = [
            # http://docs.enlightenment.org/auto/ecore/group__Ecore__Event__Group.html
            [ :ecore_event_handler_add, [:int, :ecore_event_handler_cb, :pointer], :ecore_event_handler],
            [ :ecore_event_handler_del, [:ecore_event_handler], :pointer],
            [ :ecore_event_add, [:int, :pointer, :ecore_end_cb, :pointer], :ecore_event],
            [ :ecore_event_del, [:ecore_event], :pointer],
            [ :ecore_event_handler_data_get, [:ecore_event_handler], :pointer],
            [ :ecore_event_handler_data_set, [:ecore_event_handler, :pointer], :pointer],
            [ :ecore_event_type_new, [], :int],
            [ :ecore_event_filter_add, [:ecore_data_cb, :ecore_filter_cb, :ecore_end_cb, :pointer], :ecore_event_filter],
            [ :ecore_event_filter_del, [:ecore_event_filter], :pointer],
            [ :ecore_event_current_type_get, [], :int],
            [ :ecore_event_current_event_get, [], :pointer],
        ]
        #
        attach_fcts fcts
        #
        create_aliases 'ecore_'.length, fcts
        #
    end
end
#
# EOF
