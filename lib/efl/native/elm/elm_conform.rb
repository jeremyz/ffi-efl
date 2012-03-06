#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmConform
        #
        FCT_PREFIX = 'elm_conform_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_conformant_add(Evas_Object *parent);
        [ :elm_conformant_add, [ :evas_object ], :evas_object ],
        # EAPI Evas_Object *elm_conformant_content_area_get(const Evas_Object *obj);
        [ :elm_conformant_content_area_get, [ :evas_object ], :evas_object ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
