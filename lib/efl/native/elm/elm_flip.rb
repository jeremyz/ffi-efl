#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmFlip
        #
        FCT_PREFIX = 'elm_flip_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Flip_Mode;
        enum :elm_flip_mode, [ :elm_flip_rotate_y_center_axis, :elm_flip_rotate_x_center_axis, :elm_flip_rotate_xz_center_axis,
            :elm_flip_rotate_yz_center_axis, :elm_flip_cube_left, :elm_flip_cube_right, :elm_flip_cube_up, :elm_flip_cube_down, :elm_flip_page_left,
            :elm_flip_page_right, :elm_flip_page_up, :elm_flip_page_down ]
        # typedef enum {...} Elm_Flip_Interaction;
        enum :elm_flip_interaction, [ :elm_flip_interaction_none, :elm_flip_interaction_rotate, :elm_flip_interaction_cube, :elm_flip_interaction_page
            ]
        # typedef enum {...} Elm_Flip_Direction;
        enum :elm_flip_direction, [ :elm_flip_direction_up, :elm_flip_direction_down, :elm_flip_direction_left, :elm_flip_direction_right ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_flip_add(Evas_Object *parent);
        [ :elm_flip_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_flip_perspective_set(Evas_Object *obj, Evas_Coord foc, Evas_Coord x, Evas_Coord y);
        [ :elm_flip_perspective_set, [ :evas_object, :int, :int, :int ], :void ],
        # EAPI void elm_flip_go(Evas_Object *obj, Elm_Flip_Mode mode);
        [ :elm_flip_go, [ :evas_object, :elm_flip_mode ], :void ],
        # EAPI void elm_flip_go_to(Evas_Object *obj, Eina_Bool front, Elm_Flip_Mode mode);
        [ :elm_flip_go_to, [ :evas_object, :bool, :elm_flip_mode ], :void ],
        # EAPI void elm_flip_interaction_set(Evas_Object *obj, Elm_Flip_Interaction mode);
        [ :elm_flip_interaction_set, [ :evas_object, :elm_flip_interaction ], :void ],
        # EAPI Elm_Flip_Interaction elm_flip_interaction_get(const Evas_Object *obj);
        [ :elm_flip_interaction_get, [ :evas_object ], :elm_flip_interaction ],
        # EAPI void elm_flip_interaction_direction_enabled_set(Evas_Object *obj, Elm_Flip_Direction dir, Eina_Bool enabled);
        [ :elm_flip_interaction_direction_enabled_set, [ :evas_object, :elm_flip_direction, :bool ], :void ],
        # EAPI Eina_Bool elm_flip_interaction_direction_enabled_get(Evas_Object *obj, Elm_Flip_Direction dir);
        [ :elm_flip_interaction_direction_enabled_get, [ :evas_object, :elm_flip_direction ], :bool ],
        # EAPI void elm_flip_interaction_direction_hitsize_set(Evas_Object *obj, Elm_Flip_Direction dir, double hitsize);
        [ :elm_flip_interaction_direction_hitsize_set, [ :evas_object, :elm_flip_direction, :double ], :void ],
        # EAPI double elm_flip_interaction_direction_hitsize_get(Evas_Object *obj, Elm_Flip_Direction dir);
        [ :elm_flip_interaction_direction_hitsize_get, [ :evas_object, :elm_flip_direction ], :double ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
