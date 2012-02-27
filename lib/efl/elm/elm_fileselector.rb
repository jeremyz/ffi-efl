#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_fileselector'
#
module Efl
    #
    module Elm
        #
        class ElmFileSelector < ElmObject
            #
            include Helper
            constructor :elm_fileselector_add
            search_prefixes 'elm_fileselector_'
            #
        end
        #
    end
end
#
# EOF
