#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_spinner'
#
module Efl
    #
    module Elm
        #
        class ElmSpinner < ElmObject
            #
            include Helper
            constructor :elm_spinner_add
            search_prefixes 'elm_spinner_'
            #
        end
        #
    end
end
#
# EOF
