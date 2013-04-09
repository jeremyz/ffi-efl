#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmFlipSelector
        #
        FCT_PREFIX = 'elm_flipselector_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'elementary.so.1'
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_flipselector_add(Evas_Object *parent);
        [ :elm_flipselector_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_flipselector_flip_next(Evas_Object *obj);
        [ :elm_flipselector_flip_next, [ :evas_object ], :void ],
        # EAPI void elm_flipselector_flip_prev(Evas_Object *obj);
        [ :elm_flipselector_flip_prev, [ :evas_object ], :void ],
        # EAPI Elm_Object_Item *elm_flipselector_item_append(Evas_Object *obj, const char *label, Evas_Smart_Cb func, void *data);
        [ :elm_flipselector_item_append, [ :evas_object, :string, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_flipselector_item_prepend(Evas_Object *obj, const char *label, Evas_Smart_Cb func, void *data);
        [ :elm_flipselector_item_prepend, [ :evas_object, :string, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI const Eina_List *elm_flipselector_items_get(const Evas_Object *obj);
        [ :elm_flipselector_items_get, [ :evas_object ], :eina_list ],
        # EAPI Elm_Object_Item *elm_flipselector_first_item_get(const Evas_Object *obj);
        [ :elm_flipselector_first_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_flipselector_last_item_get(const Evas_Object *obj);
        [ :elm_flipselector_last_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_flipselector_selected_item_get(const Evas_Object *obj);
        [ :elm_flipselector_selected_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI void elm_flipselector_item_selected_set(Elm_Object_Item *it, Eina_Bool selected);
        [ :elm_flipselector_item_selected_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_flipselector_item_selected_get(const Elm_Object_Item *it);
        [ :elm_flipselector_item_selected_get, [ :elm_object_item ], :bool ],
        # EAPI Elm_Object_Item *elm_flipselector_item_prev_get(const Elm_Object_Item *it);
        [ :elm_flipselector_item_prev_get, [ :elm_object_item ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_flipselector_item_next_get(const Elm_Object_Item *it);
        [ :elm_flipselector_item_next_get, [ :elm_object_item ], :elm_object_item ],
        # EAPI void elm_flipselector_first_interval_set(Evas_Object *obj, double interval);
        [ :elm_flipselector_first_interval_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_flipselector_first_interval_get(const Evas_Object *obj);
        [ :elm_flipselector_first_interval_get, [ :evas_object ], :double ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
