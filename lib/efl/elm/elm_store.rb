#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl'
require 'efl/native/elm/elm_store'
#
module Efl
    #
    module Elm
        #
        class ElmStore
            #
            include Efl::ClassHelper
            search_prefixes 'elm_store_'
            #
            def initialize o=nil, &block
                @ptr = (
                    case o
                    when NilClass
                        FFI::AutoPointer.new Native.elm_store_filesystem_new, ElmStore.method(:release)
                    when FFI::Pointer
                        o
                    else
                        raise ArgumentError.new "wrong argument #{o.class.name}"
                    end
                )
                instance_eval &block if block
            end
            def self.release p
                Native.elm_store_free p
            end
            def free
                @ptr.autorelease=false if @ptr.is_a? FFI::AutoPointer
                ElmStore.release @ptr
                @ptr=nil
            end
            #
        end
        #
    end
end
#
# EOF
