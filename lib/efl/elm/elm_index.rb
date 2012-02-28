#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/elm/elm_object_item'
require 'efl/native/elm/elm_index'
#
module Efl
    #
    module Elm
        #
        class ElmIndex < ElmObject
            #
            include Helper
            constructor :elm_index_add
            search_prefixes 'elm_index_'
            #
            def item_selected_get idx
                ElmObjectItem.new Native.elm_index_item_selected_get @ptr, idx
            end
            #
            def item_find item
                ElmObjectItem.new Native.elm_index_item_find @ptr, item
            end
            #
        end
        #
    end
end
#
# EOF
