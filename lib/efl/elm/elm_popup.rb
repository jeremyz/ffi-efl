#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/elm/elm_object_item'
require 'efl/native/elm/elm_popup'
#
module Efl
    #
    module Elm
        #
        class ElmPopup < ElmObject
            #
            include Helper
            constructor :elm_popup_add
            search_prefixes 'elm_popup_'
            #
            def item_append label, icon, func, data=nil
                ElmObjectItem.new Native.elm_popup_item_append @ptr, label, icon, func, data
            end
        end
        #
    end
end
#
# EOF
