#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmPanel
        #
        FCT_PREFIX = 'elm_panel_' unless const_defined? :FCT_PREFIX
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
        # ENUMS
        # typedef enum {...} Elm_Panel_Orient;
        enum :elm_panel_orient, [ :elm_panel_orient_top, :elm_panel_orient_bottom, :elm_panel_orient_left, :elm_panel_orient_right ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_panel_add(Evas_Object *parent);
        [ :elm_panel_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_panel_orient_set(Evas_Object *obj, Elm_Panel_Orient orient);
        [ :elm_panel_orient_set, [ :evas_object, :elm_panel_orient ], :void ],
        # EAPI Elm_Panel_Orient elm_panel_orient_get(const Evas_Object *obj);
        [ :elm_panel_orient_get, [ :evas_object ], :elm_panel_orient ],
        # EAPI void elm_panel_hidden_set(Evas_Object *obj, Eina_Bool hidden);
        [ :elm_panel_hidden_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_panel_hidden_get(const Evas_Object *obj);
        [ :elm_panel_hidden_get, [ :evas_object ], :bool ],
        # EAPI void elm_panel_toggle(Evas_Object *obj);
        [ :elm_panel_toggle, [ :evas_object ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
