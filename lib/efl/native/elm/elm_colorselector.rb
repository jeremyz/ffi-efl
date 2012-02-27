#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmColorSelector
        #
        FCT_PREFIX = 'elm_colorselector_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_colorselector_add(Evas_Object *parent);
        [ :elm_colorselector_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_colorselector_color_set(Evas_Object *obj, int r, int g, int b, int a);
        [ :elm_colorselector_color_set, [ :evas_object, :int, :int, :int, :int ], :void ],
        # EAPI void elm_colorselector_color_get(const Evas_Object *obj, int *r, int *g, int *b, int *a);
        [ :elm_colorselector_color_get, [ :evas_object, :pointer, :pointer, :pointer, :pointer ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
