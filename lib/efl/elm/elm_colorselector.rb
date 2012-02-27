#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_colorselector'
#
module Efl
    #
    module Elm
        #
        class ElmColorSelector < ElmObject
            #
            include Helper
            constructor :elm_colorselector_add
            search_prefixes 'elm_colorselector_'
            #
        end
        #
    end
end
#
# EOF
