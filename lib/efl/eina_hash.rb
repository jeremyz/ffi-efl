#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi/eina_hash'
#
class Hash
    def self.from_eina_hash o
        if o.is_a? Efl::EinaHash::REinaHash
            o.to_h
        elsif o.is_a? FFI::Pointer
            Efl::EinaHash::REinaHash.new(o).to_h
        else
            raise ArgumentError.new " wrong argument #{o.class.name}"
        end
    end
end
module Efl
    module EinaHash
        #
        class REinaHash
            include Enumerable
            include Efl::ClassHelper
            proxy_list [Efl::EinaHash,'eina_hash_'].freeze
            def initialize o=nil, &block
                cstr = ( block_given? ? block : Proc.new { Efl::EinaHash.eina_hash_string_djb2_new FFI::Pointer::NULL } )
                @ptr = (
                    case o
                    when NilClass
                        FFI::AutoPointer.new cstr.call, method(:free)
                    when self.class
                        o.to_ptr
                    when FFI::AutoPointer
                        o
                    when FFI::Pointer
                        FFI::AutoPointer.new ( o==FFI::Pointer::NULL ? cstr.call : o ), method(:free)
                    when Hash
                        ptr = cstr.call
                        o.each do |k,v| Efl::EinaHash.eina_hash_add ptr, k, v end
                        FFI::AutoPointer.new ptr, method(:free)
                    else
                        raise ArgumentError.new "wrong argument #{o.class.name}"
                    end
                )
            end
            def free p=nil
                return Efl::EinaHash.eina_hash_free p unless p.nil?
                Efl::EinaHash.eina_hash_free @ptr
                @ptr.free
                @ptr = nil
            end
            def each data=FFI::Pointer::NULL, &block
                return if not block_given?
                Efl::EinaHash::eina_hash_foreach @ptr, Proc.new{|h,k,v,d| block.call(k,v) }, data
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
                Efl::EinaHash.eina_hash_add @ptr, k, v
                v
            end
            alias :[]= :add
            def find k
                r = Efl::EinaHash.eina_hash_find @ptr, k
                return ( r==FFI::Pointer::NULL ? nil : r )
            end
            alias :[] :find
        end
    end
end
#
# EOF
