#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmMapBuf
        #
        FCT_PREFIX = 'elm_mapbuf_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_mapbuf_add(Evas_Object *parent);
        [ :elm_mapbuf_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_mapbuf_enabled_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_mapbuf_enabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_mapbuf_enabled_get(const Evas_Object *obj);
        [ :elm_mapbuf_enabled_get, [ :evas_object ], :bool ],
        # EAPI void elm_mapbuf_smooth_set(Evas_Object *obj, Eina_Bool smooth);
        [ :elm_mapbuf_smooth_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_mapbuf_smooth_get(const Evas_Object *obj);
        [ :elm_mapbuf_smooth_get, [ :evas_object ], :bool ],
        # EAPI void elm_mapbuf_alpha_set(Evas_Object *obj, Eina_Bool alpha);
        [ :elm_mapbuf_alpha_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_mapbuf_alpha_get(const Evas_Object *obj);
        [ :elm_mapbuf_alpha_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
