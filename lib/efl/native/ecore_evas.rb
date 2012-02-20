#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module EcoreEvas
        #
        FCT_PREFIX = 'ecore_evas_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'ecore_evas'
        #
        # ENUMS
        # typedef enum _Ecore_Evas_Engine_Type {...} Ecore_Evas_Engine_Type;
        enum :ecore_evas_engine_type, [ :ecore_evas_engine_software_buffer, :ecore_evas_engine_software_xlib, :ecore_evas_engine_xrender_x11,
            :ecore_evas_engine_opengl_x11, :ecore_evas_engine_software_xcb, :ecore_evas_engine_xrender_xcb, :ecore_evas_engine_software_gdi,
            :ecore_evas_engine_software_ddraw, :ecore_evas_engine_direct3d, :ecore_evas_engine_opengl_glew, :ecore_evas_engine_opengl_cocoa,
            :ecore_evas_engine_software_sdl, :ecore_evas_engine_directfb, :ecore_evas_engine_software_fb, :ecore_evas_engine_software_8_x11,
            :ecore_evas_engine_software_16_x11, :ecore_evas_engine_software_16_ddraw, :ecore_evas_engine_software_16_wince, :ecore_evas_engine_opengl_sdl,
            :ecore_evas_engine_ews, :ecore_evas_engine_psl1ght, :ecore_evas_engine_wayland_shm, :ecore_evas_engine_wayland_egl ]
        # typedef enum _Ecore_Evas_Avoid_Damage_Type {...} Ecore_Evas_Avoid_Damage_Type;
        enum :ecore_evas_avoid_damage_type, [ :ecore_evas_avoid_damage_none, 0, :ecore_evas_avoid_damage_expose, 1, :ecore_evas_avoid_damage_built_in,
            2 ]
        # typedef enum _Ecore_Evas_Object_Associate_Flags {...} Ecore_Evas_Object_Associate_Flags;
        enum :ecore_evas_object_associate_flags, [ :ecore_evas_object_associate_base, 0, :ecore_evas_object_associate_stack, 1<<0,
            :ecore_evas_object_associate_layer, 1<<1, :ecore_evas_object_associate_del, 1<<2 ]
        #
        # TYPEDEFS
        # typedef unsigned int Ecore_X_Window;
        typedef :uint, :ecore_x_window
        # typedef struct _Ecore_DirectFB_Window Ecore_DirectFB_Window;
        typedef :pointer, :ecore_directfb_window
        # typedef struct _Ecore_Win32_Window Ecore_Win32_Window;
        typedef :pointer, :ecore_win32_window
        # typedef struct _Ecore_WinCE_Window Ecore_WinCE_Window;
        typedef :pointer, :ecore_wince_window
        # typedef struct _Ecore_Cocoa_Window Ecore_Cocoa_Window;
        typedef :pointer, :ecore_cocoa_window
        # typedef struct _Ecore_Evas Ecore_Evas;
        typedef :pointer, :ecore_evas
        #
        # CALLBACKS
        # typedef void (*Ecore_Evas_Event_Cb) (Ecore_Evas *ee);
        callback :ecore_evas_event_cb, [ :pointer ], :void
        #
        # VARIABLES
        # EAPI extern int ECORE_EVAS_EWS_EVENT_MANAGER_CHANGE;
        attach_variable :ECORE_EVAS_EWS_EVENT_MANAGER_CHANGE, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_ADD;
        attach_variable :ECORE_EVAS_EWS_EVENT_ADD, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_DEL;
        attach_variable :ECORE_EVAS_EWS_EVENT_DEL, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_RESIZE;
        attach_variable :ECORE_EVAS_EWS_EVENT_RESIZE, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_MOVE;
        attach_variable :ECORE_EVAS_EWS_EVENT_MOVE, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_SHOW;
        attach_variable :ECORE_EVAS_EWS_EVENT_SHOW, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_HIDE;
        attach_variable :ECORE_EVAS_EWS_EVENT_HIDE, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_FOCUS;
        attach_variable :ECORE_EVAS_EWS_EVENT_FOCUS, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_UNFOCUS;
        attach_variable :ECORE_EVAS_EWS_EVENT_UNFOCUS, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_RAISE;
        attach_variable :ECORE_EVAS_EWS_EVENT_RAISE, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_LOWER;
        attach_variable :ECORE_EVAS_EWS_EVENT_LOWER, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_ACTIVATE;
        attach_variable :ECORE_EVAS_EWS_EVENT_ACTIVATE, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_ICONIFIED_CHANGE;
        attach_variable :ECORE_EVAS_EWS_EVENT_ICONIFIED_CHANGE, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_MAXIMIZED_CHANGE;
        attach_variable :ECORE_EVAS_EWS_EVENT_MAXIMIZED_CHANGE, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_LAYER_CHANGE;
        attach_variable :ECORE_EVAS_EWS_EVENT_LAYER_CHANGE, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_FULLSCREEN_CHANGE;
        attach_variable :ECORE_EVAS_EWS_EVENT_FULLSCREEN_CHANGE, :int
        # EAPI extern int ECORE_EVAS_EWS_EVENT_CONFIG_CHANGE;
        attach_variable :ECORE_EVAS_EWS_EVENT_CONFIG_CHANGE, :int
        # EAPI extern int ECORE_EVAS_EXTN_CLIENT_ADD;
        attach_variable :ECORE_EVAS_EXTN_CLIENT_ADD, :int
        # EAPI extern int ECORE_EVAS_EXTN_CLIENT_DEL;
        attach_variable :ECORE_EVAS_EXTN_CLIENT_DEL, :int
        #
        # FUNCTIONS
        fcts = [
        # EAPI int ecore_evas_engine_type_supported_get(Ecore_Evas_Engine_Type engine);
        [ :ecore_evas_engine_type_supported_get, [ :ecore_evas_engine_type ], :int ],
        # EAPI int ecore_evas_init(void);
        [ :ecore_evas_init, [  ], :int ],
        # EAPI int ecore_evas_shutdown(void);
        [ :ecore_evas_shutdown, [  ], :int ],
        # EAPI void ecore_evas_app_comp_sync_set(Eina_Bool do_sync);
        [ :ecore_evas_app_comp_sync_set, [ :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_app_comp_sync_get(void);
        [ :ecore_evas_app_comp_sync_get, [  ], :eina_bool ],
        # EAPI Eina_List *ecore_evas_engines_get(void);
        [ :ecore_evas_engines_get, [  ], :pointer ],
        # EAPI void ecore_evas_engines_free(Eina_List *engines);
        [ :ecore_evas_engines_free, [ :pointer ], :void ],
        # EAPI Ecore_Evas *ecore_evas_new(const char *engine_name, int x, int y, int w, int h, const char *extra_options);
        [ :ecore_evas_new, [ :string, :int, :int, :int, :int, :string ], :pointer ],
        # EAPI void ecore_evas_alpha_set(Ecore_Evas *ee, Eina_Bool alpha);
        [ :ecore_evas_alpha_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_alpha_get(const Ecore_Evas *ee);
        [ :ecore_evas_alpha_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_transparent_set(Ecore_Evas *ee, Eina_Bool transparent);
        [ :ecore_evas_transparent_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_transparent_get(const Ecore_Evas *ee);
        [ :ecore_evas_transparent_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_geometry_get(const Ecore_Evas *ee, int *x, int *y, int *w, int *h);
        [ :ecore_evas_geometry_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void ecore_evas_request_geometry_get(const Ecore_Evas *ee, int *x, int *y, int *w, int *h);
        [ :ecore_evas_request_geometry_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void ecore_evas_focus_set(Ecore_Evas *ee, Eina_Bool on);
        [ :ecore_evas_focus_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_focus_get(const Ecore_Evas *ee);
        [ :ecore_evas_focus_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_iconified_set(Ecore_Evas *ee, Eina_Bool on);
        [ :ecore_evas_iconified_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_iconified_get(const Ecore_Evas *ee);
        [ :ecore_evas_iconified_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_borderless_set(Ecore_Evas *ee, Eina_Bool on);
        [ :ecore_evas_borderless_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_borderless_get(const Ecore_Evas *ee);
        [ :ecore_evas_borderless_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_fullscreen_set(Ecore_Evas *ee, Eina_Bool on);
        [ :ecore_evas_fullscreen_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_fullscreen_get(const Ecore_Evas *ee);
        [ :ecore_evas_fullscreen_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_ignore_events_set(Ecore_Evas *ee, Eina_Bool ignore);
        [ :ecore_evas_ignore_events_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_ignore_events_get(const Ecore_Evas *ee);
        [ :ecore_evas_ignore_events_get, [ :pointer ], :eina_bool ],
        # EAPI int ecore_evas_visibility_get(const Ecore_Evas *ee);
        [ :ecore_evas_visibility_get, [ :pointer ], :int ],
        # EAPI void ecore_evas_layer_set(Ecore_Evas *ee, int layer);
        [ :ecore_evas_layer_set, [ :pointer, :int ], :void ],
        # EAPI int ecore_evas_layer_get(const Ecore_Evas *ee);
        [ :ecore_evas_layer_get, [ :pointer ], :int ],
        # EAPI void ecore_evas_maximized_set(Ecore_Evas *ee, Eina_Bool on);
        [ :ecore_evas_maximized_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_maximized_get(const Ecore_Evas *ee);
        [ :ecore_evas_maximized_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_move(Ecore_Evas *ee, int x, int y);
        [ :ecore_evas_move, [ :pointer, :int, :int ], :void ],
        # EAPI void ecore_evas_resize(Ecore_Evas *ee, int w, int h);
        [ :ecore_evas_resize, [ :pointer, :int, :int ], :void ],
        # EAPI void ecore_evas_move_resize(Ecore_Evas *ee, int x, int y, int w, int h);
        [ :ecore_evas_move_resize, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void ecore_evas_rotation_set(Ecore_Evas *ee, int rot);
        [ :ecore_evas_rotation_set, [ :pointer, :int ], :void ],
        # EAPI void ecore_evas_rotation_with_resize_set(Ecore_Evas *ee, int rot);
        [ :ecore_evas_rotation_with_resize_set, [ :pointer, :int ], :void ],
        # EAPI int ecore_evas_rotation_get(const Ecore_Evas *ee);
        [ :ecore_evas_rotation_get, [ :pointer ], :int ],
        # EAPI void ecore_evas_raise(Ecore_Evas *ee);
        [ :ecore_evas_raise, [ :pointer ], :void ],
        # EAPI void ecore_evas_lower(Ecore_Evas *ee);
        [ :ecore_evas_lower, [ :pointer ], :void ],
        # EAPI void ecore_evas_title_set(Ecore_Evas *ee, const char *t);
        [ :ecore_evas_title_set, [ :pointer, :string ], :void ],
        # EAPI const char *ecore_evas_title_get(const Ecore_Evas *ee);
        [ :ecore_evas_title_get, [ :pointer ], :string ],
        # EAPI void ecore_evas_name_class_set(Ecore_Evas *ee, const char *n, const char *c);
        [ :ecore_evas_name_class_set, [ :pointer, :string, :string ], :void ],
        # EAPI void ecore_evas_name_class_get(const Ecore_Evas *ee, const char **n, const char **c);
        [ :ecore_evas_name_class_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI Ecore_Window ecore_evas_window_get(const Ecore_Evas *ee);
        [ :ecore_evas_window_get, [ :pointer ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_software_x11_new(const char *disp_name, Ecore_X_Window parent, int x, int y, int w, int h);
        [ :ecore_evas_software_x11_new, [ :string, :uint, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_X_Window ecore_evas_software_x11_window_get(const Ecore_Evas *ee);
        [ :ecore_evas_software_x11_window_get, [ :pointer ], :uint ],
        # EAPI void ecore_evas_software_x11_direct_resize_set(Ecore_Evas *ee, Eina_Bool on);
        [ :ecore_evas_software_x11_direct_resize_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_software_x11_direct_resize_get(const Ecore_Evas *ee);
        [ :ecore_evas_software_x11_direct_resize_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_software_x11_extra_event_window_add(Ecore_Evas *ee, Ecore_X_Window win);
        [ :ecore_evas_software_x11_extra_event_window_add, [ :pointer, :uint ], :void ],
        # EAPI Ecore_Evas *ecore_evas_gl_x11_new(const char *disp_name, Ecore_X_Window parent, int x, int y, int w, int h);
        [ :ecore_evas_gl_x11_new, [ :string, :uint, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_gl_x11_options_new(const char *disp_name, Ecore_X_Window parent, int x, int y, int w, int h, const int *opt);
        [ :ecore_evas_gl_x11_options_new, [ :string, :uint, :int, :int, :int, :int, :pointer ], :pointer ],
        # EAPI Ecore_X_Window ecore_evas_gl_x11_window_get(const Ecore_Evas *ee);
        [ :ecore_evas_gl_x11_window_get, [ :pointer ], :uint ],
        # EAPI void ecore_evas_gl_x11_direct_resize_set(Ecore_Evas *ee, Eina_Bool on);
        [ :ecore_evas_gl_x11_direct_resize_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_gl_x11_direct_resize_get(const Ecore_Evas *ee);
        [ :ecore_evas_gl_x11_direct_resize_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_gl_x11_extra_event_window_add(Ecore_Evas *ee, Ecore_X_Window win);
        [ :ecore_evas_gl_x11_extra_event_window_add, [ :pointer, :uint ], :void ],
        # EAPI void ecore_evas_gl_x11_pre_post_swap_callback_set(const Ecore_Evas *ee, void *data, void (*pre_cb) (void *data, Evas *e), void (*post_cb) (void *data, Evas *e));
        # FIXME
        # EAPI Ecore_Evas *ecore_evas_xrender_x11_new(const char *disp_name, Ecore_X_Window parent, int x, int y, int w, int h);
        [ :ecore_evas_xrender_x11_new, [ :string, :uint, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_X_Window ecore_evas_xrender_x11_window_get(const Ecore_Evas *ee);
        [ :ecore_evas_xrender_x11_window_get, [ :pointer ], :uint ],
        # EAPI void ecore_evas_xrender_x11_direct_resize_set(Ecore_Evas *ee, Eina_Bool on);
        [ :ecore_evas_xrender_x11_direct_resize_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_xrender_x11_direct_resize_get(const Ecore_Evas *ee);
        [ :ecore_evas_xrender_x11_direct_resize_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_xrender_x11_extra_event_window_add(Ecore_Evas *ee, Ecore_X_Window win);
        [ :ecore_evas_xrender_x11_extra_event_window_add, [ :pointer, :uint ], :void ],
        # EAPI Ecore_Evas *ecore_evas_software_x11_8_new(const char *disp_name, Ecore_X_Window parent, int x, int y, int w, int h);
        [ :ecore_evas_software_x11_8_new, [ :string, :uint, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_X_Window ecore_evas_software_x11_8_window_get(const Ecore_Evas *ee);
        [ :ecore_evas_software_x11_8_window_get, [ :pointer ], :uint ],
        # EAPI Ecore_X_Window ecore_evas_software_x11_8_subwindow_get(const Ecore_Evas *ee);
        [ :ecore_evas_software_x11_8_subwindow_get, [ :pointer ], :uint ],
        # EAPI void ecore_evas_software_x11_8_direct_resize_set(Ecore_Evas *ee, Eina_Bool on);
        [ :ecore_evas_software_x11_8_direct_resize_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_software_x11_8_direct_resize_get(const Ecore_Evas *ee);
        [ :ecore_evas_software_x11_8_direct_resize_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_software_x11_8_extra_event_window_add(Ecore_Evas *ee, Ecore_X_Window win);
        [ :ecore_evas_software_x11_8_extra_event_window_add, [ :pointer, :uint ], :void ],
        # EAPI Ecore_Evas *ecore_evas_software_x11_16_new(const char *disp_name, Ecore_X_Window parent, int x, int y, int w, int h);
        [ :ecore_evas_software_x11_16_new, [ :string, :uint, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_X_Window ecore_evas_software_x11_16_window_get(const Ecore_Evas *ee);
        [ :ecore_evas_software_x11_16_window_get, [ :pointer ], :uint ],
        # EAPI void ecore_evas_software_x11_16_direct_resize_set(Ecore_Evas *ee, Eina_Bool on);
        [ :ecore_evas_software_x11_16_direct_resize_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_software_x11_16_direct_resize_get(const Ecore_Evas *ee);
        [ :ecore_evas_software_x11_16_direct_resize_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_software_x11_16_extra_event_window_add(Ecore_Evas *ee, Ecore_X_Window win);
        [ :ecore_evas_software_x11_16_extra_event_window_add, [ :pointer, :uint ], :void ],
        # EAPI Ecore_Evas *ecore_evas_fb_new(const char *disp_name, int rotation, int w, int h);
        [ :ecore_evas_fb_new, [ :string, :int, :int, :int ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_directfb_new(const char *disp_name, int windowed, int x, int y, int w, int h);
        [ :ecore_evas_directfb_new, [ :string, :int, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_DirectFB_Window *ecore_evas_directfb_window_get(const Ecore_Evas *ee);
        [ :ecore_evas_directfb_window_get, [ :pointer ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_wayland_shm_new(const char *disp_name, int x, int y, int w, int h, int frame);
        [ :ecore_evas_wayland_shm_new, [ :string, :int, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_wayland_egl_new(const char *disp_name, int x, int y, int w, int h, int frame);
        [ :ecore_evas_wayland_egl_new, [ :string, :int, :int, :int, :int, :int ], :pointer ],
        # EAPI void ecore_evas_wayland_resize(Ecore_Evas *ee, int location);
        [ :ecore_evas_wayland_resize, [ :pointer, :int ], :void ],
        # EAPI void ecore_evas_wayland_drag_start(Ecore_Evas *ee, Ecore_Evas *drag_ee, void *source);
        [ :ecore_evas_wayland_drag_start, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void ecore_evas_wayland_pointer_set(Ecore_Evas *ee, int hot_x, int hot_y);
        [ :ecore_evas_wayland_pointer_set, [ :pointer, :int, :int ], :void ],
        # EAPI Ecore_Evas *ecore_evas_buffer_new(int w, int h);
        [ :ecore_evas_buffer_new, [ :int, :int ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_buffer_allocfunc_new(int w, int h, void *(*alloc_func) (void *data, int size), void (*free_func) (void *data, void *pix), const void *data);
        # FIXME
        # EAPI const void *ecore_evas_buffer_pixels_get(Ecore_Evas *ee);
        [ :ecore_evas_buffer_pixels_get, [ :pointer ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_ews_new(int x, int y, int w, int h);
        [ :ecore_evas_ews_new, [ :int, :int, :int, :int ], :pointer ],
        # EAPI Evas_Object *ecore_evas_ews_backing_store_get(const Ecore_Evas *ee);
        [ :ecore_evas_ews_backing_store_get, [ :pointer ], :pointer ],
        # EAPI void ecore_evas_ews_delete_request(Ecore_Evas *ee);
        [ :ecore_evas_ews_delete_request, [ :pointer ], :void ],
        # EAPI Evas_Object *ecore_evas_object_image_new(Ecore_Evas *ee_target);
        [ :ecore_evas_object_image_new, [ :pointer ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_object_ecore_evas_get(Evas_Object *obj);
        [ :ecore_evas_object_ecore_evas_get, [ :pointer ], :pointer ],
        # EAPI Evas *ecore_evas_object_evas_get(Evas_Object *obj);
        [ :ecore_evas_object_evas_get, [ :pointer ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_software_gdi_new(Ecore_Win32_Window *parent, int x, int y, int width, int height);
        [ :ecore_evas_software_gdi_new, [ :pointer, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_software_ddraw_new(Ecore_Win32_Window *parent, int x, int y, int width, int height);
        [ :ecore_evas_software_ddraw_new, [ :pointer, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_software_16_ddraw_new(Ecore_Win32_Window *parent, int x, int y, int width, int height);
        [ :ecore_evas_software_16_ddraw_new, [ :pointer, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_direct3d_new(Ecore_Win32_Window *parent, int x, int y, int width, int height);
        [ :ecore_evas_direct3d_new, [ :pointer, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_gl_glew_new(Ecore_Win32_Window *parent, int x, int y, int width, int height);
        [ :ecore_evas_gl_glew_new, [ :pointer, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_Win32_Window *ecore_evas_win32_window_get(const Ecore_Evas *ee);
        [ :ecore_evas_win32_window_get, [ :pointer ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_sdl_new(const char* name, int w, int h, int fullscreen, int hwsurface, int noframe, int alpha);
        [ :ecore_evas_sdl_new, [ :pointer, :int, :int, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_sdl16_new(const char* name, int w, int h, int fullscreen, int hwsurface, int noframe, int alpha);
        [ :ecore_evas_sdl16_new, [ :pointer, :int, :int, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_gl_sdl_new(const char* name, int w, int h, int fullscreen, int noframe);
        [ :ecore_evas_gl_sdl_new, [ :pointer, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_software_wince_new(Ecore_WinCE_Window *parent, int x, int y, int width, int height);
        [ :ecore_evas_software_wince_new, [ :pointer, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_software_wince_fb_new(Ecore_WinCE_Window *parent, int x, int y, int width, int height);
        [ :ecore_evas_software_wince_fb_new, [ :pointer, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_software_wince_gapi_new(Ecore_WinCE_Window *parent, int x, int y, int width, int height);
        [ :ecore_evas_software_wince_gapi_new, [ :pointer, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_software_wince_ddraw_new(Ecore_WinCE_Window *parent, int x, int y, int width, int height);
        [ :ecore_evas_software_wince_ddraw_new, [ :pointer, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_software_wince_gdi_new(Ecore_WinCE_Window *parent, int x, int y, int width, int height);
        [ :ecore_evas_software_wince_gdi_new, [ :pointer, :int, :int, :int, :int ], :pointer ],
        # EAPI Ecore_WinCE_Window *ecore_evas_software_wince_window_get(const Ecore_Evas *ee);
        [ :ecore_evas_software_wince_window_get, [ :pointer ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_psl1ght_new(const char* name, int w, int h);
        [ :ecore_evas_psl1ght_new, [ :pointer, :int, :int ], :pointer ],
        # EAPI const char *ecore_evas_engine_name_get(const Ecore_Evas *ee);
        [ :ecore_evas_engine_name_get, [ :pointer ], :string ],
        # EAPI Ecore_Evas *ecore_evas_ecore_evas_get(const Evas *e);
        [ :ecore_evas_ecore_evas_get, [ :pointer ], :pointer ],
        # EAPI void ecore_evas_free(Ecore_Evas *ee);
        [ :ecore_evas_free, [ :pointer ], :void ],
        # EAPI void *ecore_evas_data_get(const Ecore_Evas *ee, const char *key);
        [ :ecore_evas_data_get, [ :pointer, :string ], :pointer ],
        # EAPI void ecore_evas_data_set(Ecore_Evas *ee, const char *key, const void *data);
        [ :ecore_evas_data_set, [ :pointer, :string, :pointer ], :void ],
        # EAPI void ecore_evas_callback_resize_set(Ecore_Evas *ee, Ecore_Evas_Event_Cb func);
        [ :ecore_evas_callback_resize_set, [ :pointer, :ecore_evas_event_cb ], :void ],
        # EAPI void ecore_evas_callback_move_set(Ecore_Evas *ee, Ecore_Evas_Event_Cb func);
        [ :ecore_evas_callback_move_set, [ :pointer, :ecore_evas_event_cb ], :void ],
        # EAPI void ecore_evas_callback_show_set(Ecore_Evas *ee, Ecore_Evas_Event_Cb func);
        [ :ecore_evas_callback_show_set, [ :pointer, :ecore_evas_event_cb ], :void ],
        # EAPI void ecore_evas_callback_hide_set(Ecore_Evas *ee, Ecore_Evas_Event_Cb func);
        [ :ecore_evas_callback_hide_set, [ :pointer, :ecore_evas_event_cb ], :void ],
        # EAPI void ecore_evas_callback_delete_request_set(Ecore_Evas *ee, Ecore_Evas_Event_Cb func);
        [ :ecore_evas_callback_delete_request_set, [ :pointer, :ecore_evas_event_cb ], :void ],
        # EAPI void ecore_evas_callback_destroy_set(Ecore_Evas *ee, Ecore_Evas_Event_Cb func);
        [ :ecore_evas_callback_destroy_set, [ :pointer, :ecore_evas_event_cb ], :void ],
        # EAPI void ecore_evas_callback_focus_in_set(Ecore_Evas *ee, Ecore_Evas_Event_Cb func);
        [ :ecore_evas_callback_focus_in_set, [ :pointer, :ecore_evas_event_cb ], :void ],
        # EAPI void ecore_evas_callback_focus_out_set(Ecore_Evas *ee, Ecore_Evas_Event_Cb func);
        [ :ecore_evas_callback_focus_out_set, [ :pointer, :ecore_evas_event_cb ], :void ],
        # EAPI void ecore_evas_callback_sticky_set(Ecore_Evas *ee, Ecore_Evas_Event_Cb func);
        [ :ecore_evas_callback_sticky_set, [ :pointer, :ecore_evas_event_cb ], :void ],
        # EAPI void ecore_evas_callback_unsticky_set(Ecore_Evas *ee, Ecore_Evas_Event_Cb func);
        [ :ecore_evas_callback_unsticky_set, [ :pointer, :ecore_evas_event_cb ], :void ],
        # EAPI void ecore_evas_callback_mouse_in_set(Ecore_Evas *ee, Ecore_Evas_Event_Cb func);
        [ :ecore_evas_callback_mouse_in_set, [ :pointer, :ecore_evas_event_cb ], :void ],
        # EAPI void ecore_evas_callback_mouse_out_set(Ecore_Evas *ee, Ecore_Evas_Event_Cb func);
        [ :ecore_evas_callback_mouse_out_set, [ :pointer, :ecore_evas_event_cb ], :void ],
        # EAPI void ecore_evas_callback_pre_render_set(Ecore_Evas *ee, Ecore_Evas_Event_Cb func);
        [ :ecore_evas_callback_pre_render_set, [ :pointer, :ecore_evas_event_cb ], :void ],
        # EAPI void ecore_evas_callback_post_render_set(Ecore_Evas *ee, Ecore_Evas_Event_Cb func);
        [ :ecore_evas_callback_post_render_set, [ :pointer, :ecore_evas_event_cb ], :void ],
        # EAPI void ecore_evas_callback_pre_free_set(Ecore_Evas *ee, Ecore_Evas_Event_Cb func);
        [ :ecore_evas_callback_pre_free_set, [ :pointer, :ecore_evas_event_cb ], :void ],
        # EAPI Evas *ecore_evas_get(const Ecore_Evas *ee);
        [ :ecore_evas_get, [ :pointer ], :pointer ],
        # EAPI void ecore_evas_managed_move(Ecore_Evas *ee, int x, int y);
        [ :ecore_evas_managed_move, [ :pointer, :int, :int ], :void ],
        # EAPI void ecore_evas_shaped_set(Ecore_Evas *ee, Eina_Bool shaped);
        [ :ecore_evas_shaped_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_shaped_get(const Ecore_Evas *ee);
        [ :ecore_evas_shaped_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_show(Ecore_Evas *ee);
        [ :ecore_evas_show, [ :pointer ], :void ],
        # EAPI void ecore_evas_hide(Ecore_Evas *ee);
        [ :ecore_evas_hide, [ :pointer ], :void ],
        # EAPI void ecore_evas_activate(Ecore_Evas *ee);
        [ :ecore_evas_activate, [ :pointer ], :void ],
        # EAPI void ecore_evas_size_min_set(Ecore_Evas *ee, int w, int h);
        [ :ecore_evas_size_min_set, [ :pointer, :int, :int ], :void ],
        # EAPI void ecore_evas_size_min_get(const Ecore_Evas *ee, int *w, int *h);
        [ :ecore_evas_size_min_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void ecore_evas_size_max_set(Ecore_Evas *ee, int w, int h);
        [ :ecore_evas_size_max_set, [ :pointer, :int, :int ], :void ],
        # EAPI void ecore_evas_size_max_get(const Ecore_Evas *ee, int *w, int *h);
        [ :ecore_evas_size_max_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void ecore_evas_size_base_set(Ecore_Evas *ee, int w, int h);
        [ :ecore_evas_size_base_set, [ :pointer, :int, :int ], :void ],
        # EAPI void ecore_evas_size_base_get(const Ecore_Evas *ee, int *w, int *h);
        [ :ecore_evas_size_base_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void ecore_evas_size_step_set(Ecore_Evas *ee, int w, int h);
        [ :ecore_evas_size_step_set, [ :pointer, :int, :int ], :void ],
        # EAPI void ecore_evas_size_step_get(const Ecore_Evas *ee, int *w, int *h);
        [ :ecore_evas_size_step_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void ecore_evas_cursor_set(Ecore_Evas *ee, const char *file, int layer, int hot_x, int hot_y);
        [ :ecore_evas_cursor_set, [ :pointer, :string, :int, :int, :int ], :void ],
        # EAPI void ecore_evas_cursor_get(const Ecore_Evas *ee, Evas_Object **obj, int *layer, int *hot_x, int *hot_y);
        [ :ecore_evas_cursor_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void ecore_evas_object_cursor_set(Ecore_Evas *ee, Evas_Object *obj, int layer, int hot_x, int hot_y);
        [ :ecore_evas_object_cursor_set, [ :pointer, :pointer, :int, :int, :int ], :void ],
        # EAPI void ecore_evas_override_set(Ecore_Evas *ee, Eina_Bool on);
        [ :ecore_evas_override_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_override_get(const Ecore_Evas *ee);
        [ :ecore_evas_override_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_avoid_damage_set(Ecore_Evas *ee, Ecore_Evas_Avoid_Damage_Type on);
        [ :ecore_evas_avoid_damage_set, [ :pointer, :ecore_evas_avoid_damage_type ], :void ],
        # EAPI Ecore_Evas_Avoid_Damage_Type ecore_evas_avoid_damage_get(const Ecore_Evas *ee);
        [ :ecore_evas_avoid_damage_get, [ :pointer ], :ecore_evas_avoid_damage_type ],
        # EAPI void ecore_evas_withdrawn_set(Ecore_Evas *ee, Eina_Bool withdrawn);
        [ :ecore_evas_withdrawn_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_withdrawn_get(const Ecore_Evas *ee);
        [ :ecore_evas_withdrawn_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_sticky_set(Ecore_Evas *ee, Eina_Bool sticky);
        [ :ecore_evas_sticky_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_sticky_get(const Ecore_Evas *ee);
        [ :ecore_evas_sticky_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_manual_render_set(Ecore_Evas *ee, Eina_Bool manual_render);
        [ :ecore_evas_manual_render_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_manual_render_get(const Ecore_Evas *ee);
        [ :ecore_evas_manual_render_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_input_event_register(Ecore_Evas *ee);
        [ :ecore_evas_input_event_register, [ :pointer ], :void ],
        # EAPI void ecore_evas_input_event_unregister(Ecore_Evas *ee);
        [ :ecore_evas_input_event_unregister, [ :pointer ], :void ],
        # EAPI void ecore_evas_manual_render(Ecore_Evas *ee);
        [ :ecore_evas_manual_render, [ :pointer ], :void ],
        # EAPI void ecore_evas_comp_sync_set(Ecore_Evas *ee, Eina_Bool do_sync);
        [ :ecore_evas_comp_sync_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_comp_sync_get(const Ecore_Evas *ee);
        [ :ecore_evas_comp_sync_get, [ :pointer ], :eina_bool ],
        # EAPI void ecore_evas_screen_geometry_get(const Ecore_Evas *ee, int *x, int *y, int *w, int *h);
        [ :ecore_evas_screen_geometry_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void ecore_evas_draw_frame_set(Ecore_Evas *ee, Eina_Bool draw_frame);
        [ :ecore_evas_draw_frame_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_evas_draw_frame_get(const Ecore_Evas *ee);
        [ :ecore_evas_draw_frame_get, [ :pointer ], :eina_bool ],
        # EAPI Eina_Bool ecore_evas_object_associate(Ecore_Evas *ee, Evas_Object *obj, Ecore_Evas_Object_Associate_Flags flags);
        [ :ecore_evas_object_associate, [ :pointer, :pointer, :ecore_evas_object_associate_flags ], :eina_bool ],
        # EAPI Eina_Bool ecore_evas_object_dissociate(Ecore_Evas *ee, Evas_Object *obj);
        [ :ecore_evas_object_dissociate, [ :pointer, :pointer ], :eina_bool ],
        # EAPI Evas_Object *ecore_evas_object_associate_get(const Ecore_Evas *ee);
        [ :ecore_evas_object_associate_get, [ :pointer ], :pointer ],
        # EAPI unsigned char ecore_getopt_callback_ecore_evas_list_engines(const Ecore_Getopt *parser, const Ecore_Getopt_Desc *desc, const char *str, void *data, Ecore_Getopt_Value *storage);
        [ :ecore_getopt_callback_ecore_evas_list_engines, [ :pointer, :pointer, :string, :pointer, :pointer ], :uchar ],
        # EAPI Eina_List *ecore_evas_ecore_evas_list_get(void);
        [ :ecore_evas_ecore_evas_list_get, [  ], :pointer ],
        # EAPI void ecore_evas_x11_leader_set(Ecore_Evas *ee, Ecore_X_Window win);
        [ :ecore_evas_x11_leader_set, [ :pointer, :uint ], :void ],
        # EAPI Ecore_X_Window ecore_evas_x11_leader_get(Ecore_Evas *ee);
        [ :ecore_evas_x11_leader_get, [ :pointer ], :uint ],
        # EAPI void ecore_evas_x11_leader_default_set(Ecore_Evas *ee);
        [ :ecore_evas_x11_leader_default_set, [ :pointer ], :void ],
        # EAPI void ecore_evas_x11_shape_input_rectangle_set(Ecore_Evas *ee, int x, int y, int w, int h);
        [ :ecore_evas_x11_shape_input_rectangle_set, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void ecore_evas_x11_shape_input_rectangle_add(Ecore_Evas *ee, int x, int y, int w, int h);
        [ :ecore_evas_x11_shape_input_rectangle_add, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void ecore_evas_x11_shape_input_rectangle_subtract(Ecore_Evas *ee, int x, int y, int w, int h);
        [ :ecore_evas_x11_shape_input_rectangle_subtract, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void ecore_evas_x11_shape_input_empty(Ecore_Evas *ee);
        [ :ecore_evas_x11_shape_input_empty, [ :pointer ], :void ],
        # EAPI void ecore_evas_x11_shape_input_reset(Ecore_Evas *ee);
        [ :ecore_evas_x11_shape_input_reset, [ :pointer ], :void ],
        # EAPI void ecore_evas_x11_shape_input_apply(Ecore_Evas *ee);
        [ :ecore_evas_x11_shape_input_apply, [ :pointer ], :void ],
        # EAPI Eina_Bool ecore_evas_ews_engine_set(const char *engine, const char *options);
        [ :ecore_evas_ews_engine_set, [ :string, :string ], :eina_bool ],
        # EAPI Eina_Bool ecore_evas_ews_setup(int x, int y, int w, int h);
        [ :ecore_evas_ews_setup, [ :int, :int, :int, :int ], :eina_bool ],
        # EAPI Ecore_Evas *ecore_evas_ews_ecore_evas_get(void);
        [ :ecore_evas_ews_ecore_evas_get, [  ], :pointer ],
        # EAPI Evas *ecore_evas_ews_evas_get(void);
        [ :ecore_evas_ews_evas_get, [  ], :pointer ],
        # EAPI Evas_Object *ecore_evas_ews_background_get(void);
        [ :ecore_evas_ews_background_get, [  ], :pointer ],
        # EAPI void ecore_evas_ews_background_set(Evas_Object *o);
        [ :ecore_evas_ews_background_set, [ :pointer ], :void ],
        # EAPI const Eina_List *ecore_evas_ews_children_get(void);
        [ :ecore_evas_ews_children_get, [  ], :pointer ],
        # EAPI void ecore_evas_ews_manager_set(const void *manager);
        [ :ecore_evas_ews_manager_set, [ :pointer ], :void ],
        # EAPI const void *ecore_evas_ews_manager_get(void);
        [ :ecore_evas_ews_manager_get, [  ], :pointer ],
        # EAPI Ecore_Evas *ecore_evas_extn_socket_new(int w, int h);
        [ :ecore_evas_extn_socket_new, [ :int, :int ], :pointer ],
        # EAPI Eina_Bool ecore_evas_extn_socket_listen(Ecore_Evas *ee, const char *svcname, int svcnum, Eina_Bool svcsys);
        [ :ecore_evas_extn_socket_listen, [ :pointer, :string, :int, :eina_bool ], :eina_bool ],
        # EAPI void ecore_evas_extn_plug_object_data_lock(Evas_Object *obj);
        [ :ecore_evas_extn_plug_object_data_lock, [ :pointer ], :void ],
        # EAPI void ecore_evas_extn_plug_object_data_unlock(Evas_Object *obj);
        [ :ecore_evas_extn_plug_object_data_unlock, [ :pointer ], :void ],
        # EAPI Evas_Object *ecore_evas_extn_plug_new(Ecore_Evas *ee_target);
        [ :ecore_evas_extn_plug_new, [ :pointer ], :pointer ],
        # EAPI Eina_Bool ecore_evas_extn_plug_connect(Evas_Object *obj, const char *svcname, int svcnum, Eina_Bool svcsys);
        [ :ecore_evas_extn_plug_connect, [ :pointer, :string, :int, :eina_bool ], :eina_bool ],
        ]
        if RUBY_PLATFORM =~ /darwin/
            # EAPI Ecore_Evas *ecore_evas_cocoa_new(Ecore_Cocoa_Window *parent, int x, int y, int w, int h);
            fcts << [ :ecore_evas_cocoa_new, [ :string, :int, :int ], :ecore_evas_p ]
        end
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
