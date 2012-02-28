#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_anchorblock'
#
module Efl
    #
    module Elm
        #
        class ElmAnchorBlock < ElmObject
            #
            include Helper
            constructor :elm_anchorblock_add
            search_prefixes 'elm_anchorblock_'
            #
        end
        #
    end
end
#
# EOF
