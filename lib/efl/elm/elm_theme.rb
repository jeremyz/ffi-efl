#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_theme'
#
module Efl
    #
    module Elm
        #
        class ElmTheme < ElmObject
            #
            search_prefixes 'elm_theme_'
            #
            def initialize o=nil, &block
                @ptr = (
                    case o
                    when NilClass
                        FFI::AutoPointer.new Native.elm_theme_new, ElmTheme.method(:release)
                    when FFI::Pointer
                        o
                    else
                        raise ArgumentError.new "wrong argument #{o.class.name}"
                    end
                )
                instance_eval &block if block
            end
            def self.release p
                Native.elm_theme_free p
            end
            def free
                @ptr.autorelease=false if @ptr.is_a? FFI::AutoPointer
                ElmTheme.release @ptr
                @ptr=nil
            end
            #
        end
        #
    end
end
#
# EOF
