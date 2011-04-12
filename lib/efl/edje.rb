#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module EFL
    module EDJE
        #
        extend FFI::Library
        #
        ffi_lib 'edje'
        [
            [ :edje_init, [], :int],
            [ :edje_shutdown, [], :int],
        ].each do |func|
            begin
                attach_function *func
            rescue Object => e
                puts "Could not attach #{func} #{e.message}"
            end
        end
        #
        class << self
            alias init edje_init
            alias shutdown edje_shutdown
        end
        #
    end
end
#
# EOF
