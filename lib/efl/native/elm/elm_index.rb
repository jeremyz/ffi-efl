#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmIndex
        #
        FCT_PREFIX = 'elm_index_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_index_add(Evas_Object *parent);
        [ :elm_index_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_index_autohide_disabled_set(Evas_Object *obj, Eina_Bool disabled);
        [ :elm_index_autohide_disabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_index_autohide_disabled_get(const Evas_Object *obj);
        [ :elm_index_autohide_disabled_get, [ :evas_object ], :bool ],
        # EAPI void elm_index_item_level_set(Evas_Object *obj, int level);
        [ :elm_index_item_level_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_index_item_level_get(const Evas_Object *obj);
        [ :elm_index_item_level_get, [ :evas_object ], :int ],
        # EAPI void elm_index_item_selected_set(Elm_Object_Item *it, Eina_Bool selected);
        [ :elm_index_item_selected_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Elm_Object_Item *elm_index_selected_item_get(const Evas_Object *obj, int level);
        [ :elm_index_selected_item_get, [ :evas_object, :int ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_index_item_append(Evas_Object *obj, const char *letter, Evas_Smart_Cb func, const void *data);
        [ :elm_index_item_append, [ :evas_object, :string, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_index_item_prepend(Evas_Object *obj, const char *letter, Evas_Smart_Cb func, const void *data);
        [ :elm_index_item_prepend, [ :evas_object, :string, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_index_item_insert_after(Evas_Object *obj, Elm_Object_Item *after, const char *letter, Evas_Smart_Cb func, const void *data);
        [ :elm_index_item_insert_after, [ :evas_object, :elm_object_item, :string, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_index_item_insert_before(Evas_Object *obj, Elm_Object_Item *before, const char *letter, Evas_Smart_Cb func, const void *data);
        [ :elm_index_item_insert_before, [ :evas_object, :elm_object_item, :string, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_index_item_sorted_insert(Evas_Object *obj, const char *letter, Evas_Smart_Cb func, const void *data, Eina_Compare_Cb cmp_func, Eina_Compare_Cb cmp_data_func);
        [ :elm_index_item_sorted_insert, [ :evas_object, :string, :evas_smart_cb, :pointer, :eina_compare_cb, :eina_compare_cb ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_index_item_find(Evas_Object *obj, const void *data);
        [ :elm_index_item_find, [ :evas_object, :pointer ], :elm_object_item ],
        # EAPI void elm_index_item_clear(Evas_Object *obj);
        [ :elm_index_item_clear, [ :evas_object ], :void ],
        # EAPI void elm_index_level_go(Evas_Object *obj, int level);
        [ :elm_index_level_go, [ :evas_object, :int ], :void ],
        # EAPI const char *elm_index_item_letter_get(const Elm_Object_Item *item);
        [ :elm_index_item_letter_get, [ :elm_object_item ], :string ],
        # EAPI void elm_index_indicator_disabled_set(Evas_Object *obj, Eina_Bool disabled);
        [ :elm_index_indicator_disabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_index_indicator_disabled_get(const Evas_Object *obj);
        [ :elm_index_indicator_disabled_get, [ :evas_object ], :bool ],
        # EAPI void elm_index_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_index_horizontal_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_index_horizontal_get(const Evas_Object *obj);
        [ :elm_index_horizontal_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
