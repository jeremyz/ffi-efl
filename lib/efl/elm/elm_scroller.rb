#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_scroller'
#
module Efl
    #
    module Elm
        #
        class ElmScroller < ElmObject
            #
            include Helper
            constructor :elm_scroller_add
            search_prefixes 'elm_scroller_'
            #
        end
        #
    end
end
#
# EOF
