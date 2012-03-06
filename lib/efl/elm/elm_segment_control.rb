#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/elm/elm_object_item'
require 'efl/native/elm/elm_segment_control'
#
module Efl
    #
    module Elm
        #
        class ElmCheck < ElmObject
            #
            include Helper
            constructor :elm_segment_control_add
            search_prefixes 'elm_segment_control_'
            #
            def item_add icon, label=nil
                ElmObjectItem.new Native.elm_segment_control_item_add @ptr, icon, label
            end
            #
            def item_insert_at icon, label, idx
                ElmObjectItem.new Native.elm_segment_control_item_insert_at @ptr, icon, label, idx
            end
            #
            def item_get idx
                ElmObjectItem.new Native.elm_segment_control_item_get @ptr, idx
            end
            #
            def item_selected_get
                ElmObjectItem.new Native.elm_segment_control_item_selected_get @ptr
            end
            #
        end
        #
    end
end
#
# EOF
