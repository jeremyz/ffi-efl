#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmActionSlider
        #
        FCT_PREFIX = 'elm_actionslider_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Actionslider_Pos;
        enum :elm_actionslider_pos, [ :elm_actionslider_none, 0, :elm_actionslider_left, 1<<0, :elm_actionslider_center, 1<<1,
            :elm_actionslider_right, 1<<2, :elm_actionslider_all, (1<<3)-1 ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_actionslider_add(Evas_Object *parent);
        [ :elm_actionslider_add, [ :evas_object ], :evas_object ],
        # EAPI const char *elm_actionslider_selected_label_get(const Evas_Object *obj);
        [ :elm_actionslider_selected_label_get, [ :evas_object ], :string ],
        # EAPI void elm_actionslider_indicator_pos_set(Evas_Object *obj, Elm_Actionslider_Pos pos);
        [ :elm_actionslider_indicator_pos_set, [ :evas_object, :elm_actionslider_pos ], :void ],
        # EAPI Elm_Actionslider_Pos elm_actionslider_indicator_pos_get(const Evas_Object *obj);
        [ :elm_actionslider_indicator_pos_get, [ :evas_object ], :elm_actionslider_pos ],
        # EAPI void elm_actionslider_magnet_pos_set(Evas_Object *obj, Elm_Actionslider_Pos pos);
        [ :elm_actionslider_magnet_pos_set, [ :evas_object, :elm_actionslider_pos ], :void ],
        # EAPI Elm_Actionslider_Pos elm_actionslider_magnet_pos_get(const Evas_Object *obj);
        [ :elm_actionslider_magnet_pos_get, [ :evas_object ], :elm_actionslider_pos ],
        # EAPI void elm_actionslider_enabled_pos_set(Evas_Object *obj, Elm_Actionslider_Pos pos);
        [ :elm_actionslider_enabled_pos_set, [ :evas_object, :elm_actionslider_pos ], :void ],
        # EAPI Elm_Actionslider_Pos elm_actionslider_enabled_pos_get(const Evas_Object *obj);
        [ :elm_actionslider_enabled_pos_get, [ :evas_object ], :elm_actionslider_pos ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
