#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_photo'
#
module Efl
    #
    module Elm
        #
        class ElmPhoto < ElmObject
            #
            include Helper
            constructor :elm_photo_add
            search_prefixes 'elm_photo_'
            #
        end
        #
    end
end
#
# EOF
