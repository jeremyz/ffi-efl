#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_map'
#
module Efl
    #
    module Elm
        #
        class ElmMap < ElmObject
            #
            include Helper
            constructor :elm_map_add
            search_prefixes 'elm_map_'
            #
        end
        #
    end
end
#
# EOF
