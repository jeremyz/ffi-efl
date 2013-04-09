#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
require 'efl/native/elm/elm_icon'
#
module Efl
    #
    module ElmHoverSel
        #
        FCT_PREFIX = 'elm_hoversel_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_hoversel_add(Evas_Object *parent);
        [ :elm_hoversel_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_hoversel_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_hoversel_horizontal_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_hoversel_horizontal_get(const Evas_Object *obj);
        [ :elm_hoversel_horizontal_get, [ :evas_object ], :bool ],
        # EAPI void elm_hoversel_hover_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_hoversel_hover_parent_set, [ :evas_object, :evas_object ], :void ],
        # EAPI Evas_Object *elm_hoversel_hover_parent_get(const Evas_Object *obj);
        [ :elm_hoversel_hover_parent_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_hoversel_hover_begin(Evas_Object *obj);
        [ :elm_hoversel_hover_begin, [ :evas_object ], :void ],
        # EAPI void elm_hoversel_hover_end(Evas_Object *obj);
        [ :elm_hoversel_hover_end, [ :evas_object ], :void ],
        # EAPI Eina_Bool elm_hoversel_expanded_get(const Evas_Object *obj);
        [ :elm_hoversel_expanded_get, [ :evas_object ], :bool ],
        # EAPI void elm_hoversel_clear(Evas_Object *obj);
        [ :elm_hoversel_clear, [ :evas_object ], :void ],
        # EAPI const Eina_List *elm_hoversel_items_get(const Evas_Object *obj);
        [ :elm_hoversel_items_get, [ :evas_object ], :eina_list ],
        # EAPI Elm_Object_Item *elm_hoversel_item_add(Evas_Object *obj, const char *label, const char *icon_file, Elm_Icon_Type icon_type, Evas_Smart_Cb func, const void *data);
        [ :elm_hoversel_item_add, [ :evas_object, :string, :string, :elm_icon_type, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI void elm_hoversel_item_icon_set(Elm_Object_Item *it, const char *icon_file, const char *icon_group, Elm_Icon_Type icon_type);
        [ :elm_hoversel_item_icon_set, [ :elm_object_item, :string, :string, :elm_icon_type ], :void ],
        # EAPI void elm_hoversel_item_icon_get(const Elm_Object_Item *it, const char **icon_file, const char **icon_group, Elm_Icon_Type *icon_type);
        [ :elm_hoversel_item_icon_get, [ :elm_object_item, :pointer, :pointer, :pointer ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
