#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_entry'
#
module Efl
    #
    module Elm
        #
        class ElmEntry < ElmObject
            #
            include Helper
            constructor :elm_entry_add
            search_prefixes 'elm_entry_'
            #
        end
        #
    end
end
#
# EOF
