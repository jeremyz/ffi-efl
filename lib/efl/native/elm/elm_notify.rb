#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmNotify
        #
        FCT_PREFIX = 'elm_notify_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Notify_Orient;
        enum :elm_notify_orient, [ :elm_notify_orient_top, :elm_notify_orient_center, :elm_notify_orient_bottom, :elm_notify_orient_left,
            :elm_notify_orient_right, :elm_notify_orient_top_left, :elm_notify_orient_top_right, :elm_notify_orient_bottom_left, :elm_notify_orient_bottom_right,
            :elm_notify_orient_last ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_notify_add(Evas_Object *parent);
        [ :elm_notify_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_notify_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_notify_parent_set, [ :evas_object, :evas_object ], :void ],
        # EAPI Evas_Object *elm_notify_parent_get(const Evas_Object *obj);
        [ :elm_notify_parent_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_notify_orient_set(Evas_Object *obj, Elm_Notify_Orient orient);
        [ :elm_notify_orient_set, [ :evas_object, :elm_notify_orient ], :void ],
        # EAPI Elm_Notify_Orient elm_notify_orient_get(const Evas_Object *obj);
        [ :elm_notify_orient_get, [ :evas_object ], :elm_notify_orient ],
        # EAPI void elm_notify_timeout_set(Evas_Object *obj, double timeout);
        [ :elm_notify_timeout_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_notify_timeout_get(const Evas_Object *obj);
        [ :elm_notify_timeout_get, [ :evas_object ], :double ],
        # EAPI void elm_notify_allow_events_set(Evas_Object *obj, Eina_Bool allow);
        [ :elm_notify_allow_events_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_notify_allow_events_get(const Evas_Object *obj);
        [ :elm_notify_allow_events_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
