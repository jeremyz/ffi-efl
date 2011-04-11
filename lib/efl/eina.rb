#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module EFL
    module EINA
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
        class << self
            alias init eina_init
            alias shutdown eina_shutdown
        end
        #
    end
end
#
# EOF
