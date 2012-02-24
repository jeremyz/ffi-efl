#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina'
require 'efl/native/eina_hash'
#
module Efl
    module EinaHash
        #
        class REinaHash
            include Enumerable
            include Efl::ClassHelper
            search_prefixes 'eina_hash_'
            def initialize o=nil, &block
                cstr = ( block_given? ? block : Proc.new { Native.eina_hash_string_djb2_new FFI::Pointer::NULL } )
                @ptr = (
                    case o
                    when NilClass
                        FFI::AutoPointer.new cstr.call, REinaHash.method(:release)
                    when FFI::Pointer
                        FFI::AutoPointer.new( (o==FFI::Pointer::NULL ? cstr.call : o), REinaHash.method(:release))
                    when Hash
                        ptr = cstr.call
                        o.each do |k,v| Native.eina_hash_add ptr, k, v end
                        FFI::AutoPointer.new ptr, REinaHash.method(:release)
                    else
                        raise ArgumentError.new "wrong argument #{o.class.name}"
                    end
                )
            end
            def self.release p
                Native.eina_hash_free p
            end
            def del
                @ptr.autorelease=false
                EinaHash.release @ptr
                @ptr=nil
            end
            def each data=FFI::Pointer::NULL, &block
                return if not block_given?
                Native.eina_hash_foreach @ptr, Proc.new{|h,k,v,d| block.call(k,v) }, data
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
                Native.eina_hash_add @ptr, k, v
                v
            end
            alias :[]= :add
            def find k
                r = Native.eina_hash_find @ptr, k
                return ( r==FFI::Pointer::NULL ? nil : r )
            end
            alias :[] :find
        end
    end
end
#
# EOF
