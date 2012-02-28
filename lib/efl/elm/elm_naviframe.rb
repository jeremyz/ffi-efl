#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/elm/elm_object_item'
require 'efl/native/elm/elm_naviframe'
#
module Efl
    #
    module Elm
        #
        class ElmNaviFrame < ElmObject
            #
            include Helper
            constructor :elm_naviframe_add
            search_prefixes 'elm_naviframe_'
            #
            def item_push label, prev_btn, next_btn, content, style
                ElmObjectItem.new Native.elm_naviframe_item_push @ptr, label, prev_btn, next_btn, content, style
            end
            #
            def item_insert_before before, label, prev_btn, next_btn, content, style
                ElmObjectItem.new Native.elm_naviframe_item_push before, label, prev_btn, next_btn, content, style
            end
            #
            def item_insert_after after, label, prev_btn, next_btn, content, style
                ElmObjectItem.new Native.elm_naviframe_item_push after, label, prev_btn, next_btn, content, style
            end
            #
            def top_item_get
                ElmObjectItem.new Native.elm_naviframe_top_item_get @ptr
            end
            #
            def bottom_item_get
                ElmObjectItem.new Native.elm_naviframe_bottom_item_get @ptr
            end
        end
        #
    end
end
#
# EOF
