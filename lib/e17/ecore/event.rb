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
        EVENT_NONE = 0
        EVENT_SIGNAL_USER     = 1 # User signal event
        EVENT_SIGNAL_HUP      = 2 # Hup signal event
        EVENT_SIGNAL_EXIT     = 3 # Exit signal event
        EVENT_SIGNAL_POWER    = 4 # Power signal event
        EVENT_SIGNAL_REALTIME = 5 # Realtime signal event
        EVENT_COUNT = 6
        callback :ecore_event_handler_cb, [:pointer, :int, :pointer], :bool
        callback :ecore_end_cb, [:pointer, :pointer], :void
        callback :ecore_data_cb, [:pointer], :pointer
        callback :ecore_filter_cb, [:pointer, :pointer, :int, :pointer], :bool
        #
        ffi_lib 'ecore'
        functions = [
            [ :ecore_event_handler_add, [:int, :ecore_event_handler_cb, :pointer], :pointer ],
            [ :ecore_event_handler_del, [:pointer], :void ],
            [ :ecore_event_add, [:int, :pointer, :ecore_end_cb, :pointer], :pointer ],
            [ :ecore_event_del, [:pointer], :void ],
            [ :ecore_event_handler_data_get, [:pointer], :pointer ],
            [ :ecore_event_handler_data_set, [:pointer,:pointer], :void ],
            [ :ecore_event_type_new, [], :int ],
            [ :ecore_event_filter_add, [:ecore_data_cb, :ecore_filter_cb, :ecore_end_cb, :pointer], :pointer ],
            [ :ecore_event_filter_del, [:pointer], :void ],
            [ :ecore_event_current_type_get, [], :int ],
            [ :ecore_event_current_event_get, [], :pointer],
        ].each do |func|
            begin
                attach_function *func
            rescue Object => e
                puts "Could not attach #{func} #{e.message}"
            end
        end
        #
        class << self
            alias event_handler_add ecore_event_handler_add
            alias event_handler_del ecore_event_handler_del
            alias event_add ecore_event_add
            alias event_del ecore_event_del
            alias event_handler_data_get ecore_event_handler_data_get
            alias event_handler_data_set ecore_event_handler_data_set
            alias event_type_new ecore_event_type_new
            alias event_current_type_get ecore_event_current_type_get
            alias event_current_event_get ecore_event_current_event_get
        end
        #
    end
end
#
# EOF
