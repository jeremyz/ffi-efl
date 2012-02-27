#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmCalendar
        #
        FCT_PREFIX = 'elm_calendar_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'elementary-ver-pre-svn-09.so.0'
        #
        # ENUMS
        # typedef enum {...} Elm_Calendar_Mark_Repeat;
        enum :elm_calendar_mark_repeat, [ :elm_calendar_unique, :elm_calendar_daily, :elm_calendar_weekly, :elm_calendar_monthly,
            :elm_calendar_annually ]
        #
        # TYPEDEFS
        # typedef struct _Elm_Calendar_Mark Elm_Calendar_Mark;
        typedef :pointer, :elm_calendar_mark
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_calendar_add(Evas_Object *parent);
        [ :elm_calendar_add, [ :evas_object ], :evas_object ],
        # EAPI const char **elm_calendar_weekdays_names_get(const Evas_Object *obj);
        [ :elm_calendar_weekdays_names_get, [ :evas_object ], :pointer ],
        # EAPI void elm_calendar_weekdays_names_set(Evas_Object *obj, const char *weekdays[]);
        # FIXME
        # EAPI void elm_calendar_min_max_year_set(Evas_Object *obj, int min, int max);
        [ :elm_calendar_min_max_year_set, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_calendar_min_max_year_get(const Evas_Object *obj, int *min, int *max);
        [ :elm_calendar_min_max_year_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_calendar_day_selection_enabled_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_calendar_day_selection_enabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_calendar_day_selection_enabled_get(const Evas_Object *obj);
        [ :elm_calendar_day_selection_enabled_get, [ :evas_object ], :bool ],
        # EAPI void elm_calendar_selected_time_set(Evas_Object *obj, struct tm *selected_time);
        [ :elm_calendar_selected_time_set, [ :evas_object, :pointer ], :void ],
        # EAPI Eina_Bool elm_calendar_selected_time_get(const Evas_Object *obj, struct tm *selected_time);
        [ :elm_calendar_selected_time_get, [ :evas_object, :pointer ], :bool ],
        # EAPI void elm_calendar_format_function_set(Evas_Object *obj, char *(*format_function)(struct tm *stime));
        # FIXME
        # EAPI Elm_Calendar_Mark *elm_calendar_mark_add(Evas_Object *obj, const char *mark_type, struct tm *mark_time, Elm_Calendar_Mark_Repeat repeat);
        [ :elm_calendar_mark_add, [ :evas_object, :string, :pointer, :elm_calendar_mark_repeat ], :elm_calendar_mark ],
        # EAPI void elm_calendar_mark_del(Elm_Calendar_Mark *mark);
        [ :elm_calendar_mark_del, [ :elm_calendar_mark ], :void ],
        # EAPI void elm_calendar_marks_clear(Evas_Object *obj);
        [ :elm_calendar_marks_clear, [ :evas_object ], :void ],
        # EAPI const Eina_List *elm_calendar_marks_get(const Evas_Object *obj);
        [ :elm_calendar_marks_get, [ :evas_object ], :eina_list ],
        # EAPI void elm_calendar_marks_draw(Evas_Object *obj);
        [ :elm_calendar_marks_draw, [ :evas_object ], :void ],
        # EAPI void elm_calendar_interval_set(Evas_Object *obj, double interval);
        [ :elm_calendar_interval_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_calendar_interval_get(const Evas_Object *obj);
        [ :elm_calendar_interval_get, [ :evas_object ], :double ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
