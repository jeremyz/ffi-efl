#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_clock'
#
module Efl
    #
    module Elm
        #
        class ElmClock < ElmObject
            #
            include Helper
            constructor :elm_clock_add
            search_prefixes 'elm_clock_'
            #
        end
        #
    end
end
#
# EOF
