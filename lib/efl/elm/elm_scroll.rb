#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_scroll'
#
module Efl
    #
    module Elm
        #
        class ElmObject
            #
            def scroll_hold_push
                Native.elm_object_scroll_hold_push @ptr
            end
            #
            def scroll_hold_pop
                Native.elm_object_scroll_hold_pop @ptr
            end
            #
            def scroll_freeze_push
                Native.elm_object_scroll_freeze_push @ptr
            end
            #
            def scroll_freeze_pop
                Native.elm_object_scroll_freeze_pop @ptr
            end
            #
            def scroll_lock_x_set lock
                Native.elm_object_scroll_lock_x_set @ptr, lock
            end
            #
            def scroll_lock_y_set lock
                Native.elm_object_scroll_lock_x_set @ptr, lock
            end
            #
            def scroll_lock_x_get
                Native.elm_object_scroll_lock_x_set @ptr
            end
            #
            def scroll_lock_y_get
                Native.elm_object_scroll_lock_x_set @ptr
            end
            #
        end
        #
    end
end
#
# EOF
