#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_scale'
#
module Efl
    #
    module Elm
        #
        class ElmScale
            #
            def scale_get
                Native.elm_object_scale_get @ptr
            end
            alias :scale :scale_get
            #
            def scale_set scale
                Native.elm_object_scale_set @ptr, scale
            end
            alias :scale= :scale_set
            #
        end
        #
    end
end
#
# EOF
