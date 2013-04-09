#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmObjectItem
        #
        FCT_PREFIX = 'elm_object_item_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_object_item_widget_get(const Elm_Object_Item *it);
        [ :elm_object_item_widget_get, [ :elm_object_item ], :evas_object ],
        # EAPI void elm_object_item_part_content_set(Elm_Object_Item *it, const char *part, Evas_Object *content);
        [ :elm_object_item_part_content_set, [ :elm_object_item, :string, :evas_object ], :void ],
        # EAPI Evas_Object *elm_object_item_part_content_get(const Elm_Object_Item *it, const char *part);
        [ :elm_object_item_part_content_get, [ :elm_object_item, :string ], :evas_object ],
        # EAPI Evas_Object *elm_object_item_part_content_unset(Elm_Object_Item *it, const char *part);
        [ :elm_object_item_part_content_unset, [ :elm_object_item, :string ], :evas_object ],
        # EAPI void elm_object_item_part_text_set(Elm_Object_Item *it, const char *part, const char *label);
        [ :elm_object_item_part_text_set, [ :elm_object_item, :string, :string ], :void ],
        # EAPI const char *elm_object_item_part_text_get(const Elm_Object_Item *it, const char *part);
        [ :elm_object_item_part_text_get, [ :elm_object_item, :string ], :string ],
        # EAPI void elm_object_item_access_info_set(Elm_Object_Item *it, const char *txt);
        [ :elm_object_item_access_info_set, [ :elm_object_item, :string ], :void ],
        # EAPI void *elm_object_item_data_get(const Elm_Object_Item *it);
        [ :elm_object_item_data_get, [ :elm_object_item ], :pointer ],
        # EAPI void elm_object_item_data_set(Elm_Object_Item *it, void *data);
        [ :elm_object_item_data_set, [ :elm_object_item, :pointer ], :void ],
        # EAPI void elm_object_item_signal_emit(Elm_Object_Item *it, const char *emission, const char *source);
        [ :elm_object_item_signal_emit, [ :elm_object_item, :string, :string ], :void ],
        # EAPI void elm_object_item_disabled_set(Elm_Object_Item *it, Eina_Bool disabled);
        [ :elm_object_item_disabled_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_object_item_disabled_get(const Elm_Object_Item *it);
        [ :elm_object_item_disabled_get, [ :elm_object_item ], :bool ],
        # EAPI void elm_object_item_del_cb_set(Elm_Object_Item *it, Evas_Smart_Cb del_cb);
        [ :elm_object_item_del_cb_set, [ :elm_object_item, :evas_smart_cb ], :void ],
        # EAPI void elm_object_item_del(Elm_Object_Item *it);
        [ :elm_object_item_del, [ :elm_object_item ], :void ],
        # EAPI void elm_object_item_tooltip_text_set(Elm_Object_Item *it, const char *text);
        [ :elm_object_item_tooltip_text_set, [ :elm_object_item, :string ], :void ],
        # EAPI Eina_Bool elm_object_item_tooltip_window_mode_set(Elm_Object_Item *it, Eina_Bool disable);
        [ :elm_object_item_tooltip_window_mode_set, [ :elm_object_item, :bool ], :bool ],
        # EAPI Eina_Bool elm_object_item_tooltip_window_mode_get(const Elm_Object_Item *it);
        [ :elm_object_item_tooltip_window_mode_get, [ :elm_object_item ], :bool ],
        # EAPI void elm_object_item_tooltip_content_cb_set(Elm_Object_Item *it, Elm_Tooltip_Item_Content_Cb func, const void *data, Evas_Smart_Cb del_cb);
        [ :elm_object_item_tooltip_content_cb_set, [ :elm_object_item, :elm_tooltip_item_content_cb, :pointer, :evas_smart_cb ], :void ],
        # EAPI void elm_object_item_tooltip_unset(Elm_Object_Item *it);
        [ :elm_object_item_tooltip_unset, [ :elm_object_item ], :void ],
        # EAPI void elm_object_item_tooltip_style_set(Elm_Object_Item *it, const char *style);
        [ :elm_object_item_tooltip_style_set, [ :elm_object_item, :string ], :void ],
        # EAPI const char *elm_object_item_tooltip_style_get(const Elm_Object_Item *it);
        [ :elm_object_item_tooltip_style_get, [ :elm_object_item ], :string ],
        # EAPI void elm_object_item_cursor_set(Elm_Object_Item *it, const char *cursor);
        [ :elm_object_item_cursor_set, [ :elm_object_item, :string ], :void ],
        # EAPI const char *elm_object_item_cursor_get(const Elm_Object_Item *it);
        [ :elm_object_item_cursor_get, [ :elm_object_item ], :string ],
        # EAPI void elm_object_item_cursor_unset(Elm_Object_Item *it);
        [ :elm_object_item_cursor_unset, [ :elm_object_item ], :void ],
        # EAPI void elm_object_item_cursor_style_set(Elm_Object_Item *it, const char *style);
        [ :elm_object_item_cursor_style_set, [ :elm_object_item, :string ], :void ],
        # EAPI const char *elm_object_item_cursor_style_get(const Elm_Object_Item *it);
        [ :elm_object_item_cursor_style_get, [ :elm_object_item ], :string ],
        # EAPI void elm_object_item_cursor_engine_only_set(Elm_Object_Item *it, Eina_Bool engine_only);
        [ :elm_object_item_cursor_engine_only_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_object_item_cursor_engine_only_get(const Elm_Object_Item *it);
        [ :elm_object_item_cursor_engine_only_get, [ :elm_object_item ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
