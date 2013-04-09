#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmDaySelector
        #
        FCT_PREFIX = 'elm_dayselector_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Dayselector_Day;
        enum :elm_dayselector_day, [ :elm_dayselector_sun, 0, :elm_dayselector_mon, 1, :elm_dayselector_tue, 2, :elm_dayselector_wed, 3,
            :elm_dayselector_thu, 4, :elm_dayselector_fri, 5, :elm_dayselector_sat, 6, :elm_dayselector_max, 7 ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_dayselector_add(Evas_Object *parent);
        [ :elm_dayselector_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_dayselector_day_selected_set(Evas_Object *obj, Elm_Dayselector_Day day, Eina_Bool selected);
        [ :elm_dayselector_day_selected_set, [ :evas_object, :elm_dayselector_day, :bool ], :void ],
        # EAPI Eina_Bool elm_dayselector_day_selected_get(const Evas_Object *obj, Elm_Dayselector_Day day);
        [ :elm_dayselector_day_selected_get, [ :evas_object, :elm_dayselector_day ], :bool ],
        # EAPI void elm_dayselector_week_start_set(Evas_Object *obj, Elm_Dayselector_Day day);
        [ :elm_dayselector_week_start_set, [ :evas_object, :elm_dayselector_day ], :void ],
        # EAPI Elm_Dayselector_Day elm_dayselector_week_start_get(const Evas_Object *obj);
        [ :elm_dayselector_week_start_get, [ :evas_object ], :elm_dayselector_day ],
        # EAPI void elm_dayselector_weekend_start_set(Evas_Object *obj, Elm_Dayselector_Day day);
        [ :elm_dayselector_weekend_start_set, [ :evas_object, :elm_dayselector_day ], :void ],
        # EAPI Elm_Dayselector_Day elm_dayselector_weekend_start_get(const Evas_Object *obj);
        [ :elm_dayselector_weekend_start_get, [ :evas_object ], :elm_dayselector_day ],
        # EAPI void elm_dayselector_weekend_length_set(Evas_Object *obj, unsigned int length);
        [ :elm_dayselector_weekend_length_set, [ :evas_object, :uint ], :void ],
        # EAPI unsigned int elm_dayselector_weekend_length_get(const Evas_Object *obj);
        [ :elm_dayselector_weekend_length_get, [ :evas_object ], :uint ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
