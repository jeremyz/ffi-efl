#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi/eina_list'
#
class Array
    def self.from_eina_list o
        if o.is_a? Efl::EinaList::REinaList
            o.to_ary
        elsif o.is_a? FFI::Pointer
            Efl::EinaList::REinaList.new(o).to_ary
        else
            raise ArgumentError.new "wrong argument #{o.class.name}"
        end
    end
end
module Efl
    module EinaList
        #
        class EinaListStruct < FFI::Struct
            layout  :data,          :pointer,
                    :next,          :pointer,
                    :prev,          :pointer,
                    :accounting,    :pointer,
                    :magic,         :uint,
        end
        #
        class REinaList
            include Enumerable
            include Efl::ClassHelper
            proxy_list [Efl::EinaList,'eina_list_'].freeze
            def initialize o=nil
                @ptr = (
                    case o
                    when FFI::Pointer
                        o
                    when NilClass
                        FFI::Pointer::NULL
                    when self.class
                        o.to_ptr
                    when Array
                        o.inject(FFI::Pointer::NULL) { |p,e| Efl::EinaList.eina_list_append p, e }
                    else
                        raise ArgumentError.new "wrong argument #{o.class.name}"
                    end
                )
            end
            def free p=nil
                return Efl::EinaList.eina_list_free p unless p.nil?
                Efl::EinaList.eina_list_free @ptr
                @ptr = nil
            end
            def each
                p = @ptr
                while p!=::FFI::Pointer::NULL
                    l = Efl::EinaList::EinaListStruct.new p
                    yield l[:data]
                    p = l[:next]
                end
            end
            def to_ary
                inject([]) { |s,e| s<<e }
            end
            # for fun and tests
            def append p
                @ptr = Efl::EinaList.eina_list_append @ptr, p
            end
            alias :<< :append
            def prepend p
                @ptr = Efl::EinaList.eina_list_prepend @ptr, p
            end
            alias :unshift :prepend
        end
    end
end
#
# EOF
