#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmIcon
        #
        FCT_PREFIX = 'elm_icon_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'elementary'
        #
        # ENUMS
        # typedef enum {...} Elm_Icon_Type;
        enum :elm_icon_type, [ :elm_icon_none, :elm_icon_file, :elm_icon_standard ]
        # typedef enum {...} Elm_Icon_Lookup_Order;
        enum :elm_icon_lookup_order, [ :elm_icon_lookup_fdo_theme, :elm_icon_lookup_theme_fdo, :elm_icon_lookup_fdo, :elm_icon_lookup_theme ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_icon_add(Evas_Object *parent);
        [ :elm_icon_add, [ :evas_object ], :evas_object ],
        # EAPI Eina_Bool elm_icon_file_set(Evas_Object *obj, const char *file, const char *group);
        [ :elm_icon_file_set, [ :evas_object, :string, :string ], :bool ],
        # EAPI Eina_Bool elm_icon_memfile_set(Evas_Object *obj, const void *img, size_t size, const char *format, const char *key);
        [ :elm_icon_memfile_set, [ :evas_object, :pointer, :ulong, :string, :string ], :bool ],
        # EAPI void elm_icon_file_get(const Evas_Object *obj, const char **file, const char **group);
        [ :elm_icon_file_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_icon_thumb_set(Evas_Object *obj, const char *file, const char *group);
        [ :elm_icon_thumb_set, [ :evas_object, :string, :string ], :void ],
        # EAPI Eina_Bool elm_icon_standard_set(Evas_Object *obj, const char *name);
        [ :elm_icon_standard_set, [ :evas_object, :string ], :bool ],
        # EAPI const char *elm_icon_standard_get(const Evas_Object *obj);
        [ :elm_icon_standard_get, [ :evas_object ], :string ],
        # EAPI void elm_icon_smooth_set(Evas_Object *obj, Eina_Bool smooth);
        [ :elm_icon_smooth_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_icon_smooth_get(const Evas_Object *obj);
        [ :elm_icon_smooth_get, [ :evas_object ], :bool ],
        # EAPI void elm_icon_no_scale_set(Evas_Object *obj, Eina_Bool no_scale);
        [ :elm_icon_no_scale_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_icon_no_scale_get(const Evas_Object *obj);
        [ :elm_icon_no_scale_get, [ :evas_object ], :bool ],
        # EAPI void elm_icon_resizable_set(Evas_Object *obj, Eina_Bool size_up, Eina_Bool size_down);
        [ :elm_icon_resizable_set, [ :evas_object, :bool, :bool ], :void ],
        # EAPI void elm_icon_resizable_get(const Evas_Object *obj, Eina_Bool *size_up, Eina_Bool *size_down);
        [ :elm_icon_resizable_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_icon_size_get(const Evas_Object *obj, int *w, int *h);
        [ :elm_icon_size_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_icon_fill_outside_set(Evas_Object *obj, Eina_Bool fill_outside);
        [ :elm_icon_fill_outside_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_icon_fill_outside_get(const Evas_Object *obj);
        [ :elm_icon_fill_outside_get, [ :evas_object ], :bool ],
        # EAPI void elm_icon_prescale_set(Evas_Object *obj, int size);
        [ :elm_icon_prescale_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_icon_prescale_get(const Evas_Object *obj);
        [ :elm_icon_prescale_get, [ :evas_object ], :int ],
        # EAPI Evas_Object *elm_icon_object_get(Evas_Object *obj);
        [ :elm_icon_object_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_icon_order_lookup_set(Evas_Object *obj, Elm_Icon_Lookup_Order order);
        [ :elm_icon_order_lookup_set, [ :evas_object, :elm_icon_lookup_order ], :void ],
        # EAPI Elm_Icon_Lookup_Order elm_icon_order_lookup_get(const Evas_Object *obj);
        [ :elm_icon_order_lookup_get, [ :evas_object ], :elm_icon_lookup_order ],
        # EAPI void elm_icon_preload_disabled_set(Evas_Object *obj, Eina_Bool disabled);
        [ :elm_icon_preload_disabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_icon_animated_available_get(const Evas_Object *obj);
        [ :elm_icon_animated_available_get, [ :evas_object ], :bool ],
        # EAPI void elm_icon_animated_set(Evas_Object *obj, Eina_Bool animated);
        [ :elm_icon_animated_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_icon_animated_get(const Evas_Object *obj);
        [ :elm_icon_animated_get, [ :evas_object ], :bool ],
        # EAPI void elm_icon_animated_play_set(Evas_Object *obj, Eina_Bool play);
        [ :elm_icon_animated_play_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_icon_animated_play_get(const Evas_Object *obj);
        [ :elm_icon_animated_play_get, [ :evas_object ], :bool ],
        # EAPI void elm_icon_aspect_fixed_set(Evas_Object *obj, Eina_Bool fixed);
        [ :elm_icon_aspect_fixed_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_icon_aspect_fixed_get(const Evas_Object *obj);
        [ :elm_icon_aspect_fixed_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
