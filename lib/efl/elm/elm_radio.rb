#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_radio'
#
module Efl
    #
    module Elm
        #
        class ElmRadio < ElmObject
            #
            include Helper
            constructor :elm_radio_add
            search_prefixes 'elm_radio_'
            #
        end
        #
    end
end
#
# EOF
