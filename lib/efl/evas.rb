#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module EFL
    module EVAS
        #
        extend FFI::Library
        #
        ffi_lib 'evas'
        functions = [
            [ :evas_init, [ ], :int ],
            [ :evas_shutdown, [], :int ],
        ].each do |func|
            begin
                attach_function *func
            rescue Object => e
                puts "Could not attach #{func} #{e.message}"
            end
        end
        #
        class << self
            alias init evas_init
            alias shutdown evas_shutdown
        end
        #
    end
end
#
# EOF
