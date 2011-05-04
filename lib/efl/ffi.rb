#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module Efl
    #
    module FFIHelper
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
        #
        def ffi_typedefs
            @ffi_typedefs
        end
        #
        def steal_ffitype mod, sym
            typedef mod.ffi_typedefs[sym], sym
        end
        #
        def self.extended mod
            #
            mod.extend FFI::Library
            #
            mod.typedef :pointer, :char_p
            mod.typedef :pointer, :short_p
            mod.typedef :pointer, :int_p
            mod.typedef :pointer, :long_p
            mod.typedef :pointer, :float_p
            mod.typedef :pointer, :double_p
            mod.typedef :pointer, :uchar_p
            mod.typedef :pointer, :ushort_p
            mod.typedef :pointer, :uint_p
            mod.typedef :pointer, :ulong_p
            mod.typedef :pointer, :ufloat_p
            mod.typedef :pointer, :udouble_p
            mod.typedef :pointer, :void_p
            mod.typedef :pointer, :string_array
            mod.typedef :pointer, :string_array_p
            mod.typedef :uint_p,  :uintptr_t
            #
            mod.typedef :bool,    :eina_bool
            mod.typedef :pointer, :eina_bool_p
            mod.typedef :pointer, :eina_list_p
            mod.typedef :pointer, :eina_hash_p
            mod.typedef :pointer, :eina_iterator_p
            mod.typedef :pointer, :eina_accessor_p
            mod.typedef :pointer, :evas_p
            mod.typedef :pointer, :evas_object_p
            mod.typedef :pointer, :evas_object_pp
            mod.typedef :pointer, :ecore_getopt_p
            mod.typedef :pointer, :ecore_getopt_desc_p
            mod.typedef :pointer, :ecore_getopt_value_p
            #
            mod.callback :eina_compare_cb, [ :void_p, :void_p ], :int
            mod.callback :eina_each_cb, [ :void_p, :void_p, :void_p ], :eina_bool
            mod.callback :eina_free_cb, [ :void_p ], :void
            #
        end
        #
    end
    #
    module ClassHelper
        def to_ptr; @ptr; end
        def === o; @ptr === o.to_ptr; end
        def address; @ptr.address; end
        def self.included kls
            # create class instance @proxy_list
            kls.class_eval "@proxy_list ||=[]"
            # access and prepend *args to @proxy_list
            kls.class_eval "def self.proxy_list *args; @proxy_list.unshift *args unless args.empty?; @proxy_list; end"
            # on inheritance, copy ancestor's @proxy_list
            kls.class_eval <<-EOF
            def self.inherited sub
                sub.class_eval '@proxy_list = []'
                sub.proxy_list *self.proxy_list
            end
            EOF
        end
        def method_missing m, *args, &block
            m_s = m.to_s
            if m_s =~/^(.*)=$/
                m_s = $1+'_set'
                args_s = '*args[0]'
            elsif m_s =~/^(.*)\?$/
                m_s = $1+'_get'
                args_s = '*args'
            else
                args_s = '*args'
            end
            self.class.proxy_list.each do |mod,p|
                sym = p+m_s
                if mod.respond_to? sym
                    self.class.class_eval "def #{m} *args, &block; r=#{mod.name}.#{sym}(@ptr,#{args_s}); yield r if block_given?; r; end"
                    return self.send m, *args, &block
                elsif mod.respond_to? m
                    self.class.class_eval "def #{m} *args, &block; r=#{mod.name}.#{m}(@ptr,#{args_s}); yield r if block_given?; r; end"
                    return self.send m, *args, &block
                end
            end
            return [self.to_s+' ['+self.to_ptr.to_s+']'] if m_s=~/^to_ary$/
            Kernel.raise NameError.new "#{self.class.name} is unable to resolve #{m} within #{self.class.proxy_list.inspect}"
        end
    end
end
#
# EOF
