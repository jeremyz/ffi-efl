#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_panel'
#
module Efl
    #
    module Elm
        #
        class ElmPanel < ElmObject
            #
            include Helper
            constructor :elm_panel_add
            search_prefixes 'elm_panel_'
            #
        end
        #
    end
end
#
# EOF
