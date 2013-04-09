#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmFrame
        #
        FCT_PREFIX = 'elm_frame_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_frame_add(Evas_Object *parent);
        [ :elm_frame_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_frame_autocollapse_set(Evas_Object *obj, Eina_Bool autocollapse);
        [ :elm_frame_autocollapse_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_frame_autocollapse_get(const Evas_Object *obj);
        [ :elm_frame_autocollapse_get, [ :evas_object ], :bool ],
        # EAPI void elm_frame_collapse_set(Evas_Object *obj, Eina_Bool collapse);
        [ :elm_frame_collapse_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_frame_collapse_get(const Evas_Object *obj);
        [ :elm_frame_collapse_get, [ :evas_object ], :bool ],
        # EAPI void elm_frame_collapse_go(Evas_Object *obj, Eina_Bool collapse);
        [ :elm_frame_collapse_go, [ :evas_object, :bool ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
