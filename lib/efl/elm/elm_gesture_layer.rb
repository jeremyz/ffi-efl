#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_gesture_layer'
#
module Efl
    #
    module Elm
        #
        class ElmGestureLayer < ElmObject
            #
            include Helper
            constructor :elm_gesture_layer_add
            search_prefixes 'elm_gesture_layer_'
            #
        end
        #
    end
end
#
# EOF
