#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmBg
        #
        FCT_PREFIX = 'elm_bg_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Bg_Option;
        enum :elm_bg_option, [ :elm_bg_option_center, :elm_bg_option_scale, :elm_bg_option_stretch, :elm_bg_option_tile, :elm_bg_option_last ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_bg_add(Evas_Object *parent);
        [ :elm_bg_add, [ :evas_object ], :evas_object ],
        # EAPI Eina_Bool elm_bg_file_set(Evas_Object *obj, const char *file, const char *group);
        [ :elm_bg_file_set, [ :evas_object, :string, :string ], :bool ],
        # EAPI void elm_bg_file_get(const Evas_Object *obj, const char **file, const char **group);
        [ :elm_bg_file_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_bg_option_set(Evas_Object *obj, Elm_Bg_Option option);
        [ :elm_bg_option_set, [ :evas_object, :elm_bg_option ], :void ],
        # EAPI Elm_Bg_Option elm_bg_option_get(const Evas_Object *obj);
        [ :elm_bg_option_get, [ :evas_object ], :elm_bg_option ],
        # EAPI void elm_bg_color_set(Evas_Object *obj, int r, int g, int b);
        [ :elm_bg_color_set, [ :evas_object, :int, :int, :int ], :void ],
        # EAPI void elm_bg_color_get(const Evas_Object *obj, int *r, int *g, int *b);
        [ :elm_bg_color_get, [ :evas_object, :pointer, :pointer, :pointer ], :void ],
        # EAPI void elm_bg_load_size_set(Evas_Object *obj, Evas_Coord w, Evas_Coord h);
        [ :elm_bg_load_size_set, [ :evas_object, :int, :int ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
