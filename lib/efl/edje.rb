#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module EFL
    module EDJE
        #
        MAJOR = 0
        MINOR = 0
        REVISION = 1
        VERSION = [MAJOR,MINOR,REVISION].join '.'
        #
        extend FFI::Library
        #
        ffi_lib 'edje'
        functions = [
            [ :edje_init, [ ], :int ],
            [ :edje_shutdown, [], :int ],
        ].each do |func|
            begin
                attach_function *func
            rescue Object => e
                puts "Could not attach #{func} #{e.message}"
            end
        end
        #
        def self.init
            edje_init
        end
        #
        def self.shutdown
            edje_shutdown
        end
        #
    end
end
#
# EOF
