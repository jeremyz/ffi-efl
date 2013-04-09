#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmColorSelector
        #
        FCT_PREFIX = 'elm_colorselector_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Colorselector_Mode;
        enum :elm_colorselector_mode, [ :elm_colorselector_palette, 0, :elm_colorselector_components, 1, :elm_colorselector_both, 2 ]
        #
        # TYPEDEFS
        # typedef struct _Elm_Color_RGBA Elm_Color_RGBA;
        typedef :pointer, :elm_color_rgba
        # typedef struct _Elm_Custom_Palette Elm_Custom_Palette;
        typedef :pointer, :elm_custom_palette
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_colorselector_add(Evas_Object *parent);
        [ :elm_colorselector_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_colorselector_color_set(Evas_Object *obj, int r, int g, int b, int a);
        [ :elm_colorselector_color_set, [ :evas_object, :int, :int, :int, :int ], :void ],
        # EAPI void elm_colorselector_color_get(const Evas_Object *obj, int *r, int *g, int *b, int *a);
        [ :elm_colorselector_color_get, [ :evas_object, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void elm_colorselector_mode_set(Evas_Object *obj, Elm_Colorselector_Mode mode);
        [ :elm_colorselector_mode_set, [ :evas_object, :elm_colorselector_mode ], :void ],
        # EAPI Elm_Colorselector_Mode elm_colorselector_mode_get(const Evas_Object *obj);
        [ :elm_colorselector_mode_get, [ :evas_object ], :elm_colorselector_mode ],
        # EAPI void elm_colorselector_palette_item_color_get(const Elm_Object_Item *it, int *r, int *g, int *b, int *a);
        [ :elm_colorselector_palette_item_color_get, [ :elm_object_item, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void elm_colorselector_palette_item_color_set(Elm_Object_Item *it, int r, int g, int b, int a);
        [ :elm_colorselector_palette_item_color_set, [ :elm_object_item, :int, :int, :int, :int ], :void ],
        # EAPI Elm_Object_Item *elm_colorselector_palette_color_add(Evas_Object *obj, int r, int g, int b, int a);
        [ :elm_colorselector_palette_color_add, [ :evas_object, :int, :int, :int, :int ], :elm_object_item ],
        # EAPI void elm_colorselector_palette_clear(Evas_Object *obj);
        [ :elm_colorselector_palette_clear, [ :evas_object ], :void ],
        # EAPI void elm_colorselector_palette_name_set(Evas_Object *obj, const char *palette_name);
        [ :elm_colorselector_palette_name_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_colorselector_palette_name_get(const Evas_Object *obj);
        [ :elm_colorselector_palette_name_get, [ :evas_object ], :string ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
