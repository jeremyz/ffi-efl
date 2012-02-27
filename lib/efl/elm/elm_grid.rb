#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_grid'
#
module Efl
    #
    module Elm
        #
        class ElmGrid < ElmObject
            #
            include Helper
            constructor :elm_grid_add
            search_prefixes 'elm_grid_'
            #
        end
        #
    end
end
#
# EOF
