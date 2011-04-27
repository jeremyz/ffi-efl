#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina'
require 'efl/ffi/eina_list'
#
class Array
    def self.from_eina_list o
        if o.is_a? Efl::Eina::EinaList
            o.to_ary
        elsif o.is_a? ::FFI::Pointer
            Efl::Eina::EinaList.new(o).to_ary
        else
            raise ArgumentError.new " wrong argument #{o.class.name}"
        end
    end
end
module Efl
    module FFI
        class EinaList < ::FFI::Struct
            layout  :data,          :pointer,
                    :next,          :pointer,
                    :prev,          :pointer,
                    :accounting,    :pointer,
                    :magic,         :uint,
        end
    end
    module Eina
        #
        class EinaList
            include Efl::Helper
            include Enumerable
            @func_prefixes = [ 'eina_list_' ].freeze
            def initialize o=nil
                @ptr = (
                    case o
                    when ::FFI::Pointer
                        o
                    when NilClass
                        ::FFI::Pointer::NULL
                    when self.class
                        o.ptr
                    when Array
                        o.inject(::FFI::Pointer::NULL) { |p,e| Efl::FFI::eina_list_append p, e }
                    else
                        raise ArgumentError.new "#{ptr.class} valid argument"
                    end
                )
            end
            def free
                return if @ptr==::FFI::Pointer::NULL
                @ptr = Efl::FFI.eina_list_free @ptr
            end
            def each
                p = @ptr
                while p!=::FFI::Pointer::NULL
                    l = Efl::FFI::EinaList.new p
                    yield l[:data]
                    p = l[:next]
                end
            end
            def to_ary
                inject([]) { |s,e| s<<e }
            end
            # for fun and tests
            def append p
                @ptr = Efl::FFI.eina_list_append @ptr, p
            end
            alias :<< :append
            def prepend p
                @ptr = Efl::FFI.eina_list_prepend @ptr, p
            end
            alias :unshift :prepend
        end
    end
end
#
# EOF
