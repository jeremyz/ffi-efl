#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi/ecore'
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
        class EcorePipe
            def initialize cb, data
                @ptr = Efl::FFI.ecore_pipe_add cb, data
            end
            def del; Efl::FFI.ecore_pipe_del @ptr; end
            def read_close; Efl::FFI.ecore_pipe_read_close @ptr; end
            def write_close; Efl::FFI.ecore_pipe_write_close @ptr; end
            def write data
                Efl::FFI.ecore_pipe_write @ptr, ::FFI::MemoryPointer.from_string(data.to_s), data.to_s.length+1
            end
            #
        end
        #
    end
end
#
# EOF
