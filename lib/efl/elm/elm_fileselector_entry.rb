#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_fileselector_entry'
#
module Efl
    #
    module Elm
        #
        class ElmFileSelectorEntry < ElmObject
            #
            include Helper
            constructor :elm_fileselector_entry_add
            search_prefixes 'elm_fileselector_entry_'
            #
        end
        #
    end
end
#
# EOF
