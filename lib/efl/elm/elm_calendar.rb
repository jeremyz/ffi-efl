#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_calendar'
#
module Efl
    #
    module Elm
        #
        class ElmCalendar < ElmObject
            #
            include Helper
            constructor :elm_calendar_add
            search_prefixes 'elm_calendar_'
            #
        end
        #
    end
end
#
# EOF
