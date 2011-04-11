#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module EFL
    module ECORE
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
        class << self
            alias init ecore_init
            alias shutdown ecore_shutdown
        end
        #
    end
end
#
# EOF
