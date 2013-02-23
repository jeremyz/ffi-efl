#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_panes'
#
module Efl
    #
    module Elm
        #
        class ElmPanes < ElmObject
            #
            include Helper
            constructor :elm_panes_add
            search_prefixes 'elm_panes_'
            #
        end
        #
    end
end
#
# EOF
