#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_notify'
#
module Efl
    #
    module Elm
        #
        class ElmNotify < ElmObject
            #
            include Helper
            constructor :elm_notify_add
            search_prefixes 'elm_check_'
            #
        end
        #
    end
end
#
# EOF
