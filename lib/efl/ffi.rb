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
            alias :ffi_lib_orig :ffi_lib
            def ffi_lib *names
                @all_ffi_libs||=[]
                @all_ffi_libs += ffi_lib_orig(names)
                @all_ffi_libs.uniq!
            end
            def find_variable name
                @all_ffi_libs.each do |lib|
                    address = lib.find_variable name
                    return address if not address.nil?
                end
                return nil
            end
        end
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
        typedef :uint_p,  :uintptr_t
        #
        typedef :bool,    :eina_bool
        typedef :pointer, :eina_bool_p
        typedef :pointer, :eina_list_p
        typedef :pointer, :eina_hash_p
        typedef :pointer, :eina_iterator_p
        typedef :pointer, :eina_accessor_p
        typedef :pointer, :evas_p
        typedef :pointer, :evas_object_p
        typedef :pointer, :evas_object_pp
        typedef :pointer, :evas_gl_api_p
        typedef :pointer, :ecore_getopt_p
        typedef :pointer, :ecore_getopt_desc_p
        typedef :pointer, :ecore_getopt_value_p
        #
        callback :eina_compare_cb, [ :void_p, :void_p ], :int
        callback :eina_each_cb, [ :void_p, :void_p, :void_p ], :eina_bool
        callback :eina_free_cb, [ :void_p ], :void
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
    module ModuleHelper
        def find_function m, prefix
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
            sym = (
                if Efl::Native.respond_to? prefix+m_s
                    prefix+m_s
                elsif Efl::Native.respond_to? m_s
                    m_s
                elsif Efl::Native.respond_to? prefix+m_s+'_get'
                    prefix+m_s+'_get'
                elsif Efl::Native.respond_to? m_s+'_get'
                    m_s+'_get'
                else
                    raise NameError.new "#{self.name}.#{m_s} (#{m})"
                end
            )
            [sym, args_s]
        end
        module_function :find_function
    end
    #
    module ClassHelper
        def to_a; [self] end
        def to_ary; [self] end
        def to_s; Object.instance_method(:to_s).bind(self).call+' ['+self.to_ptr.to_s+']' end
        def to_ptr; @ptr; end
        def === o; @ptr === o.to_ptr; end
        def null?; @ptr.null?; end
        def address; @ptr.address; end
        def self.included kls
            # create class instance @search_prefixes
            kls.class_eval "@search_prefixes ||=[]"
            # access and prepend *args to @search_prefixes
            kls.class_eval "def self.search_prefixes *args; @search_prefixes.unshift *args unless args.empty?; @search_prefixes; end"
            # on inheritance, copy ancestor's @search_prefixes
            kls.class_eval <<-EOF
            def self.inherited sub
                sub.class_eval '@search_prefixes = []'
                sub.search_prefixes *self.search_prefixes
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
            (['']+self.class.search_prefixes).each do |p|
                sym = p+m_s
                meth = (
                    if Efl::Native.respond_to? sym
                        sym
                    elsif Efl::Native.respond_to? m_s
                        m_s
                    elsif Efl::Native.respond_to? sym+'_get'
                        sym+'_get'
                    elsif Efl::Native.respond_to? m_s+'_get'
                        m_s+'_get'
                    else
                        nil
                    end
                )
                if not meth.nil?
                    self.class.class_eval "def #{m} *args, &block; r=Efl::Native.#{meth}(@ptr,#{args_s}); yield r if block_given?; r; end"
                    return self.send m, *args, &block
                end
            end
            Kernel.raise NameError.new "#{self.class.name} is unable to resolve #{m} within #{self.class.search_prefixes.inspect}"
        end
    end
end
#
# EOF
