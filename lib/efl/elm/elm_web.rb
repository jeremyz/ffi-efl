#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_web'
#
module Efl
    #
    module Elm
        #
        class ElmWeb < ElmObject
            #
            include Helper
            constructor :elm_web_add
            search_prefixes 'elm_web_'
            #
        end
        #
    end
end
#
# EOF
