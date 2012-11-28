#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
#
module Efl
    #
    module Elm
        #
        class ElmInwin < ElmObject
            #
            include Helper
            constructor :elm_button_add
            search_prefixes 'elm_button_'
            search_prefixes 'elm_win_inwin_'
            #
        end
        #
    end
end
#
# EOF
