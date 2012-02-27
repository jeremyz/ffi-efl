#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_hover'
#
module Efl
    #
    module Elm
        #
        class ElmHover < ElmObject
            #
            include Helper
            constructor :elm_hover_add
            search_prefixes 'elm_hover_'
            #
        end
        #
    end
end
#
# EOF
