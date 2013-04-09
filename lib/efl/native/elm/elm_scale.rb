#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmScale
        #
        FCT_PREFIX = 'elm_scale_' unless const_defined? :FCT_PREFIX
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
        # EAPI void elm_object_scale_set(Evas_Object *obj, double scale);
        [ :elm_object_scale_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_object_scale_get(const Evas_Object *obj);
        [ :elm_object_scale_get, [ :evas_object ], :double ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
