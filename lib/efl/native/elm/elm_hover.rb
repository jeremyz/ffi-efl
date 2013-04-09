#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmHover
        #
        FCT_PREFIX = 'elm_hover_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Hover_Axis;
        enum :elm_hover_axis, [ :elm_hover_axis_none, :elm_hover_axis_horizontal, :elm_hover_axis_vertical, :elm_hover_axis_both ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_hover_add(Evas_Object *parent);
        [ :elm_hover_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_hover_target_set(Evas_Object *obj, Evas_Object *target);
        [ :elm_hover_target_set, [ :evas_object, :evas_object ], :void ],
        # EAPI Evas_Object *elm_hover_target_get(const Evas_Object *obj);
        [ :elm_hover_target_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_hover_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_hover_parent_set, [ :evas_object, :evas_object ], :void ],
        # EAPI Evas_Object *elm_hover_parent_get(const Evas_Object *obj);
        [ :elm_hover_parent_get, [ :evas_object ], :evas_object ],
        # EAPI const char *elm_hover_best_content_location_get(const Evas_Object *obj, Elm_Hover_Axis pref_axis);
        [ :elm_hover_best_content_location_get, [ :evas_object, :elm_hover_axis ], :string ],
        # EAPI void elm_hover_dismiss(Evas_Object *obj);
        [ :elm_hover_dismiss, [ :evas_object ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
