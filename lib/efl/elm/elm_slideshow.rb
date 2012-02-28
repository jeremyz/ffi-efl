#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/elm/elm_object_item'
require 'efl/native/elm/elm_slideshow'
#
module Efl
    #
    module Elm
        #
        class ElmSlideshow < ElmObject
            #
            include Helper
            constructor :elm_slideshow_add
            search_prefixes 'elm_slideshow_'
            #
            def item_add itc, data
                ElmObjectItem.new Native.elm_slideshow_item_append @ptr, itc, data
            end
            #
            def item_sorted_insert itc, data, fct
                ElmObjectItem.new Native.elm_slideshow_item_sorted_insert @ptr, itc, data, fct
            end
            #
            def item_current_get
                ElmObjectItem.new Native.elm_slideshow_item_current_get @ptr
            end
            alias :item_current :item_current_get
            #
            def item_nth_get n
                ElmObjectItem.new Native.elm_slideshow_item_nth_get @ptr, n
            end
            alias :item_nth :item_nth_get
            #
        end
        #
    end
end
#
# EOF
