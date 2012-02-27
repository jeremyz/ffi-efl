#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_check'
#
module Efl
    #
    module Elm
        #
        class ElmCheck < ElmObject
            #
            include Helper
            constructor :elm_check_add
            search_prefixes 'elm_check_'
            #
        end
        #
    end
end
#
# EOF
