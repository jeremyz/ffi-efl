#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmPhotoCam
        #
        FCT_PREFIX = 'elm_photocam_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Photocam_Zoom_Mode;
        enum :elm_photocam_zoom_mode, [ :elm_photocam_zoom_mode_manual, 0, :elm_photocam_zoom_mode_auto_fit, 1, :elm_photocam_zoom_mode_auto_fill, 2,
            :elm_photocam_zoom_mode_auto_fit_in, 3, :elm_photocam_zoom_mode_last, 4 ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_photocam_add(Evas_Object *parent);
        [ :elm_photocam_add, [ :evas_object ], :evas_object ],
        # EAPI Evas_Load_Error elm_photocam_file_set(Evas_Object *obj, const char *file);
        [ :elm_photocam_file_set, [ :evas_object, :string ], :evas_load_error ],
        # EAPI const char *elm_photocam_file_get(const Evas_Object *obj);
        [ :elm_photocam_file_get, [ :evas_object ], :string ],
        # EAPI void elm_photocam_zoom_set(Evas_Object *obj, double zoom);
        [ :elm_photocam_zoom_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_photocam_zoom_get(const Evas_Object *obj);
        [ :elm_photocam_zoom_get, [ :evas_object ], :double ],
        # EAPI void elm_photocam_zoom_mode_set(Evas_Object *obj, Elm_Photocam_Zoom_Mode mode);
        [ :elm_photocam_zoom_mode_set, [ :evas_object, :elm_photocam_zoom_mode ], :void ],
        # EAPI Elm_Photocam_Zoom_Mode elm_photocam_zoom_mode_get(const Evas_Object *obj);
        [ :elm_photocam_zoom_mode_get, [ :evas_object ], :elm_photocam_zoom_mode ],
        # EAPI void elm_photocam_image_size_get(const Evas_Object *obj, int *w, int *h);
        [ :elm_photocam_image_size_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_photocam_image_region_get(const Evas_Object *obj, int *x, int *y, int *w, int *h);
        [ :elm_photocam_image_region_get, [ :evas_object, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void elm_photocam_image_region_show(Evas_Object *obj, int x, int y, int w, int h);
        [ :elm_photocam_image_region_show, [ :evas_object, :int, :int, :int, :int ], :void ],
        # EAPI void elm_photocam_image_region_bring_in(Evas_Object *obj, int x, int y, int w, int h);
        [ :elm_photocam_image_region_bring_in, [ :evas_object, :int, :int, :int, :int ], :void ],
        # EAPI void elm_photocam_paused_set(Evas_Object *obj, Eina_Bool paused);
        [ :elm_photocam_paused_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_photocam_paused_get(const Evas_Object *obj);
        [ :elm_photocam_paused_get, [ :evas_object ], :bool ],
        # EAPI Evas_Object *elm_photocam_internal_image_get(const Evas_Object *obj);
        [ :elm_photocam_internal_image_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_photocam_gesture_enabled_set(Evas_Object *obj, Eina_Bool gesture);
        [ :elm_photocam_gesture_enabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_photocam_gesture_enabled_get(const Evas_Object *obj);
        [ :elm_photocam_gesture_enabled_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
