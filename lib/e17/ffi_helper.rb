#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module FFIHelper
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
    #
    def create_aliases l, fcts
        module_eval <<-code
        class << self
            #{fcts.map{ |f,a,r| "alias #{f.to_s[l..-1]} #{f}" }.join "\n" }
        end
        code
    end
    #
    def self.extended mod
        mod.module_eval <<-EOF
        typedef :pointer, :int_p
        typedef :pointer, :uint_p
        typedef :pointer, :void_p
        typedef :pointer, :uchar_p
        typedef :pointer, :string_array
        #
        typedef :pointer, :eina_list_p
        EOF
    end
end
#
# EOF
