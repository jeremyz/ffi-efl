#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/elm/elm_object_item'
require 'efl/native/elm/elm_genlist'
#
module Efl
    #
    module Elm
        #
        class ElmGenList < ElmObject
            #
            include Helper
            constructor :elm_genlist_add
            search_prefixes 'elm_genlist_'
            #
            def item_append itc, data, parent, flags, cb, cbdata
                ElmObjectItem.new Native.elm_genlist_item_append @ptr, itc, data, parent, flags, cb, cbdata
            end
            #
            def item_prepend itc, data, parent, flags, cb, cbdata
                ElmObjectItem.new Native.elm_genlist_item_append @ptr, itc, data, parent, flags, cb, cbdata
            end
            #
            def item_insert_before itc, data, parent, before, flags, cb, cbdata
                ElmObjectItem.new Native.elm_genlist_item_insert_before @ptr, itc, data, parent, before, flags, cb, cbdata
            end
            #
            def item_insert_after itc, data, parent, before, flags, cb, cbdata
                ElmObjectItem.new Native.elm_genlist_item_insert_after @ptr, itc, data, parent, before, flags, cb, cbdata
            end
            #
            def item_sorted_insert itc, data, parent, flags, cmp, cb, cbdata
                ElmObjectItem.new Native.elm_genlist_item_sorted_insert @ptr, itc, data, parent, flags, cmp, cb, cbdata
            end
            #
            def selected_item_get
                ElmObjectItem.new Native.elm_genlist_selected_item_get @ptr
            end
            alias :selected_item :selected_item_get
            #
            def at_xy_item_get x, y
                @ri0 ||= FFI::MemoryPointer.new :int
                i = ElmObjectItem.new ElmObjectItem.new Native.elm_genlist_first_item_get @ptr, x, y, @ri0
                [ @ri0.read_int, i ]
            end
            #
            def first_item_get
                ElmObjectItem.new Native.elm_genlist_first_item_get @ptr
            end
            alias :first_item :first_item_get
            #
            def last_item_get
                ElmObjectItem.new Native.elm_genlist_last_item_get @ptr
            end
            alias :last_item :last_item_get
            #
            def item_next_get it
                ElmObjectItem.new Native.elm_genlist_item_next_get it
            end
            alias :item_next :item_next_get
            #
            def item_prev_get it
                ElmObjectItem.new Native.elm_genlist_item_prev_get it
            end
            alias :item_prev :item_prev_get
            #
            def item_parent_get it
                ElmObjectItem.new Native.elm_genlist_item_parent_get it
            end
            alias :item_parent :item_parent_get
            #
        end
        #
    end
end
#
# EOF
