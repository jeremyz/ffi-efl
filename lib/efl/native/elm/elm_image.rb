#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmImage
        #
        FCT_PREFIX = 'elm_image_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Image_Orient;
        enum :elm_image_orient, [ :elm_image_orient_none, 0, :elm_image_orient_0, 0, :elm_image_rotate_90, 1, :elm_image_rotate_180, 2,
            :elm_image_rotate_270, 3, :elm_image_flip_horizontal, 4, :elm_image_flip_vertical, 5, :elm_image_flip_transpose, 6, :elm_image_flip_transverse, 7 ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_image_add(Evas_Object *parent);
        [ :elm_image_add, [ :evas_object ], :evas_object ],
        # EAPI Eina_Bool elm_image_memfile_set(Evas_Object *obj, const void *img, size_t size, const char *format, const char *key);
        [ :elm_image_memfile_set, [ :evas_object, :pointer, :ulong, :string, :string ], :bool ],
        # EAPI Eina_Bool elm_image_file_set(Evas_Object *obj, const char *file, const char *group);
        [ :elm_image_file_set, [ :evas_object, :string, :string ], :bool ],
        # EAPI void elm_image_file_get(const Evas_Object *obj, const char **file, const char **group);
        [ :elm_image_file_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_image_smooth_set(Evas_Object *obj, Eina_Bool smooth);
        [ :elm_image_smooth_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_image_smooth_get(const Evas_Object *obj);
        [ :elm_image_smooth_get, [ :evas_object ], :bool ],
        # EAPI void elm_image_object_size_get(const Evas_Object *obj, int *w, int *h);
        [ :elm_image_object_size_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_image_no_scale_set(Evas_Object *obj, Eina_Bool no_scale);
        [ :elm_image_no_scale_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_image_no_scale_get(const Evas_Object *obj);
        [ :elm_image_no_scale_get, [ :evas_object ], :bool ],
        # EAPI void elm_image_resizable_set(Evas_Object *obj, Eina_Bool size_up, Eina_Bool size_down);
        [ :elm_image_resizable_set, [ :evas_object, :bool, :bool ], :void ],
        # EAPI void elm_image_resizable_get(const Evas_Object *obj, Eina_Bool *size_up, Eina_Bool *size_down);
        [ :elm_image_resizable_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_image_fill_outside_set(Evas_Object *obj, Eina_Bool fill_outside);
        [ :elm_image_fill_outside_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_image_fill_outside_get(const Evas_Object *obj);
        [ :elm_image_fill_outside_get, [ :evas_object ], :bool ],
        # EAPI void elm_image_preload_disabled_set(Evas_Object *obj, Eina_Bool disabled);
        [ :elm_image_preload_disabled_set, [ :evas_object, :bool ], :void ],
        # EAPI void elm_image_prescale_set(Evas_Object *obj, int size);
        [ :elm_image_prescale_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_image_prescale_get(const Evas_Object *obj);
        [ :elm_image_prescale_get, [ :evas_object ], :int ],
        # EAPI void elm_image_orient_set(Evas_Object *obj, Elm_Image_Orient orient);
        [ :elm_image_orient_set, [ :evas_object, :elm_image_orient ], :void ],
        # EAPI Elm_Image_Orient elm_image_orient_get(const Evas_Object *obj);
        [ :elm_image_orient_get, [ :evas_object ], :elm_image_orient ],
        # EAPI void elm_image_editable_set(Evas_Object *obj, Eina_Bool set);
        [ :elm_image_editable_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_image_editable_get(const Evas_Object *obj);
        [ :elm_image_editable_get, [ :evas_object ], :bool ],
        # EAPI Evas_Object *elm_image_object_get(const Evas_Object *obj);
        [ :elm_image_object_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_image_aspect_fixed_set(Evas_Object *obj, Eina_Bool fixed);
        [ :elm_image_aspect_fixed_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_image_aspect_fixed_get(const Evas_Object *obj);
        [ :elm_image_aspect_fixed_get, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_image_animated_available_get(const Evas_Object *obj);
        [ :elm_image_animated_available_get, [ :evas_object ], :bool ],
        # EAPI void elm_image_animated_set(Evas_Object *obj, Eina_Bool animated);
        [ :elm_image_animated_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_image_animated_get(const Evas_Object *obj);
        [ :elm_image_animated_get, [ :evas_object ], :bool ],
        # EAPI void elm_image_animated_play_set(Evas_Object *obj, Eina_Bool play);
        [ :elm_image_animated_play_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_image_animated_play_get(const Evas_Object *obj);
        [ :elm_image_animated_play_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
