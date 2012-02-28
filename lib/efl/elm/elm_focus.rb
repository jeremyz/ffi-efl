#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_focus'
#
module Efl
    #
    module Elm
        #
        class ElmObject
            #
            def focus_get
                Native.elm_object_focus_get @ptr
            end
            alias :focus :focus_get
            #
            def focus_set focus
                Native.elm_object_focus_set @ptr, focus
            end
            alias :focus= :focus_set
            #
            def focus_allow_get
                Native.elm_object_focus_allow_get @ptr
            end
            alias :focus :focus_allow_get
            #
            def focus_allow_set allow
                Native.elm_object_focus_allow_set @ptr, allow
            end
            alias :focus_allow= :focus_allow_set
            #
            def focus_allow_custom_chain_set list
                Native.elm_object_focus_allow_custom_chain_set @ptr, list
            end
            alias :focus_allow_custom_chain= :focus_allow_custom_chain_set
            #
            def focus_allow_custom_chain_unset
                Native.elm_object_focus_allow_custom_chain_unset @ptr
            end
            #
            def focus_allow_custom_chain_get
                Native.elm_object_focus_allow_custom_chain_get @ptr
            end
            alias :focus_allow_custom_chain :focus_allow_custom_chain_get
            #
            def focus_custom_chain_append child, relative_child
                Native.elm_object_focus_custom_chain_append @ptr, child, relative_child
            end
            #
            def focus_custom_chain_prepend child, relative_child
                Native.elm_object_focus_custom_chain_prepend @ptr, child, relative_child
            end
            #
            def focus_cycle direction
                Native.elm_object_focus_cycle @ptr, direction
            end
            #
            def tree_unfocusable_set unfocusable
                Native.elm_object_tree_unfocusable_set @ptr, unfocusable
            end
            alias :tree_unfocusable= :tree_unfocusable_set
            #
            def tree_unfocusable_get
                Native.elm_object_tree_unfocusable_set @ptr
            end
            alias :tree_unfocusable :tree_unfocusable_get
            #
        end
        #
    end
end
#
# EOF
