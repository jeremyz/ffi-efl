#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_conform'
#
module Efl
    #
    module Elm
        #
        class ElmConform < ElmObject
            #
            include Helper
            constructor :elm_conformant_add
            search_prefixes 'elm_conformant_'
            #
            def content_area_get
                Evas::REvasObject.new Native.elm_conformant_content_area_get @ptr
            end
            #
        end
        #
    end
end
#
# EOF
