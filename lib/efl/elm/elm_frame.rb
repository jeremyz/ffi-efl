#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_frame'
#
module Efl
    #
    module Elm
        #
        class ElmFrame < ElmObject
            #
            include Helper
            constructor :elm_frame_add
            search_prefixes 'elm_frame_'
            #
        end
        #
    end
end
#
# EOF
