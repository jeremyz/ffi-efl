#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_flip'
#
module Efl
    #
    module Elm
        #
        class ElmFlip < ElmObject
            #
            include Helper
            constructor :elm_flip_add
            search_prefixes 'elm_flip_'
            #
        end
        #
    end
end
#
# EOF
