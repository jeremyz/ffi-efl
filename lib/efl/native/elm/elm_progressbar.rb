#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmProgressBar
        #
        FCT_PREFIX = 'elm_progressbar_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_progressbar_add(Evas_Object *parent);
        [ :elm_progressbar_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_progressbar_pulse_set(Evas_Object *obj, Eina_Bool pulse);
        [ :elm_progressbar_pulse_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_progressbar_pulse_get(const Evas_Object *obj);
        [ :elm_progressbar_pulse_get, [ :evas_object ], :bool ],
        # EAPI void elm_progressbar_pulse(Evas_Object *obj, Eina_Bool state);
        [ :elm_progressbar_pulse, [ :evas_object, :bool ], :void ],
        # EAPI void elm_progressbar_value_set(Evas_Object *obj, double val);
        [ :elm_progressbar_value_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_progressbar_value_get(const Evas_Object *obj);
        [ :elm_progressbar_value_get, [ :evas_object ], :double ],
        # EAPI void elm_progressbar_span_size_set(Evas_Object *obj, Evas_Coord size);
        [ :elm_progressbar_span_size_set, [ :evas_object, :int ], :void ],
        # EAPI Evas_Coord elm_progressbar_span_size_get(const Evas_Object *obj);
        [ :elm_progressbar_span_size_get, [ :evas_object ], :int ],
        # EAPI void elm_progressbar_unit_format_set(Evas_Object *obj, const char *format);
        [ :elm_progressbar_unit_format_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_progressbar_unit_format_get(const Evas_Object *obj);
        [ :elm_progressbar_unit_format_get, [ :evas_object ], :string ],
        # EAPI void elm_progressbar_unit_format_function_set(Evas_Object *obj, char *(func)(double), void (*free_func) (char *));
        [ :elm_progressbar_unit_format_function_set, [ :evas_object, ( callback [:double], :string ), (callback [:string], :void) ], :void ],
        # EAPI void elm_progressbar_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_progressbar_horizontal_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_progressbar_horizontal_get(const Evas_Object *obj);
        [ :elm_progressbar_horizontal_get, [ :evas_object ], :bool ],
        # EAPI void elm_progressbar_inverted_set(Evas_Object *obj, Eina_Bool inverted);
        [ :elm_progressbar_inverted_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_progressbar_inverted_get(const Evas_Object *obj);
        [ :elm_progressbar_inverted_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
