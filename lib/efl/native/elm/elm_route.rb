#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/emap'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmRoute
        #
        FCT_PREFIX = 'elm_route_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'elementary'
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_route_add(Evas_Object *parent);
        [ :elm_route_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_route_emap_set(Evas_Object *obj, EMap_Route *emap);
        [ :elm_route_emap_set, [ :evas_object, :emap_route ], :void ],
        # EAPI void elm_route_longitude_min_max_get(const Evas_Object *obj, double *min, double *max);
        [ :elm_route_longitude_min_max_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_route_latitude_min_max_get(const Evas_Object *obj, double *min, double *max);
        [ :elm_route_latitude_min_max_get, [ :evas_object, :pointer, :pointer ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
