#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_photocam'
#
module Efl
    #
    module Elm
        #
        class ElmPhotoCam < ElmObject
            #
            include Helper
            constructor :elm_photocam_add
            search_prefixes 'elm_photocam_'
            #
        end
        #
    end
end
#
# EOF
