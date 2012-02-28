#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/elm/elm_object_item'
require 'efl/native/elm/elm_gengrid'
#
module Efl
    #
    module Elm
        #
        class ElmGenGrid < ElmObject
            #
            include Helper
            constructor :elm_gengrid_add
            search_prefixes 'elm_gengrid_'
            #
            def item_append gic, data, cb, cbdata
                ElmObjectItem.new Native.elm_gengrid_item_append @ptr, gic, data, cb, cbdata
            end
            #
            def item_prepend gic, data, cb, cbdata
                ElmObjectItem.new Native.elm_gengrid_item_append @ptr, gic, data, cb, cbdata
            end
            #
            def item_insert_before gic, data, before, cb, cbdata
                ElmObjectItem.new Native.elm_gengrid_item_insert_before @ptr, gic, data, before, cb, cbdata
            end
            #
            def item_insert_after gic, data, before, flags, cb, cbdata
                ElmObjectItem.new Native.elm_gengrid_item_insert_after @ptr, gic, data, before, cb, cbdata
            end
            #
            def item_sorted_insert gic, data, cmp, cb, cbdata
                ElmObjectItem.new Native.elm_gengrid_item_sorted_insert @ptr, gic, data, cmp, cb, cbdata
            end
            #
            def first_item_get
                ElmObjectItem.new Native.elm_gengrid_first_item_get @ptr
            end
            alias :first_item :first_item_get
            #
            def last_item_get
                ElmObjectItem.new Native.elm_gengrid_last_item_get @ptr
            end
            alias :last_item :last_item_get
            #
            def item_next_get it
                ElmObjectItem.new Native.elm_gengrid_item_next_get it
            end
            alias :item_next :item_next_get
            #
            def item_prev_get it
                ElmObjectItem.new Native.elm_gengrid_item_prev_get it
            end
            alias :item_prev :item_prev_get
            #
            def selected_item_get
                ElmObjectItem.new Native.elm_gengrid_selected_item_get @ptr
            end
            alias :selected_item :selected_item_get
            #
        end
        #
    end
end
#
# EOF
