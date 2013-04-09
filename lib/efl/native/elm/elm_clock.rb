#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmClock
        #
        FCT_PREFIX = 'elm_clock_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Clock_Edit_Mode;
        enum :elm_clock_edit_mode, [ :elm_clock_edit_default, 0, :elm_clock_edit_hour_decimal, 1<<0, :elm_clock_edit_hour_unit, 1<<1,
            :elm_clock_edit_min_decimal, 1<<2, :elm_clock_edit_min_unit, 1<<3, :elm_clock_edit_sec_decimal, 1<<4, :elm_clock_edit_sec_unit, 1<<5,
            :elm_clock_edit_all, (1<<6)-1 ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_clock_add(Evas_Object *parent);
        [ :elm_clock_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_clock_time_set(Evas_Object *obj, int hrs, int min, int sec);
        [ :elm_clock_time_set, [ :evas_object, :int, :int, :int ], :void ],
        # EAPI void elm_clock_time_get(const Evas_Object *obj, int *hrs, int *min, int *sec);
        [ :elm_clock_time_get, [ :evas_object, :pointer, :pointer, :pointer ], :void ],
        # EAPI void elm_clock_edit_set(Evas_Object *obj, Eina_Bool edit);
        [ :elm_clock_edit_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_clock_edit_get(const Evas_Object *obj);
        [ :elm_clock_edit_get, [ :evas_object ], :bool ],
        # EAPI void elm_clock_edit_mode_set(Evas_Object *obj, Elm_Clock_Edit_Mode digedit);
        [ :elm_clock_edit_mode_set, [ :evas_object, :elm_clock_edit_mode ], :void ],
        # EAPI Elm_Clock_Edit_Mode elm_clock_edit_mode_get(const Evas_Object *obj);
        [ :elm_clock_edit_mode_get, [ :evas_object ], :elm_clock_edit_mode ],
        # EAPI void elm_clock_show_am_pm_set(Evas_Object *obj, Eina_Bool am_pm);
        [ :elm_clock_show_am_pm_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_clock_show_am_pm_get(const Evas_Object *obj);
        [ :elm_clock_show_am_pm_get, [ :evas_object ], :bool ],
        # EAPI void elm_clock_show_seconds_set(Evas_Object *obj, Eina_Bool seconds);
        [ :elm_clock_show_seconds_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_clock_show_seconds_get(const Evas_Object *obj);
        [ :elm_clock_show_seconds_get, [ :evas_object ], :bool ],
        # EAPI void elm_clock_first_interval_set(Evas_Object *obj, double interval);
        [ :elm_clock_first_interval_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_clock_first_interval_get(const Evas_Object *obj);
        [ :elm_clock_first_interval_get, [ :evas_object ], :double ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
