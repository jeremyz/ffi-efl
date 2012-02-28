#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_table'
#
module Efl
    #
    module Elm
        #
        class ElmTable < ElmObject
            #
            include Helper
            constructor :elm_table_add
            search_prefixes 'elm_table_'
            #
        end
        #
    end
end
#
# EOF
