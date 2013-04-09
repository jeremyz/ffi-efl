#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmTable
        #
        FCT_PREFIX = 'elm_table_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_table_add(Evas_Object *parent);
        [ :elm_table_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_table_homogeneous_set(Evas_Object *obj, Eina_Bool homogeneous);
        [ :elm_table_homogeneous_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_table_homogeneous_get(const Evas_Object *obj);
        [ :elm_table_homogeneous_get, [ :evas_object ], :bool ],
        # EAPI void elm_table_padding_set(Evas_Object *obj, Evas_Coord horizontal, Evas_Coord vertical);
        [ :elm_table_padding_set, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_table_padding_get(const Evas_Object *obj, Evas_Coord *horizontal, Evas_Coord *vertical);
        [ :elm_table_padding_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_table_pack(Evas_Object *obj, Evas_Object *subobj, int x, int y, int w, int h);
        [ :elm_table_pack, [ :evas_object, :evas_object, :int, :int, :int, :int ], :void ],
        # EAPI void elm_table_unpack(Evas_Object *obj, Evas_Object *subobj);
        [ :elm_table_unpack, [ :evas_object, :evas_object ], :void ],
        # EAPI void elm_table_clear(Evas_Object *obj, Eina_Bool clear);
        [ :elm_table_clear, [ :evas_object, :bool ], :void ],
        # EAPI void elm_table_pack_set(Evas_Object *subobj, int x, int y, int w, int h);
        [ :elm_table_pack_set, [ :evas_object, :int, :int, :int, :int ], :void ],
        # EAPI void elm_table_pack_get(Evas_Object *subobj, int *x, int *y, int *w, int *h);
        [ :elm_table_pack_get, [ :evas_object, :pointer, :pointer, :pointer, :pointer ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
