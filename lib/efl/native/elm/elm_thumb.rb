#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmThumb
        #
        FCT_PREFIX = 'elm_thumb_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Thumb_Animation_Setting;
        enum :elm_thumb_animation_setting, [ :elm_thumb_animation_start, 0, :elm_thumb_animation_loop, 1, :elm_thumb_animation_stop, 2,
            :elm_thumb_animation_last, 3 ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_thumb_add(Evas_Object *parent);
        [ :elm_thumb_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_thumb_reload(Evas_Object *obj);
        [ :elm_thumb_reload, [ :evas_object ], :void ],
        # EAPI void elm_thumb_file_set(Evas_Object *obj, const char *file, const char *key);
        [ :elm_thumb_file_set, [ :evas_object, :string, :string ], :void ],
        # EAPI void elm_thumb_file_get(const Evas_Object *obj, const char **file, const char **key);
        [ :elm_thumb_file_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_thumb_path_get(const Evas_Object *obj, const char **file, const char **key);
        [ :elm_thumb_path_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_thumb_animate_set(Evas_Object *obj, Elm_Thumb_Animation_Setting s);
        [ :elm_thumb_animate_set, [ :evas_object, :elm_thumb_animation_setting ], :void ],
        # EAPI Elm_Thumb_Animation_Setting elm_thumb_animate_get(const Evas_Object *obj);
        [ :elm_thumb_animate_get, [ :evas_object ], :elm_thumb_animation_setting ],
        # EAPI void *elm_thumb_ethumb_client_get(void);
        [ :elm_thumb_ethumb_client_get, [  ], :pointer ],
        # EAPI Eina_Bool elm_thumb_ethumb_client_connected_get(void);
        [ :elm_thumb_ethumb_client_connected_get, [  ], :bool ],
        # EAPI Eina_Bool elm_thumb_editable_set(Evas_Object *obj, Eina_Bool edit);
        [ :elm_thumb_editable_set, [ :evas_object, :bool ], :bool ],
        # EAPI Eina_Bool elm_thumb_editable_get(const Evas_Object *obj);
        [ :elm_thumb_editable_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
