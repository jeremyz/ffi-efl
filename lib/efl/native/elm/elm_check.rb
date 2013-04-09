#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmCheck
        #
        FCT_PREFIX = 'elm_check_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object * elm_check_add(Evas_Object *parent);
        [ :elm_check_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_check_state_set(Evas_Object *obj, Eina_Bool state);
        [ :elm_check_state_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_check_state_get(const Evas_Object *obj);
        [ :elm_check_state_get, [ :evas_object ], :bool ],
        # EAPI void elm_check_state_pointer_set(Evas_Object *obj, Eina_Bool *statep);
        [ :elm_check_state_pointer_set, [ :evas_object, :pointer ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
