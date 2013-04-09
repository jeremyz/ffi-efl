#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmMenu
        #
        FCT_PREFIX = 'elm_menu_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_menu_add(Evas_Object *parent);
        [ :elm_menu_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_menu_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_menu_parent_set, [ :evas_object, :evas_object ], :void ],
        # EAPI Evas_Object *elm_menu_parent_get(const Evas_Object *obj);
        [ :elm_menu_parent_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_menu_move(Evas_Object *obj, Evas_Coord x, Evas_Coord y);
        [ :elm_menu_move, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_menu_close(Evas_Object *obj);
        [ :elm_menu_close, [ :evas_object ], :void ],
        # EAPI const Eina_List *elm_menu_items_get(const Evas_Object *obj);
        [ :elm_menu_items_get, [ :evas_object ], :eina_list ],
        # EAPI Evas_Object *elm_menu_item_object_get(const Elm_Object_Item *it);
        [ :elm_menu_item_object_get, [ :elm_object_item ], :evas_object ],
        # EAPI Elm_Object_Item *elm_menu_item_add(Evas_Object *obj, Elm_Object_Item *parent, const char *icon, const char *label, Evas_Smart_Cb func, const void *data);
        [ :elm_menu_item_add, [ :evas_object, :elm_object_item, :string, :string, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI void elm_menu_item_icon_name_set(Elm_Object_Item *it, const char *icon);
        [ :elm_menu_item_icon_name_set, [ :elm_object_item, :string ], :void ],
        # EAPI const char *elm_menu_item_icon_name_get(const Elm_Object_Item *it);
        [ :elm_menu_item_icon_name_get, [ :elm_object_item ], :string ],
        # EAPI void elm_menu_item_selected_set(Elm_Object_Item *it, Eina_Bool selected);
        [ :elm_menu_item_selected_set, [ :elm_object_item, :bool ], :void ],
        # EAPI Eina_Bool elm_menu_item_selected_get(const Elm_Object_Item *it);
        [ :elm_menu_item_selected_get, [ :elm_object_item ], :bool ],
        # EAPI Elm_Object_Item *elm_menu_item_separator_add(Evas_Object *obj, Elm_Object_Item *parent);
        [ :elm_menu_item_separator_add, [ :evas_object, :elm_object_item ], :elm_object_item ],
        # EAPI Eina_Bool elm_menu_item_is_separator(Elm_Object_Item *it);
        [ :elm_menu_item_is_separator, [ :elm_object_item ], :bool ],
        # EAPI const Eina_List *elm_menu_item_subitems_get(const Elm_Object_Item *it);
        [ :elm_menu_item_subitems_get, [ :elm_object_item ], :eina_list ],
        # EAPI unsigned int elm_menu_item_index_get(const Elm_Object_Item *it);
        [ :elm_menu_item_index_get, [ :elm_object_item ], :uint ],
        # EAPI Elm_Object_Item *elm_menu_selected_item_get(const Evas_Object *obj);
        [ :elm_menu_selected_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_menu_last_item_get(const Evas_Object *obj);
        [ :elm_menu_last_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_menu_first_item_get(const Evas_Object *obj);
        [ :elm_menu_first_item_get, [ :evas_object ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_menu_item_next_get(const Elm_Object_Item *it);
        [ :elm_menu_item_next_get, [ :elm_object_item ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_menu_item_prev_get(const Elm_Object_Item *it);
        [ :elm_menu_item_prev_get, [ :elm_object_item ], :elm_object_item ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
