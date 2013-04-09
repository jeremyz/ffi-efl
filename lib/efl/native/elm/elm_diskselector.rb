#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
require 'efl/native/elm/elm_scroller'
#
module Efl
    #
    module ElmDiskSelector
        #
        FCT_PREFIX = 'elm_diskselector_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_diskselector_add(Evas_Object *parent);
        [ :elm_diskselector_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_diskselector_round_enabled_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_diskselector_round_enabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_diskselector_round_enabled_get(const Evas_Object *obj);
        [ :elm_diskselector_round_enabled_get, [ :evas_object ], :bool ],
        # EAPI int elm_diskselector_side_text_max_length_get(const Evas_Object *obj);
        [ :elm_diskselector_side_text_max_length_get, [ :evas_object ], :int ],
        # EAPI void elm_diskselector_side_text_max_length_set(Evas_Object *obj, int len);
        [ :elm_diskselector_side_text_max_length_set, [ :evas_object, :int ], :void ],
        # EAPI void elm_diskselector_display_item_num_set(Evas_Object *obj, int num);
        [ :elm_diskselector_display_item_num_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_diskselector_display_item_num_get(const Evas_Object *obj);
        [ :elm_diskselector_display_item_num_get, [ :evas_object ], :int ],
        # EAPI void elm_diskselector_clear(Evas_Object *obj);
        [ :elm_diskselector_clear, [ :evas_object ], :void ],
        # EAPI const Eina_List *elm_diskselector_items_get(const Evas_Object *obj);
        [ :elm_diskselector_items_get, [ :evas_object ], :eina_list ],
        # EAPI Elm_Object_Item *elm_diskselector_item_append(Evas_Object *obj, const char *label, Evas_Object *icon, Evas_Smart_Cb func, const void *data);
        [ :elm_diskselector_item_append, [ :evas_object, :string, :evas_object, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_diskselector_selected_item_get(const Evas_Object *obj);
        [ :elm_diskselector_selected_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI void elm_diskselector_item_selected_set(Elm_Object_Item *it, Eina_Bool selected);
        [ :elm_diskselector_item_selected_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_diskselector_item_selected_get(const Elm_Object_Item *it);
        [ :elm_diskselector_item_selected_get, [ :elm_object_item ], :bool ],
        # EAPI Elm_Object_Item *elm_diskselector_first_item_get(const Evas_Object *obj);
        [ :elm_diskselector_first_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_diskselector_last_item_get(const Evas_Object *obj);
        [ :elm_diskselector_last_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_diskselector_item_prev_get(const Elm_Object_Item *it);
        [ :elm_diskselector_item_prev_get, [ :elm_object_item ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_diskselector_item_next_get(const Elm_Object_Item *it);
        [ :elm_diskselector_item_next_get, [ :elm_object_item ], :elm_object_item ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
