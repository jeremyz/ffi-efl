#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_video'
#
module Efl
    #
    module Elm
        #
        class ElmVideo < ElmObject
            #
            include Helper
            constructor :elm_video_add
            search_prefixes 'elm_video_'
            #
        end
        #
        class ElmPlayer < ElmObject
            #
            include Helper
            constructor :elm_player_add
            search_prefixes 'elm_player_'
            #
        end
        #
    end
end
#
# EOF
