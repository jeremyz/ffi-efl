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
        ffi_lib 'elementary.so.1'
        #
        # ENUMS
        # typedef enum {...} Elm_Bubble_Pos;
        enum :elm_bubble_pos, [ :elm_bubble_pos_invalid, -1, :elm_bubble_pos_top_left, 0, :elm_bubble_pos_top_right, 1, :elm_bubble_pos_bottom_left,
            2, :elm_bubble_pos_bottom_right, 3 ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_bubble_add(Evas_Object *parent);
        [ :elm_bubble_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_bubble_pos_set(Evas_Object *obj, Elm_Bubble_Pos pos);
        [ :elm_bubble_pos_set, [ :evas_object, :elm_bubble_pos ], :void ],
        # EAPI Elm_Bubble_Pos elm_bubble_pos_get(const Evas_Object *obj);
        [ :elm_bubble_pos_get, [ :evas_object ], :elm_bubble_pos ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
