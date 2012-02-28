#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_mapbuf'
#
module Efl
    #
    module Elm
        #
        class ElmMapBuf < ElmObject
            #
            include Helper
            constructor :elm_mapbuf_add
            search_prefixes 'elm_mapbuf_'
            #
        end
        #
    end
end
#
# EOF
