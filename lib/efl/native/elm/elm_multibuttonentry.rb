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
        ffi_lib 'elementary-ver-pre-svn-09.so.0'
        #
        # CALLBACKS
        # typedef Eina_Bool (*Elm_Multibuttonentry_Item_Filter_callback) (Evas_Object *obj, const char *item_label, void *item_data, void *data);
        callback :elm_multibuttonentry_item_filter_callback_cb, [ :evas_object, :string, :pointer, :pointer ], :bool
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_multibuttonentry_add(Evas_Object *parent);
        [ :elm_multibuttonentry_add, [ :evas_object ], :evas_object ],
        # EAPI Evas_Object *elm_multibuttonentry_entry_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_entry_get, [ :evas_object ], :evas_object ],
        # EAPI const char *elm_multibuttonentry_guide_text_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_guide_text_get, [ :evas_object ], :string ],
        # EAPI void elm_multibuttonentry_guide_text_set(Evas_Object *obj, const char *guidetext);
        [ :elm_multibuttonentry_guide_text_set, [ :evas_object, :string ], :void ],
        # EAPI int elm_multibuttonentry_shrink_mode_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_shrink_mode_get, [ :evas_object ], :int ],
        # EAPI void elm_multibuttonentry_shrink_mode_set(Evas_Object *obj, int shrink);
        [ :elm_multibuttonentry_shrink_mode_set, [ :evas_object, :int ], :void ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_item_prepend(Evas_Object *obj, const char *label, void *data);
        [ :elm_multibuttonentry_item_prepend, [ :evas_object, :string, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_item_append(Evas_Object *obj, const char *label, void *data);
        [ :elm_multibuttonentry_item_append, [ :evas_object, :string, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_item_insert_before(Evas_Object *obj, Elm_Object_Item *before, const char *label, void *data);
        [ :elm_multibuttonentry_item_insert_before, [ :evas_object, :elm_object_item, :string, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_item_insert_after(Evas_Object *obj, Elm_Object_Item *after, const char *label, void *data);
        [ :elm_multibuttonentry_item_insert_after, [ :evas_object, :elm_object_item, :string, :pointer ], :elm_object_item ],
        # EAPI const Eina_List *elm_multibuttonentry_items_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_items_get, [ :evas_object ], :eina_list ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_first_item_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_first_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_last_item_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_last_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_selected_item_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_selected_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI void elm_multibuttonentry_item_select(Elm_Object_Item *it, Eina_Bool selected);
        [ :elm_multibuttonentry_item_select, [ :elm_object_item, :bool ], :void ],
        # EAPI void elm_multibuttonentry_item_unselect_all(Evas_Object *obj);
        [ :elm_multibuttonentry_item_unselect_all, [ :evas_object ], :void ],
        # EAPI void elm_multibuttonentry_clear(Evas_Object *obj);
        [ :elm_multibuttonentry_clear, [ :evas_object ], :void ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_item_prev_get(const Elm_Object_Item *it);
        [ :elm_multibuttonentry_item_prev_get, [ :elm_object_item ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_multibuttonentry_item_next_get(const Elm_Object_Item *it);
        [ :elm_multibuttonentry_item_next_get, [ :elm_object_item ], :elm_object_item ],
        # EAPI void elm_multibuttonentry_item_filter_append(Evas_Object *obj, Elm_Multibuttonentry_Item_Filter_callback func, void *data);
        [ :elm_multibuttonentry_item_filter_append, [ :evas_object, :elm_multibuttonentry_item_filter_callback_cb, :pointer ], :void ],
        # EAPI void elm_multibuttonentry_item_filter_prepend(Evas_Object *obj, Elm_Multibuttonentry_Item_Filter_callback func, void *data);
        [ :elm_multibuttonentry_item_filter_prepend, [ :evas_object, :elm_multibuttonentry_item_filter_callback_cb, :pointer ], :void ],
        # EAPI void elm_multibuttonentry_item_filter_remove(Evas_Object *obj, Elm_Multibuttonentry_Item_Filter_callback func, void *data);
        [ :elm_multibuttonentry_item_filter_remove, [ :evas_object, :elm_multibuttonentry_item_filter_callback_cb, :pointer ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
