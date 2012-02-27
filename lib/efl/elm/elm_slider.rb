#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_slider'
#
module Efl
    #
    module Elm
        #
        class ElmSlider < ElmObject
            #
            include Helper
            constructor :elm_slider_add
            search_prefixes 'elm_slider_'
            #
        end
        #
    end
end
#
# EOF
