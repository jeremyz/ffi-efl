#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
require 'efl/native/elm/elm_icon'
#
module Efl
    #
    module ElmToolbar
        #
        FCT_PREFIX = 'elm_toolbar_' unless const_defined? :FCT_PREFIX
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
        # ENUMS
        # typedef enum {...} Elm_Toolbar_Shrink_Mode;
        enum :elm_toolbar_shrink_mode, [ :elm_toolbar_shrink_none, :elm_toolbar_shrink_hide, :elm_toolbar_shrink_scroll, :elm_toolbar_shrink_menu,
            :elm_toolbar_shrink_expand, :elm_toolbar_shrink_last ]
        #
        # TYPEDEFS
        # typedef struct _Elm_Toolbar_Item_State Elm_Toolbar_Item_State;
        typedef :pointer, :elm_toolbar_item_state
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_toolbar_add(Evas_Object *parent);
        [ :elm_toolbar_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_toolbar_icon_size_set(Evas_Object *obj, int icon_size);
        [ :elm_toolbar_icon_size_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_toolbar_icon_size_get(const Evas_Object *obj);
        [ :elm_toolbar_icon_size_get, [ :evas_object ], :int ],
        # EAPI void elm_toolbar_icon_order_lookup_set(Evas_Object *obj, Elm_Icon_Lookup_Order order);
        [ :elm_toolbar_icon_order_lookup_set, [ :evas_object, :elm_icon_lookup_order ], :void ],
        # EAPI Elm_Icon_Lookup_Order elm_toolbar_icon_order_lookup_get(const Evas_Object *obj);
        [ :elm_toolbar_icon_order_lookup_get, [ :evas_object ], :elm_icon_lookup_order ],
        # EAPI Elm_Object_Item *elm_toolbar_item_append(Evas_Object *obj, const char *icon, const char *label, Evas_Smart_Cb func, const void *data);
        [ :elm_toolbar_item_append, [ :evas_object, :string, :string, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_toolbar_item_prepend(Evas_Object *obj, const char *icon, const char *label, Evas_Smart_Cb func, const void *data);
        [ :elm_toolbar_item_prepend, [ :evas_object, :string, :string, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_toolbar_item_insert_before(Evas_Object *obj, Elm_Object_Item *before, const char *icon, const char *label, Evas_Smart_Cb func, const void *data);
        [ :elm_toolbar_item_insert_before, [ :evas_object, :elm_object_item, :string, :string, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_toolbar_item_insert_after(Evas_Object *obj, Elm_Object_Item *after, const char *icon, const char *label, Evas_Smart_Cb func, const void *data);
        [ :elm_toolbar_item_insert_after, [ :evas_object, :elm_object_item, :string, :string, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_toolbar_first_item_get(const Evas_Object *obj);
        [ :elm_toolbar_first_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_toolbar_last_item_get(const Evas_Object *obj);
        [ :elm_toolbar_last_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_toolbar_item_next_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_next_get, [ :elm_object_item ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_toolbar_item_prev_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_prev_get, [ :elm_object_item ], :elm_object_item ],
        # EAPI void elm_toolbar_item_priority_set(Elm_Object_Item *it, int priority);
        [ :elm_toolbar_item_priority_set, [ :elm_object_item, :int ], :void ],
        # EAPI int elm_toolbar_item_priority_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_priority_get, [ :elm_object_item ], :int ],
        # EAPI Elm_Object_Item *elm_toolbar_item_find_by_label(const Evas_Object *obj, const char *label);
        [ :elm_toolbar_item_find_by_label, [ :evas_object, :string ], :elm_object_item ],
        # EAPI Eina_Bool elm_toolbar_item_selected_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_selected_get, [ :elm_object_item ], :bool ],
        # EAPI void elm_toolbar_item_selected_set(Elm_Object_Item *it, Eina_Bool selected);
        [ :elm_toolbar_item_selected_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Elm_Object_Item *elm_toolbar_selected_item_get(const Evas_Object *obj);
        [ :elm_toolbar_selected_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_toolbar_more_item_get(const Evas_Object *obj);
        [ :elm_toolbar_more_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI void elm_toolbar_item_icon_set(Elm_Object_Item *it, const char *icon);
        [ :elm_toolbar_item_icon_set, [ :elm_object_item, :string ], :void ],
        # EAPI const char *elm_toolbar_item_icon_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_icon_get, [ :elm_object_item ], :string ],
        # EAPI Evas_Object *elm_toolbar_item_object_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_object_get, [ :elm_object_item ], :evas_object ],
        # EAPI Evas_Object *elm_toolbar_item_icon_object_get(Elm_Object_Item *it);
        [ :elm_toolbar_item_icon_object_get, [ :elm_object_item ], :evas_object ],
        # EAPI Eina_Bool elm_toolbar_item_icon_memfile_set(Elm_Object_Item *it, const void *img, size_t size, const char *format, const char *key);
        [ :elm_toolbar_item_icon_memfile_set, [ :elm_object_item, :pointer, :ulong, :string, :string ], :bool ],
        # EAPI Eina_Bool elm_toolbar_item_icon_file_set(Elm_Object_Item *it, const char *file, const char *key);
        [ :elm_toolbar_item_icon_file_set, [ :elm_object_item, :string, :string ], :bool ],
        # EAPI void elm_toolbar_item_separator_set(Elm_Object_Item *it, Eina_Bool separator);
        [ :elm_toolbar_item_separator_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_toolbar_item_separator_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_separator_get, [ :elm_object_item ], :bool ],
        # EAPI void elm_toolbar_shrink_mode_set(Evas_Object *obj, Elm_Toolbar_Shrink_Mode shrink_mode);
        [ :elm_toolbar_shrink_mode_set, [ :evas_object, :elm_toolbar_shrink_mode ], :void ],
        # EAPI Elm_Toolbar_Shrink_Mode elm_toolbar_shrink_mode_get(const Evas_Object *obj);
        [ :elm_toolbar_shrink_mode_get, [ :evas_object ], :elm_toolbar_shrink_mode ],
        # EAPI void elm_toolbar_homogeneous_set(Evas_Object *obj, Eina_Bool homogeneous);
        [ :elm_toolbar_homogeneous_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_toolbar_homogeneous_get(const Evas_Object *obj);
        [ :elm_toolbar_homogeneous_get, [ :evas_object ], :bool ],
        # EAPI void elm_toolbar_menu_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_toolbar_menu_parent_set, [ :evas_object, :evas_object ], :void ],
        # EAPI Evas_Object *elm_toolbar_menu_parent_get(const Evas_Object *obj);
        [ :elm_toolbar_menu_parent_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_toolbar_align_set(Evas_Object *obj, double align);
        [ :elm_toolbar_align_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_toolbar_align_get(const Evas_Object *obj);
        [ :elm_toolbar_align_get, [ :evas_object ], :double ],
        # EAPI void elm_toolbar_item_menu_set(Elm_Object_Item *it, Eina_Bool menu);
        [ :elm_toolbar_item_menu_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Evas_Object *elm_toolbar_item_menu_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_menu_get, [ :elm_object_item ], :evas_object ],
        # EAPI Elm_Toolbar_Item_State *elm_toolbar_item_state_add(Elm_Object_Item *it, const char *icon, const char *label, Evas_Smart_Cb func, const void *data);
        [ :elm_toolbar_item_state_add, [ :elm_object_item, :string, :string, :evas_smart_cb, :pointer ], :elm_toolbar_item_state ],
        # EAPI Eina_Bool elm_toolbar_item_state_del(Elm_Object_Item *it, Elm_Toolbar_Item_State *state);
        [ :elm_toolbar_item_state_del, [ :elm_object_item, :elm_toolbar_item_state ], :bool ],
        # EAPI Eina_Bool elm_toolbar_item_state_set(Elm_Object_Item *it, Elm_Toolbar_Item_State *state);
        [ :elm_toolbar_item_state_set, [ :elm_object_item, :elm_toolbar_item_state ], :bool ],
        # EAPI void elm_toolbar_item_state_unset(Elm_Object_Item *it);
        [ :elm_toolbar_item_state_unset, [ :elm_object_item ], :void ],
        # EAPI Elm_Toolbar_Item_State *elm_toolbar_item_state_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_state_get, [ :elm_object_item ], :elm_toolbar_item_state ],
        # EAPI Elm_Toolbar_Item_State *elm_toolbar_item_state_next(Elm_Object_Item *it);
        [ :elm_toolbar_item_state_next, [ :elm_object_item ], :elm_toolbar_item_state ],
        # EAPI Elm_Toolbar_Item_State *elm_toolbar_item_state_prev(Elm_Object_Item *it);
        [ :elm_toolbar_item_state_prev, [ :elm_object_item ], :elm_toolbar_item_state ],
        # EAPI void elm_toolbar_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_toolbar_horizontal_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_toolbar_horizontal_get(const Evas_Object *obj);
        [ :elm_toolbar_horizontal_get, [ :evas_object ], :bool ],
        # EAPI unsigned int elm_toolbar_items_count(const Evas_Object *obj);
        [ :elm_toolbar_items_count, [ :evas_object ], :uint ],
        # EAPI void elm_toolbar_standard_priority_set(Evas_Object *obj, int priority);
        [ :elm_toolbar_standard_priority_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_toolbar_standard_priority_get(const Evas_Object *obj);
        [ :elm_toolbar_standard_priority_get, [ :evas_object ], :int ],
        # EAPI void elm_toolbar_select_mode_set(Evas_Object *obj, Elm_Object_Select_Mode mode);
        [ :elm_toolbar_select_mode_set, [ :evas_object, :elm_object_select_mode ], :void ],
        # EAPI Elm_Object_Select_Mode elm_toolbar_select_mode_get(const Evas_Object *obj);
        [ :elm_toolbar_select_mode_get, [ :evas_object ], :elm_object_select_mode ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
