#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/elm/elm_object_item'
require 'efl/native/elm/elm_hoversel'
#
module Efl
    #
    module Elm
        #
        class ElmCheck < ElmObject
            #
            include Helper
            constructor :elm_hoversel_add
            search_prefixes 'elm_hoversel_'
            #
            def item_add label, icon_file=nil, icon_type=:elm_icon_none, cb=nil, data=nil
                ElmHoverselItem.new Native.elm_hoversel_item_add @ptr, label, icon_file, icon_type, cb, data
            end
            #
        end
        #
    end
end
#
# EOF
