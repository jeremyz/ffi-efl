#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_bubble'
#
module Efl
    #
    module Elm
        #
        class ElmBubble < ElmObject
            #
            include Helper
            constructor :elm_bubble_add
            search_prefixes 'elm_bubble_'
            #
        end
        #
    end
end
#
# EOF
