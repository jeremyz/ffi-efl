#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmSlider
        #
        FCT_PREFIX = 'elm_slider_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_slider_add(Evas_Object *parent);
        [ :elm_slider_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_slider_span_size_set(Evas_Object *obj, Evas_Coord size);
        [ :elm_slider_span_size_set, [ :evas_object, :int ], :void ],
        # EAPI Evas_Coord elm_slider_span_size_get(const Evas_Object *obj);
        [ :elm_slider_span_size_get, [ :evas_object ], :int ],
        # EAPI void elm_slider_unit_format_set(Evas_Object *obj, const char *format);
        [ :elm_slider_unit_format_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_slider_unit_format_get(const Evas_Object *obj);
        [ :elm_slider_unit_format_get, [ :evas_object ], :string ],
        # EAPI void elm_slider_indicator_format_set(Evas_Object *obj, const char *indicator);
        [ :elm_slider_indicator_format_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_slider_indicator_format_get(const Evas_Object *obj);
        [ :elm_slider_indicator_format_get, [ :evas_object ], :string ],
        # EAPI void elm_slider_indicator_format_function_set(Evas_Object *obj, char *(*func)(double val), void (*free_func)(char *str));
        [ :elm_slider_indicator_format_function_set, [ :evas_object, ( callback [:double], :string ), (callback [:string], :void) ], :void ],
        # EAPI void elm_slider_units_format_function_set(Evas_Object *obj, char *(*func)(double val), void (*free_func)(char *str));
        [ :elm_slider_units_format_function_set, [ :evas_object, (callback [:double], :string), (callback [:string], :void) ], :void ],
        # EAPI void elm_slider_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_slider_horizontal_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_slider_horizontal_get(const Evas_Object *obj);
        [ :elm_slider_horizontal_get, [ :evas_object ], :bool ],
        # EAPI void elm_slider_min_max_set(Evas_Object *obj, double min, double max);
        [ :elm_slider_min_max_set, [ :evas_object, :double, :double ], :void ],
        # EAPI void elm_slider_min_max_get(const Evas_Object *obj, double *min, double *max);
        [ :elm_slider_min_max_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_slider_value_set(Evas_Object *obj, double val);
        [ :elm_slider_value_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_slider_value_get(const Evas_Object *obj);
        [ :elm_slider_value_get, [ :evas_object ], :double ],
        # EAPI void elm_slider_inverted_set(Evas_Object *obj, Eina_Bool inverted);
        [ :elm_slider_inverted_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_slider_inverted_get(const Evas_Object *obj);
        [ :elm_slider_inverted_get, [ :evas_object ], :bool ],
        # EAPI void elm_slider_indicator_show_set(Evas_Object *obj, Eina_Bool show);
        [ :elm_slider_indicator_show_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_slider_indicator_show_get(const Evas_Object *obj);
        [ :elm_slider_indicator_show_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
