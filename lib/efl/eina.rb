#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module EFL
    module EINA
        #
        MAJOR = 0
        MINOR = 0
        REVISION = 1
        VERSION = [MAJOR,MINOR,REVISION].join '.'
        #
        extend FFI::Library
        #
        ffi_lib 'eina'
        functions = [
            [ :eina_init, [ ], :int ],
            [ :eina_shutdown, [], :int ],
        ].each do |func|
            begin
                attach_function *func
            rescue Object => e
                puts "Could not attach #{func} #{e.message}"
            end
        end
        #
        def self.init
            eina_init
        end
        #
        def self.shutdown
            eina_shutdown
        end
        #
    end
end
#
# EOF
