#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_progressbar'
#
module Efl
    #
    module Elm
        #
        class ElmProgressBar < ElmObject
            #
            include Helper
            constructor :elm_progressbar_add
            search_prefixes 'elm_progressbar_'
            #
        end
        #
    end
end
#
# EOF
