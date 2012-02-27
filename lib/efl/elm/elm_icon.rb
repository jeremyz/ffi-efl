#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_icon'
#
module Efl
    #
    module Elm
        #
        class ElmIcon < ElmObject
            #
            include Helper
            constructor :elm_icon_add
            search_prefixes 'elm_icon_'
            #
            def scale_set args
                Native.elm_icon_scale_set @ptr, *args
            end
            alias :scale= :scale_set
        end
        #
    end
end
#
# EOF
