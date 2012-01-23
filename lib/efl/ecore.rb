#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl'
require 'efl/native/ecore'
#
module Efl
    module Ecore
        #
        # ecore-1/Ecore.h line 95
        EVENT_NONE = 0
        EVENT_SIGNAL_USER     = 1 # User signal event
        EVENT_SIGNAL_HUP      = 2 # Hup signal event
        EVENT_SIGNAL_EXIT     = 3 # Exit signal event
        EVENT_SIGNAL_POWER    = 4 # Power signal event
        EVENT_SIGNAL_REALTIME = 5 # Realtime signal event
        EVENT_COUNT = 6
        #
        def self.version
            Native::VersionStruct.new(Native.ecore_version)
        end
        #
        class REcorePipe
            def initialize cb, data
                @ptr = FFI::AutoPointer.new Native.ecore_pipe_add(cb, data), REcorePipe.method(:release)
            end
            def self.release p
                Native.ecore_pipe_del p
            end
            def del
                @ptr.autorelease=false
                REcorePipe.release @ptr
                @ptr=nil
            end
            def read_close
                Native.ecore_pipe_read_close @ptr
            end
            def write_close
                Native.ecore_pipe_write_close @ptr
            end
            def write data
                Native.ecore_pipe_write @ptr, FFI::MemoryPointer.from_string(data.to_s), data.to_s.length+1
            end
            #
        end
        #
    end
end
#
# EOF
