#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_dayselector'
#
module Efl
    #
    module Elm
        #
        class ElmDaySelector < ElmObject
            #
            include Helper
            constructor :elm_dayselector_add
            search_prefixes 'elm_dayselector_'
            #
        end
        #
    end
end
#
# EOF
