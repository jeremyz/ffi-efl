#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module Evas
        #
        FCT_PREFIX = 'evas_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'evas'
        #
        # ENUMS
        # typedef enum _Evas_BiDi_Direction {...} Evas_BiDi_Direction;
        enum :evas_bidi_direction, [ :evas_bidi_direction_natural, :evas_bidi_direction_neutral, :evas_bidi_direction_ltr, :evas_bidi_direction_rtl ]
        # typedef enum _Evas_Callback_Type {...} Evas_Callback_Type;
        enum :evas_callback_type, [ :evas_callback_mouse_in, :evas_callback_mouse_out, :evas_callback_mouse_down, :evas_callback_mouse_up,
            :evas_callback_mouse_move, :evas_callback_mouse_wheel, :evas_callback_multi_down, :evas_callback_multi_up, :evas_callback_multi_move,
            :evas_callback_free, :evas_callback_key_down, :evas_callback_key_up, :evas_callback_focus_in, :evas_callback_focus_out, :evas_callback_show,
            :evas_callback_hide, :evas_callback_move, :evas_callback_resize, :evas_callback_restack, :evas_callback_del, :evas_callback_hold,
            :evas_callback_changed_size_hints, :evas_callback_image_preloaded, :evas_callback_canvas_focus_in, :evas_callback_canvas_focus_out,
            :evas_callback_render_flush_pre, :evas_callback_render_flush_post, :evas_callback_canvas_object_focus_in, :evas_callback_canvas_object_focus_out,
            :evas_callback_image_unloaded, :evas_callback_render_pre, :evas_callback_render_post, :evas_callback_last ]
        # typedef enum _Evas_Button_Flags {...} Evas_Button_Flags;
        enum :evas_button_flags, [ :evas_button_none, 0, :evas_button_double_click, :evas_button_triple_click ]
        # typedef enum _Evas_Event_Flags {...} Evas_Event_Flags;
        enum :evas_event_flags, [ :evas_event_flag_none, 0, :evas_event_flag_on_hold, :evas_event_flag_on_scroll ]
        # typedef enum _Evas_Touch_Point_State {...} Evas_Touch_Point_State;
        enum :evas_touch_point_state, [ :evas_touch_point_down, :evas_touch_point_up, :evas_touch_point_move, :evas_touch_point_still,
            :evas_touch_point_cancel ]
        # typedef enum _Evas_Font_Hinting_Flags {...} Evas_Font_Hinting_Flags;
        enum :evas_font_hinting_flags, [ :evas_font_hinting_none, :evas_font_hinting_auto, :evas_font_hinting_bytecode ]
        # typedef enum _Evas_Colorspace {...} Evas_Colorspace;
        enum :evas_colorspace, [ :evas_colorspace_argb8888, :evas_colorspace_ycbcr422p601_pl, :evas_colorspace_ycbcr422p709_pl,
            :evas_colorspace_rgb565_a5p, :evas_colorspace_gry8, :evas_colorspace_ycbcr422601_pl, :evas_colorspace_ycbcr420nv12601_pl,
            :evas_colorspace_ycbcr420tm12601_pl ]
        # typedef enum _Evas_Object_Table_Homogeneous_Mode {...} Evas_Object_Table_Homogeneous_Mode;
        enum :evas_object_table_homogeneous_mode, [ :evas_object_table_homogeneous_none, 0, :evas_object_table_homogeneous_table, 1,
            :evas_object_table_homogeneous_item, 2 ]
        # typedef enum _Evas_Aspect_Control {...} Evas_Aspect_Control;
        enum :evas_aspect_control, [ :evas_aspect_control_none, 0, :evas_aspect_control_neither, 1, :evas_aspect_control_horizontal, 2,
            :evas_aspect_control_vertical, 3, :evas_aspect_control_both, 4 ]
        # typedef enum _Evas_Load_Error {...} Evas_Load_Error;
        enum :evas_load_error, [ :evas_load_error_none, 0, :evas_load_error_generic, 1, :evas_load_error_does_not_exist, 2,
            :evas_load_error_permission_denied, 3, :evas_load_error_resource_allocation_failed, 4, :evas_load_error_corrupt_file, 5,
            :evas_load_error_unknown_format, 6 ]
        # typedef enum _Evas_Alloc_Error {...} Evas_Alloc_Error;
        enum :evas_alloc_error, [ :evas_alloc_error_none, 0, :evas_alloc_error_fatal, 1, :evas_alloc_error_recovered, 2 ]
        # typedef enum _Evas_Fill_Spread {...} Evas_Fill_Spread;
        enum :evas_fill_spread, [ :evas_texture_reflect, 0, :evas_texture_repeat, 1, :evas_texture_restrict, 2, :evas_texture_restrict_reflect, 3,
            :evas_texture_restrict_repeat, 4, :evas_texture_pad, 5 ]
        # typedef enum _Evas_Pixel_Import_Pixel_Format {...} Evas_Pixel_Import_Pixel_Format;
        enum :evas_pixel_import_pixel_format, [ :evas_pixel_format_none, 0, :evas_pixel_format_argb32, 1, :evas_pixel_format_yuv420p_601, 2 ]
        # typedef enum _Evas_Native_Surface_Type {...} Evas_Native_Surface_Type;
        enum :evas_native_surface_type, [ :evas_native_surface_none, :evas_native_surface_x11, :evas_native_surface_opengl ]
        # typedef enum _Evas_Render_Op {...} Evas_Render_Op;
        enum :evas_render_op, [ :evas_render_blend, 0, :evas_render_blend_rel, 1, :evas_render_copy, 2, :evas_render_copy_rel, 3, :evas_render_add, 4,
            :evas_render_add_rel, 5, :evas_render_sub, 6, :evas_render_sub_rel, 7, :evas_render_tint, 8, :evas_render_tint_rel, 9, :evas_render_mask, 10,
            :evas_render_mul, 11 ]
        # typedef enum _Evas_Border_Fill_Mode {...} Evas_Border_Fill_Mode;
        enum :evas_border_fill_mode, [ :evas_border_fill_none, 0, :evas_border_fill_default, 1, :evas_border_fill_solid, 2 ]
        # typedef enum _Evas_Image_Scale_Hint {...} Evas_Image_Scale_Hint;
        enum :evas_image_scale_hint, [ :evas_image_scale_hint_none, 0, :evas_image_scale_hint_dynamic, 1, :evas_image_scale_hint_static, 2 ]
        # typedef enum _Evas_Image_Animated_Loop_Hint {...} Evas_Image_Animated_Loop_Hint;
        enum :evas_image_animated_loop_hint, [ :evas_image_animated_hint_none, 0, :evas_image_animated_hint_loop, 1,
            :evas_image_animated_hint_pingpong, 2 ]
        # typedef enum _Evas_Engine_Render_Mode {...} Evas_Engine_Render_Mode;
        enum :evas_engine_render_mode, [ :evas_render_mode_blocking, 0, :evas_render_mode_nonblocking, 1 ]
        # typedef enum _Evas_Image_Content_Hint {...} Evas_Image_Content_Hint;
        enum :evas_image_content_hint, [ :evas_image_content_hint_none, 0, :evas_image_content_hint_dynamic, 1, :evas_image_content_hint_static, 2 ]
        # typedef enum _Evas_Object_Pointer_Mode {...} Evas_Object_Pointer_Mode;
        enum :evas_object_pointer_mode, [ :evas_object_pointer_mode_autograb, :evas_object_pointer_mode_nograb,
            :evas_object_pointer_mode_nograb_no_repeat_updown ]
        # typedef enum _Evas_Text_Style_Type {...} Evas_Text_Style_Type;
        enum :evas_text_style_type, [ :evas_text_style_plain, :evas_text_style_shadow, :evas_text_style_outline, :evas_text_style_soft_outline,
            :evas_text_style_glow, :evas_text_style_outline_shadow, :evas_text_style_far_shadow, :evas_text_style_outline_soft_shadow,
            :evas_text_style_soft_shadow, :evas_text_style_far_soft_shadow, :evas_text_style_shadow_direction_bottom_right,
            :evas_text_style_shadow_direction_bottom, :evas_text_style_shadow_direction_bottom_left, :evas_text_style_shadow_direction_left,
            :evas_text_style_shadow_direction_top_left, :evas_text_style_shadow_direction_top, :evas_text_style_shadow_direction_top_right,
            :evas_text_style_shadow_direction_right ]
        # typedef enum _Evas_Textblock_Text_Type {...} Evas_Textblock_Text_Type;
        enum :evas_textblock_text_type, [ :evas_textblock_text_raw, :evas_textblock_text_plain, :evas_textblock_text_markup ]
        # typedef enum _Evas_Textblock_Cursor_Type {...} Evas_Textblock_Cursor_Type;
        enum :evas_textblock_cursor_type, [ :evas_textblock_cursor_under, :evas_textblock_cursor_before ]
        #
        # TYPEDEFS
        # typedef struct _Evas_Version Evas_Version;
        typedef :pointer, :evas_version
        # typedef short Evas_Callback_Priority;
        typedef :short, :evas_callback_priority
        # typedef struct _Evas_Coord_Rectangle Evas_Coord_Rectangle;
        typedef :pointer, :evas_coord_rectangle
        # typedef struct _Evas_Point Evas_Point;
        typedef :pointer, :evas_point
        # typedef struct _Evas_Coord_Point Evas_Coord_Point;
        typedef :pointer, :evas_coord_point
        # typedef struct _Evas_Coord_Precision_Point Evas_Coord_Precision_Point;
        typedef :pointer, :evas_coord_precision_point
        # typedef struct _Evas_Position Evas_Position;
        typedef :pointer, :evas_position
        # typedef struct _Evas_Precision_Position Evas_Precision_Position;
        typedef :pointer, :evas_precision_position
        # typedef struct _Evas_Smart_Class Evas_Smart_Class;
        typedef :pointer, :evas_smart_class
        # typedef struct _Evas_Smart_Cb_Description Evas_Smart_Cb_Description;
        typedef :pointer, :evas_smart_cb_description
        # typedef struct _Evas_Map Evas_Map;
        typedef :pointer, :evas_map
        # typedef struct _Evas Evas;
        typedef :pointer, :evas
        # typedef struct _Evas_Object Evas_Object;
        typedef :pointer, :evas_object
        # typedef void Evas_Performance;
        typedef :void, :evas_performance
        # typedef struct _Evas_Modifier Evas_Modifier;
        typedef :pointer, :evas_modifier
        # typedef struct _Evas_Lock Evas_Lock;
        typedef :pointer, :evas_lock
        # typedef struct _Evas_Smart Evas_Smart;
        typedef :pointer, :evas_smart
        # typedef struct _Evas_Native_Surface Evas_Native_Surface;
        typedef :pointer, :evas_native_surface
        # typedef struct _Evas_Video_Surface Evas_Video_Surface;
        typedef :pointer, :evas_video_surface
        # typedef unsigned long long Evas_Modifier_Mask;
        typedef :ulong_long, :evas_modifier_mask
        # typedef int Evas_Coord;
        typedef :int, :evas_coord
        # typedef int Evas_Font_Size;
        typedef :int, :evas_font_size
        # typedef int Evas_Angle;
        typedef :int, :evas_angle
        # typedef struct _Evas_Pixel_Import_Source Evas_Pixel_Import_Source;
        typedef :pointer, :evas_pixel_import_source
        # typedef struct _Evas_Engine_Info Evas_Engine_Info;
        typedef :pointer, :evas_engine_info
        # typedef struct _Evas_Device Evas_Device;
        typedef :pointer, :evas_device
        # typedef struct _Evas_Event_Mouse_Down Evas_Event_Mouse_Down;
        typedef :pointer, :evas_event_mouse_down
        # typedef struct _Evas_Event_Mouse_Up Evas_Event_Mouse_Up;
        typedef :pointer, :evas_event_mouse_up
        # typedef struct _Evas_Event_Mouse_In Evas_Event_Mouse_In;
        typedef :pointer, :evas_event_mouse_in
        # typedef struct _Evas_Event_Mouse_Out Evas_Event_Mouse_Out;
        typedef :pointer, :evas_event_mouse_out
        # typedef struct _Evas_Event_Mouse_Move Evas_Event_Mouse_Move;
        typedef :pointer, :evas_event_mouse_move
        # typedef struct _Evas_Event_Mouse_Wheel Evas_Event_Mouse_Wheel;
        typedef :pointer, :evas_event_mouse_wheel
        # typedef struct _Evas_Event_Multi_Down Evas_Event_Multi_Down;
        typedef :pointer, :evas_event_multi_down
        # typedef struct _Evas_Event_Multi_Up Evas_Event_Multi_Up;
        typedef :pointer, :evas_event_multi_up
        # typedef struct _Evas_Event_Multi_Move Evas_Event_Multi_Move;
        typedef :pointer, :evas_event_multi_move
        # typedef struct _Evas_Event_Key_Down Evas_Event_Key_Down;
        typedef :pointer, :evas_event_key_down
        # typedef struct _Evas_Event_Key_Up Evas_Event_Key_Up;
        typedef :pointer, :evas_event_key_up
        # typedef struct _Evas_Event_Hold Evas_Event_Hold;
        typedef :pointer, :evas_event_hold
        # typedef struct _Evas_Textblock_Style Evas_Textblock_Style;
        typedef :pointer, :evas_textblock_style
        # typedef struct _Evas_Textblock_Cursor Evas_Textblock_Cursor;
        typedef :pointer, :evas_textblock_cursor
        # typedef struct _Evas_Object_Textblock_Node_Format Evas_Object_Textblock_Node_Format;
        typedef :pointer, :evas_object_textblock_node_format
        # typedef struct _Evas_Textblock_Rectangle Evas_Textblock_Rectangle;
        typedef :pointer, :evas_textblock_rectangle
        # typedef struct _Evas_Object_Smart_Clipped_Data Evas_Object_Smart_Clipped_Data;
        typedef :pointer, :evas_object_smart_clipped_data
        # typedef struct _Evas_Object_Box_Api Evas_Object_Box_Api;
        typedef :pointer, :evas_object_box_api
        # typedef struct _Evas_Object_Box_Data Evas_Object_Box_Data;
        typedef :pointer, :evas_object_box_data
        # typedef struct _Evas_Object_Box_Option Evas_Object_Box_Option;
        typedef :pointer, :evas_object_box_option
        # typedef struct _Evas_Cserve_Stats Evas_Cserve_Stats;
        typedef :pointer, :evas_cserve_stats
        # typedef struct _Evas_Cserve_Image_Cache Evas_Cserve_Image_Cache;
        typedef :pointer, :evas_cserve_image_cache
        # typedef struct _Evas_Cserve_Image Evas_Cserve_Image;
        typedef :pointer, :evas_cserve_image
        # typedef struct _Evas_Cserve_Config Evas_Cserve_Config;
        typedef :pointer, :evas_cserve_config
        #
        # CALLBACKS
        # typedef void (*Evas_Video_Cb) (void *data, Evas_Object *obj, const Evas_Video_Surface *surface);
        callback :evas_video_cb, [ :pointer, :pointer, :pointer ], :void
        # typedef void (*Evas_Video_Coord_Cb) (void *data, Evas_Object *obj, const Evas_Video_Surface *surface, Evas_Coord a, Evas_Coord b);
        callback :evas_video_coord_cb, [ :pointer, :pointer, :pointer, :int, :int ], :void
        # typedef void (*Evas_Smart_Cb) (void *data, Evas_Object *obj, void *event_info);
        callback :evas_smart_cb, [ :pointer, :pointer, :pointer ], :void
        # typedef void (*Evas_Event_Cb) (void *data, Evas *e, void *event_info);
        callback :evas_event_cb, [ :pointer, :pointer, :pointer ], :void
        # typedef Eina_Bool (*Evas_Object_Event_Post_Cb) (void *data, Evas *e);
        callback :evas_object_event_post_cb, [ :pointer, :pointer ], :eina_bool
        # typedef void (*Evas_Object_Event_Cb) (void *data, Evas *e, Evas_Object *obj, void *event_info);
        callback :evas_object_event_cb, [ :pointer, :pointer, :pointer, :pointer ], :void
        # typedef void (*Evas_Async_Events_Put_Cb) (void *target, Evas_Callback_Type type, void *event_info);
        callback :evas_async_events_put_cb, [ :pointer, :evas_callback_type, :pointer ], :void
        # typedef void (*Evas_Object_Intercept_Show_Cb) (void *data, Evas_Object *obj);
        callback :evas_object_intercept_show_cb, [ :pointer, :pointer ], :void
        # typedef void (*Evas_Object_Intercept_Hide_Cb) (void *data, Evas_Object *obj);
        callback :evas_object_intercept_hide_cb, [ :pointer, :pointer ], :void
        # typedef void (*Evas_Object_Intercept_Move_Cb) (void *data, Evas_Object *obj, Evas_Coord x, Evas_Coord y);
        callback :evas_object_intercept_move_cb, [ :pointer, :pointer, :int, :int ], :void
        # typedef void (*Evas_Object_Intercept_Resize_Cb) (void *data, Evas_Object *obj, Evas_Coord w, Evas_Coord h);
        callback :evas_object_intercept_resize_cb, [ :pointer, :pointer, :int, :int ], :void
        # typedef void (*Evas_Object_Intercept_Raise_Cb) (void *data, Evas_Object *obj);
        callback :evas_object_intercept_raise_cb, [ :pointer, :pointer ], :void
        # typedef void (*Evas_Object_Intercept_Lower_Cb) (void *data, Evas_Object *obj);
        callback :evas_object_intercept_lower_cb, [ :pointer, :pointer ], :void
        # typedef void (*Evas_Object_Intercept_Stack_Above_Cb) (void *data, Evas_Object *obj, Evas_Object *above);
        callback :evas_object_intercept_stack_above_cb, [ :pointer, :pointer, :pointer ], :void
        # typedef void (*Evas_Object_Intercept_Stack_Below_Cb) (void *data, Evas_Object *obj, Evas_Object *above);
        callback :evas_object_intercept_stack_below_cb, [ :pointer, :pointer, :pointer ], :void
        # typedef void (*Evas_Object_Intercept_Layer_Set_Cb) (void *data, Evas_Object *obj, int l);
        callback :evas_object_intercept_layer_set_cb, [ :pointer, :pointer, :int ], :void
        # typedef void (*Evas_Object_Intercept_Color_Set_Cb) (void *data, Evas_Object *obj, int r, int g, int b, int a);
        callback :evas_object_intercept_color_set_cb, [ :pointer, :pointer, :int, :int, :int, :int ], :void
        # typedef void (*Evas_Object_Intercept_Clip_Set_Cb) (void *data, Evas_Object *obj, Evas_Object *clip);
        callback :evas_object_intercept_clip_set_cb, [ :pointer, :pointer, :pointer ], :void
        # typedef void (*Evas_Object_Intercept_Clip_Unset_Cb) (void *data, Evas_Object *obj);
        callback :evas_object_intercept_clip_unset_cb, [ :pointer, :pointer ], :void
        # typedef void (*Evas_Object_Image_Pixels_Get_Cb) (void *data, Evas_Object *o);
        callback :evas_object_image_pixels_get_cb, [ :pointer, :pointer ], :void
        # typedef void (*Evas_Object_Box_Layout) (Evas_Object *o, Evas_Object_Box_Data *priv, void *user_data);
        callback :evas_object_box_layout_cb, [ :pointer, :pointer, :pointer ], :void
        #
        # VARIABLES
        # EAPI extern Evas_Version *evas_version;
        attach_variable :evas_version, :pointer
        #
        # FUNCTIONS
        fcts = [
        # EAPI int evas_init (void);
        [ :evas_init, [  ], :int ],
        # EAPI int evas_shutdown (void);
        [ :evas_shutdown, [  ], :int ],
        # EAPI Evas_Alloc_Error evas_alloc_error (void);
        [ :evas_alloc_error, [  ], :evas_alloc_error ],
        # EAPI int evas_async_events_fd_get (void);
        [ :evas_async_events_fd_get, [  ], :int ],
        # EAPI int evas_async_events_process (void);
        [ :evas_async_events_process, [  ], :int ],
        # EAPI Eina_Bool evas_async_events_put (const void *target, Evas_Callback_Type type, void *event_info, Evas_Async_Events_Put_Cb func);
        [ :evas_async_events_put, [ :pointer, :evas_callback_type, :pointer, :evas_async_events_put_cb ], :eina_bool ],
        # EAPI Evas *evas_new (void);
        [ :evas_new, [  ], :pointer ],
        # EAPI void evas_free (Evas *e);
        [ :evas_free, [ :pointer ], :void ],
        # EAPI void evas_focus_in (Evas *e);
        [ :evas_focus_in, [ :pointer ], :void ],
        # EAPI void evas_focus_out (Evas *e);
        [ :evas_focus_out, [ :pointer ], :void ],
        # EAPI Eina_Bool evas_focus_state_get (const Evas *e);
        [ :evas_focus_state_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_nochange_push (Evas *e);
        [ :evas_nochange_push, [ :pointer ], :void ],
        # EAPI void evas_nochange_pop (Evas *e);
        [ :evas_nochange_pop, [ :pointer ], :void ],
        # EAPI void evas_data_attach_set (Evas *e, void *data);
        [ :evas_data_attach_set, [ :pointer, :pointer ], :void ],
        # EAPI void *evas_data_attach_get (const Evas *e);
        [ :evas_data_attach_get, [ :pointer ], :pointer ],
        # EAPI void evas_damage_rectangle_add (Evas *e, int x, int y, int w, int h);
        [ :evas_damage_rectangle_add, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_obscured_rectangle_add (Evas *e, int x, int y, int w, int h);
        [ :evas_obscured_rectangle_add, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_obscured_clear (Evas *e);
        [ :evas_obscured_clear, [ :pointer ], :void ],
        # EAPI Eina_List *evas_render_updates (Evas *e);
        [ :evas_render_updates, [ :pointer ], :pointer ],
        # EAPI void evas_render_updates_free (Eina_List *updates);
        [ :evas_render_updates_free, [ :pointer ], :void ],
        # EAPI void evas_render (Evas *e);
        [ :evas_render, [ :pointer ], :void ],
        # EAPI void evas_norender (Evas *e);
        [ :evas_norender, [ :pointer ], :void ],
        # EAPI void evas_render_idle_flush (Evas *e);
        [ :evas_render_idle_flush, [ :pointer ], :void ],
        # EAPI void evas_render_dump (Evas *e);
        [ :evas_render_dump, [ :pointer ], :void ],
        # EAPI int evas_render_method_lookup (const char *name);
        [ :evas_render_method_lookup, [ :string ], :int ],
        # EAPI Eina_List *evas_render_method_list (void);
        [ :evas_render_method_list, [  ], :pointer ],
        # EAPI void evas_render_method_list_free (Eina_List *list);
        [ :evas_render_method_list_free, [ :pointer ], :void ],
        # EAPI void evas_output_method_set (Evas *e, int render_method);
        [ :evas_output_method_set, [ :pointer, :int ], :void ],
        # EAPI int evas_output_method_get (const Evas *e);
        [ :evas_output_method_get, [ :pointer ], :int ],
        # EAPI Evas_Engine_Info *evas_engine_info_get (const Evas *e);
        [ :evas_engine_info_get, [ :pointer ], :pointer ],
        # EAPI Eina_Bool evas_engine_info_set (Evas *e, Evas_Engine_Info *info);
        [ :evas_engine_info_set, [ :pointer, :pointer ], :eina_bool ],
        # EAPI void evas_output_size_set (Evas *e, int w, int h);
        [ :evas_output_size_set, [ :pointer, :int, :int ], :void ],
        # EAPI void evas_output_size_get (const Evas *e, int *w, int *h);
        [ :evas_output_size_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_output_viewport_set (Evas *e, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h);
        [ :evas_output_viewport_set, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_output_viewport_get (const Evas *e, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        [ :evas_output_viewport_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_output_framespace_set (Evas *e, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h);
        [ :evas_output_framespace_set, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_output_framespace_get (const Evas *e, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        [ :evas_output_framespace_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI Evas_Coord evas_coord_screen_x_to_world (const Evas *e, int x);
        [ :evas_coord_screen_x_to_world, [ :pointer, :int ], :int ],
        # EAPI Evas_Coord evas_coord_screen_y_to_world (const Evas *e, int y);
        [ :evas_coord_screen_y_to_world, [ :pointer, :int ], :int ],
        # EAPI int evas_coord_world_x_to_screen (const Evas *e, Evas_Coord x);
        [ :evas_coord_world_x_to_screen, [ :pointer, :int ], :int ],
        # EAPI int evas_coord_world_y_to_screen (const Evas *e, Evas_Coord y);
        [ :evas_coord_world_y_to_screen, [ :pointer, :int ], :int ],
        # EAPI void evas_pointer_output_xy_get (const Evas *e, int *x, int *y);
        [ :evas_pointer_output_xy_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_pointer_canvas_xy_get (const Evas *e, Evas_Coord *x, Evas_Coord *y);
        [ :evas_pointer_canvas_xy_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI int evas_pointer_button_down_mask_get (const Evas *e);
        [ :evas_pointer_button_down_mask_get, [ :pointer ], :int ],
        # EAPI Eina_Bool evas_pointer_inside_get (const Evas *e);
        [ :evas_pointer_inside_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_sync(Evas *e);
        [ :evas_sync, [ :pointer ], :void ],
        # EAPI void evas_event_callback_add (Evas *e, Evas_Callback_Type type, Evas_Event_Cb func, const void *data);
        [ :evas_event_callback_add, [ :pointer, :evas_callback_type, :evas_event_cb, :pointer ], :void ],
        # EAPI void evas_event_callback_priority_add(Evas *e, Evas_Callback_Type type, Evas_Callback_Priority priority, Evas_Event_Cb func, const void *data);
        [ :evas_event_callback_priority_add, [ :pointer, :evas_callback_type, :short, :evas_event_cb, :pointer ], :void ],
        # EAPI void *evas_event_callback_del (Evas *e, Evas_Callback_Type type, Evas_Event_Cb func);
        [ :evas_event_callback_del, [ :pointer, :evas_callback_type, :evas_event_cb ], :pointer ],
        # EAPI void *evas_event_callback_del_full (Evas *e, Evas_Callback_Type type, Evas_Event_Cb func, const void *data);
        [ :evas_event_callback_del_full, [ :pointer, :evas_callback_type, :evas_event_cb, :pointer ], :pointer ],
        # EAPI void evas_post_event_callback_push (Evas *e, Evas_Object_Event_Post_Cb func, const void *data);
        [ :evas_post_event_callback_push, [ :pointer, :evas_object_event_post_cb, :pointer ], :void ],
        # EAPI void evas_post_event_callback_remove (Evas *e, Evas_Object_Event_Post_Cb func);
        [ :evas_post_event_callback_remove, [ :pointer, :evas_object_event_post_cb ], :void ],
        # EAPI void evas_post_event_callback_remove_full (Evas *e, Evas_Object_Event_Post_Cb func, const void *data);
        [ :evas_post_event_callback_remove_full, [ :pointer, :evas_object_event_post_cb, :pointer ], :void ],
        # EAPI void evas_event_default_flags_set (Evas *e, Evas_Event_Flags flags);
        [ :evas_event_default_flags_set, [ :pointer, :evas_event_flags ], :void ],
        # EAPI Evas_Event_Flags evas_event_default_flags_get (const Evas *e);
        [ :evas_event_default_flags_get, [ :pointer ], :evas_event_flags ],
        # EAPI void evas_event_freeze (Evas *e);
        [ :evas_event_freeze, [ :pointer ], :void ],
        # EAPI void evas_event_thaw (Evas *e);
        [ :evas_event_thaw, [ :pointer ], :void ],
        # EAPI int evas_event_freeze_get (const Evas *e);
        [ :evas_event_freeze_get, [ :pointer ], :int ],
        # EAPI void evas_event_thaw_eval (Evas *e);
        [ :evas_event_thaw_eval, [ :pointer ], :void ],
        # EAPI int evas_event_down_count_get (const Evas *e);
        [ :evas_event_down_count_get, [ :pointer ], :int ],
        # EAPI void evas_event_feed_mouse_down (Evas *e, int b, Evas_Button_Flags flags, unsigned int timestamp, const void *data);
        [ :evas_event_feed_mouse_down, [ :pointer, :int, :evas_button_flags, :uint, :pointer ], :void ],
        # EAPI void evas_event_feed_mouse_up (Evas *e, int b, Evas_Button_Flags flags, unsigned int timestamp, const void *data);
        [ :evas_event_feed_mouse_up, [ :pointer, :int, :evas_button_flags, :uint, :pointer ], :void ],
        # EAPI void evas_event_feed_mouse_move (Evas *e, int x, int y, unsigned int timestamp, const void *data);
        [ :evas_event_feed_mouse_move, [ :pointer, :int, :int, :uint, :pointer ], :void ],
        # EAPI void evas_event_feed_mouse_in (Evas *e, unsigned int timestamp, const void *data);
        [ :evas_event_feed_mouse_in, [ :pointer, :uint, :pointer ], :void ],
        # EAPI void evas_event_feed_mouse_out (Evas *e, unsigned int timestamp, const void *data);
        [ :evas_event_feed_mouse_out, [ :pointer, :uint, :pointer ], :void ],
        # EAPI void evas_event_feed_multi_down (Evas *e, int d, int x, int y, double rad, double radx, double rady, double pres, double ang, double fx, double fy, Evas_Button_Flags flags, unsigned int timestamp, const void *data);
        [ :evas_event_feed_multi_down, [ :pointer, :int, :int, :int, :double, :double, :double, :double, :double, :double, :double,
            :evas_button_flags, :uint, :pointer ], :void ],
        # EAPI void evas_event_feed_multi_up (Evas *e, int d, int x, int y, double rad, double radx, double rady, double pres, double ang, double fx, double fy, Evas_Button_Flags flags, unsigned int timestamp, const void *data);
        [ :evas_event_feed_multi_up, [ :pointer, :int, :int, :int, :double, :double, :double, :double, :double, :double, :double, :evas_button_flags,
            :uint, :pointer ], :void ],
        # EAPI void evas_event_feed_multi_move (Evas *e, int d, int x, int y, double rad, double radx, double rady, double pres, double ang, double fx, double fy, unsigned int timestamp, const void *data);
        [ :evas_event_feed_multi_move, [ :pointer, :int, :int, :int, :double, :double, :double, :double, :double, :double, :double, :uint, :pointer ],
            :void ],
        # EAPI void evas_event_feed_mouse_cancel (Evas *e, unsigned int timestamp, const void *data);
        [ :evas_event_feed_mouse_cancel, [ :pointer, :uint, :pointer ], :void ],
        # EAPI void evas_event_feed_mouse_wheel (Evas *e, int direction, int z, unsigned int timestamp, const void *data);
        [ :evas_event_feed_mouse_wheel, [ :pointer, :int, :int, :uint, :pointer ], :void ],
        # EAPI void evas_event_feed_key_down (Evas *e, const char *keyname, const char *key, const char *string, const char *compose, unsigned int timestamp, const void *data);
        [ :evas_event_feed_key_down, [ :pointer, :string, :string, :string, :string, :uint, :pointer ], :void ],
        # EAPI void evas_event_feed_key_up (Evas *e, const char *keyname, const char *key, const char *string, const char *compose, unsigned int timestamp, const void *data);
        [ :evas_event_feed_key_up, [ :pointer, :string, :string, :string, :string, :uint, :pointer ], :void ],
        # EAPI void evas_event_feed_hold (Evas *e, int hold, unsigned int timestamp, const void *data);
        [ :evas_event_feed_hold, [ :pointer, :int, :uint, :pointer ], :void ],
        # EAPI void evas_event_refeed_event (Evas *e, void *event_copy, Evas_Callback_Type event_type);
        [ :evas_event_refeed_event, [ :pointer, :pointer, :evas_callback_type ], :void ],
        # EAPI void evas_image_cache_flush (Evas *e);
        [ :evas_image_cache_flush, [ :pointer ], :void ],
        # EAPI void evas_image_cache_reload (Evas *e);
        [ :evas_image_cache_reload, [ :pointer ], :void ],
        # EAPI void evas_image_cache_set (Evas *e, int size);
        [ :evas_image_cache_set, [ :pointer, :int ], :void ],
        # EAPI int evas_image_cache_get (const Evas *e);
        [ :evas_image_cache_get, [ :pointer ], :int ],
        # EAPI Eina_Bool evas_image_max_size_get (const Evas *e, int *maxw, int *maxh);
        [ :evas_image_max_size_get, [ :pointer, :pointer, :pointer ], :eina_bool ],
        # EAPI void evas_font_hinting_set (Evas *e, Evas_Font_Hinting_Flags hinting);
        [ :evas_font_hinting_set, [ :pointer, :evas_font_hinting_flags ], :void ],
        # EAPI Evas_Font_Hinting_Flags evas_font_hinting_get (const Evas *e);
        [ :evas_font_hinting_get, [ :pointer ], :evas_font_hinting_flags ],
        # EAPI Eina_Bool evas_font_hinting_can_hint (const Evas *e, Evas_Font_Hinting_Flags hinting);
        [ :evas_font_hinting_can_hint, [ :pointer, :evas_font_hinting_flags ], :eina_bool ],
        # EAPI void evas_font_cache_flush (Evas *e);
        [ :evas_font_cache_flush, [ :pointer ], :void ],
        # EAPI void evas_font_cache_set (Evas *e, int size);
        [ :evas_font_cache_set, [ :pointer, :int ], :void ],
        # EAPI int evas_font_cache_get (const Evas *e);
        [ :evas_font_cache_get, [ :pointer ], :int ],
        # EAPI Eina_List *evas_font_available_list (const Evas *e);
        [ :evas_font_available_list, [ :pointer ], :pointer ],
        # EAPI void evas_font_available_list_free(Evas *e, Eina_List *available);
        [ :evas_font_available_list_free, [ :pointer, :pointer ], :void ],
        # EAPI void evas_font_path_clear (Evas *e);
        [ :evas_font_path_clear, [ :pointer ], :void ],
        # EAPI void evas_font_path_append (Evas *e, const char *path);
        [ :evas_font_path_append, [ :pointer, :string ], :void ],
        # EAPI void evas_font_path_prepend (Evas *e, const char *path);
        [ :evas_font_path_prepend, [ :pointer, :string ], :void ],
        # EAPI const Eina_List *evas_font_path_list (const Evas *e);
        [ :evas_font_path_list, [ :pointer ], :pointer ],
        # EAPI void evas_object_clip_set (Evas_Object *obj, Evas_Object *clip);
        [ :evas_object_clip_set, [ :pointer, :pointer ], :void ],
        # EAPI Evas_Object *evas_object_clip_get (const Evas_Object *obj);
        [ :evas_object_clip_get, [ :pointer ], :pointer ],
        # EAPI void evas_object_clip_unset (Evas_Object *obj);
        [ :evas_object_clip_unset, [ :pointer ], :void ],
        # EAPI const Eina_List *evas_object_clipees_get (const Evas_Object *obj);
        [ :evas_object_clipees_get, [ :pointer ], :pointer ],
        # EAPI void evas_object_focus_set (Evas_Object *obj, Eina_Bool focus);
        [ :evas_object_focus_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_focus_get (const Evas_Object *obj);
        [ :evas_object_focus_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_layer_set (Evas_Object *obj, short l);
        [ :evas_object_layer_set, [ :pointer, :short ], :void ],
        # EAPI short evas_object_layer_get (const Evas_Object *obj);
        [ :evas_object_layer_get, [ :pointer ], :short ],
        # EAPI void evas_object_name_set (Evas_Object *obj, const char *name);
        [ :evas_object_name_set, [ :pointer, :string ], :void ],
        # EAPI const char *evas_object_name_get (const Evas_Object *obj);
        [ :evas_object_name_get, [ :pointer ], :string ],
        # EAPI void evas_object_ref (Evas_Object *obj);
        [ :evas_object_ref, [ :pointer ], :void ],
        # EAPI void evas_object_unref (Evas_Object *obj);
        [ :evas_object_unref, [ :pointer ], :void ],
        # EAPI void evas_object_del (Evas_Object *obj);
        [ :evas_object_del, [ :pointer ], :void ],
        # EAPI void evas_object_move (Evas_Object *obj, Evas_Coord x, Evas_Coord y);
        [ :evas_object_move, [ :pointer, :int, :int ], :void ],
        # EAPI void evas_object_resize (Evas_Object *obj, Evas_Coord w, Evas_Coord h);
        [ :evas_object_resize, [ :pointer, :int, :int ], :void ],
        # EAPI void evas_object_geometry_get (const Evas_Object *obj, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        [ :evas_object_geometry_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_show (Evas_Object *obj);
        [ :evas_object_show, [ :pointer ], :void ],
        # EAPI void evas_object_hide (Evas_Object *obj);
        [ :evas_object_hide, [ :pointer ], :void ],
        # EAPI Eina_Bool evas_object_visible_get (const Evas_Object *obj);
        [ :evas_object_visible_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_color_set (Evas_Object *obj, int r, int g, int b, int a);
        [ :evas_object_color_set, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_object_color_get (const Evas_Object *obj, int *r, int *g, int *b, int *a);
        [ :evas_object_color_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI Evas *evas_object_evas_get (const Evas_Object *obj);
        [ :evas_object_evas_get, [ :pointer ], :pointer ],
        # EAPI const char *evas_object_type_get (const Evas_Object *obj);
        [ :evas_object_type_get, [ :pointer ], :string ],
        # EAPI void evas_object_raise (Evas_Object *obj);
        [ :evas_object_raise, [ :pointer ], :void ],
        # EAPI void evas_object_lower (Evas_Object *obj);
        [ :evas_object_lower, [ :pointer ], :void ],
        # EAPI void evas_object_stack_above (Evas_Object *obj, Evas_Object *above);
        [ :evas_object_stack_above, [ :pointer, :pointer ], :void ],
        # EAPI void evas_object_stack_below (Evas_Object *obj, Evas_Object *below);
        [ :evas_object_stack_below, [ :pointer, :pointer ], :void ],
        # EAPI Evas_Object *evas_object_above_get (const Evas_Object *obj);
        [ :evas_object_above_get, [ :pointer ], :pointer ],
        # EAPI Evas_Object *evas_object_below_get (const Evas_Object *obj);
        [ :evas_object_below_get, [ :pointer ], :pointer ],
        # EAPI void evas_object_event_callback_add (Evas_Object *obj, Evas_Callback_Type type, Evas_Object_Event_Cb func, const void *data);
        [ :evas_object_event_callback_add, [ :pointer, :evas_callback_type, :evas_object_event_cb, :pointer ], :void ],
        # EAPI void evas_object_event_callback_priority_add(Evas_Object *obj, Evas_Callback_Type type, Evas_Callback_Priority priority, Evas_Object_Event_Cb func, const void *data);
        [ :evas_object_event_callback_priority_add, [ :pointer, :evas_callback_type, :short, :evas_object_event_cb, :pointer ], :void ],
        # EAPI void *evas_object_event_callback_del (Evas_Object *obj, Evas_Callback_Type type, Evas_Object_Event_Cb func);
        [ :evas_object_event_callback_del, [ :pointer, :evas_callback_type, :evas_object_event_cb ], :pointer ],
        # EAPI void *evas_object_event_callback_del_full(Evas_Object *obj, Evas_Callback_Type type, Evas_Object_Event_Cb func, const void *data);
        [ :evas_object_event_callback_del_full, [ :pointer, :evas_callback_type, :evas_object_event_cb, :pointer ], :pointer ],
        # EAPI void evas_object_pass_events_set (Evas_Object *obj, Eina_Bool pass);
        [ :evas_object_pass_events_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_pass_events_get (const Evas_Object *obj);
        [ :evas_object_pass_events_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_repeat_events_set (Evas_Object *obj, Eina_Bool repeat);
        [ :evas_object_repeat_events_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_repeat_events_get (const Evas_Object *obj);
        [ :evas_object_repeat_events_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_propagate_events_set (Evas_Object *obj, Eina_Bool prop);
        [ :evas_object_propagate_events_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_propagate_events_get (const Evas_Object *obj);
        [ :evas_object_propagate_events_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_freeze_events_set(Evas_Object *obj, Eina_Bool freeze);
        [ :evas_object_freeze_events_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_freeze_events_get(const Evas_Object *obj);
        [ :evas_object_freeze_events_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_map_enable_set (Evas_Object *obj, Eina_Bool enabled);
        [ :evas_object_map_enable_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_map_enable_get (const Evas_Object *obj);
        [ :evas_object_map_enable_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_map_source_set (Evas_Object *obj, Evas_Object *src);
        [ :evas_object_map_source_set, [ :pointer, :pointer ], :void ],
        # EAPI Evas_Object *evas_object_map_source_get (const Evas_Object *obj);
        [ :evas_object_map_source_get, [ :pointer ], :pointer ],
        # EAPI void evas_object_map_set (Evas_Object *obj, const Evas_Map *map);
        [ :evas_object_map_set, [ :pointer, :pointer ], :void ],
        # EAPI const Evas_Map *evas_object_map_get (const Evas_Object *obj);
        [ :evas_object_map_get, [ :pointer ], :pointer ],
        # EAPI void evas_map_util_points_populate_from_object_full(Evas_Map *m, const Evas_Object *obj, Evas_Coord z);
        [ :evas_map_util_points_populate_from_object_full, [ :pointer, :pointer, :int ], :void ],
        # EAPI void evas_map_util_points_populate_from_object (Evas_Map *m, const Evas_Object *obj);
        [ :evas_map_util_points_populate_from_object, [ :pointer, :pointer ], :void ],
        # EAPI void evas_map_util_points_populate_from_geometry (Evas_Map *m, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h, Evas_Coord z);
        [ :evas_map_util_points_populate_from_geometry, [ :pointer, :int, :int, :int, :int, :int ], :void ],
        # EAPI void evas_map_util_points_color_set (Evas_Map *m, int r, int g, int b, int a);
        [ :evas_map_util_points_color_set, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_map_util_rotate (Evas_Map *m, double degrees, Evas_Coord cx, Evas_Coord cy);
        [ :evas_map_util_rotate, [ :pointer, :double, :int, :int ], :void ],
        # EAPI void evas_map_util_zoom (Evas_Map *m, double zoomx, double zoomy, Evas_Coord cx, Evas_Coord cy);
        [ :evas_map_util_zoom, [ :pointer, :double, :double, :int, :int ], :void ],
        # EAPI void evas_map_util_3d_rotate (Evas_Map *m, double dx, double dy, double dz, Evas_Coord cx, Evas_Coord cy, Evas_Coord cz);
        [ :evas_map_util_3d_rotate, [ :pointer, :double, :double, :double, :int, :int, :int ], :void ],
        # EAPI void evas_map_util_3d_lighting (Evas_Map *m, Evas_Coord lx, Evas_Coord ly, Evas_Coord lz, int lr, int lg, int lb, int ar, int ag, int ab);
        [ :evas_map_util_3d_lighting, [ :pointer, :int, :int, :int, :int, :int, :int, :int, :int, :int ], :void ],
        # EAPI void evas_map_util_3d_perspective (Evas_Map *m, Evas_Coord px, Evas_Coord py, Evas_Coord z0, Evas_Coord foc);
        [ :evas_map_util_3d_perspective, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI Eina_Bool evas_map_util_clockwise_get (Evas_Map *m);
        [ :evas_map_util_clockwise_get, [ :pointer ], :eina_bool ],
        # EAPI Evas_Map *evas_map_new (int count);
        [ :evas_map_new, [ :int ], :pointer ],
        # EAPI void evas_map_smooth_set (Evas_Map *m, Eina_Bool enabled);
        [ :evas_map_smooth_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_map_smooth_get (const Evas_Map *m);
        [ :evas_map_smooth_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_map_alpha_set (Evas_Map *m, Eina_Bool enabled);
        [ :evas_map_alpha_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_map_alpha_get (const Evas_Map *m);
        [ :evas_map_alpha_get, [ :pointer ], :eina_bool ],
        # EAPI Evas_Map *evas_map_dup (const Evas_Map *m);
        [ :evas_map_dup, [ :pointer ], :pointer ],
        # EAPI void evas_map_free (Evas_Map *m);
        [ :evas_map_free, [ :pointer ], :void ],
        # EAPI int evas_map_count_get (const Evas_Map *m);
        [ :evas_map_count_get, [ :pointer ], :int ],
        # EAPI void evas_map_point_coord_set (Evas_Map *m, int idx, Evas_Coord x, Evas_Coord y, Evas_Coord z);
        [ :evas_map_point_coord_set, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_map_point_coord_get (const Evas_Map *m, int idx, Evas_Coord *x, Evas_Coord *y, Evas_Coord *z);
        [ :evas_map_point_coord_get, [ :pointer, :int, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_map_point_image_uv_set (Evas_Map *m, int idx, double u, double v);
        [ :evas_map_point_image_uv_set, [ :pointer, :int, :double, :double ], :void ],
        # EAPI void evas_map_point_image_uv_get (const Evas_Map *m, int idx, double *u, double *v);
        [ :evas_map_point_image_uv_get, [ :pointer, :int, :pointer, :pointer ], :void ],
        # EAPI void evas_map_point_color_set (Evas_Map *m, int idx, int r, int g, int b, int a);
        [ :evas_map_point_color_set, [ :pointer, :int, :int, :int, :int, :int ], :void ],
        # EAPI void evas_map_point_color_get (const Evas_Map *m, int idx, int *r, int *g, int *b, int *a);
        [ :evas_map_point_color_get, [ :pointer, :int, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_size_hint_min_get (const Evas_Object *obj, Evas_Coord *w, Evas_Coord *h);
        [ :evas_object_size_hint_min_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_size_hint_min_set (Evas_Object *obj, Evas_Coord w, Evas_Coord h);
        [ :evas_object_size_hint_min_set, [ :pointer, :int, :int ], :void ],
        # EAPI void evas_object_size_hint_max_get (const Evas_Object *obj, Evas_Coord *w, Evas_Coord *h);
        [ :evas_object_size_hint_max_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_size_hint_max_set (Evas_Object *obj, Evas_Coord w, Evas_Coord h);
        [ :evas_object_size_hint_max_set, [ :pointer, :int, :int ], :void ],
        # EAPI void evas_object_size_hint_request_get (const Evas_Object *obj, Evas_Coord *w, Evas_Coord *h);
        [ :evas_object_size_hint_request_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_size_hint_request_set (Evas_Object *obj, Evas_Coord w, Evas_Coord h);
        [ :evas_object_size_hint_request_set, [ :pointer, :int, :int ], :void ],
        # EAPI void evas_object_size_hint_aspect_get (const Evas_Object *obj, Evas_Aspect_Control *aspect, Evas_Coord *w, Evas_Coord *h);
        [ :evas_object_size_hint_aspect_get, [ :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_size_hint_aspect_set (Evas_Object *obj, Evas_Aspect_Control aspect, Evas_Coord w, Evas_Coord h);
        [ :evas_object_size_hint_aspect_set, [ :pointer, :evas_aspect_control, :int, :int ], :void ],
        # EAPI void evas_object_size_hint_align_get (const Evas_Object *obj, double *x, double *y);
        [ :evas_object_size_hint_align_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_size_hint_align_set (Evas_Object *obj, double x, double y);
        [ :evas_object_size_hint_align_set, [ :pointer, :double, :double ], :void ],
        # EAPI void evas_object_size_hint_weight_get (const Evas_Object *obj, double *x, double *y);
        [ :evas_object_size_hint_weight_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_size_hint_weight_set (Evas_Object *obj, double x, double y);
        [ :evas_object_size_hint_weight_set, [ :pointer, :double, :double ], :void ],
        # EAPI void evas_object_size_hint_padding_get (const Evas_Object *obj, Evas_Coord *l, Evas_Coord *r, Evas_Coord *t, Evas_Coord *b);
        [ :evas_object_size_hint_padding_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_size_hint_padding_set (Evas_Object *obj, Evas_Coord l, Evas_Coord r, Evas_Coord t, Evas_Coord b);
        [ :evas_object_size_hint_padding_set, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_object_data_set (Evas_Object *obj, const char *key, const void *data);
        [ :evas_object_data_set, [ :pointer, :string, :pointer ], :void ],
        # EAPI void *evas_object_data_get (const Evas_Object *obj, const char *key);
        [ :evas_object_data_get, [ :pointer, :string ], :pointer ],
        # EAPI void *evas_object_data_del (Evas_Object *obj, const char *key);
        [ :evas_object_data_del, [ :pointer, :string ], :pointer ],
        # EAPI void evas_object_pointer_mode_set (Evas_Object *obj, Evas_Object_Pointer_Mode setting);
        [ :evas_object_pointer_mode_set, [ :pointer, :evas_object_pointer_mode ], :void ],
        # EAPI Evas_Object_Pointer_Mode evas_object_pointer_mode_get (const Evas_Object *obj);
        [ :evas_object_pointer_mode_get, [ :pointer ], :evas_object_pointer_mode ],
        # EAPI void evas_object_anti_alias_set (Evas_Object *obj, Eina_Bool antialias);
        [ :evas_object_anti_alias_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_anti_alias_get (const Evas_Object *obj);
        [ :evas_object_anti_alias_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_scale_set (Evas_Object *obj, double scale);
        [ :evas_object_scale_set, [ :pointer, :double ], :void ],
        # EAPI double evas_object_scale_get (const Evas_Object *obj);
        [ :evas_object_scale_get, [ :pointer ], :double ],
        # EAPI void evas_object_render_op_set (Evas_Object *obj, Evas_Render_Op op);
        [ :evas_object_render_op_set, [ :pointer, :evas_render_op ], :void ],
        # EAPI Evas_Render_Op evas_object_render_op_get (const Evas_Object *obj);
        [ :evas_object_render_op_get, [ :pointer ], :evas_render_op ],
        # EAPI void evas_object_precise_is_inside_set(Evas_Object *obj, Eina_Bool precise);
        [ :evas_object_precise_is_inside_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_precise_is_inside_get(const Evas_Object *obj);
        [ :evas_object_precise_is_inside_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_static_clip_set (Evas_Object *obj, Eina_Bool is_static_clip);
        [ :evas_object_static_clip_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_static_clip_get (const Evas_Object *obj);
        [ :evas_object_static_clip_get, [ :pointer ], :eina_bool ],
        # EAPI Evas_Object *evas_focus_get (const Evas *e);
        [ :evas_focus_get, [ :pointer ], :pointer ],
        # EAPI Evas_Object *evas_object_name_find (const Evas *e, const char *name);
        [ :evas_object_name_find, [ :pointer, :string ], :pointer ],
        # EAPI Evas_Object *evas_object_name_child_find (const Evas_Object *obj, const char *name, int recurse);
        [ :evas_object_name_child_find, [ :pointer, :string, :int ], :pointer ],
        # EAPI Evas_Object *evas_object_top_at_xy_get (const Evas *e, Evas_Coord x, Evas_Coord y, Eina_Bool include_pass_events_objects, Eina_Bool include_hidden_objects);
        [ :evas_object_top_at_xy_get, [ :pointer, :int, :int, :eina_bool, :eina_bool ], :pointer ],
        # EAPI Evas_Object *evas_object_top_at_pointer_get (const Evas *e);
        [ :evas_object_top_at_pointer_get, [ :pointer ], :pointer ],
        # EAPI Evas_Object *evas_object_top_in_rectangle_get (const Evas *e, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h, Eina_Bool include_pass_events_objects, Eina_Bool include_hidden_objects);
        [ :evas_object_top_in_rectangle_get, [ :pointer, :int, :int, :int, :int, :eina_bool, :eina_bool ], :pointer ],
        # EAPI Eina_List *evas_objects_at_xy_get (const Evas *e, Evas_Coord x, Evas_Coord y, Eina_Bool include_pass_events_objects, Eina_Bool include_hidden_objects);
        [ :evas_objects_at_xy_get, [ :pointer, :int, :int, :eina_bool, :eina_bool ], :pointer ],
        # EAPI Eina_List *evas_objects_in_rectangle_get (const Evas *e, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h, Eina_Bool include_pass_events_objects, Eina_Bool include_hidden_objects);
        [ :evas_objects_in_rectangle_get, [ :pointer, :int, :int, :int, :int, :eina_bool, :eina_bool ], :pointer ],
        # EAPI Evas_Object *evas_object_bottom_get (const Evas *e);
        [ :evas_object_bottom_get, [ :pointer ], :pointer ],
        # EAPI Evas_Object *evas_object_top_get (const Evas *e);
        [ :evas_object_top_get, [ :pointer ], :pointer ],
        # EAPI void evas_object_intercept_show_callback_add (Evas_Object *obj, Evas_Object_Intercept_Show_Cb func, const void *data);
        [ :evas_object_intercept_show_callback_add, [ :pointer, :evas_object_intercept_show_cb, :pointer ], :void ],
        # EAPI void *evas_object_intercept_show_callback_del (Evas_Object *obj, Evas_Object_Intercept_Show_Cb func);
        [ :evas_object_intercept_show_callback_del, [ :pointer, :evas_object_intercept_show_cb ], :pointer ],
        # EAPI void evas_object_intercept_hide_callback_add (Evas_Object *obj, Evas_Object_Intercept_Hide_Cb func, const void *data);
        [ :evas_object_intercept_hide_callback_add, [ :pointer, :evas_object_intercept_hide_cb, :pointer ], :void ],
        # EAPI void *evas_object_intercept_hide_callback_del (Evas_Object *obj, Evas_Object_Intercept_Hide_Cb func);
        [ :evas_object_intercept_hide_callback_del, [ :pointer, :evas_object_intercept_hide_cb ], :pointer ],
        # EAPI void evas_object_intercept_move_callback_add (Evas_Object *obj, Evas_Object_Intercept_Move_Cb func, const void *data);
        [ :evas_object_intercept_move_callback_add, [ :pointer, :evas_object_intercept_move_cb, :pointer ], :void ],
        # EAPI void *evas_object_intercept_move_callback_del (Evas_Object *obj, Evas_Object_Intercept_Move_Cb func);
        [ :evas_object_intercept_move_callback_del, [ :pointer, :evas_object_intercept_move_cb ], :pointer ],
        # EAPI void evas_object_intercept_resize_callback_add (Evas_Object *obj, Evas_Object_Intercept_Resize_Cb func, const void *data);
        [ :evas_object_intercept_resize_callback_add, [ :pointer, :evas_object_intercept_resize_cb, :pointer ], :void ],
        # EAPI void *evas_object_intercept_resize_callback_del (Evas_Object *obj, Evas_Object_Intercept_Resize_Cb func);
        [ :evas_object_intercept_resize_callback_del, [ :pointer, :evas_object_intercept_resize_cb ], :pointer ],
        # EAPI void evas_object_intercept_raise_callback_add (Evas_Object *obj, Evas_Object_Intercept_Raise_Cb func, const void *data);
        [ :evas_object_intercept_raise_callback_add, [ :pointer, :evas_object_intercept_raise_cb, :pointer ], :void ],
        # EAPI void *evas_object_intercept_raise_callback_del (Evas_Object *obj, Evas_Object_Intercept_Raise_Cb func);
        [ :evas_object_intercept_raise_callback_del, [ :pointer, :evas_object_intercept_raise_cb ], :pointer ],
        # EAPI void evas_object_intercept_lower_callback_add (Evas_Object *obj, Evas_Object_Intercept_Lower_Cb func, const void *data);
        [ :evas_object_intercept_lower_callback_add, [ :pointer, :evas_object_intercept_lower_cb, :pointer ], :void ],
        # EAPI void *evas_object_intercept_lower_callback_del (Evas_Object *obj, Evas_Object_Intercept_Lower_Cb func);
        [ :evas_object_intercept_lower_callback_del, [ :pointer, :evas_object_intercept_lower_cb ], :pointer ],
        # EAPI void evas_object_intercept_stack_above_callback_add (Evas_Object *obj, Evas_Object_Intercept_Stack_Above_Cb func, const void *data);
        [ :evas_object_intercept_stack_above_callback_add, [ :pointer, :evas_object_intercept_stack_above_cb, :pointer ], :void ],
        # EAPI void *evas_object_intercept_stack_above_callback_del (Evas_Object *obj, Evas_Object_Intercept_Stack_Above_Cb func);
        [ :evas_object_intercept_stack_above_callback_del, [ :pointer, :evas_object_intercept_stack_above_cb ], :pointer ],
        # EAPI void evas_object_intercept_stack_below_callback_add (Evas_Object *obj, Evas_Object_Intercept_Stack_Below_Cb func, const void *data);
        [ :evas_object_intercept_stack_below_callback_add, [ :pointer, :evas_object_intercept_stack_below_cb, :pointer ], :void ],
        # EAPI void *evas_object_intercept_stack_below_callback_del (Evas_Object *obj, Evas_Object_Intercept_Stack_Below_Cb func);
        [ :evas_object_intercept_stack_below_callback_del, [ :pointer, :evas_object_intercept_stack_below_cb ], :pointer ],
        # EAPI void evas_object_intercept_layer_set_callback_add (Evas_Object *obj, Evas_Object_Intercept_Layer_Set_Cb func, const void *data);
        [ :evas_object_intercept_layer_set_callback_add, [ :pointer, :evas_object_intercept_layer_set_cb, :pointer ], :void ],
        # EAPI void *evas_object_intercept_layer_set_callback_del (Evas_Object *obj, Evas_Object_Intercept_Layer_Set_Cb func);
        [ :evas_object_intercept_layer_set_callback_del, [ :pointer, :evas_object_intercept_layer_set_cb ], :pointer ],
        # EAPI void evas_object_intercept_color_set_callback_add (Evas_Object *obj, Evas_Object_Intercept_Color_Set_Cb func, const void *data);
        [ :evas_object_intercept_color_set_callback_add, [ :pointer, :evas_object_intercept_color_set_cb, :pointer ], :void ],
        # EAPI void *evas_object_intercept_color_set_callback_del (Evas_Object *obj, Evas_Object_Intercept_Color_Set_Cb func);
        [ :evas_object_intercept_color_set_callback_del, [ :pointer, :evas_object_intercept_color_set_cb ], :pointer ],
        # EAPI void evas_object_intercept_clip_set_callback_add (Evas_Object *obj, Evas_Object_Intercept_Clip_Set_Cb func, const void *data);
        [ :evas_object_intercept_clip_set_callback_add, [ :pointer, :evas_object_intercept_clip_set_cb, :pointer ], :void ],
        # EAPI void *evas_object_intercept_clip_set_callback_del (Evas_Object *obj, Evas_Object_Intercept_Clip_Set_Cb func);
        [ :evas_object_intercept_clip_set_callback_del, [ :pointer, :evas_object_intercept_clip_set_cb ], :pointer ],
        # EAPI void evas_object_intercept_clip_unset_callback_add (Evas_Object *obj, Evas_Object_Intercept_Clip_Unset_Cb func, const void *data);
        [ :evas_object_intercept_clip_unset_callback_add, [ :pointer, :evas_object_intercept_clip_unset_cb, :pointer ], :void ],
        # EAPI void *evas_object_intercept_clip_unset_callback_del (Evas_Object *obj, Evas_Object_Intercept_Clip_Unset_Cb func);
        [ :evas_object_intercept_clip_unset_callback_del, [ :pointer, :evas_object_intercept_clip_unset_cb ], :pointer ],
        # EAPI Evas_Object *evas_object_rectangle_add (Evas *e);
        [ :evas_object_rectangle_add, [ :pointer ], :pointer ],
        # EAPI Evas_Object *evas_object_image_add (Evas *e);
        [ :evas_object_image_add, [ :pointer ], :pointer ],
        # EAPI Evas_Object *evas_object_image_filled_add (Evas *e);
        [ :evas_object_image_filled_add, [ :pointer ], :pointer ],
        # EAPI void evas_object_image_memfile_set (Evas_Object *obj, void *data, int size, char *format, char *key);
        [ :evas_object_image_memfile_set, [ :pointer, :pointer, :int, :string, :string ], :void ],
        # EAPI void evas_object_image_file_set (Evas_Object *obj, const char *file, const char *key);
        [ :evas_object_image_file_set, [ :pointer, :string, :string ], :void ],
        # EAPI void evas_object_image_file_get (const Evas_Object *obj, const char **file, const char **key);
        [ :evas_object_image_file_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_image_border_set (Evas_Object *obj, int l, int r, int t, int b);
        [ :evas_object_image_border_set, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_object_image_border_get (const Evas_Object *obj, int *l, int *r, int *t, int *b);
        [ :evas_object_image_border_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_image_border_center_fill_set (Evas_Object *obj, Evas_Border_Fill_Mode fill);
        [ :evas_object_image_border_center_fill_set, [ :pointer, :evas_border_fill_mode ], :void ],
        # EAPI Evas_Border_Fill_Mode evas_object_image_border_center_fill_get (const Evas_Object *obj);
        [ :evas_object_image_border_center_fill_get, [ :pointer ], :evas_border_fill_mode ],
        # EAPI void evas_object_image_filled_set (Evas_Object *obj, Eina_Bool setting);
        [ :evas_object_image_filled_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_image_filled_get (const Evas_Object *obj);
        [ :evas_object_image_filled_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_image_border_scale_set (Evas_Object *obj, double scale);
        [ :evas_object_image_border_scale_set, [ :pointer, :double ], :void ],
        # EAPI double evas_object_image_border_scale_get (const Evas_Object *obj);
        [ :evas_object_image_border_scale_get, [ :pointer ], :double ],
        # EAPI void evas_object_image_fill_set (Evas_Object *obj, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h);
        [ :evas_object_image_fill_set, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_object_image_fill_get (const Evas_Object *obj, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        [ :evas_object_image_fill_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_image_fill_spread_set (Evas_Object *obj, Evas_Fill_Spread spread);
        [ :evas_object_image_fill_spread_set, [ :pointer, :evas_fill_spread ], :void ],
        # EAPI Evas_Fill_Spread evas_object_image_fill_spread_get (const Evas_Object *obj);
        [ :evas_object_image_fill_spread_get, [ :pointer ], :evas_fill_spread ],
        # EAPI void evas_object_image_size_set (Evas_Object *obj, int w, int h);
        [ :evas_object_image_size_set, [ :pointer, :int, :int ], :void ],
        # EAPI void evas_object_image_size_get (const Evas_Object *obj, int *w, int *h);
        [ :evas_object_image_size_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI int evas_object_image_stride_get (const Evas_Object *obj);
        [ :evas_object_image_stride_get, [ :pointer ], :int ],
        # EAPI Evas_Load_Error evas_object_image_load_error_get (const Evas_Object *obj);
        [ :evas_object_image_load_error_get, [ :pointer ], :evas_load_error ],
        # EAPI void evas_object_image_data_set (Evas_Object *obj, void *data);
        [ :evas_object_image_data_set, [ :pointer, :pointer ], :void ],
        # EAPI void *evas_object_image_data_get (const Evas_Object *obj, Eina_Bool for_writing);
        [ :evas_object_image_data_get, [ :pointer, :eina_bool ], :pointer ],
        # EAPI void *evas_object_image_data_convert (Evas_Object *obj, Evas_Colorspace to_cspace);
        [ :evas_object_image_data_convert, [ :pointer, :evas_colorspace ], :pointer ],
        # EAPI void evas_object_image_data_copy_set (Evas_Object *obj, void *data);
        [ :evas_object_image_data_copy_set, [ :pointer, :pointer ], :void ],
        # EAPI void evas_object_image_data_update_add (Evas_Object *obj, int x, int y, int w, int h);
        [ :evas_object_image_data_update_add, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_object_image_alpha_set (Evas_Object *obj, Eina_Bool has_alpha);
        [ :evas_object_image_alpha_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_image_alpha_get (const Evas_Object *obj);
        [ :evas_object_image_alpha_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_image_smooth_scale_set (Evas_Object *obj, Eina_Bool smooth_scale);
        [ :evas_object_image_smooth_scale_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_image_smooth_scale_get (const Evas_Object *obj);
        [ :evas_object_image_smooth_scale_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_image_preload (Evas_Object *obj, Eina_Bool cancel);
        [ :evas_object_image_preload, [ :pointer, :eina_bool ], :void ],
        # EAPI void evas_object_image_reload (Evas_Object *obj);
        [ :evas_object_image_reload, [ :pointer ], :void ],
        # EAPI Eina_Bool evas_object_image_save (const Evas_Object *obj, const char *file, const char *key, const char *flags);
        [ :evas_object_image_save, [ :pointer, :string, :string, :string ], :eina_bool ],
        # EAPI Eina_Bool evas_object_image_pixels_import (Evas_Object *obj, Evas_Pixel_Import_Source *pixels);
        [ :evas_object_image_pixels_import, [ :pointer, :pointer ], :eina_bool ],
        # EAPI void evas_object_image_pixels_get_callback_set(Evas_Object *obj, Evas_Object_Image_Pixels_Get_Cb func, void *data);
        [ :evas_object_image_pixels_get_callback_set, [ :pointer, :evas_object_image_pixels_get_cb, :pointer ], :void ],
        # EAPI void evas_object_image_pixels_dirty_set (Evas_Object *obj, Eina_Bool dirty);
        [ :evas_object_image_pixels_dirty_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_image_pixels_dirty_get (const Evas_Object *obj);
        [ :evas_object_image_pixels_dirty_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_image_load_dpi_set (Evas_Object *obj, double dpi);
        [ :evas_object_image_load_dpi_set, [ :pointer, :double ], :void ],
        # EAPI double evas_object_image_load_dpi_get (const Evas_Object *obj);
        [ :evas_object_image_load_dpi_get, [ :pointer ], :double ],
        # EAPI void evas_object_image_load_size_set (Evas_Object *obj, int w, int h);
        [ :evas_object_image_load_size_set, [ :pointer, :int, :int ], :void ],
        # EAPI void evas_object_image_load_size_get (const Evas_Object *obj, int *w, int *h);
        [ :evas_object_image_load_size_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_image_load_scale_down_set (Evas_Object *obj, int scale_down);
        [ :evas_object_image_load_scale_down_set, [ :pointer, :int ], :void ],
        # EAPI int evas_object_image_load_scale_down_get (const Evas_Object *obj);
        [ :evas_object_image_load_scale_down_get, [ :pointer ], :int ],
        # EAPI void evas_object_image_load_region_set (Evas_Object *obj, int x, int y, int w, int h);
        [ :evas_object_image_load_region_set, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_object_image_load_region_get (const Evas_Object *obj, int *x, int *y, int *w, int *h);
        [ :evas_object_image_load_region_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_image_load_orientation_set (Evas_Object *obj, Eina_Bool enable);
        [ :evas_object_image_load_orientation_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_image_load_orientation_get (const Evas_Object *obj);
        [ :evas_object_image_load_orientation_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_image_colorspace_set (Evas_Object *obj, Evas_Colorspace cspace);
        [ :evas_object_image_colorspace_set, [ :pointer, :evas_colorspace ], :void ],
        # EAPI Evas_Colorspace evas_object_image_colorspace_get (const Evas_Object *obj);
        [ :evas_object_image_colorspace_get, [ :pointer ], :evas_colorspace ],
        # EAPI Eina_Bool evas_object_image_region_support_get (const Evas_Object *obj);
        [ :evas_object_image_region_support_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_image_native_surface_set (Evas_Object *obj, Evas_Native_Surface *surf);
        [ :evas_object_image_native_surface_set, [ :pointer, :pointer ], :void ],
        # EAPI Evas_Native_Surface *evas_object_image_native_surface_get (const Evas_Object *obj);
        [ :evas_object_image_native_surface_get, [ :pointer ], :pointer ],
        # EAPI void evas_object_image_video_surface_set (Evas_Object *obj, Evas_Video_Surface *surf);
        [ :evas_object_image_video_surface_set, [ :pointer, :pointer ], :void ],
        # EAPI const Evas_Video_Surface *evas_object_image_video_surface_get (const Evas_Object *obj);
        [ :evas_object_image_video_surface_get, [ :pointer ], :pointer ],
        # EAPI void evas_object_image_scale_hint_set (Evas_Object *obj, Evas_Image_Scale_Hint hint);
        [ :evas_object_image_scale_hint_set, [ :pointer, :evas_image_scale_hint ], :void ],
        # EAPI Evas_Image_Scale_Hint evas_object_image_scale_hint_get (const Evas_Object *obj);
        [ :evas_object_image_scale_hint_get, [ :pointer ], :evas_image_scale_hint ],
        # EAPI void evas_object_image_content_hint_set (Evas_Object *obj, Evas_Image_Content_Hint hint);
        [ :evas_object_image_content_hint_set, [ :pointer, :evas_image_content_hint ], :void ],
        # EAPI Evas_Image_Content_Hint evas_object_image_content_hint_get (const Evas_Object *obj);
        [ :evas_object_image_content_hint_get, [ :pointer ], :evas_image_content_hint ],
        # EAPI void evas_object_image_alpha_mask_set (Evas_Object *obj, Eina_Bool ismask);
        [ :evas_object_image_alpha_mask_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_image_source_set (Evas_Object *obj, Evas_Object *src);
        [ :evas_object_image_source_set, [ :pointer, :pointer ], :eina_bool ],
        # EAPI Evas_Object *evas_object_image_source_get (Evas_Object *obj);
        [ :evas_object_image_source_get, [ :pointer ], :pointer ],
        # EAPI Eina_Bool evas_object_image_source_unset (Evas_Object *obj);
        [ :evas_object_image_source_unset, [ :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_object_image_extension_can_load_get(const char *file);
        [ :evas_object_image_extension_can_load_get, [ :string ], :eina_bool ],
        # EAPI Eina_Bool evas_object_image_extension_can_load_fast_get(const char *file);
        [ :evas_object_image_extension_can_load_fast_get, [ :string ], :eina_bool ],
        # EAPI Eina_Bool evas_object_image_animated_get(const Evas_Object *obj);
        [ :evas_object_image_animated_get, [ :pointer ], :eina_bool ],
        # EAPI int evas_object_image_animated_frame_count_get(const Evas_Object *obj);
        [ :evas_object_image_animated_frame_count_get, [ :pointer ], :int ],
        # EAPI Evas_Image_Animated_Loop_Hint evas_object_image_animated_loop_type_get(const Evas_Object *obj);
        [ :evas_object_image_animated_loop_type_get, [ :pointer ], :evas_image_animated_loop_hint ],
        # EAPI int evas_object_image_animated_loop_count_get(const Evas_Object *obj);
        [ :evas_object_image_animated_loop_count_get, [ :pointer ], :int ],
        # EAPI double evas_object_image_animated_frame_duration_get(const Evas_Object *obj, int start_frame, int fram_num);
        [ :evas_object_image_animated_frame_duration_get, [ :pointer, :int, :int ], :double ],
        # EAPI void evas_object_image_animated_frame_set(Evas_Object *obj, int frame_num);
        [ :evas_object_image_animated_frame_set, [ :pointer, :int ], :void ],
        # EAPI Evas_Object *evas_object_text_add (Evas *e);
        [ :evas_object_text_add, [ :pointer ], :pointer ],
        # EAPI void evas_object_text_font_source_set (Evas_Object *obj, const char *font);
        [ :evas_object_text_font_source_set, [ :pointer, :string ], :void ],
        # EAPI const char *evas_object_text_font_source_get (const Evas_Object *obj);
        [ :evas_object_text_font_source_get, [ :pointer ], :string ],
        # EAPI void evas_object_text_font_set (Evas_Object *obj, const char *font, Evas_Font_Size size);
        [ :evas_object_text_font_set, [ :pointer, :string, :int ], :void ],
        # EAPI void evas_object_text_font_get (const Evas_Object *obj, const char **font, Evas_Font_Size *size);
        [ :evas_object_text_font_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_text_text_set (Evas_Object *obj, const char *text);
        [ :evas_object_text_text_set, [ :pointer, :string ], :void ],
        # EAPI const char *evas_object_text_text_get (const Evas_Object *obj);
        [ :evas_object_text_text_get, [ :pointer ], :string ],
        # EAPI void evas_object_text_bidi_delimiters_set(Evas_Object *obj, const char *delim);
        [ :evas_object_text_bidi_delimiters_set, [ :pointer, :string ], :void ],
        # EAPI const char *evas_object_text_bidi_delimiters_get(const Evas_Object *obj);
        [ :evas_object_text_bidi_delimiters_get, [ :pointer ], :string ],
        # EAPI Evas_Coord evas_object_text_ascent_get (const Evas_Object *obj);
        [ :evas_object_text_ascent_get, [ :pointer ], :int ],
        # EAPI Evas_Coord evas_object_text_descent_get (const Evas_Object *obj);
        [ :evas_object_text_descent_get, [ :pointer ], :int ],
        # EAPI Evas_Coord evas_object_text_max_ascent_get (const Evas_Object *obj);
        [ :evas_object_text_max_ascent_get, [ :pointer ], :int ],
        # EAPI Evas_Coord evas_object_text_max_descent_get (const Evas_Object *obj);
        [ :evas_object_text_max_descent_get, [ :pointer ], :int ],
        # EAPI Evas_Coord evas_object_text_horiz_advance_get(const Evas_Object *obj);
        [ :evas_object_text_horiz_advance_get, [ :pointer ], :int ],
        # EAPI Evas_Coord evas_object_text_vert_advance_get (const Evas_Object *obj);
        [ :evas_object_text_vert_advance_get, [ :pointer ], :int ],
        # EAPI Evas_Coord evas_object_text_inset_get (const Evas_Object *obj);
        [ :evas_object_text_inset_get, [ :pointer ], :int ],
        # EAPI Eina_Bool evas_object_text_char_pos_get (const Evas_Object *obj, int pos, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch);
        [ :evas_object_text_char_pos_get, [ :pointer, :int, :pointer, :pointer, :pointer, :pointer ], :eina_bool ],
        # EAPI int evas_object_text_char_coords_get (const Evas_Object *obj, Evas_Coord x, Evas_Coord y, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch);
        [ :evas_object_text_char_coords_get, [ :pointer, :int, :int, :pointer, :pointer, :pointer, :pointer ], :int ],
        # EAPI int evas_object_text_last_up_to_pos (const Evas_Object *obj, Evas_Coord x, Evas_Coord y);
        [ :evas_object_text_last_up_to_pos, [ :pointer, :int, :int ], :int ],
        # EAPI Evas_Text_Style_Type evas_object_text_style_get (const Evas_Object *obj);
        [ :evas_object_text_style_get, [ :pointer ], :evas_text_style_type ],
        # EAPI void evas_object_text_style_set (Evas_Object *obj, Evas_Text_Style_Type type);
        [ :evas_object_text_style_set, [ :pointer, :evas_text_style_type ], :void ],
        # EAPI void evas_object_text_shadow_color_set (Evas_Object *obj, int r, int g, int b, int a);
        [ :evas_object_text_shadow_color_set, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_object_text_shadow_color_get (const Evas_Object *obj, int *r, int *g, int *b, int *a);
        [ :evas_object_text_shadow_color_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_text_glow_color_set (Evas_Object *obj, int r, int g, int b, int a);
        [ :evas_object_text_glow_color_set, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_object_text_glow_color_get (const Evas_Object *obj, int *r, int *g, int *b, int *a);
        [ :evas_object_text_glow_color_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_text_glow2_color_set (Evas_Object *obj, int r, int g, int b, int a);
        [ :evas_object_text_glow2_color_set, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_object_text_glow2_color_get (const Evas_Object *obj, int *r, int *g, int *b, int *a);
        [ :evas_object_text_glow2_color_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_text_outline_color_set(Evas_Object *obj, int r, int g, int b, int a);
        [ :evas_object_text_outline_color_set, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_object_text_outline_color_get(const Evas_Object *obj, int *r, int *g, int *b, int *a);
        [ :evas_object_text_outline_color_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_text_style_pad_get (const Evas_Object *obj, int *l, int *r, int *t, int *b);
        [ :evas_object_text_style_pad_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI Evas_BiDi_Direction evas_object_text_direction_get (const Evas_Object *obj);
        [ :evas_object_text_direction_get, [ :pointer ], :evas_bidi_direction ],
        # EAPI Evas_Object *evas_object_textblock_add(Evas *e);
        [ :evas_object_textblock_add, [ :pointer ], :pointer ],
        # EAPI const char *evas_textblock_escape_string_get(const char *escape);
        [ :evas_textblock_escape_string_get, [ :string ], :string ],
        # EAPI const char *evas_textblock_string_escape_get(const char *string, int *len_ret);
        [ :evas_textblock_string_escape_get, [ :string, :pointer ], :string ],
        # EAPI const char *evas_textblock_escape_string_range_get(const char *escape_start, const char *escape_end);
        [ :evas_textblock_escape_string_range_get, [ :string, :string ], :string ],
        # EAPI char *evas_textblock_text_markup_to_utf8(const Evas_Object *obj, const char *text);
        [ :evas_textblock_text_markup_to_utf8, [ :pointer, :string ], :string ],
        # EAPI char *evas_textblock_text_utf8_to_markup(const Evas_Object *obj, const char *text);
        [ :evas_textblock_text_utf8_to_markup, [ :pointer, :string ], :string ],
        # EAPI Evas_Textblock_Style *evas_textblock_style_new(void);
        [ :evas_textblock_style_new, [  ], :pointer ],
        # EAPI void evas_textblock_style_free(Evas_Textblock_Style *ts);
        [ :evas_textblock_style_free, [ :pointer ], :void ],
        # EAPI void evas_textblock_style_set(Evas_Textblock_Style *ts, const char *text);
        [ :evas_textblock_style_set, [ :pointer, :string ], :void ],
        # EAPI const char *evas_textblock_style_get(const Evas_Textblock_Style *ts);
        [ :evas_textblock_style_get, [ :pointer ], :string ],
        # EAPI void evas_object_textblock_style_set(Evas_Object *obj, Evas_Textblock_Style *ts);
        [ :evas_object_textblock_style_set, [ :pointer, :pointer ], :void ],
        # EAPI const Evas_Textblock_Style *evas_object_textblock_style_get(const Evas_Object *obj);
        [ :evas_object_textblock_style_get, [ :pointer ], :pointer ],
        # EAPI void evas_object_textblock_replace_char_set(Evas_Object *obj, const char *ch);
        [ :evas_object_textblock_replace_char_set, [ :pointer, :string ], :void ],
        # EAPI const char *evas_object_textblock_replace_char_get(Evas_Object *obj);
        [ :evas_object_textblock_replace_char_get, [ :pointer ], :string ],
        # EAPI void evas_object_textblock_valign_set(Evas_Object *obj, double align);
        [ :evas_object_textblock_valign_set, [ :pointer, :double ], :void ],
        # EAPI double evas_object_textblock_valign_get(const Evas_Object *obj);
        [ :evas_object_textblock_valign_get, [ :pointer ], :double ],
        # EAPI void evas_object_textblock_bidi_delimiters_set(Evas_Object *obj, const char *delim);
        [ :evas_object_textblock_bidi_delimiters_set, [ :pointer, :string ], :void ],
        # EAPI const char *evas_object_textblock_bidi_delimiters_get(const Evas_Object *obj);
        [ :evas_object_textblock_bidi_delimiters_get, [ :pointer ], :string ],
        # EAPI void evas_object_textblock_legacy_newline_set(Evas_Object *obj, Eina_Bool mode);
        [ :evas_object_textblock_legacy_newline_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_textblock_legacy_newline_get(const Evas_Object *obj);
        [ :evas_object_textblock_legacy_newline_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_textblock_text_markup_set(Evas_Object *obj, const char *text);
        [ :evas_object_textblock_text_markup_set, [ :pointer, :string ], :void ],
        # EAPI void evas_object_textblock_text_markup_prepend(Evas_Textblock_Cursor *cur, const char *text);
        [ :evas_object_textblock_text_markup_prepend, [ :pointer, :string ], :void ],
        # EAPI const char *evas_object_textblock_text_markup_get(const Evas_Object *obj);
        [ :evas_object_textblock_text_markup_get, [ :pointer ], :string ],
        # EAPI Evas_Textblock_Cursor *evas_object_textblock_cursor_get(const Evas_Object *obj);
        [ :evas_object_textblock_cursor_get, [ :pointer ], :pointer ],
        # EAPI Evas_Textblock_Cursor *evas_object_textblock_cursor_new(const Evas_Object *obj);
        [ :evas_object_textblock_cursor_new, [ :pointer ], :pointer ],
        # EAPI void evas_textblock_cursor_free(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_free, [ :pointer ], :void ],
        # EAPI void evas_textblock_cursor_paragraph_first(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_paragraph_first, [ :pointer ], :void ],
        # EAPI void evas_textblock_cursor_paragraph_last(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_paragraph_last, [ :pointer ], :void ],
        # EAPI Eina_Bool evas_textblock_cursor_paragraph_next(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_paragraph_next, [ :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_textblock_cursor_paragraph_prev(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_paragraph_prev, [ :pointer ], :eina_bool ],
        # EAPI const Eina_List *evas_textblock_node_format_list_get(const Evas_Object *obj, const char *anchor);
        [ :evas_textblock_node_format_list_get, [ :pointer, :string ], :pointer ],
        # EAPI const Evas_Object_Textblock_Node_Format *evas_textblock_node_format_first_get(const Evas_Object *obj);
        [ :evas_textblock_node_format_first_get, [ :pointer ], :pointer ],
        # EAPI const Evas_Object_Textblock_Node_Format *evas_textblock_node_format_last_get(const Evas_Object *obj);
        [ :evas_textblock_node_format_last_get, [ :pointer ], :pointer ],
        # EAPI const Evas_Object_Textblock_Node_Format *evas_textblock_node_format_next_get(const Evas_Object_Textblock_Node_Format *n);
        [ :evas_textblock_node_format_next_get, [ :pointer ], :pointer ],
        # EAPI const Evas_Object_Textblock_Node_Format *evas_textblock_node_format_prev_get(const Evas_Object_Textblock_Node_Format *n);
        [ :evas_textblock_node_format_prev_get, [ :pointer ], :pointer ],
        # EAPI void evas_textblock_node_format_remove_pair(Evas_Object *obj, Evas_Object_Textblock_Node_Format *n);
        [ :evas_textblock_node_format_remove_pair, [ :pointer, :pointer ], :void ],
        # EAPI const Evas_Object_Textblock_Node_Format *evas_textblock_cursor_format_get(const Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_format_get, [ :pointer ], :pointer ],
        # EAPI const char *evas_textblock_node_format_text_get(const Evas_Object_Textblock_Node_Format *fnode);
        [ :evas_textblock_node_format_text_get, [ :pointer ], :string ],
        # EAPI void evas_textblock_cursor_at_format_set(Evas_Textblock_Cursor *cur, const Evas_Object_Textblock_Node_Format *fmt);
        [ :evas_textblock_cursor_at_format_set, [ :pointer, :pointer ], :void ],
        # EAPI Eina_Bool evas_textblock_cursor_format_is_visible_get(const Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_format_is_visible_get, [ :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_textblock_cursor_format_next(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_format_next, [ :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_textblock_cursor_format_prev(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_format_prev, [ :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_textblock_cursor_is_format(const Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_is_format, [ :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_textblock_cursor_char_next(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_char_next, [ :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_textblock_cursor_char_prev(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_char_prev, [ :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_textblock_cursor_word_start(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_word_start, [ :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_textblock_cursor_word_end(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_word_end, [ :pointer ], :eina_bool ],
        # EAPI void evas_textblock_cursor_paragraph_char_first(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_paragraph_char_first, [ :pointer ], :void ],
        # EAPI void evas_textblock_cursor_paragraph_char_last(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_paragraph_char_last, [ :pointer ], :void ],
        # EAPI void evas_textblock_cursor_line_char_first(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_line_char_first, [ :pointer ], :void ],
        # EAPI void evas_textblock_cursor_line_char_last(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_line_char_last, [ :pointer ], :void ],
        # EAPI int evas_textblock_cursor_pos_get(const Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_pos_get, [ :pointer ], :int ],
        # EAPI void evas_textblock_cursor_pos_set(Evas_Textblock_Cursor *cur, int pos);
        [ :evas_textblock_cursor_pos_set, [ :pointer, :int ], :void ],
        # EAPI Eina_Bool evas_textblock_cursor_line_set(Evas_Textblock_Cursor *cur, int line);
        [ :evas_textblock_cursor_line_set, [ :pointer, :int ], :eina_bool ],
        # EAPI int evas_textblock_cursor_compare(const Evas_Textblock_Cursor *cur1, const Evas_Textblock_Cursor *cur2);
        [ :evas_textblock_cursor_compare, [ :pointer, :pointer ], :int ],
        # EAPI void evas_textblock_cursor_copy(const Evas_Textblock_Cursor *cur, Evas_Textblock_Cursor *cur_dest);
        [ :evas_textblock_cursor_copy, [ :pointer, :pointer ], :void ],
        # EAPI int evas_textblock_cursor_text_append(Evas_Textblock_Cursor *cur, const char *text);
        [ :evas_textblock_cursor_text_append, [ :pointer, :string ], :int ],
        # EAPI int evas_textblock_cursor_text_prepend(Evas_Textblock_Cursor *cur, const char *text);
        [ :evas_textblock_cursor_text_prepend, [ :pointer, :string ], :int ],
        # EAPI Eina_Bool evas_textblock_cursor_format_append(Evas_Textblock_Cursor *cur, const char *format);
        [ :evas_textblock_cursor_format_append, [ :pointer, :string ], :eina_bool ],
        # EAPI Eina_Bool evas_textblock_cursor_format_prepend(Evas_Textblock_Cursor *cur, const char *format);
        [ :evas_textblock_cursor_format_prepend, [ :pointer, :string ], :eina_bool ],
        # EAPI void evas_textblock_cursor_char_delete(Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_char_delete, [ :pointer ], :void ],
        # EAPI void evas_textblock_cursor_range_delete(Evas_Textblock_Cursor *cur1, Evas_Textblock_Cursor *cur2);
        [ :evas_textblock_cursor_range_delete, [ :pointer, :pointer ], :void ],
        # EAPI const char *evas_textblock_cursor_paragraph_text_get(const Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_paragraph_text_get, [ :pointer ], :string ],
        # EAPI int evas_textblock_cursor_paragraph_text_length_get(const Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_paragraph_text_length_get, [ :pointer ], :int ],
        # EAPI Eina_Bool evas_textblock_cursor_visible_range_get(Evas_Textblock_Cursor *start, Evas_Textblock_Cursor *end);
        [ :evas_textblock_cursor_visible_range_get, [ :pointer, :pointer ], :eina_bool ],
        # EAPI Eina_List * evas_textblock_cursor_range_formats_get(const Evas_Textblock_Cursor *cur1, const Evas_Textblock_Cursor *cur2);
        [ :evas_textblock_cursor_range_formats_get, [ :pointer, :pointer ], :pointer ],
        # EAPI char *evas_textblock_cursor_range_text_get(const Evas_Textblock_Cursor *cur1, const Evas_Textblock_Cursor *cur2, Evas_Textblock_Text_Type format);
        [ :evas_textblock_cursor_range_text_get, [ :pointer, :pointer, :evas_textblock_text_type ], :string ],
        # EAPI char *evas_textblock_cursor_content_get(const Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_content_get, [ :pointer ], :string ],
        # EAPI int evas_textblock_cursor_geometry_get(const Evas_Textblock_Cursor *cur, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch, Evas_BiDi_Direction *dir, Evas_Textblock_Cursor_Type ctype);
        [ :evas_textblock_cursor_geometry_get, [ :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :evas_textblock_cursor_type ], :int ],
        # EAPI int evas_textblock_cursor_char_geometry_get(const Evas_Textblock_Cursor *cur, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch);
        [ :evas_textblock_cursor_char_geometry_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :int ],
        # EAPI int evas_textblock_cursor_pen_geometry_get(const Evas_Textblock_Cursor *cur, Evas_Coord *cpen_x, Evas_Coord *cy, Evas_Coord *cadv, Evas_Coord *ch);
        [ :evas_textblock_cursor_pen_geometry_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :int ],
        # EAPI int evas_textblock_cursor_line_geometry_get(const Evas_Textblock_Cursor *cur, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch);
        [ :evas_textblock_cursor_line_geometry_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :int ],
        # EAPI Eina_Bool evas_textblock_cursor_char_coord_set(Evas_Textblock_Cursor *cur, Evas_Coord x, Evas_Coord y);
        [ :evas_textblock_cursor_char_coord_set, [ :pointer, :int, :int ], :eina_bool ],
        # EAPI int evas_textblock_cursor_line_coord_set(Evas_Textblock_Cursor *cur, Evas_Coord y);
        [ :evas_textblock_cursor_line_coord_set, [ :pointer, :int ], :int ],
        # EAPI Eina_List *evas_textblock_cursor_range_geometry_get(const Evas_Textblock_Cursor *cur1, const Evas_Textblock_Cursor *cur2);
        [ :evas_textblock_cursor_range_geometry_get, [ :pointer, :pointer ], :pointer ],
        # EAPI Eina_Bool evas_textblock_cursor_format_item_geometry_get(const Evas_Textblock_Cursor *cur, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch);
        [ :evas_textblock_cursor_format_item_geometry_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_textblock_cursor_eol_get(const Evas_Textblock_Cursor *cur);
        [ :evas_textblock_cursor_eol_get, [ :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_object_textblock_line_number_geometry_get(const Evas_Object *obj, int line, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch);
        [ :evas_object_textblock_line_number_geometry_get, [ :pointer, :int, :pointer, :pointer, :pointer, :pointer ], :eina_bool ],
        # EAPI void evas_object_textblock_clear(Evas_Object *obj);
        [ :evas_object_textblock_clear, [ :pointer ], :void ],
        # EAPI void evas_object_textblock_size_formatted_get(const Evas_Object *obj, Evas_Coord *w, Evas_Coord *h);
        [ :evas_object_textblock_size_formatted_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_textblock_size_native_get(const Evas_Object *obj, Evas_Coord *w, Evas_Coord *h);
        [ :evas_object_textblock_size_native_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_textblock_style_insets_get(const Evas_Object *obj, Evas_Coord *l, Evas_Coord *r, Evas_Coord *t, Evas_Coord *b);
        [ :evas_object_textblock_style_insets_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI Evas_Object *evas_object_line_add (Evas *e);
        [ :evas_object_line_add, [ :pointer ], :pointer ],
        # EAPI void evas_object_line_xy_set (Evas_Object *obj, Evas_Coord x1, Evas_Coord y1, Evas_Coord x2, Evas_Coord y2);
        [ :evas_object_line_xy_set, [ :pointer, :int, :int, :int, :int ], :void ],
        # EAPI void evas_object_line_xy_get (const Evas_Object *obj, Evas_Coord *x1, Evas_Coord *y1, Evas_Coord *x2, Evas_Coord *y2);
        [ :evas_object_line_xy_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI Evas_Object *evas_object_polygon_add (Evas *e);
        [ :evas_object_polygon_add, [ :pointer ], :pointer ],
        # EAPI void evas_object_polygon_point_add (Evas_Object *obj, Evas_Coord x, Evas_Coord y);
        [ :evas_object_polygon_point_add, [ :pointer, :int, :int ], :void ],
        # EAPI void evas_object_polygon_points_clear (Evas_Object *obj);
        [ :evas_object_polygon_points_clear, [ :pointer ], :void ],
        # EAPI void evas_object_is_frame_object_set(Evas_Object *obj, Eina_Bool is_frame);
        [ :evas_object_is_frame_object_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_is_frame_object_get(Evas_Object *obj);
        [ :evas_object_is_frame_object_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_smart_free (Evas_Smart *s);
        [ :evas_smart_free, [ :pointer ], :void ],
        # EAPI Evas_Smart *evas_smart_class_new (const Evas_Smart_Class *sc);
        [ :evas_smart_class_new, [ :pointer ], :pointer ],
        # EAPI const Evas_Smart_Class *evas_smart_class_get (const Evas_Smart *s);
        [ :evas_smart_class_get, [ :pointer ], :pointer ],
        # EAPI void *evas_smart_data_get (const Evas_Smart *s);
        [ :evas_smart_data_get, [ :pointer ], :pointer ],
        # EAPI const Evas_Smart_Cb_Description **evas_smart_callbacks_descriptions_get(const Evas_Smart *s, unsigned int *count);
        [ :evas_smart_callbacks_descriptions_get, [ :pointer, :pointer ], :pointer ],
        # EAPI const Evas_Smart_Cb_Description *evas_smart_callback_description_find(const Evas_Smart *s, const char *name);
        [ :evas_smart_callback_description_find, [ :pointer, :string ], :pointer ],
        # EAPI Eina_Bool evas_smart_class_inherit_full (Evas_Smart_Class *sc, const Evas_Smart_Class *parent_sc, unsigned int parent_sc_size);
        [ :evas_smart_class_inherit_full, [ :pointer, :pointer, :uint ], :eina_bool ],
        # EAPI int evas_smart_usage_get(const Evas_Smart *s);
        [ :evas_smart_usage_get, [ :pointer ], :int ],
        # EAPI Evas_Object *evas_object_smart_add (Evas *e, Evas_Smart *s);
        [ :evas_object_smart_add, [ :pointer, :pointer ], :pointer ],
        # EAPI void evas_object_smart_member_add (Evas_Object *obj, Evas_Object *smart_obj);
        [ :evas_object_smart_member_add, [ :pointer, :pointer ], :void ],
        # EAPI void evas_object_smart_member_del (Evas_Object *obj);
        [ :evas_object_smart_member_del, [ :pointer ], :void ],
        # EAPI Eina_List *evas_object_smart_members_get (const Evas_Object *obj);
        [ :evas_object_smart_members_get, [ :pointer ], :pointer ],
        # EAPI Evas_Object *evas_object_smart_parent_get (const Evas_Object *obj);
        [ :evas_object_smart_parent_get, [ :pointer ], :pointer ],
        # EAPI Eina_Bool evas_object_smart_type_check (const Evas_Object *obj, const char *type);
        [ :evas_object_smart_type_check, [ :pointer, :string ], :eina_bool ],
        # EAPI Eina_Bool evas_object_smart_type_check_ptr (const Evas_Object *obj, const char *type);
        [ :evas_object_smart_type_check_ptr, [ :pointer, :string ], :eina_bool ],
        # EAPI Evas_Smart *evas_object_smart_smart_get (const Evas_Object *obj);
        [ :evas_object_smart_smart_get, [ :pointer ], :pointer ],
        # EAPI void *evas_object_smart_data_get (const Evas_Object *obj);
        [ :evas_object_smart_data_get, [ :pointer ], :pointer ],
        # EAPI void evas_object_smart_data_set (Evas_Object *obj, void *data);
        [ :evas_object_smart_data_set, [ :pointer, :pointer ], :void ],
        # EAPI void evas_object_smart_callback_add (Evas_Object *obj, const char *event, Evas_Smart_Cb func, const void *data);
        [ :evas_object_smart_callback_add, [ :pointer, :string, :evas_smart_cb, :pointer ], :void ],
        # EAPI void evas_object_smart_callback_priority_add(Evas_Object *obj, const char *event, Evas_Callback_Priority priority, Evas_Smart_Cb func, const void *data);
        [ :evas_object_smart_callback_priority_add, [ :pointer, :string, :short, :evas_smart_cb, :pointer ], :void ],
        # EAPI void *evas_object_smart_callback_del (Evas_Object *obj, const char *event, Evas_Smart_Cb func);
        [ :evas_object_smart_callback_del, [ :pointer, :string, :evas_smart_cb ], :pointer ],
        # EAPI void *evas_object_smart_callback_del_full(Evas_Object *obj, const char *event, Evas_Smart_Cb func, const void *data);
        [ :evas_object_smart_callback_del_full, [ :pointer, :string, :evas_smart_cb, :pointer ], :pointer ],
        # EAPI void evas_object_smart_callback_call (Evas_Object *obj, const char *event, void *event_info);
        [ :evas_object_smart_callback_call, [ :pointer, :string, :pointer ], :void ],
        # EAPI Eina_Bool evas_object_smart_callbacks_descriptions_set(Evas_Object *obj, const Evas_Smart_Cb_Description *descriptions);
        [ :evas_object_smart_callbacks_descriptions_set, [ :pointer, :pointer ], :eina_bool ],
        # EAPI void evas_object_smart_callbacks_descriptions_get(const Evas_Object *obj, const Evas_Smart_Cb_Description ***class_descriptions, unsigned int *class_count, const Evas_Smart_Cb_Description ***instance_descriptions, unsigned int *instance_count);
        [ :evas_object_smart_callbacks_descriptions_get, [ :pointer, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_smart_callback_description_find(const Evas_Object *obj, const char *name, const Evas_Smart_Cb_Description **class_description, const Evas_Smart_Cb_Description **instance_description);
        [ :evas_object_smart_callback_description_find, [ :pointer, :string, :pointer, :pointer ], :void ],
        # EAPI void evas_object_smart_changed (Evas_Object *obj);
        [ :evas_object_smart_changed, [ :pointer ], :void ],
        # EAPI void evas_object_smart_need_recalculate_set(Evas_Object *obj, Eina_Bool value);
        [ :evas_object_smart_need_recalculate_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_smart_need_recalculate_get(const Evas_Object *obj);
        [ :evas_object_smart_need_recalculate_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_object_smart_calculate (Evas_Object *obj);
        [ :evas_object_smart_calculate, [ :pointer ], :void ],
        # EAPI void evas_smart_objects_calculate (Evas *e);
        [ :evas_smart_objects_calculate, [ :pointer ], :void ],
        # EAPI int evas_smart_objects_calculate_count_get (const Evas *e);
        [ :evas_smart_objects_calculate_count_get, [ :pointer ], :int ],
        # EAPI void evas_object_smart_move_children_relative(Evas_Object *obj, Evas_Coord dx, Evas_Coord dy);
        [ :evas_object_smart_move_children_relative, [ :pointer, :int, :int ], :void ],
        # EAPI Evas_Object *evas_object_smart_clipped_clipper_get (Evas_Object *obj);
        [ :evas_object_smart_clipped_clipper_get, [ :pointer ], :pointer ],
        # EAPI void evas_object_smart_clipped_smart_set (Evas_Smart_Class *sc);
        [ :evas_object_smart_clipped_smart_set, [ :pointer ], :void ],
        # EAPI const Evas_Smart_Class *evas_object_smart_clipped_class_get (void);
        [ :evas_object_smart_clipped_class_get, [  ], :pointer ],
        # EAPI void evas_object_box_smart_set (Evas_Object_Box_Api *api);
        [ :evas_object_box_smart_set, [ :pointer ], :void ],
        # EAPI const Evas_Object_Box_Api *evas_object_box_smart_class_get (void);
        [ :evas_object_box_smart_class_get, [  ], :pointer ],
        # EAPI void evas_object_box_layout_set (Evas_Object *o, Evas_Object_Box_Layout cb, const void *data, void (*free_data)(void *data));
        # FIXME
        # EAPI Evas_Object *evas_object_box_add (Evas *evas);
        [ :evas_object_box_add, [ :pointer ], :pointer ],
        # EAPI Evas_Object *evas_object_box_add_to (Evas_Object *parent);
        [ :evas_object_box_add_to, [ :pointer ], :pointer ],
        # EAPI void evas_object_box_layout_horizontal (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        [ :evas_object_box_layout_horizontal, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_box_layout_vertical (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        [ :evas_object_box_layout_vertical, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_box_layout_homogeneous_vertical (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        [ :evas_object_box_layout_homogeneous_vertical, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_box_layout_homogeneous_horizontal (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        [ :evas_object_box_layout_homogeneous_horizontal, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_box_layout_homogeneous_max_size_horizontal(Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        [ :evas_object_box_layout_homogeneous_max_size_horizontal, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_box_layout_homogeneous_max_size_vertical (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        [ :evas_object_box_layout_homogeneous_max_size_vertical, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_box_layout_flow_horizontal (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        [ :evas_object_box_layout_flow_horizontal, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_box_layout_flow_vertical (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        [ :evas_object_box_layout_flow_vertical, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_box_layout_stack (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        [ :evas_object_box_layout_stack, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_box_align_set (Evas_Object *o, double horizontal, double vertical);
        [ :evas_object_box_align_set, [ :pointer, :double, :double ], :void ],
        # EAPI void evas_object_box_align_get (const Evas_Object *o, double *horizontal, double *vertical);
        [ :evas_object_box_align_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_box_padding_set (Evas_Object *o, Evas_Coord horizontal, Evas_Coord vertical);
        [ :evas_object_box_padding_set, [ :pointer, :int, :int ], :void ],
        # EAPI void evas_object_box_padding_get (const Evas_Object *o, Evas_Coord *horizontal, Evas_Coord *vertical);
        [ :evas_object_box_padding_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI Evas_Object_Box_Option *evas_object_box_append (Evas_Object *o, Evas_Object *child);
        [ :evas_object_box_append, [ :pointer, :pointer ], :pointer ],
        # EAPI Evas_Object_Box_Option *evas_object_box_prepend (Evas_Object *o, Evas_Object *child);
        [ :evas_object_box_prepend, [ :pointer, :pointer ], :pointer ],
        # EAPI Evas_Object_Box_Option *evas_object_box_insert_before (Evas_Object *o, Evas_Object *child, const Evas_Object *reference);
        [ :evas_object_box_insert_before, [ :pointer, :pointer, :pointer ], :pointer ],
        # EAPI Evas_Object_Box_Option *evas_object_box_insert_after (Evas_Object *o, Evas_Object *child, const Evas_Object *referente);
        [ :evas_object_box_insert_after, [ :pointer, :pointer, :pointer ], :pointer ],
        # EAPI Evas_Object_Box_Option *evas_object_box_insert_at (Evas_Object *o, Evas_Object *child, unsigned int pos);
        [ :evas_object_box_insert_at, [ :pointer, :pointer, :uint ], :pointer ],
        # EAPI Eina_Bool evas_object_box_remove (Evas_Object *o, Evas_Object *child);
        [ :evas_object_box_remove, [ :pointer, :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_object_box_remove_at (Evas_Object *o, unsigned int pos);
        [ :evas_object_box_remove_at, [ :pointer, :uint ], :eina_bool ],
        # EAPI Eina_Bool evas_object_box_remove_all (Evas_Object *o, Eina_Bool clear);
        [ :evas_object_box_remove_all, [ :pointer, :eina_bool ], :eina_bool ],
        # EAPI Eina_Iterator *evas_object_box_iterator_new (const Evas_Object *o);
        [ :evas_object_box_iterator_new, [ :pointer ], :pointer ],
        # EAPI Eina_Accessor *evas_object_box_accessor_new (const Evas_Object *o);
        [ :evas_object_box_accessor_new, [ :pointer ], :pointer ],
        # EAPI Eina_List *evas_object_box_children_get (const Evas_Object *o);
        [ :evas_object_box_children_get, [ :pointer ], :pointer ],
        # EAPI const char *evas_object_box_option_property_name_get (Evas_Object *o, int property);
        [ :evas_object_box_option_property_name_get, [ :pointer, :int ], :string ],
        # EAPI int evas_object_box_option_property_id_get (Evas_Object *o, const char *name);
        [ :evas_object_box_option_property_id_get, [ :pointer, :string ], :int ],
        # EAPI Eina_Bool evas_object_box_option_property_set (Evas_Object *o, Evas_Object_Box_Option *opt, int property, ...);
        [ :evas_object_box_option_property_set, [ :pointer, :pointer, :int, :varargs ], :eina_bool ],
        # EAPI Eina_Bool evas_object_box_option_property_vset (Evas_Object *o, Evas_Object_Box_Option *opt, int property, va_list args);
        [ :evas_object_box_option_property_vset, [ :pointer, :pointer, :int, :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_object_box_option_property_get (Evas_Object *o, Evas_Object_Box_Option *opt, int property, ...);
        [ :evas_object_box_option_property_get, [ :pointer, :pointer, :int, :varargs ], :eina_bool ],
        # EAPI Eina_Bool evas_object_box_option_property_vget (Evas_Object *o, Evas_Object_Box_Option *opt, int property, va_list args);
        [ :evas_object_box_option_property_vget, [ :pointer, :pointer, :int, :pointer ], :eina_bool ],
        # EAPI Evas_Object *evas_object_table_add (Evas *evas);
        [ :evas_object_table_add, [ :pointer ], :pointer ],
        # EAPI Evas_Object *evas_object_table_add_to (Evas_Object *parent);
        [ :evas_object_table_add_to, [ :pointer ], :pointer ],
        # EAPI void evas_object_table_homogeneous_set (Evas_Object *o, Evas_Object_Table_Homogeneous_Mode homogeneous);
        [ :evas_object_table_homogeneous_set, [ :pointer, :evas_object_table_homogeneous_mode ], :void ],
        # EAPI Evas_Object_Table_Homogeneous_Mode evas_object_table_homogeneous_get (const Evas_Object *o);
        [ :evas_object_table_homogeneous_get, [ :pointer ], :evas_object_table_homogeneous_mode ],
        # EAPI void evas_object_table_padding_set (Evas_Object *o, Evas_Coord horizontal, Evas_Coord vertical);
        [ :evas_object_table_padding_set, [ :pointer, :int, :int ], :void ],
        # EAPI void evas_object_table_padding_get (const Evas_Object *o, Evas_Coord *horizontal, Evas_Coord *vertical);
        [ :evas_object_table_padding_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_table_align_set (Evas_Object *o, double horizontal, double vertical);
        [ :evas_object_table_align_set, [ :pointer, :double, :double ], :void ],
        # EAPI void evas_object_table_align_get (const Evas_Object *o, double *horizontal, double *vertical);
        [ :evas_object_table_align_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_table_mirrored_set (Evas_Object *o, Eina_Bool mirrored);
        [ :evas_object_table_mirrored_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_table_mirrored_get (const Evas_Object *o);
        [ :evas_object_table_mirrored_get, [ :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_object_table_pack_get(Evas_Object *o, Evas_Object *child, unsigned short *col, unsigned short *row, unsigned short *colspan, unsigned short *rowspan);
        [ :evas_object_table_pack_get, [ :pointer, :pointer, :pointer, :pointer, :pointer, :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_object_table_pack (Evas_Object *o, Evas_Object *child, unsigned short col, unsigned short row, unsigned short colspan, unsigned short rowspan);
        [ :evas_object_table_pack, [ :pointer, :pointer, :ushort, :ushort, :ushort, :ushort ], :eina_bool ],
        # EAPI Eina_Bool evas_object_table_unpack (Evas_Object *o, Evas_Object *child);
        [ :evas_object_table_unpack, [ :pointer, :pointer ], :eina_bool ],
        # EAPI void evas_object_table_clear (Evas_Object *o, Eina_Bool clear);
        [ :evas_object_table_clear, [ :pointer, :eina_bool ], :void ],
        # EAPI void evas_object_table_col_row_size_get(const Evas_Object *o, int *cols, int *rows);
        [ :evas_object_table_col_row_size_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI Eina_Iterator *evas_object_table_iterator_new (const Evas_Object *o);
        [ :evas_object_table_iterator_new, [ :pointer ], :pointer ],
        # EAPI Eina_Accessor *evas_object_table_accessor_new (const Evas_Object *o);
        [ :evas_object_table_accessor_new, [ :pointer ], :pointer ],
        # EAPI Eina_List *evas_object_table_children_get (const Evas_Object *o);
        [ :evas_object_table_children_get, [ :pointer ], :pointer ],
        # EAPI Evas_Object *evas_object_table_child_get (const Evas_Object *o, unsigned short col, unsigned short row);
        [ :evas_object_table_child_get, [ :pointer, :ushort, :ushort ], :pointer ],
        # EAPI Evas_Object *evas_object_grid_add (Evas *evas);
        [ :evas_object_grid_add, [ :pointer ], :pointer ],
        # EAPI Evas_Object *evas_object_grid_add_to (Evas_Object *parent);
        [ :evas_object_grid_add_to, [ :pointer ], :pointer ],
        # EAPI void evas_object_grid_size_set (Evas_Object *o, int w, int h);
        [ :evas_object_grid_size_set, [ :pointer, :int, :int ], :void ],
        # EAPI void evas_object_grid_size_get (const Evas_Object *o, int *w, int *h);
        [ :evas_object_grid_size_get, [ :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_object_grid_mirrored_set (Evas_Object *o, Eina_Bool mirrored);
        [ :evas_object_grid_mirrored_set, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_grid_mirrored_get (const Evas_Object *o);
        [ :evas_object_grid_mirrored_get, [ :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_object_grid_pack (Evas_Object *o, Evas_Object *child, int x, int y, int w, int h);
        [ :evas_object_grid_pack, [ :pointer, :pointer, :int, :int, :int, :int ], :eina_bool ],
        # EAPI Eina_Bool evas_object_grid_unpack (Evas_Object *o, Evas_Object *child);
        [ :evas_object_grid_unpack, [ :pointer, :pointer ], :eina_bool ],
        # EAPI void evas_object_grid_clear (Evas_Object *o, Eina_Bool clear);
        [ :evas_object_grid_clear, [ :pointer, :eina_bool ], :void ],
        # EAPI Eina_Bool evas_object_grid_pack_get (Evas_Object *o, Evas_Object *child, int *x, int *y, int *w, int *h);
        [ :evas_object_grid_pack_get, [ :pointer, :pointer, :pointer, :pointer, :pointer, :pointer ], :eina_bool ],
        # EAPI Eina_Iterator *evas_object_grid_iterator_new (const Evas_Object *o);
        [ :evas_object_grid_iterator_new, [ :pointer ], :pointer ],
        # EAPI Eina_Accessor *evas_object_grid_accessor_new (const Evas_Object *o);
        [ :evas_object_grid_accessor_new, [ :pointer ], :pointer ],
        # EAPI Eina_List *evas_object_grid_children_get (const Evas_Object *o);
        [ :evas_object_grid_children_get, [ :pointer ], :pointer ],
        # EAPI Eina_Bool evas_cserve_want_get (void);
        [ :evas_cserve_want_get, [  ], :eina_bool ],
        # EAPI Eina_Bool evas_cserve_connected_get (void);
        [ :evas_cserve_connected_get, [  ], :eina_bool ],
        # EAPI Eina_Bool evas_cserve_stats_get (Evas_Cserve_Stats *stats);
        [ :evas_cserve_stats_get, [ :pointer ], :eina_bool ],
        # EAPI void evas_cserve_image_cache_contents_clean (Evas_Cserve_Image_Cache *cache);
        [ :evas_cserve_image_cache_contents_clean, [ :pointer ], :void ],
        # EAPI Eina_Bool evas_cserve_config_get (Evas_Cserve_Config *config);
        [ :evas_cserve_config_get, [ :pointer ], :eina_bool ],
        # EAPI Eina_Bool evas_cserve_config_set (const Evas_Cserve_Config *config);
        [ :evas_cserve_config_set, [ :pointer ], :eina_bool ],
        # EAPI void evas_cserve_disconnect (void);
        [ :evas_cserve_disconnect, [  ], :void ],
        # EAPI const char *evas_load_error_str (Evas_Load_Error error);
        [ :evas_load_error_str, [ :evas_load_error ], :string ],
        # EAPI void evas_color_hsv_to_rgb (float h, float s, float v, int *r, int *g, int *b);
        [ :evas_color_hsv_to_rgb, [ :float, :float, :float, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_color_rgb_to_hsv (int r, int g, int b, float *h, float *s, float *v);
        [ :evas_color_rgb_to_hsv, [ :int, :int, :int, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_color_argb_premul (int a, int *r, int *g, int *b);
        [ :evas_color_argb_premul, [ :int, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_color_argb_unpremul (int a, int *r, int *g, int *b);
        [ :evas_color_argb_unpremul, [ :int, :pointer, :pointer, :pointer ], :void ],
        # EAPI void evas_data_argb_premul (unsigned int *data, unsigned int len);
        [ :evas_data_argb_premul, [ :pointer, :uint ], :void ],
        # EAPI void evas_data_argb_unpremul (unsigned int *data, unsigned int len);
        [ :evas_data_argb_unpremul, [ :pointer, :uint ], :void ],
        # EAPI int evas_string_char_next_get (const char *str, int pos, int *decoded);
        [ :evas_string_char_next_get, [ :string, :int, :pointer ], :int ],
        # EAPI int evas_string_char_prev_get (const char *str, int pos, int *decoded);
        [ :evas_string_char_prev_get, [ :string, :int, :pointer ], :int ],
        # EAPI int evas_string_char_len_get (const char *str);
        [ :evas_string_char_len_get, [ :string ], :int ],
        # EAPI const Evas_Modifier *evas_key_modifier_get (const Evas *e);
        [ :evas_key_modifier_get, [ :pointer ], :pointer ],
        # EAPI const Evas_Lock *evas_key_lock_get (const Evas *e);
        [ :evas_key_lock_get, [ :pointer ], :pointer ],
        # EAPI Eina_Bool evas_key_modifier_is_set (const Evas_Modifier *m, const char *keyname);
        [ :evas_key_modifier_is_set, [ :pointer, :string ], :eina_bool ],
        # EAPI Eina_Bool evas_key_lock_is_set (const Evas_Lock *l, const char *keyname);
        [ :evas_key_lock_is_set, [ :pointer, :string ], :eina_bool ],
        # EAPI void evas_key_modifier_add (Evas *e, const char *keyname);
        [ :evas_key_modifier_add, [ :pointer, :string ], :void ],
        # EAPI void evas_key_modifier_del (Evas *e, const char *keyname);
        [ :evas_key_modifier_del, [ :pointer, :string ], :void ],
        # EAPI void evas_key_lock_add (Evas *e, const char *keyname);
        [ :evas_key_lock_add, [ :pointer, :string ], :void ],
        # EAPI void evas_key_lock_del (Evas *e, const char *keyname);
        [ :evas_key_lock_del, [ :pointer, :string ], :void ],
        # EAPI void evas_key_modifier_on (Evas *e, const char *keyname);
        [ :evas_key_modifier_on, [ :pointer, :string ], :void ],
        # EAPI void evas_key_modifier_off (Evas *e, const char *keyname);
        [ :evas_key_modifier_off, [ :pointer, :string ], :void ],
        # EAPI void evas_key_lock_on (Evas *e, const char *keyname);
        [ :evas_key_lock_on, [ :pointer, :string ], :void ],
        # EAPI void evas_key_lock_off (Evas *e, const char *keyname);
        [ :evas_key_lock_off, [ :pointer, :string ], :void ],
        # EAPI Evas_Modifier_Mask evas_key_modifier_mask_get (const Evas *e, const char *keyname);
        [ :evas_key_modifier_mask_get, [ :pointer, :string ], :ulong_long ],
        # EAPI Eina_Bool evas_object_key_grab (Evas_Object *obj, const char *keyname, Evas_Modifier_Mask modifiers, Evas_Modifier_Mask not_modifiers, Eina_Bool exclusive);
        [ :evas_object_key_grab, [ :pointer, :string, :ulong_long, :ulong_long, :eina_bool ], :eina_bool ],
        # EAPI void evas_object_key_ungrab (Evas_Object *obj, const char *keyname, Evas_Modifier_Mask modifiers, Evas_Modifier_Mask not_modifiers);
        [ :evas_object_key_ungrab, [ :pointer, :string, :ulong_long, :ulong_long ], :void ],
        # EAPI unsigned int evas_touch_point_list_count(Evas *e);
        [ :evas_touch_point_list_count, [ :pointer ], :uint ],
        # EAPI void evas_touch_point_list_nth_xy_get(Evas *e, unsigned int n, Evas_Coord *x, Evas_Coord *y);
        [ :evas_touch_point_list_nth_xy_get, [ :pointer, :uint, :pointer, :pointer ], :void ],
        # EAPI int evas_touch_point_list_nth_id_get(Evas *e, unsigned int n);
        [ :evas_touch_point_list_nth_id_get, [ :pointer, :uint ], :int ],
        # EAPI Evas_Touch_Point_State evas_touch_point_list_nth_state_get(Evas *e, unsigned int n);
        [ :evas_touch_point_list_nth_state_get, [ :pointer, :uint ], :evas_touch_point_state ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
