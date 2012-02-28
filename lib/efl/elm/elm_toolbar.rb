#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/elm/elm_object_item'
require 'efl/native/elm/elm_toolbar'
#
module Efl
    #
    module Elm
        #
        class ElmToolbar < ElmObject
            #
            include Helper
            constructor :elm_toolbar_add
            search_prefixes 'elm_toolbar_'
            #
            def item_append icon, label, cb=nil, data=nil
                ElmObjectItem.new Native.elm_toolbar_item_append @ptr, icon, label, cb, data
            end
            #
            def item_prepend icon, label, cb=nil, data=nil
                ElmObjectItem.new Native.elm_toolbar_item_prepend @ptr, icon, label, cb, data
            end
            #
            def item_insert_before before, icon, label, cb=nil, data=nil
                ElmObjectItem.new Native.elm_toolbar_item_insert_before @ptr, before, icon, label, cb, data
            end
            #
            def item_insert_after after, icon, label, cb=nil, data=nil
                ElmObjectItem.new Native.elm_toolbar_item_insert_after @ptr, after, icon, label, cb, data
            end
            #
            def first_item_get
                ElmObjectItem.new Native.elm_toolbar_first_item_get @ptr
            end
            alias :first_item :first_item_get
            #
            def last_item_get
                ElmObjectItem.new Native.elm_toolbar_last_item_get @ptr
            end
            alias :last_item :last_item_get
            #
            def item_prev_get it
                ElmObjectItem.new Native.elm_toolbar_item_prev it
            end
            alias :item_prev :item_prev_get
            #
            def item_next_get it
                ElmObjectItem.new Native.elm_toolbar_item_next it
            end
            alias :item_next :item_next_get
            #
            def selected_item_get
                ElmObjectItem.new Native.elm_toolbar_selected_item_get @ptr
            end
            alias :selected_item :selected_item_get
        end
        #
    end
end
#
# EOF
