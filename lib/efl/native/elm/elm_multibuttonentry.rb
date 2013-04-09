#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmMultiButtonEntry
        #
        FCT_PREFIX = 'elm_multibuttonentry_' unless const_defined? :FCT_PREFIX
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
        # CALLBACKS
        # typedef Eina_Bool (*Elm_Multibuttonentry_Item_Filter_Cb) (Evas_Object *obj, const char *item_label, void *item_data, void *data);
        callback :elm_multibuttonentry_item_filter_cb, [ :evas_object, :string, :pointer, :pointer ], :bool
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_multibuttonentry_add(Evas_Object *parent);
        [ :elm_multibuttonentry_add, [ :evas_object ], :evas_object ],
        # EAPI Evas_Object *elm_multibuttonentry_entry_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_entry_get, [ :evas_object ], :evas_object ],
        # EAPI Eina_Bool elm_multibuttonentry_expanded_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_expanded_get, [ :evas_object ], :bool ],
        # EAPI void elm_multibuttonentry_expanded_set(Evas_Object *obj, Eina_Bool expanded);
        [ :elm_multibuttonentry_expanded_set, [ :evas_object, :bool ], :void ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_item_prepend(Evas_Object *obj, const char *label, Evas_Smart_Cb func, void *data);
        [ :elm_multibuttonentry_item_prepend, [ :evas_object, :string, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_item_append(Evas_Object *obj, const char *label, Evas_Smart_Cb func, void *data);
        [ :elm_multibuttonentry_item_append, [ :evas_object, :string, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_item_insert_before(Evas_Object *obj, Elm_Object_Item *before, const char *label, Evas_Smart_Cb func, void *data);
        [ :elm_multibuttonentry_item_insert_before, [ :evas_object, :elm_object_item, :string, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_item_insert_after(Evas_Object *obj, Elm_Object_Item *after, const char *label, Evas_Smart_Cb func, void *data);
        [ :elm_multibuttonentry_item_insert_after, [ :evas_object, :elm_object_item, :string, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI const Eina_List *elm_multibuttonentry_items_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_items_get, [ :evas_object ], :eina_list ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_first_item_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_first_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_last_item_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_last_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_selected_item_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_selected_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI void elm_multibuttonentry_item_selected_set(Elm_Object_Item *it, Eina_Bool selected);
        [ :elm_multibuttonentry_item_selected_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_multibuttonentry_item_selected_get(const Elm_Object_Item *it);
        [ :elm_multibuttonentry_item_selected_get, [ :elm_object_item ], :bool ],
        # EAPI void elm_multibuttonentry_clear(Evas_Object *obj);
        [ :elm_multibuttonentry_clear, [ :evas_object ], :void ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_item_prev_get(const Elm_Object_Item *it);
        [ :elm_multibuttonentry_item_prev_get, [ :elm_object_item ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_item_next_get(const Elm_Object_Item *it);
        [ :elm_multibuttonentry_item_next_get, [ :elm_object_item ], :elm_object_item ],
        # EAPI void elm_multibuttonentry_item_filter_append(Evas_Object *obj, Elm_Multibuttonentry_Item_Filter_Cb func, void *data);
        [ :elm_multibuttonentry_item_filter_append, [ :evas_object, :elm_multibuttonentry_item_filter_cb, :pointer ], :void ],
        # EAPI void elm_multibuttonentry_item_filter_prepend(Evas_Object *obj, Elm_Multibuttonentry_Item_Filter_Cb func, void *data);
        [ :elm_multibuttonentry_item_filter_prepend, [ :evas_object, :elm_multibuttonentry_item_filter_cb, :pointer ], :void ],
        # EAPI void elm_multibuttonentry_item_filter_remove(Evas_Object *obj, Elm_Multibuttonentry_Item_Filter_Cb func, void *data);
        [ :elm_multibuttonentry_item_filter_remove, [ :evas_object, :elm_multibuttonentry_item_filter_cb, :pointer ], :void ],
        # EAPI void elm_multibuttonentry_editable_set(Evas_Object *obj, Eina_Bool editable);
        [ :elm_multibuttonentry_editable_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_multibuttonentry_editable_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_editable_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
