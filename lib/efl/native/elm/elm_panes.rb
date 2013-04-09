#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmPanes
        #
        FCT_PREFIX = 'elm_panes_' unless const_defined? :FCT_PREFIX
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
        # EAPI Evas_Object *elm_panes_add(Evas_Object *parent);
        [ :elm_panes_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_panes_fixed_set(Evas_Object *obj, Eina_Bool fixed);
        [ :elm_panes_fixed_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_panes_fixed_get(const Evas_Object *obj);
        [ :elm_panes_fixed_get, [ :evas_object ], :bool ],
        # EAPI double elm_panes_content_left_size_get(const Evas_Object *obj);
        [ :elm_panes_content_left_size_get, [ :evas_object ], :double ],
        # EAPI void elm_panes_content_left_size_set(Evas_Object *obj, double size);
        [ :elm_panes_content_left_size_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_panes_content_right_size_get(const Evas_Object *obj);
        [ :elm_panes_content_right_size_get, [ :evas_object ], :double ],
        # EAPI void elm_panes_content_right_size_set(Evas_Object *obj, double size);
        [ :elm_panes_content_right_size_set, [ :evas_object, :double ], :void ],
        # EAPI void elm_panes_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_panes_horizontal_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_panes_horizontal_get(const Evas_Object *obj);
        [ :elm_panes_horizontal_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
