#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_plug'
#
module Efl
    #
    module Elm
        #
        class ElmPlug < ElmObject
            #
            include Helper
            constructor :elm_plug_add
            search_prefixes 'elm_plug_'
            #
        end
        #
    end
end
#
# EOF
