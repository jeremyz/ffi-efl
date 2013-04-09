#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmMirroring
        #
        FCT_PREFIX = 'elm_mirroring_' unless const_defined? :FCT_PREFIX
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
        # EAPI Eina_Bool elm_object_mirrored_get(const Evas_Object *obj);
        [ :elm_object_mirrored_get, [ :evas_object ], :bool ],
        # EAPI void elm_object_mirrored_set(Evas_Object *obj, Eina_Bool mirrored);
        [ :elm_object_mirrored_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_object_mirrored_automatic_get(const Evas_Object *obj);
        [ :elm_object_mirrored_automatic_get, [ :evas_object ], :bool ],
        # EAPI void elm_object_mirrored_automatic_set(Evas_Object *obj, Eina_Bool automatic);
        [ :elm_object_mirrored_automatic_set, [ :evas_object, :bool ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
