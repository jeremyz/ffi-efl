#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmButton
        #
        FCT_PREFIX = 'elm_button_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_button_add(Evas_Object *parent);
        [ :elm_button_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_button_autorepeat_set(Evas_Object *obj, Eina_Bool on);
        [ :elm_button_autorepeat_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_button_autorepeat_get(const Evas_Object *obj);
        [ :elm_button_autorepeat_get, [ :evas_object ], :bool ],
        # EAPI void elm_button_autorepeat_initial_timeout_set(Evas_Object *obj, double t);
        [ :elm_button_autorepeat_initial_timeout_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_button_autorepeat_initial_timeout_get(const Evas_Object *obj);
        [ :elm_button_autorepeat_initial_timeout_get, [ :evas_object ], :double ],
        # EAPI void elm_button_autorepeat_gap_timeout_set(Evas_Object *obj, double t);
        [ :elm_button_autorepeat_gap_timeout_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_button_autorepeat_gap_timeout_get(const Evas_Object *obj);
        [ :elm_button_autorepeat_gap_timeout_get, [ :evas_object ], :double ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
