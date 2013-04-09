#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmInwin
        #
        FCT_PREFIX = 'elm_win_inwin_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_win_inwin_add(Evas_Object *parent);
        [ :elm_win_inwin_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_win_inwin_activate(Evas_Object *obj);
        [ :elm_win_inwin_activate, [ :evas_object ], :void ],
        # EAPI void elm_win_inwin_content_set(Evas_Object *obj, Evas_Object *content);
        [ :elm_win_inwin_content_set, [ :evas_object, :evas_object ], :void ],
        # EAPI Evas_Object *elm_win_inwin_content_get(const Evas_Object *obj);
        [ :elm_win_inwin_content_get, [ :evas_object ], :evas_object ],
        # EAPI Evas_Object *elm_win_inwin_content_unset(Evas_Object *obj);
        [ :elm_win_inwin_content_unset, [ :evas_object ], :evas_object ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
