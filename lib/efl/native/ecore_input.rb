#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/eina_list'
#
module Efl
    #
    module EcoreInput
        #
        FCT_PREFIX = 'ecore_event_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'ecore_input.so.1'
        #
        # ENUMS
        # typedef enum _Ecore_Event_Modifier {...} Ecore_Event_Modifier;
        enum :ecore_event_modifier, [ :ecore_none, :ecore_shift, :ecore_ctrl, :ecore_alt, :ecore_win, :ecore_scroll, :ecore_caps, :ecore_mode,
            :ecore_last ]
        # typedef enum _Ecore_Event_Press {...} Ecore_Event_Press;
        enum :ecore_event_press, [ :ecore_down, :ecore_up ]
        # typedef enum _Ecore_Event_IO {...} Ecore_Event_IO;
        enum :ecore_event_io, [ :ecore_in, :ecore_out ]
        # typedef enum _Ecore_Compose_State {...} Ecore_Compose_State;
        enum :ecore_compose_state, [ :ecore_compose_none, :ecore_compose_middle, :ecore_compose_done ]
        #
        # TYPEDEFS
        # typedef uintptr_t Ecore_Window;
        typedef :pointer, :ecore_window
        # typedef struct _Ecore_Event_Key Ecore_Event_Key;
        typedef :pointer, :ecore_event_key
        # typedef struct _Ecore_Event_Mouse_Button Ecore_Event_Mouse_Button;
        typedef :pointer, :ecore_event_mouse_button
        # typedef struct _Ecore_Event_Mouse_Wheel Ecore_Event_Mouse_Wheel;
        typedef :pointer, :ecore_event_mouse_wheel
        # typedef struct _Ecore_Event_Mouse_Move Ecore_Event_Mouse_Move;
        typedef :pointer, :ecore_event_mouse_move
        # typedef struct _Ecore_Event_Mouse_IO Ecore_Event_Mouse_IO;
        typedef :pointer, :ecore_event_mouse_io
        # typedef struct _Ecore_Event_Modifiers Ecore_Event_Modifiers;
        typedef :pointer, :ecore_event_modifiers
        #
        # VARIABLES
        # EAPI extern int ECORE_EVENT_KEY_DOWN;
        attach_variable :ECORE_EVENT_KEY_DOWN, :int
        # EAPI extern int ECORE_EVENT_KEY_UP;
        attach_variable :ECORE_EVENT_KEY_UP, :int
        # EAPI extern int ECORE_EVENT_MOUSE_BUTTON_DOWN;
        attach_variable :ECORE_EVENT_MOUSE_BUTTON_DOWN, :int
        # EAPI extern int ECORE_EVENT_MOUSE_BUTTON_UP;
        attach_variable :ECORE_EVENT_MOUSE_BUTTON_UP, :int
        # EAPI extern int ECORE_EVENT_MOUSE_MOVE;
        attach_variable :ECORE_EVENT_MOUSE_MOVE, :int
        # EAPI extern int ECORE_EVENT_MOUSE_WHEEL;
        attach_variable :ECORE_EVENT_MOUSE_WHEEL, :int
        # EAPI extern int ECORE_EVENT_MOUSE_IN;
        attach_variable :ECORE_EVENT_MOUSE_IN, :int
        # EAPI extern int ECORE_EVENT_MOUSE_OUT;
        attach_variable :ECORE_EVENT_MOUSE_OUT, :int
        #
        # FUNCTIONS
        fcts = [
        # EAPI int ecore_event_init(void);
        [ :ecore_event_init, [  ], :int ],
        # EAPI int ecore_event_shutdown(void);
        [ :ecore_event_shutdown, [  ], :int ],
        # EAPI unsigned int ecore_event_modifier_mask(Ecore_Event_Modifier modifier);
        [ :ecore_event_modifier_mask, [ :ecore_event_modifier ], :uint ],
        # EAPI Ecore_Event_Modifier ecore_event_update_modifier(const char *key, Ecore_Event_Modifiers *modifiers, int inc);
        [ :ecore_event_update_modifier, [ :string, :ecore_event_modifiers, :int ], :ecore_event_modifier ],
        # EAPI Ecore_Compose_State ecore_compose_get(const Eina_List *seq, char **seqstr_ret);
        [ :ecore_compose_get, [ :eina_list, :pointer ], :ecore_compose_state ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
