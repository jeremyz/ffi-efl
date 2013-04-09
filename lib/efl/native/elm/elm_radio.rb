#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmRadio
        #
        FCT_PREFIX = 'elm_radio_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_radio_add(Evas_Object *parent);
        [ :elm_radio_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_radio_group_add(Evas_Object *obj, Evas_Object *group);
        [ :elm_radio_group_add, [ :evas_object, :evas_object ], :void ],
        # EAPI void elm_radio_state_value_set(Evas_Object *obj, int value);
        [ :elm_radio_state_value_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_radio_state_value_get(const Evas_Object *obj);
        [ :elm_radio_state_value_get, [ :evas_object ], :int ],
        # EAPI void elm_radio_value_set(Evas_Object *obj, int value);
        [ :elm_radio_value_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_radio_value_get(const Evas_Object *obj);
        [ :elm_radio_value_get, [ :evas_object ], :int ],
        # EAPI void elm_radio_value_pointer_set(Evas_Object *obj, int *valuep);
        [ :elm_radio_value_pointer_set, [ :evas_object, :pointer ], :void ],
        # EAPI Evas_Object *elm_radio_selected_object_get(Evas_Object *obj);
        [ :elm_radio_selected_object_get, [ :evas_object ], :evas_object ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
