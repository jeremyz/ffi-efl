#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_thumb'
#
module Efl
    #
    module Elm
        #
        class ElmThumb < ElmObject
            #
            include Helper
            constructor :elm_thumb_add
            search_prefixes 'elm_thumb_'
            #
        end
        #
    end
end
#
# EOF
