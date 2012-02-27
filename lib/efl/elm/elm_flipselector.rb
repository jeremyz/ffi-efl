#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_flipselector'
#
module Efl
    #
    module Elm
        #
        class ElmFlipSelector < ElmObject
            #
            include Helper
            constructor :elm_flipselector_add
            search_prefixes 'elm_flipselector_'
            #
            def item_append label, cb=nil, data=nil
                ElmObjectItem.new Native::elm_flipselector_item_append @ptr, label, cb, data
            end
            #
            def item_prepend label, cb=nil, data=nil
                ElmObjectItem.new Native::elm_flipselector_item_prepend @ptr, label, cb, data
            end
            #
            def first_item_get
                ElmObjectItem.new Native::elm_flipselector_first_item_get @ptr
            end
            #
            def last_item_get
                ElmObjectItem.new Native::elm_flipselector_last_item_get @ptr
            end
            #
            def selected_item_get
                ElmObjectItem.new Native::elm_flipselector_selected_item_get @ptr
            end
            #
            def item_prev_get it
                ElmObjectItem.new Native::elm_flipselector_item_prev_get it
            end
            #
            def item_next_get it
                ElmObjectItem.new Native::elm_flipselector_item_next_get it
            end
            #
        end
        #
    end
end
#
# EOF
