#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_glview'
#
module Efl
    #
    module Elm
        #
        class ElmGLView < ElmObject
            #
            include Helper
            constructor :elm_glview_add
            search_prefixes 'elm_glview_'
            #
        end
        #
    end
end
#
# EOF
