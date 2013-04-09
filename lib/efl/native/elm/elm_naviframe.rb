#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmNaviFrame
        #
        FCT_PREFIX = 'elm_naviframe_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_naviframe_add(Evas_Object *parent);
        [ :elm_naviframe_add, [ :evas_object ], :evas_object ],
        # EAPI Elm_Object_Item *elm_naviframe_item_push(Evas_Object *obj, const char *title_label, Evas_Object *prev_btn, Evas_Object *next_btn, Evas_Object *content, const char *item_style);
        [ :elm_naviframe_item_push, [ :evas_object, :string, :evas_object, :evas_object, :evas_object, :string ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_naviframe_item_insert_before(Evas_Object *obj, Elm_Object_Item *before, const char *title_label, Evas_Object *prev_btn, Evas_Object *next_btn, Evas_Object *content, const char *item_style);
        [ :elm_naviframe_item_insert_before, [ :evas_object, :elm_object_item, :string, :evas_object, :evas_object, :evas_object, :string ],
            :elm_object_item ],
        # EAPI Elm_Object_Item *elm_naviframe_item_insert_after(Evas_Object *obj, Elm_Object_Item *after, const char *title_label, Evas_Object *prev_btn, Evas_Object *next_btn, Evas_Object *content, const char *item_style);
        [ :elm_naviframe_item_insert_after, [ :evas_object, :elm_object_item, :string, :evas_object, :evas_object, :evas_object, :string ],
            :elm_object_item ],
        # EAPI Evas_Object *elm_naviframe_item_pop(Evas_Object *obj);
        [ :elm_naviframe_item_pop, [ :evas_object ], :evas_object ],
        # EAPI void elm_naviframe_item_pop_to(Elm_Object_Item *it);
        [ :elm_naviframe_item_pop_to, [ :elm_object_item ], :void ],
        # EAPI void elm_naviframe_item_promote(Elm_Object_Item *it);
        [ :elm_naviframe_item_promote, [ :elm_object_item ], :void ],
        # EAPI void elm_naviframe_content_preserve_on_pop_set(Evas_Object *obj, Eina_Bool preserve);
        [ :elm_naviframe_content_preserve_on_pop_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_naviframe_content_preserve_on_pop_get(const Evas_Object *obj);
        [ :elm_naviframe_content_preserve_on_pop_get, [ :evas_object ], :bool ],
        # EAPI Elm_Object_Item *elm_naviframe_top_item_get(const Evas_Object *obj);
        [ :elm_naviframe_top_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_naviframe_bottom_item_get(const Evas_Object *obj);
        [ :elm_naviframe_bottom_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI void elm_naviframe_item_style_set(Elm_Object_Item *it, const char *item_style);
        [ :elm_naviframe_item_style_set, [ :elm_object_item, :string ], :void ],
        # EAPI const char *elm_naviframe_item_style_get(const Elm_Object_Item *it);
        [ :elm_naviframe_item_style_get, [ :elm_object_item ], :string ],
        # EAPI void elm_naviframe_item_title_visible_set(Elm_Object_Item *it, Eina_Bool visible);
        [ :elm_naviframe_item_title_visible_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_naviframe_item_title_visible_get(const Elm_Object_Item *it);
        [ :elm_naviframe_item_title_visible_get, [ :elm_object_item ], :bool ],
        # EAPI void elm_naviframe_prev_btn_auto_pushed_set(Evas_Object *obj, Eina_Bool auto_pushed);
        [ :elm_naviframe_prev_btn_auto_pushed_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_naviframe_prev_btn_auto_pushed_get(const Evas_Object *obj);
        [ :elm_naviframe_prev_btn_auto_pushed_get, [ :evas_object ], :bool ],
        # EAPI Eina_List *elm_naviframe_items_get(const Evas_Object *obj);
        [ :elm_naviframe_items_get, [ :evas_object ], :eina_list ],
        # EAPI void elm_naviframe_event_enabled_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_naviframe_event_enabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_naviframe_event_enabled_get(const Evas_Object *obj);
        [ :elm_naviframe_event_enabled_get, [ :evas_object ], :bool ],
        # EAPI void elm_naviframe_item_simple_promote(Evas_Object *obj, Evas_Object *content);
        [ :elm_naviframe_item_simple_promote, [ :evas_object, :evas_object ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
