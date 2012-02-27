#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_layout'
#
module Efl
    #
    module Elm
        #
        class ElmLayout < ElmObject
            #
            include Helper
            constructor :elm_layout_add
            search_prefixes 'elm_layout_'
            #
        end
        #
    end
end
#
# EOF
