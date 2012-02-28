#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmPager
        #
        FCT_PREFIX = 'elm_pager_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_pager_add(Evas_Object *parent);
        [ :elm_pager_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_pager_content_push(Evas_Object *obj, Evas_Object *content);
        [ :elm_pager_content_push, [ :evas_object, :evas_object ], :void ],
        # EAPI void elm_pager_content_pop(Evas_Object *obj);
        [ :elm_pager_content_pop, [ :evas_object ], :void ],
        # EAPI void elm_pager_content_promote(Evas_Object *obj, Evas_Object *content);
        [ :elm_pager_content_promote, [ :evas_object, :evas_object ], :void ],
        # EAPI Evas_Object *elm_pager_content_bottom_get(const Evas_Object *obj);
        [ :elm_pager_content_bottom_get, [ :evas_object ], :evas_object ],
        # EAPI Evas_Object *elm_pager_content_top_get(const Evas_Object *obj);
        [ :elm_pager_content_top_get, [ :evas_object ], :evas_object ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
