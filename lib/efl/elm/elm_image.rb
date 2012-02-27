#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_image'
#
module Efl
    #
    module Elm
        #
        class ElmImage < ElmObject
            #
            include Helper
            constructor :elm_image_add
            search_prefixes 'elm_image_'
            #
        end
        #
    end
end
#
# EOF
