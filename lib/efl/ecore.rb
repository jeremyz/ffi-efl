#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module EFL
    module ECORE
        #
        MAJOR = 0
        MINOR = 0
        REVISION = 1
        VERSION = [MAJOR,MINOR,REVISION].join '.'
        #
        extend FFI::Library
        #
        ffi_lib 'ecore'
        functions = [
            [ :ecore_init, [ ], :int ],
            [ :ecore_shutdown, [], :int ],
        ].each do |func|
            begin
                attach_function *func
            rescue Object => e
                puts "Could not attach #{func} #{e.message}"
            end
        end
        #
        def self.init
            ecore_init
        end
        #
        def self.shutdown
            ecore_shutdown
        end
        #
    end
end
#
# EOF
