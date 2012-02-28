#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/elm/elm_object_item'
require 'efl/native/elm/elm_diskselector'
#
module Efl
    #
    module Elm
        #
        class ElmDiskSelector < ElmObject
            #
            include Helper
            constructor :elm_diskselector_add
            search_prefixes 'elm_diskselector_'
            #
            def item_append label, icon=nil, cb=nil, data=nil
                ElmObjectItem.new Native::elm_diskselector_item_append @ptr, label, icon, cb, data
            end
            #
            def selected_item_get
                ElmObjectItem.new Native::elm_diskselector_selected_item_get @ptr
            end
            #
            def first_item_get
                ElmObjectItem.new Native::elm_diskselector_first_item_get @ptr
            end
            #
            def last_item_get
                ElmObjectItem.new Native::elm_diskselector_last_item_get @ptr
            end
            #
            def item_prev_get it
                ElmObjectItem.new Native::elm_diskselector_item_prev_get it
            end
            #
            def item_next_get it
                ElmObjectItem.new Native::elm_diskselector_item_next_get it
            end
            #
        end
        #
    end
end
#
# EOF
