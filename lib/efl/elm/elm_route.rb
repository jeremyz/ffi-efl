#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_route'
#
module Efl
    #
    module Elm
        #
        class ElmRoute < ElmObject
            #
            include Helper
            constructor :elm_route_add
            search_prefixes 'elm_route_'
            #
        end
        #
    end
end
#
# EOF
