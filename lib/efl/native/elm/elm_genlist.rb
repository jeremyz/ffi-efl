#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
require 'efl/native/elm/elm_gen'
require 'efl/native/elm/elm_list'
require 'efl/native/elm/elm_scroller'
#
module Efl
    #
    module ElmGenList
        #
        FCT_PREFIX = 'elm_genlist_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Genlist_Item_Type;
        enum :elm_genlist_item_type, [ :elm_genlist_item_none, 0, :elm_genlist_item_tree, (1<<0), :elm_genlist_item_group, (1<<1),
            :elm_genlist_item_max, (1<<2) ]
        # typedef enum {...} Elm_Genlist_Item_Field_Type;
        enum :elm_genlist_item_field_type, [ :elm_genlist_item_field_all, 0, :elm_genlist_item_field_text, (1<<0), :elm_genlist_item_field_content,
            (1<<1), :elm_genlist_item_field_state, (1<<2) ]
        # typedef enum {...} Elm_Genlist_Item_Scrollto_Type;
        enum :elm_genlist_item_scrollto_type, [ :elm_genlist_item_scrollto_none, 0, :elm_genlist_item_scrollto_in, (1<<0),
            :elm_genlist_item_scrollto_top, (1<<1), :elm_genlist_item_scrollto_middle, (1<<2) ]
        #
        # TYPEDEFS
        # typedef Elm_Gen_Item_Class Elm_Genlist_Item_Class;
        typedef :elm_gen_item_class, :elm_genlist_item_class
        # typedef Elm_Gen_Item_Text_Get_Cb Elm_Genlist_Item_Text_Get_Cb;
        typedef :elm_gen_item_text_get_cb, :elm_genlist_item_text_get_cb
        # typedef Elm_Gen_Item_Content_Get_Cb Elm_Genlist_Item_Content_Get_Cb;
        typedef :elm_gen_item_content_get_cb, :elm_genlist_item_content_get_cb
        # typedef Elm_Gen_Item_State_Get_Cb Elm_Genlist_Item_State_Get_Cb;
        typedef :elm_gen_item_state_get_cb, :elm_genlist_item_state_get_cb
        # typedef Elm_Gen_Item_Del_Cb Elm_Genlist_Item_Del_Cb;
        typedef :elm_gen_item_del_cb, :elm_genlist_item_del_cb
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_genlist_add(Evas_Object *parent);
        [ :elm_genlist_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_genlist_clear(Evas_Object *obj);
        [ :elm_genlist_clear, [ :evas_object ], :void ],
        # EAPI void elm_genlist_multi_select_set(Evas_Object *obj, Eina_Bool multi);
        [ :elm_genlist_multi_select_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_genlist_multi_select_get(const Evas_Object *obj);
        [ :elm_genlist_multi_select_get, [ :evas_object ], :bool ],
        # EAPI void elm_genlist_mode_set(Evas_Object *obj, Elm_List_Mode mode);
        [ :elm_genlist_mode_set, [ :evas_object, :elm_list_mode ], :void ],
        # EAPI Elm_List_Mode elm_genlist_mode_get(const Evas_Object *obj);
        [ :elm_genlist_mode_get, [ :evas_object ], :elm_list_mode ],
        # EAPI Elm_Object_Item *elm_genlist_item_append(Evas_Object *obj, const Elm_Genlist_Item_Class *itc, const void *data, Elm_Object_Item *parent, Elm_Genlist_Item_Type type, Evas_Smart_Cb func, const void *func_data);
        [ :elm_genlist_item_append, [ :evas_object, :pointer, :pointer, :elm_object_item, :elm_genlist_item_type, :evas_smart_cb, :pointer ],
            :elm_object_item ],
        # EAPI Elm_Object_Item *elm_genlist_item_prepend(Evas_Object *obj, const Elm_Genlist_Item_Class *itc, const void *data, Elm_Object_Item *parent, Elm_Genlist_Item_Type type, Evas_Smart_Cb func, const void *func_data);
        [ :elm_genlist_item_prepend, [ :evas_object, :pointer, :pointer, :elm_object_item, :elm_genlist_item_type, :evas_smart_cb, :pointer ],
            :elm_object_item ],
        # EAPI Elm_Object_Item *elm_genlist_item_insert_before(Evas_Object *obj, const Elm_Genlist_Item_Class *itc, const void *data, Elm_Object_Item *parent, Elm_Object_Item *before, Elm_Genlist_Item_Type type, Evas_Smart_Cb func, const void *func_data);
        [ :elm_genlist_item_insert_before, [ :evas_object, :pointer, :pointer, :elm_object_item, :elm_object_item, :elm_genlist_item_type,
            :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_genlist_item_insert_after(Evas_Object *obj, const Elm_Genlist_Item_Class *itc, const void *data, Elm_Object_Item *parent, Elm_Object_Item *after, Elm_Genlist_Item_Type type, Evas_Smart_Cb func, const void *func_data);
        [ :elm_genlist_item_insert_after, [ :evas_object, :pointer, :pointer, :elm_object_item, :elm_object_item, :elm_genlist_item_type,
            :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_genlist_item_sorted_insert(Evas_Object *obj, const Elm_Genlist_Item_Class *itc, const void *data, Elm_Object_Item *parent, Elm_Genlist_Item_Type type, Eina_Compare_Cb comp, Evas_Smart_Cb func, const void *func_data);
        [ :elm_genlist_item_sorted_insert, [ :evas_object, :pointer, :pointer, :elm_object_item, :elm_genlist_item_type, :eina_compare_cb,
            :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_genlist_selected_item_get(const Evas_Object *obj);
        [ :elm_genlist_selected_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI const Eina_List *elm_genlist_selected_items_get(const Evas_Object *obj);
        [ :elm_genlist_selected_items_get, [ :evas_object ], :eina_list ],
        # EAPI Eina_List *elm_genlist_realized_items_get(const Evas_Object *obj);
        [ :elm_genlist_realized_items_get, [ :evas_object ], :eina_list ],
        # EAPI Elm_Object_Item *elm_genlist_first_item_get(const Evas_Object *obj);
        [ :elm_genlist_first_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_genlist_last_item_get(const Evas_Object *obj);
        [ :elm_genlist_last_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_genlist_item_next_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_next_get, [ :elm_object_item ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_genlist_item_prev_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_prev_get, [ :elm_object_item ], :elm_object_item ],
        # EAPI void elm_genlist_item_selected_set(Elm_Object_Item *it, Eina_Bool selected);
        [ :elm_genlist_item_selected_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_genlist_item_selected_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_selected_get, [ :elm_object_item ], :bool ],
        # EAPI void elm_genlist_item_show(Elm_Object_Item *it, Elm_Genlist_Item_Scrollto_Type type);
        [ :elm_genlist_item_show, [ :elm_object_item, :elm_genlist_item_scrollto_type ], :void ],
        # EAPI void elm_genlist_item_bring_in(Elm_Object_Item *it, Elm_Genlist_Item_Scrollto_Type type);
        [ :elm_genlist_item_bring_in, [ :elm_object_item, :elm_genlist_item_scrollto_type ], :void ],
        # EAPI void elm_genlist_item_update(Elm_Object_Item *it);
        [ :elm_genlist_item_update, [ :elm_object_item ], :void ],
        # EAPI void elm_genlist_item_item_class_update(Elm_Object_Item *it, const Elm_Genlist_Item_Class *itc);
        [ :elm_genlist_item_item_class_update, [ :elm_object_item, :pointer ], :void ],
        # EAPI const Elm_Genlist_Item_Class *elm_genlist_item_item_class_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_item_class_get, [ :elm_object_item ], :pointer ],
        # EAPI int elm_genlist_item_index_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_index_get, [ :elm_object_item ], :int ],
        # EAPI void elm_genlist_realized_items_update(Evas_Object *obj);
        [ :elm_genlist_realized_items_update, [ :evas_object ], :void ],
        # EAPI unsigned int elm_genlist_items_count(const Evas_Object *obj);
        [ :elm_genlist_items_count, [ :evas_object ], :uint ],
        # EAPI Elm_Genlist_Item_Class *elm_genlist_item_class_new(void);
        [ :elm_genlist_item_class_new, [  ], :pointer ],
        # EAPI void elm_genlist_item_class_free(Elm_Genlist_Item_Class *itc);
        [ :elm_genlist_item_class_free, [ :pointer ], :void ],
        # EAPI void elm_genlist_item_class_ref(Elm_Genlist_Item_Class *itc);
        [ :elm_genlist_item_class_ref, [ :pointer ], :void ],
        # EAPI void elm_genlist_item_class_unref(Elm_Genlist_Item_Class *itc);
        [ :elm_genlist_item_class_unref, [ :pointer ], :void ],
        # EAPI void elm_genlist_item_tooltip_text_set(Elm_Object_Item *it, const char *text);
        [ :elm_genlist_item_tooltip_text_set, [ :elm_object_item, :string ], :void ],
        # EAPI void elm_genlist_item_tooltip_content_cb_set(Elm_Object_Item *it, Elm_Tooltip_Item_Content_Cb func, const void *data, Evas_Smart_Cb del_cb);
        [ :elm_genlist_item_tooltip_content_cb_set, [ :elm_object_item, :elm_tooltip_item_content_cb, :pointer, :evas_smart_cb ], :void ],
        # EAPI void elm_genlist_item_tooltip_unset(Elm_Object_Item *it);
        [ :elm_genlist_item_tooltip_unset, [ :elm_object_item ], :void ],
        # EAPI void elm_genlist_item_tooltip_style_set(Elm_Object_Item *it, const char *style);
        [ :elm_genlist_item_tooltip_style_set, [ :elm_object_item, :string ], :void ],
        # EAPI const char *elm_genlist_item_tooltip_style_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_tooltip_style_get, [ :elm_object_item ], :string ],
        # EAPI Eina_Bool elm_genlist_item_tooltip_window_mode_set(Elm_Object_Item *it, Eina_Bool disable);
        [ :elm_genlist_item_tooltip_window_mode_set, [ :elm_object_item, :bool ], :bool ],
        # EAPI Eina_Bool elm_genlist_item_tooltip_window_mode_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_tooltip_window_mode_get, [ :elm_object_item ], :bool ],
        # EAPI void elm_genlist_item_cursor_set(Elm_Object_Item *it, const char *cursor);
        [ :elm_genlist_item_cursor_set, [ :elm_object_item, :string ], :void ],
        # EAPI const char *elm_genlist_item_cursor_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_cursor_get, [ :elm_object_item ], :string ],
        # EAPI void elm_genlist_item_cursor_unset(Elm_Object_Item *it);
        [ :elm_genlist_item_cursor_unset, [ :elm_object_item ], :void ],
        # EAPI void elm_genlist_item_cursor_style_set(Elm_Object_Item *it, const char *style);
        [ :elm_genlist_item_cursor_style_set, [ :elm_object_item, :string ], :void ],
        # EAPI const char *elm_genlist_item_cursor_style_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_cursor_style_get, [ :elm_object_item ], :string ],
        # EAPI void elm_genlist_item_cursor_engine_only_set(Elm_Object_Item *it, Eina_Bool engine_only);
        [ :elm_genlist_item_cursor_engine_only_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_genlist_item_cursor_engine_only_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_cursor_engine_only_get, [ :elm_object_item ], :bool ],
        # EAPI void elm_genlist_homogeneous_set(Evas_Object *obj, Eina_Bool homogeneous);
        [ :elm_genlist_homogeneous_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_genlist_homogeneous_get(const Evas_Object *obj);
        [ :elm_genlist_homogeneous_get, [ :evas_object ], :bool ],
        # EAPI void elm_genlist_block_count_set(Evas_Object *obj, int count);
        [ :elm_genlist_block_count_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_genlist_block_count_get(const Evas_Object *obj);
        [ :elm_genlist_block_count_get, [ :evas_object ], :int ],
        # EAPI void elm_genlist_longpress_timeout_set(Evas_Object *obj, double timeout);
        [ :elm_genlist_longpress_timeout_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_genlist_longpress_timeout_get(const Evas_Object *obj);
        [ :elm_genlist_longpress_timeout_get, [ :evas_object ], :double ],
        # EAPI Elm_Object_Item *elm_genlist_at_xy_item_get(const Evas_Object *obj, Evas_Coord x, Evas_Coord y, int *posret);
        [ :elm_genlist_at_xy_item_get, [ :evas_object, :int, :int, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_genlist_item_parent_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_parent_get, [ :elm_object_item ], :elm_object_item ],
        # EAPI void elm_genlist_item_subitems_clear(Elm_Object_Item *it);
        [ :elm_genlist_item_subitems_clear, [ :elm_object_item ], :void ],
        # EAPI void elm_genlist_item_expanded_set(Elm_Object_Item *it, Eina_Bool expanded);
        [ :elm_genlist_item_expanded_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_genlist_item_expanded_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_expanded_get, [ :elm_object_item ], :bool ],
        # EAPI int elm_genlist_item_expanded_depth_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_expanded_depth_get, [ :elm_object_item ], :int ],
        # EAPI void elm_genlist_item_all_contents_unset(Elm_Object_Item *it, Eina_List **l);
        [ :elm_genlist_item_all_contents_unset, [ :elm_object_item, :eina_list ], :void ],
        # EAPI void elm_genlist_item_promote(Elm_Object_Item *it);
        [ :elm_genlist_item_promote, [ :elm_object_item ], :void ],
        # EAPI void elm_genlist_item_demote(Elm_Object_Item *it);
        [ :elm_genlist_item_demote, [ :elm_object_item ], :void ],
        # EAPI void elm_genlist_item_fields_update(Elm_Object_Item *it, const char *parts, Elm_Genlist_Item_Field_Type itf);
        [ :elm_genlist_item_fields_update, [ :elm_object_item, :string, :elm_genlist_item_field_type ], :void ],
        # EAPI void elm_genlist_item_decorate_mode_set(Elm_Object_Item *it, const char *decorate_it_type, Eina_Bool decorate_it_set);
        [ :elm_genlist_item_decorate_mode_set, [ :elm_object_item, :string, :bool ], :void ],
        # EAPI const char *elm_genlist_item_decorate_mode_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_decorate_mode_get, [ :elm_object_item ], :string ],
        # EAPI Elm_Object_Item *elm_genlist_decorated_item_get(const Evas_Object *obj);
        [ :elm_genlist_decorated_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI void elm_genlist_reorder_mode_set(Evas_Object *obj, Eina_Bool reorder_mode);
        [ :elm_genlist_reorder_mode_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_genlist_reorder_mode_get(const Evas_Object *obj);
        [ :elm_genlist_reorder_mode_get, [ :evas_object ], :bool ],
        # EAPI Elm_Genlist_Item_Type elm_genlist_item_type_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_type_get, [ :elm_object_item ], :elm_genlist_item_type ],
        # EAPI void elm_genlist_decorate_mode_set(Evas_Object *obj, Eina_Bool decorated);
        [ :elm_genlist_decorate_mode_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_genlist_decorate_mode_get(const Evas_Object *obj);
        [ :elm_genlist_decorate_mode_get, [ :evas_object ], :bool ],
        # EAPI void elm_genlist_item_flip_set(Elm_Object_Item *it, Eina_Bool flip);
        [ :elm_genlist_item_flip_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_genlist_item_flip_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_flip_get, [ :elm_object_item ], :bool ],
        # EAPI void elm_genlist_tree_effect_enabled_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_genlist_tree_effect_enabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_genlist_tree_effect_enabled_get(const Evas_Object *obj);
        [ :elm_genlist_tree_effect_enabled_get, [ :evas_object ], :bool ],
        # EAPI void elm_genlist_select_mode_set(Evas_Object *obj, Elm_Object_Select_Mode mode);
        [ :elm_genlist_select_mode_set, [ :evas_object, :elm_object_select_mode ], :void ],
        # EAPI Elm_Object_Select_Mode elm_genlist_select_mode_get(const Evas_Object *obj);
        [ :elm_genlist_select_mode_get, [ :evas_object ], :elm_object_select_mode ],
        # EAPI void elm_genlist_highlight_mode_set(Evas_Object *obj, Eina_Bool highlight);
        [ :elm_genlist_highlight_mode_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_genlist_highlight_mode_get(const Evas_Object *obj);
        [ :elm_genlist_highlight_mode_get, [ :evas_object ], :bool ],
        # EAPI void elm_genlist_item_select_mode_set(Elm_Object_Item *it, Elm_Object_Select_Mode mode);
        [ :elm_genlist_item_select_mode_set, [ :elm_object_item, :elm_object_select_mode ], :void ],
        # EAPI Elm_Object_Select_Mode elm_genlist_item_select_mode_get(const Elm_Object_Item *it);
        [ :elm_genlist_item_select_mode_get, [ :elm_object_item ], :elm_object_select_mode ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
