#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
require 'efl/native/elm/elm_entry'
#
module Efl
    #
    module ElmLabel
        #
        FCT_PREFIX = 'elm_label_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_label_add(Evas_Object *parent);
        [ :elm_label_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_label_line_wrap_set(Evas_Object *obj, Elm_Wrap_Type wrap);
        [ :elm_label_line_wrap_set, [ :evas_object, :elm_wrap_type ], :void ],
        # EAPI Elm_Wrap_Type elm_label_line_wrap_get(const Evas_Object *obj);
        [ :elm_label_line_wrap_get, [ :evas_object ], :elm_wrap_type ],
        # EAPI void elm_label_wrap_width_set(Evas_Object *obj, Evas_Coord w);
        [ :elm_label_wrap_width_set, [ :evas_object, :int ], :void ],
        # EAPI Evas_Coord elm_label_wrap_width_get(const Evas_Object *obj);
        [ :elm_label_wrap_width_get, [ :evas_object ], :int ],
        # EAPI void elm_label_ellipsis_set(Evas_Object *obj, Eina_Bool ellipsis);
        [ :elm_label_ellipsis_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_label_ellipsis_get(const Evas_Object *obj);
        [ :elm_label_ellipsis_get, [ :evas_object ], :bool ],
        # EAPI void elm_label_slide_set(Evas_Object *obj, Eina_Bool slide);
        [ :elm_label_slide_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_label_slide_get(const Evas_Object *obj);
        [ :elm_label_slide_get, [ :evas_object ], :bool ],
        # EAPI void elm_label_slide_duration_set(Evas_Object *obj, double duration);
        [ :elm_label_slide_duration_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_label_slide_duration_get(const Evas_Object *obj);
        [ :elm_label_slide_duration_get, [ :evas_object ], :double ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
