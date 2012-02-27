#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmBubble
        #
        FCT_PREFIX = 'elm_bubble_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_bubble_add(Evas_Object *parent);
        [ :elm_bubble_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_bubble_corner_set(Evas_Object *obj, const char *corner);
        [ :elm_bubble_corner_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_bubble_corner_get(const Evas_Object *obj);
        [ :elm_bubble_corner_get, [ :evas_object ], :string ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
