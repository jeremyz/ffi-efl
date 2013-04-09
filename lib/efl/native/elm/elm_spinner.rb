#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmSpinner
        #
        FCT_PREFIX = 'elm_spinner_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_spinner_add(Evas_Object *parent);
        [ :elm_spinner_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_spinner_label_format_set(Evas_Object *obj, const char *fmt);
        [ :elm_spinner_label_format_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_spinner_label_format_get(const Evas_Object *obj);
        [ :elm_spinner_label_format_get, [ :evas_object ], :string ],
        # EAPI void elm_spinner_min_max_set(Evas_Object *obj, double min, double max);
        [ :elm_spinner_min_max_set, [ :evas_object, :double, :double ], :void ],
        # EAPI void elm_spinner_min_max_get(const Evas_Object *obj, double *min, double *max);
        [ :elm_spinner_min_max_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_spinner_step_set(Evas_Object *obj, double step);
        [ :elm_spinner_step_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_spinner_step_get(const Evas_Object *obj);
        [ :elm_spinner_step_get, [ :evas_object ], :double ],
        # EAPI void elm_spinner_value_set(Evas_Object *obj, double val);
        [ :elm_spinner_value_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_spinner_value_get(const Evas_Object *obj);
        [ :elm_spinner_value_get, [ :evas_object ], :double ],
        # EAPI void elm_spinner_wrap_set(Evas_Object *obj, Eina_Bool wrap);
        [ :elm_spinner_wrap_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_spinner_wrap_get(const Evas_Object *obj);
        [ :elm_spinner_wrap_get, [ :evas_object ], :bool ],
        # EAPI void elm_spinner_editable_set(Evas_Object *obj, Eina_Bool editable);
        [ :elm_spinner_editable_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_spinner_editable_get(const Evas_Object *obj);
        [ :elm_spinner_editable_get, [ :evas_object ], :bool ],
        # EAPI void elm_spinner_special_value_add(Evas_Object *obj, double value, const char *label);
        [ :elm_spinner_special_value_add, [ :evas_object, :double, :string ], :void ],
        # EAPI void elm_spinner_interval_set(Evas_Object *obj, double interval);
        [ :elm_spinner_interval_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_spinner_interval_get(const Evas_Object *obj);
        [ :elm_spinner_interval_get, [ :evas_object ], :double ],
        # EAPI void elm_spinner_base_set(Evas_Object *obj, double base);
        [ :elm_spinner_base_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_spinner_base_get(const Evas_Object *obj);
        [ :elm_spinner_base_get, [ :evas_object ], :double ],
        # EAPI void elm_spinner_round_set(Evas_Object *obj, int rnd);
        [ :elm_spinner_round_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_spinner_round_get(const Evas_Object *obj);
        [ :elm_spinner_round_get, [ :evas_object ], :int ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
