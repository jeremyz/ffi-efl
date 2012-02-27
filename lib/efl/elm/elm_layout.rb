#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_layout'
#
module Efl
    #
    module Elm
        #
        class ElmLayout < ElmObject
            #
            include Helper
            constructor :elm_layout_add
            search_prefixes 'elm_layout_'
            #
            def edje_get &block
                Efl::Edje::REdje.new Native.method(:elm_layout_edje_get), @ptr, &block
            end
            alias :edje :edje_get
        end
        #
    end
end
#
# EOF
