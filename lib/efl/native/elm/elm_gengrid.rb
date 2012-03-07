#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
require 'efl/native/elm/elm_gen'
#
module Efl
    #
    module ElmGenGrid
        #
        FCT_PREFIX = 'elm_gengrid_' unless const_defined? :FCT_PREFIX
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
        # TYPEDEFS
        # typedef Elm_Gen_Item_Class Elm_Gengrid_Item_Class;
        typedef :elm_gen_item_class, :elm_gengrid_item_class
        # typedef Elm_Gen_Item_Text_Get_Cb Elm_Gengrid_Item_Text_Get_Cb;
        typedef :elm_gen_item_text_get_cb, :elm_gengrid_item_text_get_cb
        # typedef Elm_Gen_Item_Content_Get_Cb Elm_Gengrid_Item_Content_Get_Cb;
        typedef :elm_gen_item_content_get_cb, :elm_gengrid_item_content_get_cb
        # typedef Elm_Gen_Item_State_Get_Cb Elm_Gengrid_Item_State_Get_Cb;
        typedef :elm_gen_item_state_get_cb, :elm_gengrid_item_state_get_cb
        # typedef Elm_Gen_Item_Del_Cb Elm_Gengrid_Item_Del_Cb;
        typedef :elm_gen_item_del_cb, :elm_gengrid_item_del_cb
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_gengrid_add(Evas_Object *parent);
        [ :elm_gengrid_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_gengrid_clear(Evas_Object *obj);
        [ :elm_gengrid_clear, [ :evas_object ], :void ],
        # EAPI void elm_gengrid_multi_select_set(Evas_Object *obj, Eina_Bool multi);
        [ :elm_gengrid_multi_select_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_multi_select_get(const Evas_Object *obj);
        [ :elm_gengrid_multi_select_get, [ :evas_object ], :bool ],
        # EAPI void elm_gengrid_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_gengrid_horizontal_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_horizontal_get(const Evas_Object *obj);
        [ :elm_gengrid_horizontal_get, [ :evas_object ], :bool ],
        # EAPI void elm_gengrid_always_select_mode_set(Evas_Object *obj, Eina_Bool always_select);
        [ :elm_gengrid_always_select_mode_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_always_select_mode_get(const Evas_Object *obj);
        [ :elm_gengrid_always_select_mode_get, [ :evas_object ], :bool ],
        # EAPI void elm_gengrid_no_select_mode_set(Evas_Object *obj, Eina_Bool no_select);
        [ :elm_gengrid_no_select_mode_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_no_select_mode_get(const Evas_Object *obj);
        [ :elm_gengrid_no_select_mode_get, [ :evas_object ], :bool ],
        # EAPI void elm_gengrid_bounce_set(Evas_Object *obj, Eina_Bool h_bounce, Eina_Bool v_bounce);
        [ :elm_gengrid_bounce_set, [ :evas_object, :bool, :bool ], :void ],
        # EAPI void elm_gengrid_bounce_get(const Evas_Object *obj, Eina_Bool *h_bounce, Eina_Bool *v_bounce);
        [ :elm_gengrid_bounce_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI Elm_Object_Item *elm_gengrid_item_append(Evas_Object *obj, const Elm_Gengrid_Item_Class *gic, const void *data, Evas_Smart_Cb func, const void *func_data);
        [ :elm_gengrid_item_append, [ :evas_object, :pointer, :pointer, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_gengrid_item_prepend(Evas_Object *obj, const Elm_Gengrid_Item_Class *gic, const void *data, Evas_Smart_Cb func, const void *func_data);
        [ :elm_gengrid_item_prepend, [ :evas_object, :pointer, :pointer, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_gengrid_item_insert_before(Evas_Object *obj, const Elm_Gengrid_Item_Class *gic, const void *data, Elm_Object_Item *relative, Evas_Smart_Cb func, const void *func_data);
        [ :elm_gengrid_item_insert_before, [ :evas_object, :pointer, :pointer, :elm_object_item, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_gengrid_item_insert_after(Evas_Object *obj, const Elm_Gengrid_Item_Class *gic, const void *data, Elm_Object_Item *relative, Evas_Smart_Cb func, const void *func_data);
        [ :elm_gengrid_item_insert_after, [ :evas_object, :pointer, :pointer, :elm_object_item, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_gengrid_item_sorted_insert(Evas_Object *obj, const Elm_Gengrid_Item_Class *gic, const void *data, Eina_Compare_Cb comp, Evas_Smart_Cb func, const void *func_data);
        [ :elm_gengrid_item_sorted_insert, [ :evas_object, :pointer, :pointer, :eina_compare_cb, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_gengrid_selected_item_get(const Evas_Object *obj);
        [ :elm_gengrid_selected_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI const Eina_List *elm_gengrid_selected_items_get(const Evas_Object *obj);
        [ :elm_gengrid_selected_items_get, [ :evas_object ], :eina_list ],
        # EAPI Elm_Object_Item *elm_gengrid_first_item_get(const Evas_Object *obj);
        [ :elm_gengrid_first_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_gengrid_last_item_get(const Evas_Object *obj);
        [ :elm_gengrid_last_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_gengrid_item_next_get(const Elm_Object_Item *it);
        [ :elm_gengrid_item_next_get, [ :elm_object_item ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_gengrid_item_prev_get(const Elm_Object_Item *it);
        [ :elm_gengrid_item_prev_get, [ :elm_object_item ], :elm_object_item ],
        # EAPI void elm_gengrid_item_selected_set(Elm_Object_Item *it, Eina_Bool selected);
        [ :elm_gengrid_item_selected_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_item_selected_get(const Elm_Object_Item *it);
        [ :elm_gengrid_item_selected_get, [ :elm_object_item ], :bool ],
        # EAPI void elm_gengrid_item_show(Elm_Object_Item *it);
        [ :elm_gengrid_item_show, [ :elm_object_item ], :void ],
        # EAPI void elm_gengrid_item_bring_in(Elm_Object_Item *it);
        [ :elm_gengrid_item_bring_in, [ :elm_object_item ], :void ],
        # EAPI void elm_gengrid_item_update(Elm_Object_Item *it);
        [ :elm_gengrid_item_update, [ :elm_object_item ], :void ],
        # EAPI void elm_gengrid_item_item_class_update(Elm_Object_Item *it, const Elm_Gengrid_Item_Class *gic);
        [ :elm_gengrid_item_item_class_update, [ :elm_object_item, :pointer ], :void ],
        # EAPI const Elm_Gengrid_Item_Class *elm_gengrid_item_item_class_get(const Elm_Object_Item *it);
        [ :elm_gengrid_item_item_class_get, [ :elm_object_item ], :pointer ],
        # EAPI Elm_Gengrid_Item_Class *elm_gengrid_item_class_new(void);
        [ :elm_gengrid_item_class_new, [  ], :pointer ],
        # EAPI void elm_gengrid_item_class_free(Elm_Gengrid_Item_Class *itc);
        [ :elm_gengrid_item_class_free, [ :pointer ], :void ],
        # EAPI void elm_gengrid_item_class_ref(Elm_Gengrid_Item_Class *itc);
        [ :elm_gengrid_item_class_ref, [ :pointer ], :void ],
        # EAPI void elm_gengrid_item_class_unref(Elm_Gengrid_Item_Class *itc);
        [ :elm_gengrid_item_class_unref, [ :pointer ], :void ],
        # EAPI void elm_gengrid_item_tooltip_text_set(Elm_Object_Item *it, const char *text);
        [ :elm_gengrid_item_tooltip_text_set, [ :elm_object_item, :string ], :void ],
        # EAPI void elm_gengrid_item_tooltip_content_cb_set(Elm_Object_Item *it, Elm_Tooltip_Item_Content_Cb func, const void *data, Evas_Smart_Cb del_cb);
        [ :elm_gengrid_item_tooltip_content_cb_set, [ :elm_object_item, :elm_tooltip_item_content_cb, :pointer, :evas_smart_cb ], :void ],
        # EAPI void elm_gengrid_item_tooltip_unset(Elm_Object_Item *it);
        [ :elm_gengrid_item_tooltip_unset, [ :elm_object_item ], :void ],
        # EAPI void elm_gengrid_item_tooltip_style_set(Elm_Object_Item *it, const char *style);
        [ :elm_gengrid_item_tooltip_style_set, [ :elm_object_item, :string ], :void ],
        # EAPI const char *elm_gengrid_item_tooltip_style_get(const Elm_Object_Item *it);
        [ :elm_gengrid_item_tooltip_style_get, [ :elm_object_item ], :string ],
        # EAPI Eina_Bool elm_gengrid_item_tooltip_window_mode_set(Elm_Object_Item *it, Eina_Bool disable);
        [ :elm_gengrid_item_tooltip_window_mode_set, [ :elm_object_item, :bool ], :bool ],
        # EAPI Eina_Bool elm_gengrid_item_tooltip_window_mode_get(const Elm_Object_Item *it);
        [ :elm_gengrid_item_tooltip_window_mode_get, [ :elm_object_item ], :bool ],
        # EAPI void elm_gengrid_item_cursor_set(Elm_Object_Item *it, const char *cursor);
        [ :elm_gengrid_item_cursor_set, [ :elm_object_item, :string ], :void ],
        # EAPI const char *elm_gengrid_item_cursor_get(const Elm_Object_Item *it);
        [ :elm_gengrid_item_cursor_get, [ :elm_object_item ], :string ],
        # EAPI void elm_gengrid_item_cursor_unset(Elm_Object_Item *it);
        [ :elm_gengrid_item_cursor_unset, [ :elm_object_item ], :void ],
        # EAPI void elm_gengrid_item_cursor_style_set(Elm_Object_Item *it, const char *style);
        [ :elm_gengrid_item_cursor_style_set, [ :elm_object_item, :string ], :void ],
        # EAPI const char *elm_gengrid_item_cursor_style_get(const Elm_Object_Item *it);
        [ :elm_gengrid_item_cursor_style_get, [ :elm_object_item ], :string ],
        # EAPI void elm_gengrid_item_cursor_engine_only_set(Elm_Object_Item *it, Eina_Bool engine_only);
        [ :elm_gengrid_item_cursor_engine_only_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_item_cursor_engine_only_get(const Elm_Object_Item *it);
        [ :elm_gengrid_item_cursor_engine_only_get, [ :elm_object_item ], :bool ],
        # EAPI void elm_gengrid_item_size_set(Evas_Object *obj, Evas_Coord w, Evas_Coord h);
        [ :elm_gengrid_item_size_set, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_gengrid_item_size_get(const Evas_Object *obj, Evas_Coord *w, Evas_Coord *h);
        [ :elm_gengrid_item_size_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_gengrid_group_item_size_set(Evas_Object *obj, Evas_Coord w, Evas_Coord h);
        [ :elm_gengrid_group_item_size_set, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_gengrid_group_item_size_get(const Evas_Object *obj, Evas_Coord *w, Evas_Coord *h);
        [ :elm_gengrid_group_item_size_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_gengrid_align_set(Evas_Object *obj, double align_x, double align_y);
        [ :elm_gengrid_align_set, [ :evas_object, :double, :double ], :void ],
        # EAPI void elm_gengrid_align_get(const Evas_Object *obj, double *align_x, double *align_y);
        [ :elm_gengrid_align_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_gengrid_reorder_mode_set(Evas_Object *obj, Eina_Bool reorder_mode);
        [ :elm_gengrid_reorder_mode_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_reorder_mode_get(const Evas_Object *obj);
        [ :elm_gengrid_reorder_mode_get, [ :evas_object ], :bool ],
        # EAPI void elm_gengrid_page_relative_set(Evas_Object *obj, double h_pagerel, double v_pagerel);
        [ :elm_gengrid_page_relative_set, [ :evas_object, :double, :double ], :void ],
        # EAPI void elm_gengrid_page_relative_get(const Evas_Object *obj, double *h_pagerel, double *v_pagerel);
        [ :elm_gengrid_page_relative_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_gengrid_page_size_set(Evas_Object *obj, Evas_Coord h_pagesize, Evas_Coord v_pagesize);
        [ :elm_gengrid_page_size_set, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_gengrid_current_page_get(const Evas_Object *obj, int *h_pagenumber, int *v_pagenumber);
        [ :elm_gengrid_current_page_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_gengrid_last_page_get(const Evas_Object *obj, int *h_pagenumber, int *v_pagenumber);
        [ :elm_gengrid_last_page_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_gengrid_page_show(const Evas_Object *obj, int h_pagenumber, int v_pagenumber);
        [ :elm_gengrid_page_show, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_gengrid_page_bring_in(const Evas_Object *obj, int h_pagenumber, int v_pagenumber);
        [ :elm_gengrid_page_bring_in, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_gengrid_item_pos_get(const Elm_Object_Item *it, unsigned int *x, unsigned int *y);
        [ :elm_gengrid_item_pos_get, [ :elm_object_item, :pointer, :pointer ], :void ],
        # EAPI void elm_gengrid_filled_set(Evas_Object *obj, Eina_Bool fill);
        [ :elm_gengrid_filled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_filled_get(const Evas_Object *obj);
        [ :elm_gengrid_filled_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
