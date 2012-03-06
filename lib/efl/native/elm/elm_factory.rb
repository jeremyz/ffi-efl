#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmFactory
        #
        FCT_PREFIX = 'elm_factory_' unless const_defined? :FCT_PREFIX
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
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_factory_add(Evas_Object *parent);
        [ :elm_factory_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_factory_maxmin_mode_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_factory_maxmin_mode_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_factory_maxmin_mode_get(const Evas_Object *obj);
        [ :elm_factory_maxmin_mode_get, [ :evas_object ], :bool ],
        # EAPI void elm_factory_maxmin_reset_set(Evas_Object *obj);
        [ :elm_factory_maxmin_reset_set, [ :evas_object ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
