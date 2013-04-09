#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmPhoto
        #
        FCT_PREFIX = 'elm_photo_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_photo_add(Evas_Object *parent);
        [ :elm_photo_add, [ :evas_object ], :evas_object ],
        # EAPI Eina_Bool elm_photo_file_set(Evas_Object *obj, const char *file);
        [ :elm_photo_file_set, [ :evas_object, :string ], :bool ],
        # EAPI void elm_photo_thumb_set(const Evas_Object *obj, const char *file, const char *group);
        [ :elm_photo_thumb_set, [ :evas_object, :string, :string ], :void ],
        # EAPI void elm_photo_size_set(Evas_Object *obj, int size);
        [ :elm_photo_size_set, [ :evas_object, :int ], :void ],
        # EAPI void elm_photo_fill_inside_set(Evas_Object *obj, Eina_Bool fill);
        [ :elm_photo_fill_inside_set, [ :evas_object, :bool ], :void ],
        # EAPI void elm_photo_editable_set(Evas_Object *obj, Eina_Bool set);
        [ :elm_photo_editable_set, [ :evas_object, :bool ], :void ],
        # EAPI void elm_photo_aspect_fixed_set(Evas_Object *obj, Eina_Bool fixed);
        [ :elm_photo_aspect_fixed_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_photo_aspect_fixed_get(const Evas_Object *obj);
        [ :elm_photo_aspect_fixed_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
