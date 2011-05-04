#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native/eina_list'
#
module Efl
    #
    module Native
        #
        class EinaListStruct < FFI::Struct
            layout  :data,          :pointer,
                        :next,          :pointer,
                    :prev,          :pointer,
                    :accounting,    :pointer,
                    :magic,         :uint
        end
    end
    #
    module EinaList
        #
        class REinaList
            include Enumerable
            include Efl::ClassHelper
            search_prefixes 'eina_list_'
            def initialize o=nil
                @ptr = (
                    case o
                    when FFI::Pointer
                        o
                    when NilClass
                        FFI::Pointer::NULL
                    when Array
                        o.inject(FFI::Pointer::NULL) { |p,e| Native.eina_list_append p, e }
                    else
                        raise ArgumentError.new "wrong argument #{o.class.name}"
                    end
                )
            end
            def free
                Native.eina_list_free @ptr
                @ptr = nil
            end
            def each
                return if not block_given?
                p = @ptr
                while p!=::FFI::Pointer::NULL
                    l = Native::EinaListStruct.new p
                    yield l[:data]
                    p = l[:next]
                end
            end
            def to_ary
                inject([]) { |s,e| s<<e }
            end
            # for fun and tests
            def append p
                @ptr = Native.eina_list_append @ptr, p
            end
            alias :<< :append
            def prepend p
                @ptr = Native.eina_list_prepend @ptr, p
            end
            alias :unshift :prepend
        end
    end
end
#
# EOF
