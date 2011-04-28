#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina'
require 'efl/ffi/eina/eina_hash'
#
class Hash
    def self.from_eina_hash o
        if o.is_a? Efl::Eina::EinaHash
            o.to_h
        elsif o.is_a? ::FFI::Pointer
            Efl::Eina::EinaHash.new(o).to_h
        else
            raise ArgumentError.new " wrong argument #{o.class.name}"
        end
    end
end
module Efl
    module Eina
        #
        class EinaHash
            include Efl::Helper
            include Enumerable
            @func_prefixes = [ 'eina_hash_' ].freeze
            def initialize o=nil, &block
                cstr = ( block_given? ? block : Proc.new { Efl::FFI.eina_hash_string_djb2_new ::FFI::Pointer::NULL } )
                @ptr = (
                    case o
                    when ::FFI::Pointer
                        ( o==::FFI::Pointer::NULL ? cstr.call : o )
                    when NilClass
                        cstr.call
                    when self.class
                        o.ptr
                    when Hash
                        ptr = cstr.call
                        o.each do |k,v| Efl::FFI.eina_hash_add ptr, k, v end
                        ptr
                    else
                        raise ArgumentError.new "#{ptr.class} valid argument"
                    end
                )
            end
            def free
                return if @ptr==::FFI::Pointer::NULL
                @ptr = Efl::FFI.eina_hash_free @ptr
            end
            def each data=::FFI::Pointer::NULL, &block
                return if not block_given?
                Efl::FFI::eina_hash_foreach @ptr, Proc.new{|h,k,v,d| block.call(k,v) }, data
            end
            def to_h
                 rh = {}
                 each { |k,v| rh[k]=v; true }
                 rh
            end
            def to_h_conv &block
                 rh = {}
                 if block_given?
                    each { |k,v| rh[block.call(k)]=v; true }
                 else
                    each { |k,v| rh[k.read_string]=v; true }
                 end
                 rh
            end
            # for fun and tests
            def add k, v
                Efl::FFI.eina_hash_add @ptr, k, v
                v
            end
            alias :[]= :add
            def find k
                r = Efl::FFI.eina_hash_find @ptr, k
                return ( r==::FFI::Pointer::NULL ? nil : r )
            end
            alias :[] :find
        end
    end
end
#
# EOF
