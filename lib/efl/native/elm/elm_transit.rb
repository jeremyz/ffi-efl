#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmTransit
        #
        FCT_PREFIX = 'elm_transit_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Transit_Tween_Mode;
        enum :elm_transit_tween_mode, [ :elm_transit_tween_mode_linear, :elm_transit_tween_mode_sinusoidal, :elm_transit_tween_mode_decelerate,
            :elm_transit_tween_mode_accelerate ]
        # typedef enum {...} Elm_Transit_Effect_Flip_Axis;
        enum :elm_transit_effect_flip_axis, [ :elm_transit_effect_flip_axis_x, :elm_transit_effect_flip_axis_y ]
        # typedef enum {...} Elm_Transit_Effect_Wipe_Dir;
        enum :elm_transit_effect_wipe_dir, [ :elm_transit_effect_wipe_dir_left, :elm_transit_effect_wipe_dir_right, :elm_transit_effect_wipe_dir_up,
            :elm_transit_effect_wipe_dir_down ]
        # typedef enum {...} Elm_Transit_Effect_Wipe_Type;
        enum :elm_transit_effect_wipe_type, [ :elm_transit_effect_wipe_type_hide, :elm_transit_effect_wipe_type_show ]
        #
        # TYPEDEFS
        # typedef struct _Elm_Transit Elm_Transit;
        typedef :pointer, :elm_transit
        # typedef void Elm_Transit_Effect;
        typedef :void, :elm_transit_effect
        #
        # CALLBACKS
        # typedef void (*Elm_Transit_Effect_Transition_Cb) (Elm_Transit_Effect *effect, Elm_Transit *transit, double progress);
        callback :elm_transit_effect_transition_cb, [ :pointer, :elm_transit, :double ], :void
        # typedef void (*Elm_Transit_Effect_End_Cb) (Elm_Transit_Effect *effect, Elm_Transit *transit);
        callback :elm_transit_effect_end_cb, [ :pointer, :elm_transit ], :void
        # typedef void (*Elm_Transit_Del_Cb) (void *data, Elm_Transit *transit);
        callback :elm_transit_del_cb, [ :pointer, :elm_transit ], :void
        #
        # FUNCTIONS
        fcts = [
        # EAPI Elm_Transit *elm_transit_add(void);
        [ :elm_transit_add, [  ], :elm_transit ],
        # EAPI void elm_transit_del(Elm_Transit *transit);
        [ :elm_transit_del, [ :elm_transit ], :void ],
        # EAPI void elm_transit_effect_add(Elm_Transit *transit, Elm_Transit_Effect_Transition_Cb transition_cb, Elm_Transit_Effect *effect, Elm_Transit_Effect_End_Cb end_cb);
        [ :elm_transit_effect_add, [ :elm_transit, :elm_transit_effect_transition_cb, :pointer, :elm_transit_effect_end_cb ], :void ],
        # EAPI void elm_transit_effect_del(Elm_Transit *transit, Elm_Transit_Effect_Transition_Cb transition_cb, Elm_Transit_Effect *effect);
        [ :elm_transit_effect_del, [ :elm_transit, :elm_transit_effect_transition_cb, :pointer ], :void ],
        # EAPI void elm_transit_object_add(Elm_Transit *transit, Evas_Object *obj);
        [ :elm_transit_object_add, [ :elm_transit, :evas_object ], :void ],
        # EAPI void elm_transit_object_remove(Elm_Transit *transit, Evas_Object *obj);
        [ :elm_transit_object_remove, [ :elm_transit, :evas_object ], :void ],
        # EAPI const Eina_List *elm_transit_objects_get(const Elm_Transit *transit);
        [ :elm_transit_objects_get, [ :elm_transit ], :eina_list ],
        # EAPI void elm_transit_objects_final_state_keep_set(Elm_Transit *transit, Eina_Bool state_keep);
        [ :elm_transit_objects_final_state_keep_set, [ :elm_transit, :bool ], :void ],
        # EAPI Eina_Bool elm_transit_objects_final_state_keep_get(const Elm_Transit *transit);
        [ :elm_transit_objects_final_state_keep_get, [ :elm_transit ], :bool ],
        # EAPI void elm_transit_event_enabled_set(Elm_Transit *transit, Eina_Bool enabled);
        [ :elm_transit_event_enabled_set, [ :elm_transit, :bool ], :void ],
        # EAPI Eina_Bool elm_transit_event_enabled_get(const Elm_Transit *transit);
        [ :elm_transit_event_enabled_get, [ :elm_transit ], :bool ],
        # EAPI void elm_transit_del_cb_set(Elm_Transit *transit, Elm_Transit_Del_Cb cb, void *data);
        [ :elm_transit_del_cb_set, [ :elm_transit, :elm_transit_del_cb, :pointer ], :void ],
        # EAPI void elm_transit_auto_reverse_set(Elm_Transit *transit, Eina_Bool reverse);
        [ :elm_transit_auto_reverse_set, [ :elm_transit, :bool ], :void ],
        # EAPI Eina_Bool elm_transit_auto_reverse_get(const Elm_Transit *transit);
        [ :elm_transit_auto_reverse_get, [ :elm_transit ], :bool ],
        # EAPI void elm_transit_repeat_times_set(Elm_Transit *transit, int repeat);
        [ :elm_transit_repeat_times_set, [ :elm_transit, :int ], :void ],
        # EAPI int elm_transit_repeat_times_get(const Elm_Transit *transit);
        [ :elm_transit_repeat_times_get, [ :elm_transit ], :int ],
        # EAPI void elm_transit_tween_mode_set(Elm_Transit *transit, Elm_Transit_Tween_Mode tween_mode);
        [ :elm_transit_tween_mode_set, [ :elm_transit, :elm_transit_tween_mode ], :void ],
        # EAPI Elm_Transit_Tween_Mode elm_transit_tween_mode_get(const Elm_Transit *transit);
        [ :elm_transit_tween_mode_get, [ :elm_transit ], :elm_transit_tween_mode ],
        # EAPI void elm_transit_duration_set(Elm_Transit *transit, double duration);
        [ :elm_transit_duration_set, [ :elm_transit, :double ], :void ],
        # EAPI double elm_transit_duration_get(const Elm_Transit *transit);
        [ :elm_transit_duration_get, [ :elm_transit ], :double ],
        # EAPI void elm_transit_go(Elm_Transit *transit);
        [ :elm_transit_go, [ :elm_transit ], :void ],
        # EAPI void elm_transit_paused_set(Elm_Transit *transit, Eina_Bool paused);
        [ :elm_transit_paused_set, [ :elm_transit, :bool ], :void ],
        # EAPI Eina_Bool elm_transit_paused_get(const Elm_Transit *transit);
        [ :elm_transit_paused_get, [ :elm_transit ], :bool ],
        # EAPI double elm_transit_progress_value_get(const Elm_Transit *transit);
        [ :elm_transit_progress_value_get, [ :elm_transit ], :double ],
        # EAPI void elm_transit_chain_transit_add(Elm_Transit *transit, Elm_Transit *chain_transit);
        [ :elm_transit_chain_transit_add, [ :elm_transit, :elm_transit ], :void ],
        # EAPI void elm_transit_chain_transit_del(Elm_Transit *transit, Elm_Transit *chain_transit);
        [ :elm_transit_chain_transit_del, [ :elm_transit, :elm_transit ], :void ],
        # EAPI Eina_List *elm_transit_chain_transits_get(const Elm_Transit *transit);
        [ :elm_transit_chain_transits_get, [ :elm_transit ], :eina_list ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_resizing_add(Elm_Transit *transit, Evas_Coord from_w, Evas_Coord from_h, Evas_Coord to_w, Evas_Coord to_h);
        [ :elm_transit_effect_resizing_add, [ :elm_transit, :int, :int, :int, :int ], :pointer ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_translation_add(Elm_Transit *transit, Evas_Coord from_dx, Evas_Coord from_dy, Evas_Coord to_dx, Evas_Coord to_dy);
        [ :elm_transit_effect_translation_add, [ :elm_transit, :int, :int, :int, :int ], :pointer ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_zoom_add(Elm_Transit *transit, float from_rate, float to_rate);
        [ :elm_transit_effect_zoom_add, [ :elm_transit, :float, :float ], :pointer ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_flip_add(Elm_Transit *transit, Elm_Transit_Effect_Flip_Axis axis, Eina_Bool cw);
        [ :elm_transit_effect_flip_add, [ :elm_transit, :elm_transit_effect_flip_axis, :bool ], :pointer ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_resizable_flip_add(Elm_Transit *transit, Elm_Transit_Effect_Flip_Axis axis, Eina_Bool cw);
        [ :elm_transit_effect_resizable_flip_add, [ :elm_transit, :elm_transit_effect_flip_axis, :bool ], :pointer ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_wipe_add(Elm_Transit *transit, Elm_Transit_Effect_Wipe_Type type, Elm_Transit_Effect_Wipe_Dir dir);
        [ :elm_transit_effect_wipe_add, [ :elm_transit, :elm_transit_effect_wipe_type, :elm_transit_effect_wipe_dir ], :pointer ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_color_add(Elm_Transit *transit, unsigned int from_r, unsigned int from_g, unsigned int from_b, unsigned int from_a, unsigned int to_r, unsigned int to_g, unsigned int to_b, unsigned int to_a);
        [ :elm_transit_effect_color_add, [ :elm_transit, :uint, :uint, :uint, :uint, :uint, :uint, :uint, :uint ], :pointer ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_fade_add(Elm_Transit *transit);
        [ :elm_transit_effect_fade_add, [ :elm_transit ], :pointer ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_blend_add(Elm_Transit *transit);
        [ :elm_transit_effect_blend_add, [ :elm_transit ], :pointer ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_rotation_add(Elm_Transit *transit, float from_degree, float to_degree);
        [ :elm_transit_effect_rotation_add, [ :elm_transit, :float, :float ], :pointer ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_image_animation_add(Elm_Transit *transit, Eina_List *images);
        [ :elm_transit_effect_image_animation_add, [ :elm_transit, :eina_list ], :pointer ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
