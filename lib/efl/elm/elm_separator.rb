#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_separator'
#
module Efl
    #
    module Elm
        #
        class ElmSeparator < ElmObject
            #
            include Helper
            constructor :elm_separator_add
            search_prefixes 'elm_separator_'
            #
        end
        #
    end
end
#
# EOF
