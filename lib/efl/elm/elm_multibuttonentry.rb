#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/elm/elm_object_item'
require 'efl/native/elm/elm_multibuttonentry'
#
module Efl
    #
    module Elm
        #
        class ElmMultiButtonEntry < ElmObject
            #
            include Helper
            constructor :elm_multibuttonentry_add
            search_prefixes 'elm_multibuttonentry_'
            #
            def item_prepend label, data=nil
                ElmObjectItem.new Native.elm_multibuttonentry_item_prepend @ptr, label, data
            end
            #
            def item_append label, data=nil
                ElmObjectItem.new Native.elm_multibuttonentry_item_append @ptr, label, data
            end
            #
            def item_insert_before before, label, data=nil
                ElmObjectItem.new Native.elm_multibuttonentry_item_insert_before @ptr, before, label, data
            end
            #
            def item_insert_after after, label, data=nil
                ElmObjectItem.new Native.elm_multibuttonentry_item_insert_after @ptr, after, label, data
            end
            #
            def first_item_get
                ElmObjectItem.new Native.elm_multibuttonentry_first_item_get @ptr
            end
            #
            def last_item_get
                ElmObjectItem.new Native.elm_multibuttonentry_last_item_get @ptr
            end
            #
            def selected_item_get
                ElmObjectItem.new Native.elm_multibuttonentry_selected_item_get @ptr
            end
            #
            def item_prev it
                ElmObjectItem.new Native.elm_multibuttonentry_item_prev it
            end
            #
            def item_next it
                ElmObjectItem.new Native.elm_multibuttonentry_item_next it
            end
        end
        #
    end
end
#
# EOF
