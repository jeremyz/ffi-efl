#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmDatetime
        #
        FCT_PREFIX = 'elm_datetime_' unless const_defined? :FCT_PREFIX
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
        # typedef enum _Elm_Datetime_Field_Type {...} Elm_Datetime_Field_Type;
        enum :elm_datetime_field_type, [ :elm_datetime_year, 0, :elm_datetime_month, 1, :elm_datetime_date, 2, :elm_datetime_hour, 3,
            :elm_datetime_minute, 4, :elm_datetime_ampm, 5 ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_datetime_add(Evas_Object *parent);
        [ :elm_datetime_add, [ :evas_object ], :evas_object ],
        # EAPI const char *elm_datetime_format_get(const Evas_Object *obj);
        [ :elm_datetime_format_get, [ :evas_object ], :string ],
        # EAPI void elm_datetime_format_set(Evas_Object *obj, const char *fmt);
        [ :elm_datetime_format_set, [ :evas_object, :string ], :void ],
        # EAPI Eina_Bool elm_datetime_value_max_get(const Evas_Object *obj, struct tm *maxtime);
        [ :elm_datetime_value_max_get, [ :evas_object, :pointer ], :bool ],
        # EAPI Eina_Bool elm_datetime_value_max_set(Evas_Object *obj, const struct tm *maxtime);
        [ :elm_datetime_value_max_set, [ :evas_object, :pointer ], :bool ],
        # EAPI Eina_Bool elm_datetime_value_min_get(const Evas_Object *obj, struct tm *mintime);
        [ :elm_datetime_value_min_get, [ :evas_object, :pointer ], :bool ],
        # EAPI Eina_Bool elm_datetime_value_min_set(Evas_Object *obj, const struct tm *mintime);
        [ :elm_datetime_value_min_set, [ :evas_object, :pointer ], :bool ],
        # EAPI void elm_datetime_field_limit_get(const Evas_Object *obj, Elm_Datetime_Field_Type fieldtype, int *min, int *max);
        [ :elm_datetime_field_limit_get, [ :evas_object, :elm_datetime_field_type, :pointer, :pointer ], :void ],
        # EAPI void elm_datetime_field_limit_set(Evas_Object *obj, Elm_Datetime_Field_Type fieldtype, int min, int max);
        [ :elm_datetime_field_limit_set, [ :evas_object, :elm_datetime_field_type, :int, :int ], :void ],
        # EAPI Eina_Bool elm_datetime_value_get(const Evas_Object *obj, struct tm *currtime);
        [ :elm_datetime_value_get, [ :evas_object, :pointer ], :bool ],
        # EAPI Eina_Bool elm_datetime_value_set(Evas_Object *obj, const struct tm *newtime);
        [ :elm_datetime_value_set, [ :evas_object, :pointer ], :bool ],
        # EAPI Eina_Bool elm_datetime_field_visible_get(const Evas_Object *obj, Elm_Datetime_Field_Type fieldtype);
        [ :elm_datetime_field_visible_get, [ :evas_object, :elm_datetime_field_type ], :bool ],
        # EAPI void elm_datetime_field_visible_set(Evas_Object *obj, Elm_Datetime_Field_Type fieldtype, Eina_Bool visible);
        [ :elm_datetime_field_visible_set, [ :evas_object, :elm_datetime_field_type, :bool ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
