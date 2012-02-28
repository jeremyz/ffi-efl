#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/elm/elm_object_item'
require 'efl/native/elm/elm_list'
#
module Efl
    #
    module Elm
        #
        class ElmList < ElmObject
            #
            include Helper
            constructor :elm_list_add
            search_prefixes 'elm_list_'
            #
            def item_append label, left_icon=nil, right_icon=nil, cb=nil, data=nil
                ElmObjectItem.new Native.elm_list_item_append @ptr, label, left_icon, right_icon, cb, data
            end
            #
            def item_prepend label, left_icon=nil, right_icon=nil, cb=nil, data=nil
                ElmObjectItem.new Native.elm_list_item_prepend @ptr, label, left_icon, right_icon, cb, data
            end
            #
            def item_insert_before before, label, left_icon=nil, right_icon=nil, cb=nil, data=nil
                ElmObjectItem.new Native.elm_list_item_insert_before @ptr, before, label, left_icon, right_icon, cb, data
            end
            #
            def item_insert_after after, label, left_icon=nil, right_icon=nil, cb=nil, data=nil
                ElmObjectItem.new Native.elm_list_item_insert_after @ptr, after, label, left_icon, right_icon, cb, data
            end
            #
            def item_sorted_insert label, left_icon, right_icon, cb, data, cmp_fct
                ElmObjectItem.new Native.elm_list_item_sorted_insert @ptr, label, left_icon, right_icon, cb, data, cmp_fct
            end
            #
            def selected_item_get
                ElmObjectItem.new Native.elm_list_selected_item_get @ptr
            end
            #
            def item_prev it
                ElmObjectItem.new Native.elm_list_item_prev it
            end
            #
            def item_next it
                ElmObjectItem.new Native.elm_list_item_next it
            end
            #
        end
        #
    end
end
#
# EOF
