#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi'
#
module Efl
    #
    module Ecorefb
        def self.method_missing m, *args, &block
            return Efl::API.send 'ecore_fb_'+m.to_s, *args, &block
        end
    end
    #
    module API
        #
        #
        ffi_lib 'ecore'
        #
        # ENUMS
        #
        # TYPEDEFS
        # typedef struct _Ecore_Fb_Input_Device Ecore_Fb_Input_Device;
        typedef :pointer, :ecore_fb_input_device
        typedef :pointer, :ecore_fb_input_device_p
        # typedef enum _Ecore_Fb_Input_Device_Cap Ecore_Fb_Input_Device_Cap;
        typedef :pointer, :ecore_fb_input_device_cap
        # typedef struct _Ecore_Fb_Event_Key_Down Ecore_Fb_Event_Key_Down;
        typedef :pointer, :ecore_fb_event_key_down
        # typedef struct _Ecore_Fb_Event_Key_Up Ecore_Fb_Event_Key_Up;
        typedef :pointer, :ecore_fb_event_key_up
        # typedef struct _Ecore_Fb_Event_Mouse_Button_Down Ecore_Fb_Event_Mouse_Button_Down;
        typedef :pointer, :ecore_fb_event_mouse_button_down
        # typedef struct _Ecore_Fb_Event_Mouse_Button_Up Ecore_Fb_Event_Mouse_Button_Up;
        typedef :pointer, :ecore_fb_event_mouse_button_up
        # typedef struct _Ecore_Fb_Event_Mouse_Move Ecore_Fb_Event_Mouse_Move;
        typedef :pointer, :ecore_fb_event_mouse_move
        # typedef struct _Ecore_Fb_Event_Mouse_Wheel Ecore_Fb_Event_Mouse_Wheel;
        typedef :pointer, :ecore_fb_event_mouse_wheel
        #
        # CALLBACKS
        #
        # FUNCTIONS
        fcts = [
        # EAPI extern int ECORE_FB_EVENT_KEY_DOWN; /**< FB Key Down event */ EAPI extern int ECORE_FB_EVENT_KEY_UP; /**< FB Key Up event */
        # FIXME
        # EAPI extern int ECORE_FB_EVENT_MOUSE_BUTTON_DOWN; /**< FB Mouse Down event */ EAPI extern int ECORE_FB_EVENT_MOUSE_BUTTON_UP; /**< FB Mouse Up event */
        # FIXME
        # EAPI extern int ECORE_FB_EVENT_MOUSE_MOVE; /**< FB Mouse Move event */ EAPI extern int ECORE_FB_EVENT_MOUSE_WHEEL; /**< FB Mouse Wheel event */
        # FIXME
        # EAPI void ecore_fb_callback_gain_set(void (*func) (void *data), void *data);
        # FIXME
        # EAPI void ecore_fb_callback_lose_set(void (*func) (void *data), void *data);
        # FIXME
        # EAPI Ecore_Fb_Input_Device *ecore_fb_input_device_open(const char *dev);
        [ :ecore_fb_input_device_open, [ :string ], :ecore_fb_input_device_p ],
        # EAPI void ecore_fb_input_device_close(Ecore_Fb_Input_Device *dev);
        [ :ecore_fb_input_device_close, [ :ecore_fb_input_device_p ], :void ],
        # EAPI void ecore_fb_input_device_listen(Ecore_Fb_Input_Device *dev, Eina_Bool listen);
        [ :ecore_fb_input_device_listen, [ :ecore_fb_input_device_p, :eina_bool ], :void ],
        # EAPI const char *ecore_fb_input_device_name_get(Ecore_Fb_Input_Device *dev);
        [ :ecore_fb_input_device_name_get, [ :ecore_fb_input_device_p ], :string ],
        # EAPI Ecore_Fb_Input_Device_Cap ecore_fb_input_device_cap_get(Ecore_Fb_Input_Device *dev);
        [ :ecore_fb_input_device_cap_get, [ :ecore_fb_input_device_p ], :ecore_fb_input_device_cap ],
        # EAPI void ecore_fb_input_device_axis_size_set(Ecore_Fb_Input_Device *dev, int w, int h);
        [ :ecore_fb_input_device_axis_size_set, [ :ecore_fb_input_device_p, :int, :int ], :void ],
        # EAPI void ecore_fb_input_threshold_click_set(Ecore_Fb_Input_Device *dev, double threshold);
        [ :ecore_fb_input_threshold_click_set, [ :ecore_fb_input_device_p, :double ], :void ],
        # EAPI double ecore_fb_input_threshold_click_get(Ecore_Fb_Input_Device *dev);
        [ :ecore_fb_input_threshold_click_get, [ :ecore_fb_input_device_p ], :double ],
        # EAPI int ecore_fb_init(const char *name);
        [ :ecore_fb_init, [ :string ], :int ],
        # EAPI int ecore_fb_shutdown(void);
        [ :ecore_fb_shutdown, [  ], :int ],
        # EAPI void ecore_fb_size_get(int *w, int *h);
        [ :ecore_fb_size_get, [ :int_p, :int_p ], :void ],
        # EAPI void ecore_fb_touch_screen_calibrate_set(int xscale, int xtrans, int yscale, int ytrans, int xyswap);
        [ :ecore_fb_touch_screen_calibrate_set, [ :int, :int, :int, :int, :int ], :void ],
        # EAPI void ecore_fb_touch_screen_calibrate_get(int *xscale, int *xtrans, int *yscale, int *ytrans, int *xyswap);
        [ :ecore_fb_touch_screen_calibrate_get, [ :int_p, :int_p, :int_p, :int_p, :int_p ], :void ],
        ]
        #
        attach_fcts fcts
    end
end
#
# EOF
