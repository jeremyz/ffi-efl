#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmFocus
        #
        FCT_PREFIX = 'elm_focus_' unless const_defined? :FCT_PREFIX
        #
        def self.method_missing meth, *args, &block
            sym = Efl::MethodResolver.resolve self, meth, FCT_PREFIX
            self.send sym, *args, &block
        end
        #
    end
    #
    module Native
        #
        ffi_lib 'elementary-ver-pre-svn-09.so.0'
        #
        # FUNCTIONS
        fcts = [
        # EAPI Eina_Bool elm_focus_highlight_enabled_get(void);
        [ :elm_focus_highlight_enabled_get, [  ], :bool ],
        # EAPI void elm_focus_highlight_enabled_set(Eina_Bool enable);
        [ :elm_focus_highlight_enabled_set, [ :bool ], :void ],
        # EAPI Eina_Bool elm_focus_highlight_animate_get(void);
        [ :elm_focus_highlight_animate_get, [  ], :bool ],
        # EAPI void elm_focus_highlight_animate_set(Eina_Bool animate);
        [ :elm_focus_highlight_animate_set, [ :bool ], :void ],
        # EAPI Eina_Bool elm_object_focus_get(const Evas_Object *obj);
        [ :elm_object_focus_get, [ :evas_object ], :bool ],
        # EAPI void elm_object_focus_set(Evas_Object *obj, Eina_Bool focus);
        [ :elm_object_focus_set, [ :evas_object, :bool ], :void ],
        # EAPI void elm_object_focus_allow_set(Evas_Object *obj, Eina_Bool enable);
        [ :elm_object_focus_allow_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_object_focus_allow_get(const Evas_Object *obj);
        [ :elm_object_focus_allow_get, [ :evas_object ], :bool ],
        # EAPI void elm_object_focus_custom_chain_set(Evas_Object *obj, Eina_List *objs);
        [ :elm_object_focus_custom_chain_set, [ :evas_object, :eina_list ], :void ],
        # EAPI void elm_object_focus_custom_chain_unset(Evas_Object *obj);
        [ :elm_object_focus_custom_chain_unset, [ :evas_object ], :void ],
        # EAPI const Eina_List *elm_object_focus_custom_chain_get(const Evas_Object *obj);
        [ :elm_object_focus_custom_chain_get, [ :evas_object ], :eina_list ],
        # EAPI void elm_object_focus_custom_chain_append(Evas_Object *obj, Evas_Object *child, Evas_Object *relative_child);
        [ :elm_object_focus_custom_chain_append, [ :evas_object, :evas_object, :evas_object ], :void ],
        # EAPI void elm_object_focus_custom_chain_prepend(Evas_Object *obj, Evas_Object *child, Evas_Object *relative_child);
        [ :elm_object_focus_custom_chain_prepend, [ :evas_object, :evas_object, :evas_object ], :void ],
        # EAPI void elm_object_focus_cycle(Evas_Object *obj, Elm_Focus_Direction dir);
        [ :elm_object_focus_cycle, [ :evas_object, :elm_focus_direction ], :void ],
        # EAPI void elm_object_tree_unfocusable_set(Evas_Object *obj, Eina_Bool tree_unfocusable);
        [ :elm_object_tree_unfocusable_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_object_tree_unfocusable_get(const Evas_Object *obj);
        [ :elm_object_tree_unfocusable_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
