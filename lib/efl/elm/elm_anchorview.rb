#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_anchorview'
#
module Efl
    #
    module Elm
        #
        class ElmAnchorView < ElmObject
            #
            include Helper
            constructor :elm_anchorview_add
            search_prefixes 'elm_anchorview_'
            #
        end
        #
    end
end
#
# EOF
