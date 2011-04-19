#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module E17
    #
    module API
        #
        extend FFI::Library
        #
        def attach_fcts fcts
            fcts.each do |func|
                begin
                    attach_function *func
                rescue Object => e
                    puts "Could not attach #{func} #{e.message}"
                end
            end
        end
        module_function :attach_fcts
        #
        typedef :pointer, :int_p
        typedef :pointer, :uint_p
        typedef :pointer, :void_p
        typedef :pointer, :uchar_p
        typedef :pointer, :string_array
        #
        typedef :pointer, :eina_list_p
        #
    end
    #
end
#
# EOF
