#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/ecore_evas'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmWin
        #
        FCT_PREFIX = 'elm_win_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Win_Type;
        enum :elm_win_type, [ :elm_win_basic, :elm_win_dialog_basic, :elm_win_desktop, :elm_win_dock, :melm_win_toolbar, :elm_win_menu,
            :elm_win_utility, :elm_win_splash, :elm_win_dropdown_menu, :elm_win_popup_menu, :elm_win_tooltip, :telm_win_notification, :elm_win_combo,
            :elm_win_dnd, :elm_win_inlined_image, :teeelm_win_socket_image, :n ]
        # typedef enum {...} Elm_Win_Keyboard_Mode;
        enum :elm_win_keyboard_mode, [ :elm_win_keyboard_unknown, :elm_win_keyboard_off, :elm_win_keyboard_on, :elm_win_keyboard_alpha,
            :elm_win_keyboard_numeric, :elm_win_keyboard_pin, :elm_win_keyboard_phone_number, :elm_win_keyboard_hex, :elm_win_keyboard_terminal,
            :elm_win_keyboard_password, :elm_win_keyboard_ip, :elm_win_keyboard_host, :elm_win_keyboard_file, :elm_win_keyboard_url, :elm_win_keyboard_keypad,
            :elm_win_keyboard_j2me ]
        # typedef enum {...} Elm_Win_Indicator_Mode;
        enum :elm_win_indicator_mode, [ :elm_win_indicator_unknown, :elm_win_indicator_hide, :elm_win_indicator_show ]
        # typedef enum {...} Elm_Win_Indicator_Opacity_Mode;
        enum :elm_win_indicator_opacity_mode, [ :elm_win_indicator_opacity_unknown, :elm_win_indicator_opaque, :elm_win_indicator_translucent,
            :elm_win_indicator_transparent ]
        # typedef enum {...} Elm_Illume_Command;
        enum :elm_illume_command, [ :elm_illume_command_focus_back, :elm_illume_command_focus_forward, :elm_illume_command_focus_home,
            :elm_illume_command_close ]
        #
        # TYPEDEFS
        # typedef struct _Elm_Win_Trap Elm_Win_Trap;
        typedef :pointer, :elm_win_trap
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_win_add(Evas_Object *parent, const char *name, Elm_Win_Type type);
        [ :elm_win_add, [ :evas_object, :string, :elm_win_type ], :evas_object ],
        # EAPI Evas_Object *elm_win_util_standard_add(const char *name, const char *title);
        [ :elm_win_util_standard_add, [ :string, :string ], :evas_object ],
        # EAPI void elm_win_resize_object_add(Evas_Object *obj, Evas_Object *subobj);
        [ :elm_win_resize_object_add, [ :evas_object, :evas_object ], :void ],
        # EAPI void elm_win_resize_object_del(Evas_Object *obj, Evas_Object *subobj);
        [ :elm_win_resize_object_del, [ :evas_object, :evas_object ], :void ],
        # EAPI void elm_win_title_set(Evas_Object *obj, const char *title);
        [ :elm_win_title_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_win_title_get(const Evas_Object *obj);
        [ :elm_win_title_get, [ :evas_object ], :string ],
        # EAPI void elm_win_icon_name_set(Evas_Object *obj, const char *icon_name);
        [ :elm_win_icon_name_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_win_icon_name_get(const Evas_Object *obj);
        [ :elm_win_icon_name_get, [ :evas_object ], :string ],
        # EAPI void elm_win_role_set(Evas_Object *obj, const char *role);
        [ :elm_win_role_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_win_role_get(const Evas_Object *obj);
        [ :elm_win_role_get, [ :evas_object ], :string ],
        # EAPI void elm_win_icon_object_set(Evas_Object *obj, Evas_Object *icon);
        [ :elm_win_icon_object_set, [ :evas_object, :evas_object ], :void ],
        # EAPI const Evas_Object *elm_win_icon_object_get(const Evas_Object *obj);
        [ :elm_win_icon_object_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_win_autodel_set(Evas_Object *obj, Eina_Bool autodel);
        [ :elm_win_autodel_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_autodel_get(const Evas_Object *obj);
        [ :elm_win_autodel_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_activate(Evas_Object *obj);
        [ :elm_win_activate, [ :evas_object ], :void ],
        # EAPI void elm_win_lower(Evas_Object *obj);
        [ :elm_win_lower, [ :evas_object ], :void ],
        # EAPI void elm_win_raise(Evas_Object *obj);
        [ :elm_win_raise, [ :evas_object ], :void ],
        # EAPI void elm_win_center(Evas_Object *obj, Eina_Bool h, Eina_Bool v);
        [ :elm_win_center, [ :evas_object, :bool, :bool ], :void ],
        # EAPI void elm_win_borderless_set(Evas_Object *obj, Eina_Bool borderless);
        [ :elm_win_borderless_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_borderless_get(const Evas_Object *obj);
        [ :elm_win_borderless_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_shaped_set(Evas_Object *obj, Eina_Bool shaped);
        [ :elm_win_shaped_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_shaped_get(const Evas_Object *obj);
        [ :elm_win_shaped_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_alpha_set(Evas_Object *obj, Eina_Bool alpha);
        [ :elm_win_alpha_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_alpha_get(const Evas_Object *obj);
        [ :elm_win_alpha_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_override_set(Evas_Object *obj, Eina_Bool override);
        [ :elm_win_override_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_override_get(const Evas_Object *obj);
        [ :elm_win_override_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_fullscreen_set(Evas_Object *obj, Eina_Bool fullscreen);
        [ :elm_win_fullscreen_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_fullscreen_get(const Evas_Object *obj);
        [ :elm_win_fullscreen_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_maximized_set(Evas_Object *obj, Eina_Bool maximized);
        [ :elm_win_maximized_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_maximized_get(const Evas_Object *obj);
        [ :elm_win_maximized_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_iconified_set(Evas_Object *obj, Eina_Bool iconified);
        [ :elm_win_iconified_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_iconified_get(const Evas_Object *obj);
        [ :elm_win_iconified_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_withdrawn_set(Evas_Object *obj, Eina_Bool withdrawn);
        [ :elm_win_withdrawn_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_withdrawn_get(const Evas_Object *obj);
        [ :elm_win_withdrawn_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_urgent_set(Evas_Object *obj, Eina_Bool urgent);
        [ :elm_win_urgent_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_urgent_get(const Evas_Object *obj);
        [ :elm_win_urgent_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_demand_attention_set(Evas_Object *obj, Eina_Bool demand_attention);
        [ :elm_win_demand_attention_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_demand_attention_get(const Evas_Object *obj);
        [ :elm_win_demand_attention_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_modal_set(Evas_Object *obj, Eina_Bool modal);
        [ :elm_win_modal_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_modal_get(const Evas_Object *obj);
        [ :elm_win_modal_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_aspect_set(Evas_Object *obj, double aspect);
        [ :elm_win_aspect_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_win_aspect_get(const Evas_Object *obj);
        [ :elm_win_aspect_get, [ :evas_object ], :double ],
        # EAPI void elm_win_size_base_set(Evas_Object *obj, int w, int h);
        [ :elm_win_size_base_set, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_win_size_base_get(Evas_Object *obj, int *w, int *h);
        [ :elm_win_size_base_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_win_size_step_set(Evas_Object *obj, int w, int h);
        [ :elm_win_size_step_set, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_win_size_step_get(Evas_Object *obj, int *w, int *h);
        [ :elm_win_size_step_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_win_layer_set(Evas_Object *obj, int layer);
        [ :elm_win_layer_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_win_layer_get(const Evas_Object *obj);
        [ :elm_win_layer_get, [ :evas_object ], :int ],
        # EAPI void elm_win_norender_push(Evas_Object *obj);
        [ :elm_win_norender_push, [ :evas_object ], :void ],
        # EAPI void elm_win_norender_pop(Evas_Object *obj);
        [ :elm_win_norender_pop, [ :evas_object ], :void ],
        # EAPI int elm_win_norender_get(Evas_Object *obj);
        [ :elm_win_norender_get, [ :evas_object ], :int ],
        # EAPI void elm_win_render(Evas_Object *obj);
        [ :elm_win_render, [ :evas_object ], :void ],
        # EAPI void elm_win_rotation_set(Evas_Object *obj, int rotation);
        [ :elm_win_rotation_set, [ :evas_object, :int ], :void ],
        # EAPI void elm_win_rotation_with_resize_set(Evas_Object *obj, int rotation);
        [ :elm_win_rotation_with_resize_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_win_rotation_get(const Evas_Object *obj);
        [ :elm_win_rotation_get, [ :evas_object ], :int ],
        # EAPI void elm_win_sticky_set(Evas_Object *obj, Eina_Bool sticky);
        [ :elm_win_sticky_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_sticky_get(const Evas_Object *obj);
        [ :elm_win_sticky_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_conformant_set(Evas_Object *obj, Eina_Bool conformant);
        [ :elm_win_conformant_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_conformant_get(const Evas_Object *obj);
        [ :elm_win_conformant_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_quickpanel_set(Evas_Object *obj, Eina_Bool quickpanel);
        [ :elm_win_quickpanel_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_quickpanel_get(const Evas_Object *obj);
        [ :elm_win_quickpanel_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_quickpanel_priority_major_set(Evas_Object *obj, int priority);
        [ :elm_win_quickpanel_priority_major_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_win_quickpanel_priority_major_get(const Evas_Object *obj);
        [ :elm_win_quickpanel_priority_major_get, [ :evas_object ], :int ],
        # EAPI void elm_win_quickpanel_priority_minor_set(Evas_Object *obj, int priority);
        [ :elm_win_quickpanel_priority_minor_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_win_quickpanel_priority_minor_get(const Evas_Object *obj);
        [ :elm_win_quickpanel_priority_minor_get, [ :evas_object ], :int ],
        # EAPI void elm_win_quickpanel_zone_set(Evas_Object *obj, int zone);
        [ :elm_win_quickpanel_zone_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_win_quickpanel_zone_get(const Evas_Object *obj);
        [ :elm_win_quickpanel_zone_get, [ :evas_object ], :int ],
        # EAPI void elm_win_prop_focus_skip_set(Evas_Object *obj, Eina_Bool skip);
        [ :elm_win_prop_focus_skip_set, [ :evas_object, :bool ], :void ],
        # EAPI void elm_win_illume_command_send(Evas_Object *obj, Elm_Illume_Command command, void *params);
        [ :elm_win_illume_command_send, [ :evas_object, :elm_illume_command, :pointer ], :void ],
        # EAPI Evas_Object *elm_win_inlined_image_object_get(Evas_Object *obj);
        [ :elm_win_inlined_image_object_get, [ :evas_object ], :evas_object ],
        # EAPI Eina_Bool elm_win_focus_get(const Evas_Object *obj);
        [ :elm_win_focus_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_screen_constrain_set(Evas_Object *obj, Eina_Bool constrain);
        [ :elm_win_screen_constrain_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_screen_constrain_get(Evas_Object *obj);
        [ :elm_win_screen_constrain_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_screen_size_get(const Evas_Object *obj, int *x, int *y, int *w, int *h);
        [ :elm_win_screen_size_get, [ :evas_object, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void elm_win_screen_dpi_get(const Evas_Object *obj, int *xdpi, int *ydpi);
        [ :elm_win_screen_dpi_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_win_focus_highlight_enabled_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_win_focus_highlight_enabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_focus_highlight_enabled_get(const Evas_Object *obj);
        [ :elm_win_focus_highlight_enabled_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_focus_highlight_style_set(Evas_Object *obj, const char *style);
        [ :elm_win_focus_highlight_style_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_win_focus_highlight_style_get(const Evas_Object *obj);
        [ :elm_win_focus_highlight_style_get, [ :evas_object ], :string ],
        # EAPI void elm_win_keyboard_mode_set(Evas_Object *obj, Elm_Win_Keyboard_Mode mode);
        [ :elm_win_keyboard_mode_set, [ :evas_object, :elm_win_keyboard_mode ], :void ],
        # EAPI Elm_Win_Keyboard_Mode elm_win_keyboard_mode_get(const Evas_Object *obj);
        [ :elm_win_keyboard_mode_get, [ :evas_object ], :elm_win_keyboard_mode ],
        # EAPI void elm_win_keyboard_win_set(Evas_Object *obj, Eina_Bool is_keyboard);
        [ :elm_win_keyboard_win_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_win_keyboard_win_get(const Evas_Object *obj);
        [ :elm_win_keyboard_win_get, [ :evas_object ], :bool ],
        # EAPI void elm_win_indicator_mode_set(Evas_Object *obj, Elm_Win_Indicator_Mode mode);
        [ :elm_win_indicator_mode_set, [ :evas_object, :elm_win_indicator_mode ], :void ],
        # EAPI Elm_Win_Indicator_Mode elm_win_indicator_mode_get(const Evas_Object *obj);
        [ :elm_win_indicator_mode_get, [ :evas_object ], :elm_win_indicator_mode ],
        # EAPI void elm_win_indicator_opacity_set(Evas_Object *obj, Elm_Win_Indicator_Opacity_Mode mode);
        [ :elm_win_indicator_opacity_set, [ :evas_object, :elm_win_indicator_opacity_mode ], :void ],
        # EAPI Elm_Win_Indicator_Opacity_Mode elm_win_indicator_opacity_get(const Evas_Object *obj);
        [ :elm_win_indicator_opacity_get, [ :evas_object ], :elm_win_indicator_opacity_mode ],
        # EAPI void elm_win_screen_position_get(const Evas_Object *obj, int *x, int *y);
        [ :elm_win_screen_position_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI Eina_Bool elm_win_socket_listen(Evas_Object *obj, const char *svcname, int svcnum, Eina_Bool svcsys);
        [ :elm_win_socket_listen, [ :evas_object, :string, :int, :bool ], :bool ],
        # EAPI Ecore_X_Window elm_win_xwindow_get(const Evas_Object *obj);
        [ :elm_win_xwindow_get, [ :evas_object ], :uint ],
        # EAPI Ecore_Wl_Window *elm_win_wl_window_get(const Evas_Object *obj);
        [ :elm_win_wl_window_get, [ :evas_object ], :ecore_wl_window ],
        # EAPI Eina_Bool elm_win_trap_set(const Elm_Win_Trap *trap);
        [ :elm_win_trap_set, [ :elm_win_trap ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
