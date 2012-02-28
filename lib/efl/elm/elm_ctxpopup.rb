#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/elm/elm_object_item'
require 'efl/native/elm/elm_ctxpopup'
#
module Efl
    #
    module Elm
        #
        class ElmCtxPopup < ElmObject
            #
            include Helper
            constructor :elm_ctxpopup_add
            search_prefixes 'elm_ctxpopup_'
            #
            def item_append label, icon=nil, cb=nil, data=nil
                ElmObjectItem.new Native.elm_ctxpopup_item_append @ptr, label, icon, cb, data
            end
            #
        end
        #
    end
end
#
# EOF
