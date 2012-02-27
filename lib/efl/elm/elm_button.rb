#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_button'
#
module Efl
    #
    module Elm
        #
        class ElmButton < ElmObject
            #
            include Helper
            constructor :elm_button_add
            search_prefixes 'elm_button_'
            #
        end
        #
    end
end
#
# EOF
