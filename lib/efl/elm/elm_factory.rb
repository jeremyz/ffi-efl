#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_factory'
#
module Efl
    #
    module Elm
        #
        class ElmFactory < ElmObject
            #
            include Helper
            constructor :elm_factory_add
            search_prefixes 'elm_factory_'
            #
        end
        #
    end
end
#
# EOF
