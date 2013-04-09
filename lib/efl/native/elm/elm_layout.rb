#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/edje'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmLayout
        #
        FCT_PREFIX = 'elm_layout_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_layout_add(Evas_Object *parent);
        [ :elm_layout_add, [ :evas_object ], :evas_object ],
        # EAPI Eina_Bool elm_layout_file_set(Evas_Object *obj, const char *file, const char *group);
        [ :elm_layout_file_set, [ :evas_object, :string, :string ], :bool ],
        # EAPI int elm_layout_freeze(Evas_Object *obj);
        [ :elm_layout_freeze, [ :evas_object ], :int ],
        # EAPI int elm_layout_thaw(Evas_Object *obj);
        [ :elm_layout_thaw, [ :evas_object ], :int ],
        # EAPI Eina_Bool elm_layout_theme_set(Evas_Object *obj, const char *clas, const char *group, const char *style);
        [ :elm_layout_theme_set, [ :evas_object, :string, :string, :string ], :bool ],
        # EAPI void elm_layout_signal_emit(Evas_Object *obj, const char *emission, const char *source);
        [ :elm_layout_signal_emit, [ :evas_object, :string, :string ], :void ],
        # EAPI void elm_layout_signal_callback_add(Evas_Object *obj, const char *emission, const char *source, Edje_Signal_Cb func, void *data);
        [ :elm_layout_signal_callback_add, [ :evas_object, :string, :string, :edje_signal_cb, :pointer ], :void ],
        # EAPI void *elm_layout_signal_callback_del(Evas_Object *obj, const char *emission, const char *source, Edje_Signal_Cb func);
        [ :elm_layout_signal_callback_del, [ :evas_object, :string, :string, :edje_signal_cb ], :pointer ],
        # EAPI Eina_Bool elm_layout_box_append(Evas_Object *obj, const char *part, Evas_Object *child);
        [ :elm_layout_box_append, [ :evas_object, :string, :evas_object ], :bool ],
        # EAPI Eina_Bool elm_layout_box_prepend(Evas_Object *obj, const char *part, Evas_Object *child);
        [ :elm_layout_box_prepend, [ :evas_object, :string, :evas_object ], :bool ],
        # EAPI Eina_Bool elm_layout_box_insert_before(Evas_Object *obj, const char *part, Evas_Object *child, const Evas_Object *reference);
        [ :elm_layout_box_insert_before, [ :evas_object, :string, :evas_object, :evas_object ], :bool ],
        # EAPI Eina_Bool elm_layout_box_insert_at(Evas_Object *obj, const char *part, Evas_Object *child, unsigned int pos);
        [ :elm_layout_box_insert_at, [ :evas_object, :string, :evas_object, :uint ], :bool ],
        # EAPI Evas_Object *elm_layout_box_remove(Evas_Object *obj, const char *part, Evas_Object *child);
        [ :elm_layout_box_remove, [ :evas_object, :string, :evas_object ], :evas_object ],
        # EAPI Eina_Bool elm_layout_box_remove_all(Evas_Object *obj, const char *part, Eina_Bool clear);
        [ :elm_layout_box_remove_all, [ :evas_object, :string, :bool ], :bool ],
        # EAPI Eina_Bool elm_layout_table_pack(Evas_Object *obj, const char *part, Evas_Object *child_obj, unsigned short col, unsigned short row, unsigned short colspan, unsigned short rowspan);
        [ :elm_layout_table_pack, [ :evas_object, :string, :evas_object, :ushort, :ushort, :ushort, :ushort ], :bool ],
        # EAPI Evas_Object *elm_layout_table_unpack(Evas_Object *obj, const char *part, Evas_Object *child_obj);
        [ :elm_layout_table_unpack, [ :evas_object, :string, :evas_object ], :evas_object ],
        # EAPI Eina_Bool elm_layout_table_clear(Evas_Object *obj, const char *part, Eina_Bool clear);
        [ :elm_layout_table_clear, [ :evas_object, :string, :bool ], :bool ],
        # EAPI Evas_Object *elm_layout_edje_get(const Evas_Object *obj);
        [ :elm_layout_edje_get, [ :evas_object ], :evas_object ],
        # EAPI const char *elm_layout_data_get(const Evas_Object *obj, const char *key);
        [ :elm_layout_data_get, [ :evas_object, :string ], :string ],
        # EAPI void elm_layout_sizing_eval(Evas_Object *obj);
        [ :elm_layout_sizing_eval, [ :evas_object ], :void ],
        # EAPI Eina_Bool elm_layout_part_cursor_set(Evas_Object *obj, const char *part_name, const char *cursor);
        [ :elm_layout_part_cursor_set, [ :evas_object, :string, :string ], :bool ],
        # EAPI const char *elm_layout_part_cursor_get(const Evas_Object *obj, const char *part_name);
        [ :elm_layout_part_cursor_get, [ :evas_object, :string ], :string ],
        # EAPI Eina_Bool elm_layout_part_cursor_unset(Evas_Object *obj, const char *part_name);
        [ :elm_layout_part_cursor_unset, [ :evas_object, :string ], :bool ],
        # EAPI Eina_Bool elm_layout_part_cursor_style_set(Evas_Object *obj, const char *part_name, const char *style);
        [ :elm_layout_part_cursor_style_set, [ :evas_object, :string, :string ], :bool ],
        # EAPI const char *elm_layout_part_cursor_style_get(const Evas_Object *obj, const char *part_name);
        [ :elm_layout_part_cursor_style_get, [ :evas_object, :string ], :string ],
        # EAPI Eina_Bool elm_layout_part_cursor_engine_only_set(Evas_Object *obj, const char *part_name, Eina_Bool engine_only);
        [ :elm_layout_part_cursor_engine_only_set, [ :evas_object, :string, :bool ], :bool ],
        # EAPI Eina_Bool elm_layout_edje_object_can_access_set(Evas_Object *obj, Eina_Bool can_access);
        [ :elm_layout_edje_object_can_access_set, [ :evas_object, :bool ], :bool ],
        # EAPI Eina_Bool elm_layout_edje_object_can_access_get(Evas_Object *obj);
        [ :elm_layout_edje_object_can_access_get, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_layout_part_cursor_engine_only_get(const Evas_Object *obj, const char *part_name);
        [ :elm_layout_part_cursor_engine_only_get, [ :evas_object, :string ], :bool ],
        # EAPI Eina_Bool elm_layout_content_set(Evas_Object *obj, const char *swallow, Evas_Object *content);
        [ :elm_layout_content_set, [ :evas_object, :string, :evas_object ], :bool ],
        # EAPI Evas_Object *elm_layout_content_get(const Evas_Object *obj, const char *swallow);
        [ :elm_layout_content_get, [ :evas_object, :string ], :evas_object ],
        # EAPI Evas_Object *elm_layout_content_unset(Evas_Object *obj, const char *swallow);
        [ :elm_layout_content_unset, [ :evas_object, :string ], :evas_object ],
        # EAPI Eina_Bool elm_layout_text_set(Evas_Object *obj, const char *part, const char *text);
        [ :elm_layout_text_set, [ :evas_object, :string, :string ], :bool ],
        # EAPI const char *elm_layout_text_get(const Evas_Object *obj, const char *part);
        [ :elm_layout_text_get, [ :evas_object, :string ], :string ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
