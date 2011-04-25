#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module Efl
    #
    module API
        #
        extend FFI::Library
        #
        def attach_fcts fcts
            fcts.each do |func|
                begin
                    attach_function(*func)
                rescue Object => e
                    puts "Could not attach #{func} #{e.message}"
                end
            end
        end
        module_function :attach_fcts
        #
        typedef :pointer, :char_p
        typedef :pointer, :short_p
        typedef :pointer, :int_p
        typedef :pointer, :long_p
        typedef :pointer, :float_p
        typedef :pointer, :double_p
        typedef :pointer, :uchar_p
        typedef :pointer, :ushort_p
        typedef :pointer, :uint_p
        typedef :pointer, :ulong_p
        typedef :pointer, :ufloat_p
        typedef :pointer, :udouble_p
        typedef :pointer, :void_p
        typedef :pointer, :string_array
        typedef :pointer, :string_array_p
        #
        typedef :pointer, :eina_list_p
        typedef :pointer, :eina_iterator_p
        typedef :pointer, :eina_accessor_p
        typedef :pointer, :evas_p
        typedef :pointer, :evas_object_p
        #
    end
    #
    module Helper
        def self.included m
            m.class_eval "def ptr; @ptr; end"
            m.class_eval "def self.func_prefixes; @func_prefixes; end"
            m.class_eval "def self.inherited sub; sub.class_eval 'def self.func_prefixes; superclass.func_prefixes; end'; end"
        end
        def method_missing m, *args, &block
            self.class.func_prefixes.each do |p|
                sym = p+m.to_s
                if Efl::API.respond_to? sym
                    self.class.class_eval "def #{m} *args, &block; r=Efl::API.#{sym}(@ptr,*args); yield r if block_given?; r; end" 
                    return self.send m, *args, &block
                end
            end
            r = Efl::API.send m, @ptr, *args
            self.class.class_eval "def #{m} *args, &block; r=Efl::API.#{m}(@ptr,*args); yield r if block_given?; r; end" 
            r
        end
    end
end
#
require 'efl/eina/eina_types-ffi'
#
# EOF
