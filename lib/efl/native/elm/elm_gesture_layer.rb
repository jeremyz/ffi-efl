#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmGestureLayer
        #
        FCT_PREFIX = 'elm_gesture_layer_' unless const_defined? :FCT_PREFIX
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
        # enum _Elm_Gesture_Type {...} Elm_Gesture_Type;
        enum :elm_gesture_type, [ :elm_gesture_first, 0, :elm_gesture_n_taps, 1, :elm_gesture_n_long_taps, 2, :elm_gesture_n_double_taps, 3,
            :elm_gesture_n_triple_taps, 4, :elm_gesture_momentum, 5, :elm_gesture_n_lines, 6, :elm_gesture_n_flicks, 7, :elm_gesture_zoom, 8, :elm_gesture_rotate,
            9, :elm_gesture_last, 10 ]
        # enum _Elm_Gesture_State {...} Elm_Gesture_State;
        enum :elm_gesture_state, [ :elm_gesture_state_undefined, -1, :elm_gesture_state_start, 0, :elm_gesture_state_move, 1, :elm_gesture_state_end,
            2, :elm_gesture_state_abort, 3 ]
        #
        # TYPEDEFS
        # typedef struct _Elm_Gesture_Taps_Info Elm_Gesture_Taps_Info;
        typedef :pointer, :elm_gesture_taps_info
        # typedef struct _Elm_Gesture_Momentum_Info Elm_Gesture_Momentum_Info;
        typedef :pointer, :elm_gesture_momentum_info
        # typedef struct _Elm_Gesture_Line_Info Elm_Gesture_Line_Info;
        typedef :pointer, :elm_gesture_line_info
        # typedef struct _Elm_Gesture_Zoom_Info Elm_Gesture_Zoom_Info;
        typedef :pointer, :elm_gesture_zoom_info
        # typedef struct _Elm_Gesture_Rotate_Info Elm_Gesture_Rotate_Info;
        typedef :pointer, :elm_gesture_rotate_info
        #
        # CALLBACKS
        # typedef Evas_Event_Flags (*Elm_Gesture_Event_Cb) (void *data, void *event_info);
        callback :elm_gesture_event_cb, [ :pointer, :pointer ], :evas_event_flags
        #
        # FUNCTIONS
        fcts = [
        # EAPI void elm_gesture_layer_cb_set(Evas_Object *obj, Elm_Gesture_Type idx, Elm_Gesture_State cb_type, Elm_Gesture_Event_Cb cb, void *data);
        [ :elm_gesture_layer_cb_set, [ :evas_object, :elm_gesture_type, :elm_gesture_state, :elm_gesture_event_cb, :pointer ], :void ],
        # EAPI Eina_Bool elm_gesture_layer_hold_events_get(const Evas_Object *obj);
        [ :elm_gesture_layer_hold_events_get, [ :evas_object ], :bool ],
        # EAPI void elm_gesture_layer_hold_events_set(Evas_Object *obj, Eina_Bool hold_events);
        [ :elm_gesture_layer_hold_events_set, [ :evas_object, :bool ], :void ],
        # EAPI void elm_gesture_layer_zoom_step_set(Evas_Object *obj, double step);
        [ :elm_gesture_layer_zoom_step_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_gesture_layer_zoom_step_get(const Evas_Object *obj);
        [ :elm_gesture_layer_zoom_step_get, [ :evas_object ], :double ],
        # EAPI void elm_gesture_layer_rotate_step_set(Evas_Object *obj, double step);
        [ :elm_gesture_layer_rotate_step_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_gesture_layer_rotate_step_get(const Evas_Object *obj);
        [ :elm_gesture_layer_rotate_step_get, [ :evas_object ], :double ],
        # EAPI Eina_Bool elm_gesture_layer_attach(Evas_Object *obj, Evas_Object *target);
        [ :elm_gesture_layer_attach, [ :evas_object, :evas_object ], :bool ],
        # EAPI Evas_Object *elm_gesture_layer_add(Evas_Object *parent);
        [ :elm_gesture_layer_add, [ :evas_object ], :evas_object ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
