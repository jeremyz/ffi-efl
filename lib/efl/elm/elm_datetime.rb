#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_datetime'
#
module Efl
    #
    module Elm
        #
        class ElmDatetime < ElmObject
            #
            include Helper
            constructor :elm_datetime_add
            search_prefixes 'elm_datetime_'
            #
        end
        #
    end
end
#
# EOF
