#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmSeparator
        #
        FCT_PREFIX = 'elm_separator_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_separator_add(Evas_Object *parent);
        [ :elm_separator_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_separator_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_separator_horizontal_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_separator_horizontal_get(const Evas_Object *obj);
        [ :elm_separator_horizontal_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
