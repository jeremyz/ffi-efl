#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_fileselector_button'
#
module Efl
    #
    module Elm
        #
        class ElmFileSelectorButton < ElmObject
            #
            include Helper
            constructor :elm_fileselector_button_add
            search_prefixes 'elm_fileselector_button_'
            #
        end
        #
    end
end
#
# EOF
