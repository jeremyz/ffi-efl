#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmPlug
        #
        FCT_PREFIX = 'elm_plug_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_plug_add(Evas_Object *parent);
        [ :elm_plug_add, [ :evas_object ], :evas_object ],
        # EAPI Eina_Bool elm_plug_connect(Evas_Object *obj, const char *svcname, int svcnum, Eina_Bool svcsys);
        [ :elm_plug_connect, [ :evas_object, :string, :int, :bool ], :bool ],
        # EAPI Evas_Object *elm_plug_image_object_get(const Evas_Object *obj);
        [ :elm_plug_image_object_get, [ :evas_object ], :evas_object ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
