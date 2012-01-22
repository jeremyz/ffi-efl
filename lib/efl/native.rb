#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module Efl
    #
    module Native
        #
        extend FFI::Library
        #
        def self.attach_fcts fcts
            fcts.each do |func|
                begin
                    attach_function(*func)
                rescue Object => e
                    puts "Could not attach #{func} #{e.message}"
                end
            end
        end
        #
        class << self
            def find_variable name
                ffi_libraries.each do |lib|
                    address = lib.find_variable name
                    return address if not address.nil?
                end
                return nil
            end
        end
        #
        class VersionStruct < FFI::Struct
            layout  :major,     :int,
                    :minor,     :int,
                    :micro,     :int,
                    :revision,  :int

            def full
                [:major,:minor,:micro,:revision].collect { |e| self[e].to_s }.join '.'
            end
        end
    end
    #
end
#
require 'efl/native/eina_types'
#
# EOF
