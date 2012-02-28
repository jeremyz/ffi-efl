#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_actionslider'
#
module Efl
    #
    module Elm
        #
        class ElmActionSlider < ElmObject
            #
            include Helper
            constructor :elm_actionslider_add
            search_prefixes 'elm_actionslider_'
            #
        end
        #
    end
end
#
# EOF
