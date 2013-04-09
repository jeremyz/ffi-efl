#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmGrid
        #
        FCT_PREFIX = 'elm_grid_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_grid_add(Evas_Object *parent);
        [ :elm_grid_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_grid_size_set(Evas_Object *obj, Evas_Coord w, Evas_Coord h);
        [ :elm_grid_size_set, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_grid_size_get(const Evas_Object *obj, Evas_Coord *w, Evas_Coord *h);
        [ :elm_grid_size_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_grid_pack(Evas_Object *obj, Evas_Object *subobj, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h);
        [ :elm_grid_pack, [ :evas_object, :evas_object, :int, :int, :int, :int ], :void ],
        # EAPI void elm_grid_unpack(Evas_Object *obj, Evas_Object *subobj);
        [ :elm_grid_unpack, [ :evas_object, :evas_object ], :void ],
        # EAPI void elm_grid_clear(Evas_Object *obj, Eina_Bool clear);
        [ :elm_grid_clear, [ :evas_object, :bool ], :void ],
        # EAPI void elm_grid_pack_set(Evas_Object *subobj, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h);
        [ :elm_grid_pack_set, [ :evas_object, :int, :int, :int, :int ], :void ],
        # EAPI void elm_grid_pack_get(Evas_Object *subobj, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        [ :elm_grid_pack_get, [ :evas_object, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI Eina_List *elm_grid_children_get(const Evas_Object *obj);
        [ :elm_grid_children_get, [ :evas_object ], :eina_list ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
