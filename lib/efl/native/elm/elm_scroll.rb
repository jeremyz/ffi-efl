#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmScroll
        #
        FCT_PREFIX = 'elm_scroll_' unless const_defined? :FCT_PREFIX
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
        # EAPI void elm_object_scroll_hold_push(Evas_Object *obj);
        [ :elm_object_scroll_hold_push, [ :evas_object ], :void ],
        # EAPI void elm_object_scroll_hold_pop(Evas_Object *obj);
        [ :elm_object_scroll_hold_pop, [ :evas_object ], :void ],
        # EAPI int elm_object_scroll_hold_get(const Evas_Object *obj);
        [ :elm_object_scroll_hold_get, [ :evas_object ], :int ],
        # EAPI void elm_object_scroll_freeze_push(Evas_Object *obj);
        [ :elm_object_scroll_freeze_push, [ :evas_object ], :void ],
        # EAPI void elm_object_scroll_freeze_pop(Evas_Object *obj);
        [ :elm_object_scroll_freeze_pop, [ :evas_object ], :void ],
        # EAPI int elm_object_scroll_freeze_get(const Evas_Object *obj);
        [ :elm_object_scroll_freeze_get, [ :evas_object ], :int ],
        # EAPI void elm_object_scroll_lock_x_set(Evas_Object *obj, Eina_Bool lock);
        [ :elm_object_scroll_lock_x_set, [ :evas_object, :bool ], :void ],
        # EAPI void elm_object_scroll_lock_y_set(Evas_Object *obj, Eina_Bool lock);
        [ :elm_object_scroll_lock_y_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_object_scroll_lock_x_get(const Evas_Object *obj);
        [ :elm_object_scroll_lock_x_get, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_object_scroll_lock_y_get(const Evas_Object *obj);
        [ :elm_object_scroll_lock_y_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
