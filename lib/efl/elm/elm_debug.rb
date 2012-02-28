#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_scroll'
#
module Efl
    #
    module Elm
        #
        class ElmObject
            #
            def tree_dump
                Native.elm_object_tree_dump @ptr
            end
            def tree_dot_dump filepath
                Native.elm_object_tree_dot_dump @ptr, filepath
            end
            #
        end
        #
    end
end
#
# EOF
