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
        ffi_lib 'elementary.so.1'
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_conformant_add(Evas_Object *parent);
        [ :elm_conformant_add, [ :evas_object ], :evas_object ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
