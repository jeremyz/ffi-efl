#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/elm/elm_object_item'
require 'efl/native/elm/elm_menu'
#
module Efl
    #
    module Elm
        #
        class ElmMenu < ElmObject
            #
            include Helper
            constructor :elm_menu_add
            search_prefixes 'elm_menu_'
            #
            def item_add parent, icon=nil, label=nil, cb=nil, data=nil
                ElmObjectItem.new Native.elm_menu_item_add @ptr, parent, icon, label, cb, data
            end
            #
            def item_add_object parent, subobj, cb=nil, data=nil
                ElmObjectItem.new Native.elm_menu_item_add_object @ptr, parent, subobj, cb, data
            end
            #
            def item_separator_add parent
                ElmObjectItem.new Native.elm_menu_item_separator_add @ptr, parent
            end
            #
            def selected_item_get
                ElmObjectItem.new Native.elm_menu_selected_item_get @ptr
            end
            #
            def last_item_get
                ElmObjectItem.new Native.elm_menu_last_item_get @ptr
            end
            #
            def first_item_get
                ElmObjectItem.new Native.elm_menu_first_item_get @ptr
            end
            #
            def item_next_get it
                ElmObjectItem.new Native.elm_menu_item_next_get it
            end
            #
            def item_prev_get it
                ElmObjectItem.new Native.elm_menu_item_prev_get it
            end
            #
        end
        #
    end
end
#
# EOF
