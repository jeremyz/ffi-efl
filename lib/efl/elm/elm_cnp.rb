#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_cnp'
#
module Efl
    #
    module Elm
        #
        class ElmObject
            #
            def cnp_selection_set selection, format, buf, sizet
                Native.elm_cnp_selection_set @ptr, selection, format, buf, sizet
            end
            #
            def cnp_selection_get selection, format, datacb, data
                Native.elm_cnp_selection_set @ptr, selection, format, datacb, data
            end
            #
            def cnp_selection_clear selection
                Native.elm_object_cnp_selection_clear @ptr, selection
            end
            #
        end
        #
    end
end
#
# EOF
