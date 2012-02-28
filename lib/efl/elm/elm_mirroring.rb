#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_mirroring'
#
module Efl
    #
    module Elm
        #
        class ElmMirroring
            #
            def mirrored_get
                Native.elm_object_mirrored_get @ptr
            end
            alias :mirrored :mirrored_get
            #
            def mirrored_set mirrored
                Native.elm_object_mirrored_set @ptr, mirrored
            end
            #
            def mirrored_automatic_get
                Native.elm_object_mirrored_automatic_get @ptr
            end
            alias :mirrored_automatic :mirrored_automatic_get
            #
            def mirrored_automatic_set auto
                Native.elm_object_mirrored_automatic_set @ptr, auto
            end
            #
        end
        #
    end
end
#
# EOF
