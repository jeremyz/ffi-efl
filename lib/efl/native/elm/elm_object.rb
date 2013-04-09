#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/edje'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmObject
        #
        FCT_PREFIX = 'elm_object_' unless const_defined? :FCT_PREFIX
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
        # EAPI void elm_object_part_text_set(Evas_Object *obj, const char *part, const char *text);
        [ :elm_object_part_text_set, [ :evas_object, :string, :string ], :void ],
        # EAPI const char *elm_object_part_text_get(const Evas_Object *obj, const char *part);
        [ :elm_object_part_text_get, [ :evas_object, :string ], :string ],
        # EAPI void elm_object_part_content_set(Evas_Object *obj, const char *part, Evas_Object *content);
        [ :elm_object_part_content_set, [ :evas_object, :string, :evas_object ], :void ],
        # EAPI Evas_Object *elm_object_part_content_get(const Evas_Object *obj, const char *part);
        [ :elm_object_part_content_get, [ :evas_object, :string ], :evas_object ],
        # EAPI Evas_Object *elm_object_part_content_unset(Evas_Object *obj, const char *part);
        [ :elm_object_part_content_unset, [ :evas_object, :string ], :evas_object ],
        # EAPI void elm_object_access_info_set(Evas_Object *obj, const char *txt);
        [ :elm_object_access_info_set, [ :evas_object, :string ], :void ],
        # EAPI Evas_Object *elm_object_name_find(const Evas_Object *obj, const char *name, int recurse);
        [ :elm_object_name_find, [ :evas_object, :string, :int ], :evas_object ],
        # EAPI Eina_Bool elm_object_style_set(Evas_Object *obj, const char *style);
        [ :elm_object_style_set, [ :evas_object, :string ], :bool ],
        # EAPI const char *elm_object_style_get(const Evas_Object *obj);
        [ :elm_object_style_get, [ :evas_object ], :string ],
        # EAPI void elm_object_disabled_set(Evas_Object *obj, Eina_Bool disabled);
        [ :elm_object_disabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_object_disabled_get(const Evas_Object *obj);
        [ :elm_object_disabled_get, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_object_widget_check(const Evas_Object *obj);
        [ :elm_object_widget_check, [ :evas_object ], :bool ],
        # EAPI Evas_Object *elm_object_parent_widget_get(const Evas_Object *obj);
        [ :elm_object_parent_widget_get, [ :evas_object ], :evas_object ],
        # EAPI Evas_Object *elm_object_top_widget_get(const Evas_Object *obj);
        [ :elm_object_top_widget_get, [ :evas_object ], :evas_object ],
        # EAPI const char *elm_object_widget_type_get(const Evas_Object *obj);
        [ :elm_object_widget_type_get, [ :evas_object ], :string ],
        # EAPI void elm_object_signal_emit(Evas_Object *obj, const char *emission, const char *source);
        [ :elm_object_signal_emit, [ :evas_object, :string, :string ], :void ],
        # EAPI void elm_object_signal_callback_add(Evas_Object *obj, const char *emission, const char *source, Edje_Signal_Cb func, void *data);
        [ :elm_object_signal_callback_add, [ :evas_object, :string, :string, :edje_signal_cb, :pointer ], :void ],
        # EAPI void *elm_object_signal_callback_del(Evas_Object *obj, const char *emission, const char *source, Edje_Signal_Cb func);
        [ :elm_object_signal_callback_del, [ :evas_object, :string, :string, :edje_signal_cb ], :pointer ],
        # EAPI void elm_object_event_callback_add(Evas_Object *obj, Elm_Event_Cb func, const void *data);
        [ :elm_object_event_callback_add, [ :evas_object, :elm_event_cb, :pointer ], :void ],
        # EAPI void *elm_object_event_callback_del(Evas_Object *obj, Elm_Event_Cb func, const void *data);
        [ :elm_object_event_callback_del, [ :evas_object, :elm_event_cb, :pointer ], :pointer ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
