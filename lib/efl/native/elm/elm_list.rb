#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
require 'efl/native/elm/elm_scroller'
#
module Efl
    #
    module ElmList
        #
        FCT_PREFIX = 'elm_list_' unless const_defined? :FCT_PREFIX
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
        # ENUMS
        # typedef enum {...} Elm_List_Mode;
        enum :elm_list_mode, [ :elm_list_compress, 0, :elm_list_scroll, 1, :elm_list_limit, 2, :elm_list_expand, 3, :elm_list_last, 4 ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_list_add(Evas_Object *parent);
        [ :elm_list_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_list_go(Evas_Object *obj);
        [ :elm_list_go, [ :evas_object ], :void ],
        # EAPI void elm_list_multi_select_set(Evas_Object *obj, Eina_Bool multi);
        [ :elm_list_multi_select_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_list_multi_select_get(const Evas_Object *obj);
        [ :elm_list_multi_select_get, [ :evas_object ], :bool ],
        # EAPI void elm_list_mode_set(Evas_Object *obj, Elm_List_Mode mode);
        [ :elm_list_mode_set, [ :evas_object, :elm_list_mode ], :void ],
        # EAPI Elm_List_Mode elm_list_mode_get(const Evas_Object *obj);
        [ :elm_list_mode_get, [ :evas_object ], :elm_list_mode ],
        # EAPI void elm_list_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_list_horizontal_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_list_horizontal_get(const Evas_Object *obj);
        [ :elm_list_horizontal_get, [ :evas_object ], :bool ],
        # EAPI void elm_list_always_select_mode_set(Evas_Object *obj, Eina_Bool always_select);
        [ :elm_list_always_select_mode_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_list_always_select_mode_get(const Evas_Object *obj);
        [ :elm_list_always_select_mode_get, [ :evas_object ], :bool ],
        # EAPI void elm_list_bounce_set(Evas_Object *obj, Eina_Bool h_bounce, Eina_Bool v_bounce);
        [ :elm_list_bounce_set, [ :evas_object, :bool, :bool ], :void ],
        # EAPI void elm_list_bounce_get(const Evas_Object *obj, Eina_Bool *h_bounce, Eina_Bool *v_bounce);
        [ :elm_list_bounce_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_list_scroller_policy_set(Evas_Object *obj, Elm_Scroller_Policy policy_h, Elm_Scroller_Policy policy_v);
        [ :elm_list_scroller_policy_set, [ :evas_object, :elm_scroller_policy, :elm_scroller_policy ], :void ],
        # EAPI void elm_list_scroller_policy_get(const Evas_Object *obj, Elm_Scroller_Policy *policy_h, Elm_Scroller_Policy *policy_v);
        [ :elm_list_scroller_policy_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI Elm_Object_Item *elm_list_item_append(Evas_Object *obj, const char *label, Evas_Object *icon, Evas_Object *end, Evas_Smart_Cb func, const void *data);
        [ :elm_list_item_append, [ :evas_object, :string, :evas_object, :evas_object, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_list_item_prepend(Evas_Object *obj, const char *label, Evas_Object *icon, Evas_Object *end, Evas_Smart_Cb func, const void *data);
        [ :elm_list_item_prepend, [ :evas_object, :string, :evas_object, :evas_object, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_list_item_insert_before(Evas_Object *obj, Elm_Object_Item *before, const char *label, Evas_Object *icon, Evas_Object *end, Evas_Smart_Cb func, const void *data);
        [ :elm_list_item_insert_before, [ :evas_object, :elm_object_item, :string, :evas_object, :evas_object, :evas_smart_cb, :pointer ],
            :elm_object_item ],
        # EAPI Elm_Object_Item *elm_list_item_insert_after(Evas_Object *obj, Elm_Object_Item *after, const char *label, Evas_Object *icon, Evas_Object *end, Evas_Smart_Cb func, const void *data);
        [ :elm_list_item_insert_after, [ :evas_object, :elm_object_item, :string, :evas_object, :evas_object, :evas_smart_cb, :pointer ],
            :elm_object_item ],
        # EAPI Elm_Object_Item *elm_list_item_sorted_insert(Evas_Object *obj, const char *label, Evas_Object *icon, Evas_Object *end, Evas_Smart_Cb func, const void *data, Eina_Compare_Cb cmp_func);
        [ :elm_list_item_sorted_insert, [ :evas_object, :string, :evas_object, :evas_object, :evas_smart_cb, :pointer, :eina_compare_cb ],
            :elm_object_item ],
        # EAPI void elm_list_clear(Evas_Object *obj);
        [ :elm_list_clear, [ :evas_object ], :void ],
        # EAPI const Eina_List *elm_list_items_get(const Evas_Object *obj);
        [ :elm_list_items_get, [ :evas_object ], :eina_list ],
        # EAPI Elm_Object_Item *elm_list_selected_item_get(const Evas_Object *obj);
        [ :elm_list_selected_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI const Eina_List *elm_list_selected_items_get(const Evas_Object *obj);
        [ :elm_list_selected_items_get, [ :evas_object ], :eina_list ],
        # EAPI void elm_list_item_selected_set(Elm_Object_Item *it, Eina_Bool selected);
        [ :elm_list_item_selected_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_list_item_selected_get(const Elm_Object_Item *it);
        [ :elm_list_item_selected_get, [ :elm_object_item ], :bool ],
        # EAPI void elm_list_item_separator_set(Elm_Object_Item *it, Eina_Bool setting);
        [ :elm_list_item_separator_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_list_item_separator_get(const Elm_Object_Item *it);
        [ :elm_list_item_separator_get, [ :elm_object_item ], :bool ],
        # EAPI void elm_list_item_show(Elm_Object_Item *it);
        [ :elm_list_item_show, [ :elm_object_item ], :void ],
        # EAPI void elm_list_item_bring_in(Elm_Object_Item *it);
        [ :elm_list_item_bring_in, [ :elm_object_item ], :void ],
        # EAPI Evas_Object *elm_list_item_object_get(const Elm_Object_Item *it);
        [ :elm_list_item_object_get, [ :elm_object_item ], :evas_object ],
        # EAPI Elm_Object_Item *elm_list_item_prev(const Elm_Object_Item *it);
        [ :elm_list_item_prev, [ :elm_object_item ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_list_item_next(const Elm_Object_Item *it);
        [ :elm_list_item_next, [ :elm_object_item ], :elm_object_item ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF