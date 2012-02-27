#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_label'
#
module Efl
    #
    module Elm
        #
        class ElmLabel < ElmObject
            #
            include Helper
            constructor :elm_label_add
            search_prefixes 'elm_label_'
            #
        end
        #
    end
end
#
# EOF
