#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_pager'
#
module Efl
    #
    module Elm
        #
        class ElmPager < ElmObject
            #
            include Helper
            constructor :elm_pager_add
            search_prefixes 'elm_pager_'
            #
        end
        #
    end
end
#
# EOF
