#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi'
require 'efl/native/evas'
require 'efl/native/edje'
require 'efl/native/emap'
require 'efl/native/eina_list'
#
module Efl
    #
    module Elm
        #
        FCT_PREFIX = 'elm_'
        #
        def self.method_missing m, *args, &block
            sym, args_s = ModuleHelper.find_function m, FCT_PREFIX
            self.module_eval "def self.#{m} *args, &block; r=Efl::Native.#{sym}(#{args_s}); yield r if block_given?; r; end"
            self.send m, *args, &block
        end
        #
    end
    #
    module Native
        #
        ffi_lib 'libelementary-ver-pre-svn-09.so.0'
        #
        # ENUMS
        # typedef enum _Elm_Object_Layer {...} Elm_Object_Layer;
        enum :elm_object_layer, [ :elm_object_layer_background, :elm_object_layer_default, 0, :elm_object_layer_focus, :elm_object_layer_tooltip,
            :elm_object_layer_cursor, :elm_object_layer_last ]
        # typedef enum _Elm_Policy {...} Elm_Policy;
        enum :elm_policy, [ :elm_policy_quit, :elm_policy_last ]
        # typedef enum _Elm_Policy_Quit {...} Elm_Policy_Quit;
        enum :elm_policy_quit, [ :elm_policy_quit_none, 0, :elm_policy_quit_last_window_closed ]
        # typedef enum _Elm_Focus_Direction {...} Elm_Focus_Direction;
        enum :elm_focus_direction, [ :elm_focus_previous, :elm_focus_next ]
        # typedef enum _Elm_Text_Format {...} Elm_Text_Format;
        enum :elm_text_format, [ :elm_text_format_plain_utf8, :elm_text_format_markup_utf8 ]
        typedef :pointer, :elm_text_format_p
        # typedef enum _Elm_Wrap_Type {...} Elm_Wrap_Type;
        enum :elm_wrap_type, [ :elm_wrap_none, 0, :elm_wrap_char, :elm_wrap_word, :elm_wrap_mixed, :elm_wrap_last ]
        # typedef enum {...} Elm_Input_Panel_Layout;
        enum :elm_input_panel_layout, [ :elm_input_panel_layout_normal, :elm_input_panel_layout_number, :elm_input_panel_layout_email, :elm_input_panel_layout_url,
            :elm_input_panel_layout_phonenumber, :elm_input_panel_layout_ip, :elm_input_panel_layout_month, :elm_input_panel_layout_numberonly, :elm_input_panel_layout_invalid ]
        # typedef enum {...} Elm_Autocapital_Type;
        enum :elm_autocapital_type, [ :elm_autocapital_type_none, :elm_autocapital_type_word, :elm_autocapital_type_sentence, :elm_autocapital_type_allcharacter ]
        # typedef enum _Elm_Win_Type {...} Elm_Win_Type;
        enum :elm_win_type, [ :elm_win_basic, :elm_win_dialog_basic, :elm_win_desktop, :elm_win_dock, :m, :elm_win_toolbar, :elm_win_menu, :elm_win_utility,
            :elm_win_splash, :elm_win_dropdown_menu, :elm_win_popup_menu, :elm_win_tooltip, :t, :elm_win_notification, :elm_win_combo, :elm_win_dnd, :elm_win_inlined_image, :t, :e,
            :e ]
        # typedef enum _Elm_Win_Keyboard_Mode {...} Elm_Win_Keyboard_Mode;
        enum :elm_win_keyboard_mode, [ :elm_win_keyboard_unknown, :elm_win_keyboard_off, :elm_win_keyboard_on, :elm_win_keyboard_alpha, :elm_win_keyboard_numeric,
            :elm_win_keyboard_pin, :elm_win_keyboard_phone_number, :elm_win_keyboard_hex, :elm_win_keyboard_terminal, :elm_win_keyboard_password, :elm_win_keyboard_ip,
            :elm_win_keyboard_host, :elm_win_keyboard_file, :elm_win_keyboard_url, :elm_win_keyboard_keypad, :elm_win_keyboard_j2me ]
        # typedef enum _Elm_Illume_Command {...} Elm_Illume_Command;
        enum :elm_illume_command, [ :elm_illume_command_focus_back, :elm_illume_command_focus_forward, :elm_illume_command_focus_home, :elm_illume_command_close ]
        # typedef enum _Elm_Bg_Option {...} Elm_Bg_Option;
        enum :elm_bg_option, [ :elm_bg_option_center, :elm_bg_option_scale, :elm_bg_option_stretch, :elm_bg_option_tile ]
        # typedef enum _Elm_Icon_Type {...} Elm_Icon_Type;
        enum :elm_icon_type, [ :elm_icon_none, :elm_icon_file, :elm_icon_standard ]
        typedef :pointer, :elm_icon_type_p
        # typedef enum _Elm_Icon_Lookup_Order {...} Elm_Icon_Lookup_Order;
        enum :elm_icon_lookup_order, [ :elm_icon_lookup_fdo_theme, :elm_icon_lookup_theme_fdo, :elm_icon_lookup_fdo, :elm_icon_lookup_theme ]
        # typedef enum _Elm_Image_Orient {...} Elm_Image_Orient;
        enum :elm_image_orient, [ :elm_image_orient_none, 0, :elm_image_orient_0, 0, :elm_image_rotate_90, 1, :elm_image_rotate_180, 2, :elm_image_rotate_270, 3,
            :elm_image_flip_horizontal, 4, :elm_image_flip_vertical, 5, :elm_image_flip_transpose, 6, :elm_image_flip_transverse, 7 ]
        # typedef enum _Elm_GLView_Mode {...} Elm_GLView_Mode;
        enum :elm_glview_mode, [ :elm_glview_alpha, 1, :elm_glview_depth, 2, :elm_glview_stencil, 4 ]
        # typedef enum _Elm_GLView_Resize_Policy {...} Elm_GLView_Resize_Policy;
        enum :elm_glview_resize_policy, [ :elm_glview_resize_policy_recreate, 1, :elm_glview_resize_policy_scale, 2 ]
        # typedef enum _Elm_GLView_Render_Policy {...} Elm_GLView_Render_Policy;
        enum :elm_glview_render_policy, [ :elm_glview_render_policy_on_demand, 1, :elm_glview_render_policy_always, 2 ]
        # typedef enum _Elm_Scroller_Policy {...} Elm_Scroller_Policy;
        enum :elm_scroller_policy, [ :elm_scroller_policy_auto, 0, :elm_scroller_policy_on, :elm_scroller_policy_off, :elm_scroller_policy_last ]
        typedef :pointer, :elm_scroller_policy_p
        # typedef enum _Elm_Clock_Digedit {...} Elm_Clock_Digedit;
        enum :elm_clock_digedit, [ :elm_clock_none, 0, :elm_clock_hour_decimal, 1, :elm_clock_hour_unit, 1, :elm_clock_min_decimal, 1, :elm_clock_min_unit, 1,
            :elm_clock_sec_decimal, 1, :elm_clock_sec_unit, 1, :elm_clock_all ]
        # typedef enum _Elm_Notify_Orient {...} Elm_Notify_Orient;
        enum :elm_notify_orient, [ :elm_notify_orient_top, :elm_notify_orient_center, :elm_notify_orient_bottom, :elm_notify_orient_left, :elm_notify_orient_right,
            :elm_notify_orient_top_left, :elm_notify_orient_top_right, :elm_notify_orient_bottom_left, :elm_notify_orient_bottom_right, :elm_notify_orient_last ]
        # typedef enum _Elm_Hover_Axis {...} Elm_Hover_Axis;
        enum :elm_hover_axis, [ :elm_hover_axis_none, :elm_hover_axis_horizontal, :elm_hover_axis_vertical, :elm_hover_axis_both ]
        # typedef enum _Elm_Gesture_Types { ELM_GESTURE_FIRST = 0, ELM_GESTURE_N_TAPS, ELM_GESTURE_N_LONG_TAPS, ELM_GESTURE_N_DOUBLE_TAPS, ELM_GESTURE_N_TRIPLE_TAPS, ELM_GESTURE_MOMENTUM, ELM_GESTURE_N_LINES, ELM_GESTURE_N_FLICKS, ELM_GESTURE_ZOOM, ELM_GESTURE_ROTATE, ELM_GESTURE_LAST } Elm_Gesture_Types
        # FIXME
        # typedef enum _Elm_Gesture_State { ELM_GESTURE_STATE_UNDEFINED = -1, ELM_GESTURE_STATE_START, ELM_GESTURE_STATE_MOVE, ELM_GESTURE_STATE_END, ELM_GESTURE_STATE_ABORT } Elm_Gesture_State
        # FIXME
        # typedef enum _Elm_Thumb_Animation_Setting {...} Elm_Thumb_Animation_Setting;
        enum :elm_thumb_animation_setting, [ :elm_thumb_animation_start, 0, :elm_thumb_animation_loop, :elm_thumb_animation_stop, :elm_thumb_animation_last ]
        # typedef enum _Elm_Web_Menu_Item_Type {...} Elm_Web_Menu_Item_Type;
        enum :elm_web_menu_item_type, [ :elm_web_menu_separator, :elm_web_menu_group, :elm_web_menu_option ]
        # typedef enum _Elm_Web_Zoom_Mode {...} Elm_Web_Zoom_Mode;
        enum :elm_web_zoom_mode, [ :elm_web_zoom_mode_manual, 0, :elm_web_zoom_mode_auto_fit, :elm_web_zoom_mode_auto_fill, :elm_web_zoom_mode_last ]
        # typedef enum _Elm_Toolbar_Shrink_Mode {...} Elm_Toolbar_Shrink_Mode;
        enum :elm_toolbar_shrink_mode, [ :elm_toolbar_shrink_none, :elm_toolbar_shrink_hide, :elm_toolbar_shrink_scroll, :elm_toolbar_shrink_menu,
            :elm_toolbar_shrink_last ]
        # typedef enum _Elm_List_Mode {...} Elm_List_Mode;
        enum :elm_list_mode, [ :elm_list_compress, 0, :elm_list_scroll, :elm_list_limit, :elm_list_expand, :elm_list_last ]
        # typedef enum _Elm_Actionslider_Pos {...} Elm_Actionslider_Pos;
        enum :elm_actionslider_pos, [ :elm_actionslider_none, 0, :elm_actionslider_left, 1, :elm_actionslider_center, 2, :elm_actionslider_right, 4, :elm_actionslider_all, 7
            ]
        # typedef enum _Elm_Genlist_Item_Flags {...} Elm_Genlist_Item_Flags;
        enum :elm_genlist_item_flags, [ :elm_genlist_item_none, 0, :elm_genlist_item_subitems, :elm_genlist_item_group ]
        # typedef enum _Elm_Genlist_Item_Field_Flags {...} Elm_Genlist_Item_Field_Flags;
        enum :elm_genlist_item_field_flags, [ :elm_genlist_item_field_all, 0, :elm_genlist_item_field_label, :elm_genlist_item_field_content,
            :elm_genlist_item_field_state ]
        # typedef enum _Elm_Fileselector_Mode {...} Elm_Fileselector_Mode;
        enum :elm_fileselector_mode, [ :elm_fileselector_list, 0, :elm_fileselector_grid, :elm_fileselector_last ]
        # typedef enum _Elm_Photocam_Zoom_Mode {...} Elm_Photocam_Zoom_Mode;
        enum :elm_photocam_zoom_mode, [ :elm_photocam_zoom_mode_manual, 0, :elm_photocam_zoom_mode_auto_fit, :elm_photocam_zoom_mode_auto_fill,
            :elm_photocam_zoom_mode_auto_fit_in, :elm_photocam_zoom_mode_last ]
        # typedef enum _Elm_Map_Zoom_Mode {...} Elm_Map_Zoom_Mode;
        enum :elm_map_zoom_mode, [ :elm_map_zoom_mode_manual, :elm_map_zoom_mode_auto_fit, :elm_map_zoom_mode_auto_fill, :elm_map_zoom_mode_last ]
        # typedef enum _Elm_Map_Route_Sources {...} Elm_Map_Route_Sources;
        enum :elm_map_route_sources, [ :elm_map_route_source_yours, :elm_map_route_source_monav, :elm_map_route_source_ors, :elm_map_route_source_last ]
        # typedef enum _Elm_Map_Name_Sources {...} Elm_Map_Name_Sources;
        enum :elm_map_name_sources, [ :elm_map_name_source_nominatim, :elm_map_name_source_last ]
        # typedef enum _Elm_Map_Route_Type {...} Elm_Map_Route_Type;
        enum :elm_map_route_type, [ :elm_map_route_type_motocar, :elm_map_route_type_bicycle, :elm_map_route_type_foot, :elm_map_route_type_last ]
        # typedef enum _Elm_Map_Route_Method {...} Elm_Map_Route_Method;
        enum :elm_map_route_method, [ :elm_map_route_method_fastest, :elm_map_route_method_shortest, :elm_map_route_method_last ]
        # typedef enum _Elm_Map_Name_Method {...} Elm_Map_Name_Method;
        enum :elm_map_name_method, [ :elm_map_name_method_search, :elm_map_name_method_reverse, :elm_map_name_method_last ]
        # typedef enum _Elm_Panel_Orient {...} Elm_Panel_Orient;
        enum :elm_panel_orient, [ :elm_panel_orient_top, :elm_panel_orient_bottom, :elm_panel_orient_left, :elm_panel_orient_right ]
        # typedef enum _Elm_Flip_Mode {...} Elm_Flip_Mode;
        enum :elm_flip_mode, [ :elm_flip_rotate_y_center_axis, :elm_flip_rotate_x_center_axis, :elm_flip_rotate_xz_center_axis, :elm_flip_rotate_yz_center_axis,
            :elm_flip_cube_left, :elm_flip_cube_right, :elm_flip_cube_up, :elm_flip_cube_down, :elm_flip_page_left, :elm_flip_page_right, :elm_flip_page_up, :elm_flip_page_down ]
        # typedef enum _Elm_Flip_Interaction {...} Elm_Flip_Interaction;
        enum :elm_flip_interaction, [ :elm_flip_interaction_none, :elm_flip_interaction_rotate, :elm_flip_interaction_cube, :elm_flip_interaction_page ]
        # typedef enum _Elm_Flip_Direction {...} Elm_Flip_Direction;
        enum :elm_flip_direction, [ :elm_flip_direction_up, :elm_flip_direction_down, :elm_flip_direction_left, :elm_flip_direction_right ]
        # typedef enum _Elm_Calendar_Mark_Repeat {...} Elm_Calendar_Mark_Repeat;
        enum :elm_calendar_mark_repeat, [ :elm_calendar_unique, :elm_calendar_daily, :elm_calendar_weekly, :elm_calendar_monthly, :elm_calendar_annually ]
        # typedef enum _Elm_Ctxpopup_Direction {...} Elm_Ctxpopup_Direction;
        enum :elm_ctxpopup_direction, [ :elm_ctxpopup_direction_down, :elm_ctxpopup_direction_right, :elm_ctxpopup_direction_left, :elm_ctxpopup_direction_up,
            :elm_ctxpopup_direction_unknown ]
        typedef :pointer, :elm_ctxpopup_direction_p
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
        # typedef enum {...} Elm_Store_Item_Mapping_Type;
        enum :elm_store_item_mapping_type, [ :elm_store_item_mapping_none, 0, :elm_store_item_mapping_label, :elm_store_item_mapping_state, :elm_store_item_mapping_icon,
            :elm_store_item_mapping_photo, :elm_store_item_mapping_custom, :elm_store_item_mapping_last ]
        #
        # TYPEDEFS
        # typedef struct _Elm_Version Elm_Version;
        typedef :pointer, :elm_version
        typedef :pointer, :elm_version_p
        # typedef struct _Elm_Event_Policy_Changed Elm_Event_Policy_Changed;
        typedef :pointer, :elm_event_policy_changed
        # typedef struct _Elm_Object_Item Elm_Object_Item;
        typedef :pointer, :elm_object_item
        typedef :pointer, :elm_object_item_p
        # typedef struct _Elm_Text_Class Elm_Text_Class;
        typedef :pointer, :elm_text_class
        # typedef struct _Elm_Font_Overlay Elm_Font_Overlay;
        typedef :pointer, :elm_font_overlay
        # typedef struct _Elm_Font_Properties Elm_Font_Properties;
        typedef :pointer, :elm_font_properties
        typedef :pointer, :elm_font_properties_p
        # typedef struct _Elm_Theme Elm_Theme;
        typedef :pointer, :elm_theme
        typedef :pointer, :elm_theme_p
        # typedef struct _Elm_Box_Transition Elm_Box_Transition;
        typedef :pointer, :elm_box_transition
        typedef :pointer, :elm_box_transition_p
        # typedef struct Elm_Gen_Item Elm_Gen_Item;
        typedef :pointer, :elm_gen_item
        typedef :elm_gen_item, :elm_gen_item
        typedef :pointer, :elm_gen_item_p
        # typedef struct _Elm_Gen_Item_Class Elm_Gen_Item_Class;
        typedef :pointer, :elm_gen_item_class
        # typedef struct _Elm_Gen_Item_Class_Func Elm_Gen_Item_Class_Func;
        typedef :pointer, :elm_gen_item_class_func
        # typedef struct _Elm_Gengrid_Item_Class Elm_Gengrid_Item_Class;
        typedef :pointer, :elm_gengrid_item_class
        typedef :pointer, :elm_gengrid_item_class_p
        # typedef struct _Elm_Gengrid_Item Elm_Gengrid_Item;
        typedef :pointer, :elm_gengrid_item
        typedef :pointer, :elm_gengrid_item_p
        # typedef struct _Elm_Gengrid_Item_Class_Func Elm_Gengrid_Item_Class_Func;
        typedef :pointer, :elm_gengrid_item_class_func
        # typedef struct _Elm_Entry_Anchor_Info Elm_Entry_Anchor_Info;
        typedef :pointer, :elm_entry_anchor_info
        # typedef Edje_Entry_Change_Info Elm_Entry_Change_Info;
        typedef :edje_entry_change_info, :elm_entry_change_info
        # typedef struct _Elm_Entry_Filter_Limit_Size Elm_Entry_Filter_Limit_Size;
        typedef :pointer, :elm_entry_filter_limit_size
        # typedef struct _Elm_Entry_Filter_Accept_Set Elm_Entry_Filter_Accept_Set;
        typedef :pointer, :elm_entry_filter_accept_set
        # typedef struct _Elm_Entry_Anchorview_Info Elm_Entry_Anchorview_Info;
        typedef :pointer, :elm_entry_anchorview_info
        # typedef struct _Elm_Entry_Anchorblock_Info Elm_Entry_Anchorblock_Info;
        typedef :pointer, :elm_entry_anchorblock_info
        # typedef enum _Elm_Gesture_Types Elm_Gesture_Types;
        typedef :pointer, :elm_gesture_types
        # typedef enum _Elm_Gesture_State Elm_Gesture_State;
        typedef :pointer, :elm_gesture_state
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
        # typedef struct _Elm_Web_Frame_Load_Error Elm_Web_Frame_Load_Error;
        typedef :pointer, :elm_web_frame_load_error
        # typedef struct _Elm_Web_Menu_Item Elm_Web_Menu_Item;
        typedef :pointer, :elm_web_menu_item
        # typedef struct _Elm_Web_Menu Elm_Web_Menu;
        typedef :pointer, :elm_web_menu
        # typedef struct _Elm_Web_Download Elm_Web_Download;
        typedef :pointer, :elm_web_download
        # typedef struct _Elm_Web_Window_Features Elm_Web_Window_Features;
        typedef :pointer, :elm_web_window_features
        typedef :pointer, :elm_web_window_features_p
        # typedef struct _Elm_Hoversel_Item Elm_Hoversel_Item;
        typedef :pointer, :elm_hoversel_item
        typedef :pointer, :elm_hoversel_item_p
        # typedef struct _Elm_Toolbar_Item Elm_Toolbar_Item;
        typedef :pointer, :elm_toolbar_item
        typedef :pointer, :elm_toolbar_item_p
        # typedef struct _Elm_Toolbar_Item_State Elm_Toolbar_Item_State;
        typedef :pointer, :elm_toolbar_item_state
        typedef :pointer, :elm_toolbar_item_state_p
        # typedef struct _Elm_Menu_Item Elm_Menu_Item;
        typedef :pointer, :elm_menu_item
        typedef :pointer, :elm_menu_item_p
        # typedef struct _Elm_List_Item Elm_List_Item;
        typedef :pointer, :elm_list_item
        typedef :pointer, :elm_list_item_p
        # typedef struct _Elm_Genlist_Item_Class Elm_Genlist_Item_Class;
        typedef :pointer, :elm_genlist_item_class
        typedef :pointer, :elm_genlist_item_class_p
        # typedef struct _Elm_Genlist_Item Elm_Genlist_Item;
        typedef :pointer, :elm_genlist_item
        typedef :pointer, :elm_genlist_item_p
        # typedef struct _Elm_Genlist_Item_Class_Func Elm_Genlist_Item_Class_Func;
        typedef :pointer, :elm_genlist_item_class_func
        # typedef struct _Elm_Slideshow_Item_Class Elm_Slideshow_Item_Class;
        typedef :pointer, :elm_slideshow_item_class
        typedef :pointer, :elm_slideshow_item_class_p
        # typedef struct _Elm_Slideshow_Item_Class_Func Elm_Slideshow_Item_Class_Func;
        typedef :pointer, :elm_slideshow_item_class_func
        # typedef struct _Elm_Slideshow_Item Elm_Slideshow_Item;
        typedef :pointer, :elm_slideshow_item
        typedef :pointer, :elm_slideshow_item_p
        # typedef struct _Elm_Index_Item Elm_Index_Item;
        typedef :pointer, :elm_index_item
        typedef :pointer, :elm_index_item_p
        # typedef struct _Elm_Map_Marker Elm_Map_Marker;
        typedef :pointer, :elm_map_marker
        typedef :pointer, :elm_map_marker_p
        # typedef struct _Elm_Map_Marker_Class Elm_Map_Marker_Class;
        typedef :pointer, :elm_map_marker_class
        typedef :pointer, :elm_map_marker_class_p
        # typedef struct _Elm_Map_Group_Class Elm_Map_Group_Class;
        typedef :pointer, :elm_map_group_class
        typedef :pointer, :elm_map_group_class_p
        # typedef struct _Elm_Map_Route Elm_Map_Route;
        typedef :pointer, :elm_map_route
        typedef :pointer, :elm_map_route_p
        # typedef struct _Elm_Map_Name Elm_Map_Name;
        typedef :pointer, :elm_map_name
        typedef :pointer, :elm_map_name_p
        # typedef struct _Elm_Map_Track Elm_Map_Track;
        typedef :pointer, :elm_map_track
        # typedef struct _Elm_Calendar_Mark Elm_Calendar_Mark;
        typedef :pointer, :elm_calendar_mark
        typedef :pointer, :elm_calendar_mark_p
        # typedef struct _Elm_Diskselector_Item Elm_Diskselector_Item;
        typedef :pointer, :elm_diskselector_item
        typedef :pointer, :elm_diskselector_item_p
        # typedef struct _Elm_Transit Elm_Transit;
        typedef :pointer, :elm_transit
        typedef :pointer, :elm_transit_p
        # typedef void Elm_Transit_Effect;
        typedef :void, :elm_transit_effect
        typedef :pointer, :elm_transit_effect_p
        # typedef struct _Elm_Store Elm_Store;
        typedef :pointer, :elm_store
        typedef :pointer, :elm_store_p
        # typedef struct _Elm_Store_Filesystem Elm_Store_Filesystem;
        typedef :pointer, :elm_store_filesystem
        # typedef struct _Elm_Store_Item Elm_Store_Item;
        typedef :pointer, :elm_store_item
        typedef :pointer, :elm_store_item_p
        # typedef struct _Elm_Store_Item_Filesystem Elm_Store_Item_Filesystem;
        typedef :pointer, :elm_store_item_filesystem
        # typedef struct _Elm_Store_Item_Info Elm_Store_Item_Info;
        typedef :pointer, :elm_store_item_info
        typedef :pointer, :elm_store_item_info_p
        # typedef struct _Elm_Store_Item_Info_Filesystem Elm_Store_Item_Info_Filesystem;
        typedef :pointer, :elm_store_item_info_filesystem
        # typedef struct _Elm_Store_Item_Mapping Elm_Store_Item_Mapping;
        typedef :pointer, :elm_store_item_mapping
        # typedef struct _Elm_Store_Item_Mapping_Empty Elm_Store_Item_Mapping_Empty;
        typedef :pointer, :elm_store_item_mapping_empty
        # typedef struct _Elm_Store_Item_Mapping_Icon Elm_Store_Item_Mapping_Icon;
        typedef :pointer, :elm_store_item_mapping_icon
        # typedef struct _Elm_Store_Item_Mapping_Photo Elm_Store_Item_Mapping_Photo;
        typedef :pointer, :elm_store_item_mapping_photo
        # typedef struct _Elm_Store_Item_Mapping_Custom Elm_Store_Item_Mapping_Custom;
        typedef :pointer, :elm_store_item_mapping_custom
        # typedef struct _Elm_Segment_Item Elm_Segment_Item;
        typedef :pointer, :elm_segment_item
        typedef :pointer, :elm_segment_item_p
        # typedef struct _Multibuttonentry_Item Elm_Multibuttonentry_Item;
        typedef :pointer, :elm_multibuttonentry_item
        typedef :pointer, :elm_multibuttonentry_item_p
        #
        # CALLBACKS
        # typedef Evas_Object *(*Elm_Tooltip_Content_Cb) (void *data, Evas_Object *obj, Evas_Object *tooltip);
        callback :elm_tooltip_content_cb, [ :void_p, :evas_object_p, :evas_object_p ], :evas_object_p
        # typedef Evas_Object *(*Elm_Tooltip_Item_Content_Cb) (void *data, Evas_Object *obj, Evas_Object *tooltip, void *item);
        callback :elm_tooltip_item_content_cb, [ :void_p, :evas_object_p, :evas_object_p, :void_p ], :evas_object_p
        # typedef Eina_Bool (*Elm_Event_Cb) (void *data, Evas_Object *obj, Evas_Object *src, Evas_Callback_Type type, void *event_info);
        callback :elm_event_cb, [ :void_p, :evas_object_p, :evas_object_p, :evas_callback_type, :void_p ], :eina_bool
        # typedef void (*Elm_GLView_Func_Cb) (Evas_Object *obj);
        callback :elm_glview_func_cb, [ :evas_object_p ], :void
        # typedef char *(*Elm_Gen_Item_Text_Get_Cb) (void *data, Evas_Object *obj, const char *part);
        callback :elm_gen_item_text_get_cb, [ :void_p, :evas_object_p, :string ], :string
        # typedef Evas_Object *(*Elm_Gen_Item_Content_Get_Cb) (void *data, Evas_Object *obj, const char *part);
        callback :elm_gen_item_content_get_cb, [ :void_p, :evas_object_p, :string ], :evas_object_p
        # typedef Eina_Bool (*Elm_Gen_Item_State_Get_Cb) (void *data, Evas_Object *obj, const char *part);
        callback :elm_gen_item_state_get_cb, [ :void_p, :evas_object_p, :string ], :eina_bool
        # typedef void (*Elm_Gen_Item_Del_Cb) (void *data, Evas_Object *obj);
        callback :elm_gen_item_del_cb, [ :void_p, :evas_object_p ], :void
        # typedef char *(*Elm_Gengrid_Item_Text_Get_Cb) (void *data, Evas_Object *obj, const char *part);
        callback :elm_gengrid_item_text_get_cb, [ :void_p, :evas_object_p, :string ], :string
        # typedef Evas_Object *(*Elm_Gengrid_Item_Content_Get_Cb) (void *data, Evas_Object *obj, const char *part);
        callback :elm_gengrid_item_content_get_cb, [ :void_p, :evas_object_p, :string ], :evas_object_p
        # typedef Eina_Bool (*Elm_Gengrid_Item_State_Get_Cb) (void *data, Evas_Object *obj, const char *part);
        callback :elm_gengrid_item_state_get_cb, [ :void_p, :evas_object_p, :string ], :eina_bool
        # typedef void (*Elm_Gengrid_Item_Del_Cb) (void *data, Evas_Object *obj);
        callback :elm_gengrid_item_del_cb, [ :void_p, :evas_object_p ], :void
        # typedef void (*Elm_Entry_Filter_Cb) (void *data, Evas_Object *entry, char **text);
        callback :elm_entry_filter_cb, [ :void_p, :evas_object_p, :string_array ], :void
        # typedef Evas_Event_Flags (*Elm_Gesture_Event_Cb) (void *data, void *event_info);
        callback :elm_gesture_event_cb, [ :void_p, :void_p ], :evas_event_flags
        # typedef Evas_Object *(*Elm_Web_Window_Open) (void *data, Evas_Object *obj, Eina_Bool js, const Elm_Web_Window_Features *window_features);
        callback :elm_web_window_open, [ :void_p, :evas_object_p, :eina_bool, :elm_web_window_features_p ], :evas_object_p
        # typedef Evas_Object *(*Elm_Web_Dialog_Alert) (void *data, Evas_Object *obj, const char *message);
        callback :elm_web_dialog_alert, [ :void_p, :evas_object_p, :string ], :evas_object_p
        # typedef Evas_Object *(*Elm_Web_Dialog_Confirm) (void *data, Evas_Object *obj, const char *message, Eina_Bool *ret);
        callback :elm_web_dialog_confirm, [ :void_p, :evas_object_p, :string, :eina_bool_p ], :evas_object_p
        # typedef Evas_Object *(*Elm_Web_Dialog_Prompt) (void *data, Evas_Object *obj, const char *message, const char *def_value, char **value, Eina_Bool *ret);
        callback :elm_web_dialog_prompt, [ :void_p, :evas_object_p, :string, :string, :string_array, :eina_bool_p ], :evas_object_p
        # typedef Evas_Object *(*Elm_Web_Dialog_File_Selector) (void *data, Evas_Object *obj, Eina_Bool allows_multiple, Eina_List *accept_types, Eina_List **selected, Eina_Bool *ret);
        callback :elm_web_dialog_file_selector, [ :void_p, :evas_object_p, :eina_bool, :eina_list_p, :eina_list_pp, :eina_bool_p ], :evas_object_p
        # typedef void (*Elm_Web_Console_Message) (void *data, Evas_Object *obj, const char *message, unsigned int line_number, const char *source_id);
        callback :elm_web_console_message, [ :void_p, :evas_object_p, :string, :uint, :string ], :void
        # 
        # FIXME
        # typedef char *(*Elm_Genlist_Item_Text_Get_Cb) (void *data, Evas_Object *obj, const char *part);
        callback :elm_genlist_item_text_get_cb, [ :void_p, :evas_object_p, :string ], :string
        # typedef Evas_Object *(*Elm_Genlist_Item_Content_Get_Cb) (void *data, Evas_Object *obj, const char *part);
        callback :elm_genlist_item_content_get_cb, [ :void_p, :evas_object_p, :string ], :evas_object_p
        # typedef Eina_Bool (*Elm_Genlist_Item_State_Get_Cb) (void *data, Evas_Object *obj, const char *part);
        callback :elm_genlist_item_state_get_cb, [ :void_p, :evas_object_p, :string ], :eina_bool
        # typedef void (*Elm_Genlist_Item_Del_Cb) (void *data, Evas_Object *obj);
        callback :elm_genlist_item_del_cb, [ :void_p, :evas_object_p ], :void
        # typedef Evas_Object *(*SlideshowItemGetFunc) (void *data, Evas_Object *obj);
        callback :slideshowitemgetfunc, [ :void_p, :evas_object_p ], :evas_object_p
        # typedef void (*SlideshowItemDelFunc) (void *data, Evas_Object *obj);
        callback :slideshowitemdelfunc, [ :void_p, :evas_object_p ], :void
        # typedef Evas_Object *(*ElmMapMarkerGetFunc) (Evas_Object *obj, Elm_Map_Marker *marker, void *data);
        callback :elmmapmarkergetfunc, [ :evas_object_p, :elm_map_marker_p, :void_p ], :evas_object_p
        # typedef void (*ElmMapMarkerDelFunc) (Evas_Object *obj, Elm_Map_Marker *marker, void *data, Evas_Object *o);
        callback :elmmapmarkerdelfunc, [ :evas_object_p, :elm_map_marker_p, :void_p, :evas_object_p ], :void
        # typedef Evas_Object *(*ElmMapMarkerIconGetFunc) (Evas_Object *obj, Elm_Map_Marker *marker, void *data);
        callback :elmmapmarkericongetfunc, [ :evas_object_p, :elm_map_marker_p, :void_p ], :evas_object_p
        # typedef Evas_Object *(*ElmMapGroupIconGetFunc) (Evas_Object *obj, void *data);
        callback :elmmapgroupicongetfunc, [ :evas_object_p, :void_p ], :evas_object_p
        # typedef char *(*ElmMapModuleSourceFunc) (void);
        callback :elmmapmodulesourcefunc, [  ], :string
        # typedef int (*ElmMapModuleZoomMinFunc) (void);
        callback :elmmapmodulezoomminfunc, [  ], :int
        # typedef int (*ElmMapModuleZoomMaxFunc) (void);
        callback :elmmapmodulezoommaxfunc, [  ], :int
        # typedef char *(*ElmMapModuleUrlFunc) (Evas_Object *obj, int x, int y, int zoom);
        callback :elmmapmoduleurlfunc, [ :evas_object_p, :int, :int, :int ], :string
        # typedef int (*ElmMapModuleRouteSourceFunc) (void);
        callback :elmmapmoduleroutesourcefunc, [  ], :int
        # typedef char *(*ElmMapModuleRouteUrlFunc) (Evas_Object *obj, char *type_name, int method, double flon, double flat, double tlon, double tlat);
        callback :elmmapmodulerouteurlfunc, [ :evas_object_p, :string, :int, :double, :double, :double, :double ], :string
        # typedef char *(*ElmMapModuleNameUrlFunc) (Evas_Object *obj, int method, char *name, double lon, double lat);
        callback :elmmapmodulenameurlfunc, [ :evas_object_p, :int, :string, :double, :double ], :string
        # typedef Eina_Bool (*ElmMapModuleGeoIntoCoordFunc) (const Evas_Object *obj, int zoom, double lon, double lat, int size, int *x, int *y);
        callback :elmmapmodulegeointocoordfunc, [ :evas_object_p, :int, :double, :double, :int, :int_p, :int_p ], :eina_bool
        # typedef Eina_Bool (*ElmMapModuleCoordIntoGeoFunc) (const Evas_Object *obj, int zoom, int x, int y, int size, double *lon, double *lat);
        callback :elmmapmodulecoordintogeofunc, [ :evas_object_p, :int, :int, :int, :int, :double_p, :double_p ], :eina_bool
        # typedef void (*Elm_Transit_Effect_Transition_Cb) (Elm_Transit_Effect *effect, Elm_Transit *transit, double progress);
        callback :elm_transit_effect_transition_cb, [ :void_p, :elm_transit_p, :double ], :void
        # typedef void (*Elm_Transit_Effect_End_Cb) (Elm_Transit_Effect *effect, Elm_Transit *transit);
        callback :elm_transit_effect_end_cb, [ :void_p, :elm_transit_p ], :void
        # typedef void (*Elm_Transit_Del_Cb) (void *data, Elm_Transit *transit);
        callback :elm_transit_del_cb, [ :void_p, :elm_transit_p ], :void
        # typedef Eina_Bool (*Elm_Store_Item_List_Cb) (void *data, Elm_Store_Item_Info *info);
        callback :elm_store_item_list_cb, [ :void_p, :elm_store_item_info_p ], :eina_bool
        # typedef void (*Elm_Store_Item_Fetch_Cb) (void *data, Elm_Store_Item *sti);
        callback :elm_store_item_fetch_cb, [ :void_p, :elm_store_item_p ], :void
        # typedef void (*Elm_Store_Item_Unfetch_Cb) (void *data, Elm_Store_Item *sti);
        callback :elm_store_item_unfetch_cb, [ :void_p, :elm_store_item_p ], :void
        # typedef void *(*Elm_Store_Item_Mapping_Cb) (void *data, Elm_Store_Item *sti, const char *part);
        callback :elm_store_item_mapping_cb, [ :void_p, :elm_store_item_p, :string ], :void_p
        # void(*transition_end_cb)(void *data)
        callback :elm_box_transition_end_cb, [ :void_p ], :void
        # typedef Eina_Bool (*Elm_Multibuttonentry_Item_Filter_callback) (Evas_Object *obj, const char *item_label, void *item_data, void *data);
        callback :elm_multibuttonentry_item_filter_callback, [ :evas_object_p, :string, :void_p, :void_p ], :eina_bool
        #
        # VARIABLES
        # EAPI extern Elm_Version *elm_version;
        attach_variable :elm_version, :elm_version_p
        # EAPI extern int ELM_ECORE_EVENT_ETHUMB_CONNECT;
        attach_variable :ELM_ECORE_EVENT_ETHUMB_CONNECT, :int
        # EAPI extern int ELM_EVENT_CONFIG_ALL_CHANGED;
        attach_variable :ELM_EVENT_CONFIG_ALL_CHANGED, :int
        # EAPI extern int ELM_EVENT_POLICY_CHANGED;
        attach_variable :ELM_EVENT_POLICY_CHANGED, :int
        #
        # FUNCTIONS
        fcts = [
        # EAPI int elm_init(int argc, char **argv);
        [ :elm_init, [ :int, :string_array ], :int ],
        # EAPI int elm_shutdown(void);
        [ :elm_shutdown, [  ], :int ],
        # EAPI void elm_run(void);
        [ :elm_run, [  ], :void ],
        # EAPI void elm_exit(void);
        [ :elm_exit, [  ], :void ],
        # EAPI void elm_app_info_set(void *mainfunc, const char *dom, const char *checkfile);
        [ :elm_app_info_set, [ :void_p, :string, :string ], :void ],
        # EAPI void elm_app_compile_bin_dir_set(const char *dir);
        [ :elm_app_compile_bin_dir_set, [ :string ], :void ],
        # EAPI void elm_app_compile_lib_dir_set(const char *dir);
        [ :elm_app_compile_lib_dir_set, [ :string ], :void ],
        # EAPI void elm_app_compile_data_dir_set(const char *dir);
        [ :elm_app_compile_data_dir_set, [ :string ], :void ],
        # EAPI void elm_app_compile_locale_set(const char *dir);
        [ :elm_app_compile_locale_set, [ :string ], :void ],
        # EAPI const char *elm_app_prefix_dir_get(void);
        [ :elm_app_prefix_dir_get, [  ], :string ],
        # EAPI const char *elm_app_bin_dir_get(void);
        [ :elm_app_bin_dir_get, [  ], :string ],
        # EAPI const char *elm_app_lib_dir_get(void);
        [ :elm_app_lib_dir_get, [  ], :string ],
        # EAPI const char *elm_app_data_dir_get(void);
        [ :elm_app_data_dir_get, [  ], :string ],
        # EAPI const char *elm_app_locale_dir_get(void);
        [ :elm_app_locale_dir_get, [  ], :string ],
        # EAPI void elm_quicklaunch_mode_set(Eina_Bool ql_on);
        [ :elm_quicklaunch_mode_set, [ :eina_bool ], :void ],
        # EAPI Eina_Bool elm_quicklaunch_mode_get(void);
        [ :elm_quicklaunch_mode_get, [  ], :eina_bool ],
        # EAPI int elm_quicklaunch_init(int argc, char **argv);
        [ :elm_quicklaunch_init, [ :int, :string_array ], :int ],
        # EAPI int elm_quicklaunch_sub_init(int argc, char **argv);
        [ :elm_quicklaunch_sub_init, [ :int, :string_array ], :int ],
        # EAPI int elm_quicklaunch_sub_shutdown(void);
        [ :elm_quicklaunch_sub_shutdown, [  ], :int ],
        # EAPI int elm_quicklaunch_shutdown(void);
        [ :elm_quicklaunch_shutdown, [  ], :int ],
        # EAPI void elm_quicklaunch_seed(void);
        [ :elm_quicklaunch_seed, [  ], :void ],
        # EAPI Eina_Bool elm_quicklaunch_prepare(int argc, char **argv);
        [ :elm_quicklaunch_prepare, [ :int, :string_array ], :eina_bool ],
        # EAPI Eina_Bool elm_quicklaunch_fork(int argc, char **argv, char *cwd, void (postfork_func) (void *data), void *postfork_data);
        # FIXME
        # EAPI void elm_quicklaunch_cleanup(void);
        [ :elm_quicklaunch_cleanup, [  ], :void ],
        # EAPI int elm_quicklaunch_fallback(int argc, char **argv);
        [ :elm_quicklaunch_fallback, [ :int, :string_array ], :int ],
        # EAPI char *elm_quicklaunch_exe_path_get(const char *exe);
        [ :elm_quicklaunch_exe_path_get, [ :string ], :string ],
        # EAPI Eina_Bool elm_need_efreet(void);
        [ :elm_need_efreet, [  ], :eina_bool ],
        # EAPI Eina_Bool elm_need_e_dbus(void);
        [ :elm_need_e_dbus, [  ], :eina_bool ],
        # EAPI Eina_Bool elm_need_ethumb(void);
        [ :elm_need_ethumb, [  ], :eina_bool ],
        # EAPI Eina_Bool elm_need_web(void);
        [ :elm_need_web, [  ], :eina_bool ],
        # EAPI Eina_Bool elm_policy_set(unsigned int policy, int value);
        [ :elm_policy_set, [ :uint, :int ], :eina_bool ],
        # EAPI int elm_policy_get(unsigned int policy);
        [ :elm_policy_get, [ :uint ], :int ],
        # EAPI void elm_language_set(const char *lang);
        [ :elm_language_set, [ :string ], :void ],
        # EAPI void elm_object_part_text_set(Evas_Object *obj, const char *part, const char *label);
        [ :elm_object_part_text_set, [ :evas_object_p, :string, :string ], :void ],
        # EAPI const char *elm_object_part_text_get(const Evas_Object *obj, const char *part);
        [ :elm_object_part_text_get, [ :evas_object_p, :string ], :string ],
        # EAPI void elm_object_domain_translatable_text_part_set(Evas_Object *obj, const char *part, const char *domain, const char *text);
        [ :elm_object_domain_translatable_text_part_set, [ :evas_object_p, :string, :string, :string ], :void ],
        # EAPI const char *elm_object_translatable_text_part_get(const Evas_Object *obj, const char *part);
        [ :elm_object_translatable_text_part_get, [ :evas_object_p, :string ], :string ],
        # EAPI void elm_object_part_content_set(Evas_Object *obj, const char *part, Evas_Object *content);
        [ :elm_object_part_content_set, [ :evas_object_p, :string, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_object_part_content_get(const Evas_Object *obj, const char *part);
        [ :elm_object_part_content_get, [ :evas_object_p, :string ], :evas_object_p ],
        # EAPI Evas_Object *elm_object_part_content_unset(Evas_Object *obj, const char *part);
        [ :elm_object_part_content_unset, [ :evas_object_p, :string ], :evas_object_p ],
        # EAPI void elm_object_access_info_set(Evas_Object *obj, const char *txt);
        [ :elm_object_access_info_set, [ :evas_object_p, :string ], :void ],
        # EAPI Evas_Object *elm_object_item_object_get(const Elm_Object_Item *it);
        [ :elm_object_item_object_get, [ :elm_object_item_p ], :evas_object_p ],
        # EAPI void elm_object_item_part_content_set(Elm_Object_Item *it, const char *part, Evas_Object *content);
        [ :elm_object_item_part_content_set, [ :elm_object_item_p, :string, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_object_item_content_part_get(const Elm_Object_Item *it, const char *part);
        [ :elm_object_item_content_part_get, [ :elm_object_item_p, :string ], :evas_object_p ],
        # EAPI Evas_Object *elm_object_item_part_content_get(const Elm_Object_Item *it, const char *part);
        [ :elm_object_item_part_content_get, [ :elm_object_item_p, :string ], :evas_object_p ],
        # EAPI Evas_Object *elm_object_item_part_content_unset(Elm_Object_Item *it, const char *part);
        [ :elm_object_item_part_content_unset, [ :elm_object_item_p, :string ], :evas_object_p ],
        # EAPI void elm_object_item_part_text_set(Elm_Object_Item *it, const char *part, const char *label);
        [ :elm_object_item_part_text_set, [ :elm_object_item_p, :string, :string ], :void ],
        # EAPI const char *elm_object_item_part_text_get(const Elm_Object_Item *it, const char *part);
        [ :elm_object_item_part_text_get, [ :elm_object_item_p, :string ], :string ],
        # EAPI void elm_object_item_access_info_set(Elm_Object_Item *it, const char *txt);
        [ :elm_object_item_access_info_set, [ :elm_object_item_p, :string ], :void ],
        # EAPI void *elm_object_item_data_get(const Elm_Object_Item *it);
        [ :elm_object_item_data_get, [ :elm_object_item_p ], :void_p ],
        # EAPI void elm_object_item_data_set(Elm_Object_Item *it, void *data);
        [ :elm_object_item_data_set, [ :elm_object_item_p, :void_p ], :void ],
        # EAPI void elm_object_item_signal_emit(Elm_Object_Item *it, const char *emission, const char *source);
        [ :elm_object_item_signal_emit, [ :elm_object_item_p, :string, :string ], :void ],
        # EAPI void elm_object_item_disabled_set(Elm_Object_Item *it, Eina_Bool disabled);
        [ :elm_object_item_disabled_set, [ :elm_object_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_object_item_disabled_get(const Elm_Object_Item *it);
        [ :elm_object_item_disabled_get, [ :elm_object_item_p ], :eina_bool ],
        # EAPI void elm_all_flush(void);
        [ :elm_all_flush, [  ], :void ],
        # EAPI int elm_cache_flush_interval_get(void);
        [ :elm_cache_flush_interval_get, [  ], :int ],
        # EAPI void elm_cache_flush_interval_set(int size);
        [ :elm_cache_flush_interval_set, [ :int ], :void ],
        # EAPI void elm_cache_flush_interval_all_set(int size);
        [ :elm_cache_flush_interval_all_set, [ :int ], :void ],
        # EAPI Eina_Bool elm_cache_flush_enabled_get(void);
        [ :elm_cache_flush_enabled_get, [  ], :eina_bool ],
        # EAPI void elm_cache_flush_enabled_set(Eina_Bool enabled);
        [ :elm_cache_flush_enabled_set, [ :eina_bool ], :void ],
        # EAPI void elm_cache_flush_enabled_all_set(Eina_Bool enabled);
        [ :elm_cache_flush_enabled_all_set, [ :eina_bool ], :void ],
        # EAPI int elm_font_cache_get(void);
        [ :elm_font_cache_get, [  ], :int ],
        # EAPI void elm_font_cache_set(int size);
        [ :elm_font_cache_set, [ :int ], :void ],
        # EAPI void elm_font_cache_all_set(int size);
        [ :elm_font_cache_all_set, [ :int ], :void ],
        # EAPI int elm_image_cache_get(void);
        [ :elm_image_cache_get, [  ], :int ],
        # EAPI void elm_image_cache_set(int size);
        [ :elm_image_cache_set, [ :int ], :void ],
        # EAPI void elm_image_cache_all_set(int size);
        [ :elm_image_cache_all_set, [ :int ], :void ],
        # EAPI int elm_edje_file_cache_get(void);
        [ :elm_edje_file_cache_get, [  ], :int ],
        # EAPI void elm_edje_file_cache_set(int size);
        [ :elm_edje_file_cache_set, [ :int ], :void ],
        # EAPI void elm_edje_file_cache_all_set(int size);
        [ :elm_edje_file_cache_all_set, [ :int ], :void ],
        # EAPI int elm_edje_collection_cache_get(void);
        [ :elm_edje_collection_cache_get, [  ], :int ],
        # EAPI void elm_edje_collection_cache_set(int size);
        [ :elm_edje_collection_cache_set, [ :int ], :void ],
        # EAPI void elm_edje_collection_cache_all_set(int size);
        [ :elm_edje_collection_cache_all_set, [ :int ], :void ],
        # EAPI double elm_scale_get(void);
        [ :elm_scale_get, [  ], :double ],
        # EAPI void elm_scale_set(double scale);
        [ :elm_scale_set, [ :double ], :void ],
        # EAPI void elm_scale_all_set(double scale);
        [ :elm_scale_all_set, [ :double ], :void ],
        # EAPI void elm_object_scale_set(Evas_Object *obj, double scale);
        [ :elm_object_scale_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_object_scale_get(const Evas_Object *obj);
        [ :elm_object_scale_get, [ :evas_object_p ], :double ],
        # EAPI Eina_Bool elm_password_show_last_get(void);
        [ :elm_password_show_last_get, [  ], :eina_bool ],
        # EAPI void elm_password_show_last_set(Eina_Bool password_show_last);
        [ :elm_password_show_last_set, [ :eina_bool ], :void ],
        # EAPI double elm_password_show_last_timeout_get(void);
        [ :elm_password_show_last_timeout_get, [  ], :double ],
        # EAPI void elm_password_show_last_timeout_set(double password_show_last_timeout);
        [ :elm_password_show_last_timeout_set, [ :double ], :void ],
        # EAPI Eina_Bool elm_mirrored_get(void);
        [ :elm_mirrored_get, [  ], :eina_bool ],
        # EAPI void elm_mirrored_set(Eina_Bool mirrored);
        [ :elm_mirrored_set, [ :eina_bool ], :void ],
        # EAPI Eina_Bool elm_object_mirrored_get(const Evas_Object *obj);
        [ :elm_object_mirrored_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_object_mirrored_set(Evas_Object *obj, Eina_Bool mirrored);
        [ :elm_object_mirrored_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_object_mirrored_automatic_get(const Evas_Object *obj);
        [ :elm_object_mirrored_automatic_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_object_mirrored_automatic_set(Evas_Object *obj, Eina_Bool automatic);
        [ :elm_object_mirrored_automatic_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI void elm_object_style_set(Evas_Object *obj, const char *style);
        [ :elm_object_style_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_object_style_get(const Evas_Object *obj);
        [ :elm_object_style_get, [ :evas_object_p ], :string ],
        # EAPI void elm_object_disabled_set(Evas_Object *obj, Eina_Bool disabled);
        [ :elm_object_disabled_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_object_disabled_get(const Evas_Object *obj);
        [ :elm_object_disabled_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_object_widget_check(const Evas_Object *obj);
        [ :elm_object_widget_check, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_object_parent_widget_get(const Evas_Object *obj);
        [ :elm_object_parent_widget_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_object_top_widget_get(const Evas_Object *obj);
        [ :elm_object_top_widget_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI const char *elm_object_widget_type_get(const Evas_Object *obj);
        [ :elm_object_widget_type_get, [ :evas_object_p ], :string ],
        # EAPI Eina_Bool elm_config_save(void);
        [ :elm_config_save, [  ], :eina_bool ],
        # EAPI void elm_config_reload(void);
        [ :elm_config_reload, [  ], :void ],
        # EAPI const char *elm_profile_current_get(void);
        [ :elm_profile_current_get, [  ], :string ],
        # EAPI const char *elm_profile_dir_get(const char *profile, Eina_Bool is_user);
        [ :elm_profile_dir_get, [ :string, :eina_bool ], :string ],
        # EAPI void elm_profile_dir_free(const char *p_dir);
        [ :elm_profile_dir_free, [ :string ], :void ],
        # EAPI Eina_List *elm_profile_list_get(void);
        [ :elm_profile_list_get, [  ], :eina_list_p ],
        # EAPI void elm_profile_list_free(Eina_List *l);
        [ :elm_profile_list_free, [ :eina_list_p ], :void ],
        # EAPI void elm_profile_set(const char *profile);
        [ :elm_profile_set, [ :string ], :void ],
        # EAPI void elm_profile_all_set(const char *profile);
        [ :elm_profile_all_set, [ :string ], :void ],
        # EAPI const char *elm_engine_current_get(void);
        [ :elm_engine_current_get, [  ], :string ],
        # EAPI void elm_engine_set(const char *engine);
        [ :elm_engine_set, [ :string ], :void ],
        # EAPI const Eina_List *elm_text_classes_list_get(void);
        [ :elm_text_classes_list_get, [  ], :eina_list_p ],
        # EAPI void elm_text_classes_list_free(const Eina_List *list);
        [ :elm_text_classes_list_free, [ :eina_list_p ], :void ],
        # EAPI const Eina_List *elm_font_overlay_list_get(void);
        [ :elm_font_overlay_list_get, [  ], :eina_list_p ],
        # EAPI void elm_font_overlay_set(const char *text_class, const char *font, Evas_Font_Size size);
        [ :elm_font_overlay_set, [ :string, :string, :int ], :void ],
        # EAPI void elm_font_overlay_unset(const char *text_class);
        [ :elm_font_overlay_unset, [ :string ], :void ],
        # EAPI void elm_font_overlay_apply(void);
        [ :elm_font_overlay_apply, [  ], :void ],
        # EAPI void elm_font_overlay_all_apply(void);
        [ :elm_font_overlay_all_apply, [  ], :void ],
        # EAPI Elm_Font_Properties *elm_font_properties_get(const char *font);
        [ :elm_font_properties_get, [ :string ], :elm_font_properties_p ],
        # EAPI void elm_font_properties_free(Elm_Font_Properties *efp);
        [ :elm_font_properties_free, [ :elm_font_properties_p ], :void ],
        # EAPI const char *elm_font_fontconfig_name_get(const char *name, const char *style);
        [ :elm_font_fontconfig_name_get, [ :string, :string ], :string ],
        # EAPI void elm_font_fontconfig_name_free(const char *name);
        [ :elm_font_fontconfig_name_free, [ :string ], :void ],
        # EAPI Eina_Hash *elm_font_available_hash_add(Eina_List *list);
        [ :elm_font_available_hash_add, [ :eina_list_p ], :eina_hash_p ],
        # EAPI void elm_font_available_hash_del(Eina_Hash *hash);
        [ :elm_font_available_hash_del, [ :eina_hash_p ], :void ],
        # EAPI Evas_Coord elm_finger_size_get(void);
        [ :elm_finger_size_get, [  ], :int ],
        # EAPI void elm_finger_size_set(Evas_Coord size);
        [ :elm_finger_size_set, [ :int ], :void ],
        # EAPI void elm_finger_size_all_set(Evas_Coord size);
        [ :elm_finger_size_all_set, [ :int ], :void ],
        # EAPI Eina_Bool elm_focus_highlight_enabled_get(void);
        [ :elm_focus_highlight_enabled_get, [  ], :eina_bool ],
        # EAPI void elm_focus_highlight_enabled_set(Eina_Bool enable);
        [ :elm_focus_highlight_enabled_set, [ :eina_bool ], :void ],
        # EAPI Eina_Bool elm_focus_highlight_animate_get(void);
        [ :elm_focus_highlight_animate_get, [  ], :eina_bool ],
        # EAPI void elm_focus_highlight_animate_set(Eina_Bool animate);
        [ :elm_focus_highlight_animate_set, [ :eina_bool ], :void ],
        # EAPI Eina_Bool elm_object_focus_get(const Evas_Object *obj);
        [ :elm_object_focus_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_object_focus_set(Evas_Object *obj, Eina_Bool focus);
        [ :elm_object_focus_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI void elm_object_focus_allow_set(Evas_Object *obj, Eina_Bool enable);
        [ :elm_object_focus_allow_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_object_focus_allow_get(const Evas_Object *obj);
        [ :elm_object_focus_allow_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_object_focus_custom_chain_set(Evas_Object *obj, Eina_List *objs);
        [ :elm_object_focus_custom_chain_set, [ :evas_object_p, :eina_list_p ], :void ],
        # EAPI void elm_object_focus_custom_chain_unset(Evas_Object *obj);
        [ :elm_object_focus_custom_chain_unset, [ :evas_object_p ], :void ],
        # EAPI const Eina_List *elm_object_focus_custom_chain_get(const Evas_Object *obj);
        [ :elm_object_focus_custom_chain_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI void elm_object_focus_custom_chain_append(Evas_Object *obj, Evas_Object *child, Evas_Object *relative_child);
        [ :elm_object_focus_custom_chain_append, [ :evas_object_p, :evas_object_p, :evas_object_p ], :void ],
        # EAPI void elm_object_focus_custom_chain_prepend(Evas_Object *obj, Evas_Object *child, Evas_Object *relative_child);
        [ :elm_object_focus_custom_chain_prepend, [ :evas_object_p, :evas_object_p, :evas_object_p ], :void ],
        # EAPI void elm_object_focus_cycle(Evas_Object *obj, Elm_Focus_Direction dir);
        [ :elm_object_focus_cycle, [ :evas_object_p, :elm_focus_direction ], :void ],
        # EAPI void elm_object_focus_direction_go(Evas_Object *obj, int x, int y);
        [ :elm_object_focus_direction_go, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_object_tree_unfocusable_set(Evas_Object *obj, Eina_Bool tree_unfocusable);
        [ :elm_object_tree_unfocusable_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_object_tree_unfocusable_get(const Evas_Object *obj);
        [ :elm_object_tree_unfocusable_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_scroll_bounce_enabled_get(void);
        [ :elm_scroll_bounce_enabled_get, [  ], :eina_bool ],
        # EAPI void elm_scroll_bounce_enabled_set(Eina_Bool enabled);
        [ :elm_scroll_bounce_enabled_set, [ :eina_bool ], :void ],
        # EAPI void elm_scroll_bounce_enabled_all_set(Eina_Bool enabled);
        [ :elm_scroll_bounce_enabled_all_set, [ :eina_bool ], :void ],
        # EAPI double elm_scroll_bounce_friction_get(void);
        [ :elm_scroll_bounce_friction_get, [  ], :double ],
        # EAPI void elm_scroll_bounce_friction_set(double friction);
        [ :elm_scroll_bounce_friction_set, [ :double ], :void ],
        # EAPI void elm_scroll_bounce_friction_all_set(double friction);
        [ :elm_scroll_bounce_friction_all_set, [ :double ], :void ],
        # EAPI double elm_scroll_page_scroll_friction_get(void);
        [ :elm_scroll_page_scroll_friction_get, [  ], :double ],
        # EAPI void elm_scroll_page_scroll_friction_set(double friction);
        [ :elm_scroll_page_scroll_friction_set, [ :double ], :void ],
        # EAPI void elm_scroll_page_scroll_friction_all_set(double friction);
        [ :elm_scroll_page_scroll_friction_all_set, [ :double ], :void ],
        # EAPI double elm_scroll_bring_in_scroll_friction_get(void);
        [ :elm_scroll_bring_in_scroll_friction_get, [  ], :double ],
        # EAPI void elm_scroll_bring_in_scroll_friction_set(double friction);
        [ :elm_scroll_bring_in_scroll_friction_set, [ :double ], :void ],
        # EAPI void elm_scroll_bring_in_scroll_friction_all_set(double friction);
        [ :elm_scroll_bring_in_scroll_friction_all_set, [ :double ], :void ],
        # EAPI double elm_scroll_zoom_friction_get(void);
        [ :elm_scroll_zoom_friction_get, [  ], :double ],
        # EAPI void elm_scroll_zoom_friction_set(double friction);
        [ :elm_scroll_zoom_friction_set, [ :double ], :void ],
        # EAPI void elm_scroll_zoom_friction_all_set(double friction);
        [ :elm_scroll_zoom_friction_all_set, [ :double ], :void ],
        # EAPI Eina_Bool elm_scroll_thumbscroll_enabled_get(void);
        [ :elm_scroll_thumbscroll_enabled_get, [  ], :eina_bool ],
        # EAPI void elm_scroll_thumbscroll_enabled_set(Eina_Bool enabled);
        [ :elm_scroll_thumbscroll_enabled_set, [ :eina_bool ], :void ],
        # EAPI void elm_scroll_thumbscroll_enabled_all_set(Eina_Bool enabled);
        [ :elm_scroll_thumbscroll_enabled_all_set, [ :eina_bool ], :void ],
        # EAPI unsigned int elm_scroll_thumbscroll_threshold_get(void);
        [ :elm_scroll_thumbscroll_threshold_get, [  ], :uint ],
        # EAPI void elm_scroll_thumbscroll_threshold_set(unsigned int threshold);
        [ :elm_scroll_thumbscroll_threshold_set, [ :uint ], :void ],
        # EAPI void elm_scroll_thumbscroll_threshold_all_set(unsigned int threshold);
        [ :elm_scroll_thumbscroll_threshold_all_set, [ :uint ], :void ],
        # EAPI double elm_scroll_thumbscroll_momentum_threshold_get(void);
        [ :elm_scroll_thumbscroll_momentum_threshold_get, [  ], :double ],
        # EAPI void elm_scroll_thumbscroll_momentum_threshold_set(double threshold);
        [ :elm_scroll_thumbscroll_momentum_threshold_set, [ :double ], :void ],
        # EAPI void elm_scroll_thumbscroll_momentum_threshold_all_set(double threshold);
        [ :elm_scroll_thumbscroll_momentum_threshold_all_set, [ :double ], :void ],
        # EAPI double elm_scroll_thumbscroll_friction_get(void);
        [ :elm_scroll_thumbscroll_friction_get, [  ], :double ],
        # EAPI void elm_scroll_thumbscroll_friction_set(double friction);
        [ :elm_scroll_thumbscroll_friction_set, [ :double ], :void ],
        # EAPI void elm_scroll_thumbscroll_friction_all_set(double friction);
        [ :elm_scroll_thumbscroll_friction_all_set, [ :double ], :void ],
        # EAPI double elm_scroll_thumbscroll_border_friction_get(void);
        [ :elm_scroll_thumbscroll_border_friction_get, [  ], :double ],
        # EAPI void elm_scroll_thumbscroll_border_friction_set(double friction);
        [ :elm_scroll_thumbscroll_border_friction_set, [ :double ], :void ],
        # EAPI void elm_scroll_thumbscroll_border_friction_all_set(double friction);
        [ :elm_scroll_thumbscroll_border_friction_all_set, [ :double ], :void ],
        # EAPI double elm_scroll_thumbscroll_sensitivity_friction_get(void);
        [ :elm_scroll_thumbscroll_sensitivity_friction_get, [  ], :double ],
        # EAPI void elm_scroll_thumbscroll_sensitivity_friction_set(double friction);
        [ :elm_scroll_thumbscroll_sensitivity_friction_set, [ :double ], :void ],
        # EAPI void elm_scroll_thumbscroll_sensitivity_friction_all_set(double friction);
        [ :elm_scroll_thumbscroll_sensitivity_friction_all_set, [ :double ], :void ],
        # EAPI void elm_object_scroll_hold_push(Evas_Object *obj);
        [ :elm_object_scroll_hold_push, [ :evas_object_p ], :void ],
        # EAPI void elm_object_scroll_hold_pop(Evas_Object *obj);
        [ :elm_object_scroll_hold_pop, [ :evas_object_p ], :void ],
        # EAPI void elm_object_scroll_freeze_push(Evas_Object *obj);
        [ :elm_object_scroll_freeze_push, [ :evas_object_p ], :void ],
        # EAPI void elm_object_scroll_freeze_pop(Evas_Object *obj);
        [ :elm_object_scroll_freeze_pop, [ :evas_object_p ], :void ],
        # EAPI void elm_object_scroll_lock_x_set(Evas_Object *obj, Eina_Bool lock);
        [ :elm_object_scroll_lock_x_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI void elm_object_scroll_lock_y_set(Evas_Object *obj, Eina_Bool lock);
        [ :elm_object_scroll_lock_y_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_object_scroll_lock_x_get(const Evas_Object *obj);
        [ :elm_object_scroll_lock_x_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_object_scroll_lock_y_get(const Evas_Object *obj);
        [ :elm_object_scroll_lock_y_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_object_signal_emit(Evas_Object *obj, const char *emission, const char *source);
        [ :elm_object_signal_emit, [ :evas_object_p, :string, :string ], :void ],
        # EAPI void elm_object_signal_callback_add(Evas_Object *obj, const char *emission, const char *source, Edje_Signal_Cb func, void *data);
        [ :elm_object_signal_callback_add, [ :evas_object_p, :string, :string, :edje_signal_cb, :void_p ], :void ],
        # EAPI void *elm_object_signal_callback_del(Evas_Object *obj, const char *emission, const char *source, Edje_Signal_Cb func);
        [ :elm_object_signal_callback_del, [ :evas_object_p, :string, :string, :edje_signal_cb ], :void_p ],
        # EAPI void elm_object_event_callback_add(Evas_Object *obj, Elm_Event_Cb func, const void *data);
        [ :elm_object_event_callback_add, [ :evas_object_p, :elm_event_cb, :void_p ], :void ],
        # EAPI void *elm_object_event_callback_del(Evas_Object *obj, Elm_Event_Cb func, const void *data);
        [ :elm_object_event_callback_del, [ :evas_object_p, :elm_event_cb, :void_p ], :void_p ],
        # EAPI void elm_coords_finger_size_adjust(int times_w, Evas_Coord *w, int times_h, Evas_Coord *h);
        [ :elm_coords_finger_size_adjust, [ :int, :int_p, :int, :int_p ], :void ],
        # EAPI double elm_longpress_timeout_get(void);
        [ :elm_longpress_timeout_get, [  ], :double ],
        # EAPI void elm_longpress_timeout_set(double longpress_timeout);
        [ :elm_longpress_timeout_set, [ :double ], :void ],
        # EAPI void elm_object_tree_dump(const Evas_Object *top);
        [ :elm_object_tree_dump, [ :evas_object_p ], :void ],
        # EAPI void elm_object_tree_dot_dump(const Evas_Object *top, const char *file);
        [ :elm_object_tree_dot_dump, [ :evas_object_p, :string ], :void ],
        # EAPI Elm_Theme *elm_theme_new(void);
        [ :elm_theme_new, [  ], :elm_theme_p ],
        # EAPI void elm_theme_free(Elm_Theme *th);
        [ :elm_theme_free, [ :elm_theme_p ], :void ],
        # EAPI void elm_theme_copy(Elm_Theme *th, Elm_Theme *thdst);
        [ :elm_theme_copy, [ :elm_theme_p, :elm_theme_p ], :void ],
        # EAPI void elm_theme_ref_set(Elm_Theme *th, Elm_Theme *thref);
        [ :elm_theme_ref_set, [ :elm_theme_p, :elm_theme_p ], :void ],
        # EAPI Elm_Theme *elm_theme_ref_get(Elm_Theme *th);
        [ :elm_theme_ref_get, [ :elm_theme_p ], :elm_theme_p ],
        # EAPI Elm_Theme *elm_theme_default_get(void);
        [ :elm_theme_default_get, [  ], :elm_theme_p ],
        # EAPI void elm_theme_overlay_add(Elm_Theme *th, const char *item);
        [ :elm_theme_overlay_add, [ :elm_theme_p, :string ], :void ],
        # EAPI void elm_theme_overlay_del(Elm_Theme *th, const char *item);
        [ :elm_theme_overlay_del, [ :elm_theme_p, :string ], :void ],
        # EAPI void elm_theme_extension_add(Elm_Theme *th, const char *item);
        [ :elm_theme_extension_add, [ :elm_theme_p, :string ], :void ],
        # EAPI void elm_theme_extension_del(Elm_Theme *th, const char *item);
        [ :elm_theme_extension_del, [ :elm_theme_p, :string ], :void ],
        # EAPI void elm_theme_set(Elm_Theme *th, const char *theme);
        [ :elm_theme_set, [ :elm_theme_p, :string ], :void ],
        # EAPI const char *elm_theme_get(Elm_Theme *th);
        [ :elm_theme_get, [ :elm_theme_p ], :string ],
        # EAPI const Eina_List *elm_theme_list_get(const Elm_Theme *th);
        [ :elm_theme_list_get, [ :elm_theme_p ], :eina_list_p ],
        # EAPI char *elm_theme_list_item_path_get(const char *f, Eina_Bool *in_search_path);
        [ :elm_theme_list_item_path_get, [ :string, :eina_bool_p ], :string ],
        # EAPI void elm_theme_flush(Elm_Theme *th);
        [ :elm_theme_flush, [ :elm_theme_p ], :void ],
        # EAPI void elm_theme_full_flush(void);
        [ :elm_theme_full_flush, [  ], :void ],
        # EAPI void elm_theme_all_set(const char *theme);
        [ :elm_theme_all_set, [ :string ], :void ],
        # EAPI Eina_List *elm_theme_name_available_list_new(void);
        [ :elm_theme_name_available_list_new, [  ], :eina_list_p ],
        # EAPI void elm_theme_name_available_list_free(Eina_List *list);
        [ :elm_theme_name_available_list_free, [ :eina_list_p ], :void ],
        # EAPI void elm_object_theme_set(Evas_Object *obj, Elm_Theme *th);
        [ :elm_object_theme_set, [ :evas_object_p, :elm_theme_p ], :void ],
        # EAPI Elm_Theme *elm_object_theme_get(const Evas_Object *obj);
        [ :elm_object_theme_get, [ :evas_object_p ], :elm_theme_p ],
        # EAPI const char *elm_theme_data_get(Elm_Theme *th, const char *key);
        [ :elm_theme_data_get, [ :elm_theme_p, :string ], :string ],
        # EAPI Evas_Object *elm_win_add(Evas_Object *parent, const char *name, Elm_Win_Type type);
        [ :elm_win_add, [ :evas_object_p, :string, :elm_win_type ], :evas_object_p ],
        # EAPI Evas_Object *elm_win_util_standard_add(const char *name, const char *title);
        [ :elm_win_util_standard_add, [ :string, :string ], :evas_object_p ],
        # EAPI void elm_win_resize_object_add(Evas_Object *obj, Evas_Object *subobj);
        [ :elm_win_resize_object_add, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI void elm_win_resize_object_del(Evas_Object *obj, Evas_Object *subobj);
        [ :elm_win_resize_object_del, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI void elm_win_title_set(Evas_Object *obj, const char *title);
        [ :elm_win_title_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_win_title_get(const Evas_Object *obj);
        [ :elm_win_title_get, [ :evas_object_p ], :string ],
        # EAPI void elm_win_autodel_set(Evas_Object *obj, Eina_Bool autodel);
        [ :elm_win_autodel_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_win_autodel_get(const Evas_Object *obj);
        [ :elm_win_autodel_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_activate(Evas_Object *obj);
        [ :elm_win_activate, [ :evas_object_p ], :void ],
        # EAPI void elm_win_lower(Evas_Object *obj);
        [ :elm_win_lower, [ :evas_object_p ], :void ],
        # EAPI void elm_win_raise(Evas_Object *obj);
        [ :elm_win_raise, [ :evas_object_p ], :void ],
        # EAPI void elm_win_center(Evas_Object *obj, Eina_Bool h, Eina_Bool v);
        [ :elm_win_center, [ :evas_object_p, :eina_bool, :eina_bool ], :void ],
        # EAPI void elm_win_borderless_set(Evas_Object *obj, Eina_Bool borderless);
        [ :elm_win_borderless_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_win_borderless_get(const Evas_Object *obj);
        [ :elm_win_borderless_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_shaped_set(Evas_Object *obj, Eina_Bool shaped);
        [ :elm_win_shaped_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_win_shaped_get(const Evas_Object *obj);
        [ :elm_win_shaped_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_alpha_set(Evas_Object *obj, Eina_Bool alpha);
        [ :elm_win_alpha_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_win_transparent_get(const Evas_Object *obj);
        [ :elm_win_transparent_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_transparent_set(Evas_Object *obj, Eina_Bool transparent);
        [ :elm_win_transparent_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_win_alpha_get(const Evas_Object *obj);
        [ :elm_win_alpha_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_override_set(Evas_Object *obj, Eina_Bool override);
        [ :elm_win_override_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_win_override_get(const Evas_Object *obj);
        [ :elm_win_override_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_fullscreen_set(Evas_Object *obj, Eina_Bool fullscreen);
        [ :elm_win_fullscreen_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_win_fullscreen_get(const Evas_Object *obj);
        [ :elm_win_fullscreen_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_maximized_set(Evas_Object *obj, Eina_Bool maximized);
        [ :elm_win_maximized_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_win_maximized_get(const Evas_Object *obj);
        [ :elm_win_maximized_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_iconified_set(Evas_Object *obj, Eina_Bool iconified);
        [ :elm_win_iconified_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_win_iconified_get(const Evas_Object *obj);
        [ :elm_win_iconified_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_layer_set(Evas_Object *obj, int layer);
        [ :elm_win_layer_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_win_layer_get(const Evas_Object *obj);
        [ :elm_win_layer_get, [ :evas_object_p ], :int ],
        # EAPI void elm_win_rotation_set(Evas_Object *obj, int rotation);
        [ :elm_win_rotation_set, [ :evas_object_p, :int ], :void ],
        # EAPI void elm_win_rotation_with_resize_set(Evas_Object *obj, int rotation);
        [ :elm_win_rotation_with_resize_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_win_rotation_get(const Evas_Object *obj);
        [ :elm_win_rotation_get, [ :evas_object_p ], :int ],
        # EAPI void elm_win_sticky_set(Evas_Object *obj, Eina_Bool sticky);
        [ :elm_win_sticky_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_win_sticky_get(const Evas_Object *obj);
        [ :elm_win_sticky_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_conformant_set(Evas_Object *obj, Eina_Bool conformant);
        [ :elm_win_conformant_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_win_conformant_get(const Evas_Object *obj);
        [ :elm_win_conformant_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_quickpanel_set(Evas_Object *obj, Eina_Bool quickpanel);
        [ :elm_win_quickpanel_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_win_quickpanel_get(const Evas_Object *obj);
        [ :elm_win_quickpanel_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_quickpanel_priority_major_set(Evas_Object *obj, int priority);
        [ :elm_win_quickpanel_priority_major_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_win_quickpanel_priority_major_get(const Evas_Object *obj);
        [ :elm_win_quickpanel_priority_major_get, [ :evas_object_p ], :int ],
        # EAPI void elm_win_quickpanel_priority_minor_set(Evas_Object *obj, int priority);
        [ :elm_win_quickpanel_priority_minor_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_win_quickpanel_priority_minor_get(const Evas_Object *obj);
        [ :elm_win_quickpanel_priority_minor_get, [ :evas_object_p ], :int ],
        # EAPI void elm_win_quickpanel_zone_set(Evas_Object *obj, int zone);
        [ :elm_win_quickpanel_zone_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_win_quickpanel_zone_get(const Evas_Object *obj);
        [ :elm_win_quickpanel_zone_get, [ :evas_object_p ], :int ],
        # EAPI void elm_win_prop_focus_skip_set(Evas_Object *obj, Eina_Bool skip);
        [ :elm_win_prop_focus_skip_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI void elm_win_illume_command_send(Evas_Object *obj, Elm_Illume_Command command, void *params);
        [ :elm_win_illume_command_send, [ :evas_object_p, :elm_illume_command, :void_p ], :void ],
        # EAPI Evas_Object *elm_win_inlined_image_object_get(Evas_Object *obj);
        [ :elm_win_inlined_image_object_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI Eina_Bool elm_win_focus_get(const Evas_Object *obj);
        [ :elm_win_focus_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_screen_constrain_set(Evas_Object *obj, Eina_Bool constrain);
        [ :elm_win_screen_constrain_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_win_screen_constrain_get(Evas_Object *obj);
        [ :elm_win_screen_constrain_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_screen_size_get(const Evas_Object *obj, int *x, int *y, int *w, int *h);
        [ :elm_win_screen_size_get, [ :evas_object_p, :int_p, :int_p, :int_p, :int_p ], :void ],
        # EAPI void elm_win_focus_highlight_enabled_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_win_focus_highlight_enabled_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_win_focus_highlight_enabled_get(const Evas_Object *obj);
        [ :elm_win_focus_highlight_enabled_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_focus_highlight_style_set(Evas_Object *obj, const char *style);
        [ :elm_win_focus_highlight_style_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_win_focus_highlight_style_get(const Evas_Object *obj);
        [ :elm_win_focus_highlight_style_get, [ :evas_object_p ], :string ],
        # EAPI void elm_win_keyboard_mode_set(Evas_Object *obj, Elm_Win_Keyboard_Mode mode);
        [ :elm_win_keyboard_mode_set, [ :evas_object_p, :elm_win_keyboard_mode ], :void ],
        # EAPI Elm_Win_Keyboard_Mode elm_win_keyboard_mode_get(const Evas_Object *obj);
        [ :elm_win_keyboard_mode_get, [ :evas_object_p ], :elm_win_keyboard_mode ],
        # EAPI void elm_win_keyboard_win_set(Evas_Object *obj, Eina_Bool is_keyboard);
        [ :elm_win_keyboard_win_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_win_keyboard_win_get(const Evas_Object *obj);
        [ :elm_win_keyboard_win_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_win_screen_position_get(const Evas_Object *obj, int *x, int *y);
        [ :elm_win_screen_position_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI Evas_Object *elm_win_inwin_add(Evas_Object *obj);
        [ :elm_win_inwin_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_win_inwin_activate(Evas_Object *obj);
        [ :elm_win_inwin_activate, [ :evas_object_p ], :void ],
        # EAPI void elm_win_inwin_content_set(Evas_Object *obj, Evas_Object *content);
        [ :elm_win_inwin_content_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_win_inwin_content_get(const Evas_Object *obj);
        [ :elm_win_inwin_content_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_win_inwin_content_unset(Evas_Object *obj);
        [ :elm_win_inwin_content_unset, [ :evas_object_p ], :evas_object_p ],
        # EAPI Ecore_X_Window elm_win_xwindow_get(const Evas_Object *obj);
        [ :elm_win_xwindow_get, [ :evas_object_p ], :uint ],
        # EAPI Evas_Object *elm_bg_add(Evas_Object *parent);
        [ :elm_bg_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_bg_file_set(Evas_Object *obj, const char *file, const char *group);
        [ :elm_bg_file_set, [ :evas_object_p, :string, :string ], :void ],
        # EAPI void elm_bg_file_get(const Evas_Object *obj, const char **file, const char **group);
        [ :elm_bg_file_get, [ :evas_object_p, :string_array, :string_array ], :void ],
        # EAPI void elm_bg_option_set(Evas_Object *obj, Elm_Bg_Option option);
        [ :elm_bg_option_set, [ :evas_object_p, :elm_bg_option ], :void ],
        # EAPI Elm_Bg_Option elm_bg_option_get(const Evas_Object *obj);
        [ :elm_bg_option_get, [ :evas_object_p ], :elm_bg_option ],
        # EAPI void elm_bg_color_set(Evas_Object *obj, int r, int g, int b);
        [ :elm_bg_color_set, [ :evas_object_p, :int, :int, :int ], :void ],
        # EAPI void elm_bg_color_get(const Evas_Object *obj, int *r, int *g, int *b);
        [ :elm_bg_color_get, [ :evas_object_p, :int_p, :int_p, :int_p ], :void ],
        # EAPI void elm_bg_load_size_set(Evas_Object *obj, Evas_Coord w, Evas_Coord h);
        [ :elm_bg_load_size_set, [ :evas_object_p, :int, :int ], :void ],
        # EAPI Evas_Object *elm_icon_add(Evas_Object *parent);
        [ :elm_icon_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI Eina_Bool elm_icon_file_set(Evas_Object *obj, const char *file, const char *group);
        [ :elm_icon_file_set, [ :evas_object_p, :string, :string ], :eina_bool ],
        # EAPI Eina_Bool elm_icon_memfile_set(Evas_Object *obj, const void *img, size_t size, const char *format, const char *key);
        [ :elm_icon_memfile_set, [ :evas_object_p, :void_p, :ulong, :string, :string ], :eina_bool ],
        # EAPI void elm_icon_file_get(const Evas_Object *obj, const char **file, const char **group);
        [ :elm_icon_file_get, [ :evas_object_p, :string_array, :string_array ], :void ],
        # EAPI void elm_icon_thumb_set(Evas_Object *obj, const char *file, const char *group);
        [ :elm_icon_thumb_set, [ :evas_object_p, :string, :string ], :void ],
        # EAPI Eina_Bool elm_icon_standard_set(Evas_Object *obj, const char *name);
        [ :elm_icon_standard_set, [ :evas_object_p, :string ], :eina_bool ],
        # EAPI const char *elm_icon_standard_get(const Evas_Object *obj);
        [ :elm_icon_standard_get, [ :evas_object_p ], :string ],
        # EAPI void elm_icon_smooth_set(Evas_Object *obj, Eina_Bool smooth);
        [ :elm_icon_smooth_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_icon_smooth_get(const Evas_Object *obj);
        [ :elm_icon_smooth_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_icon_no_scale_set(Evas_Object *obj, Eina_Bool no_scale);
        [ :elm_icon_no_scale_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_icon_no_scale_get(const Evas_Object *obj);
        [ :elm_icon_no_scale_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_icon_scale_set(Evas_Object *obj, Eina_Bool scale_up, Eina_Bool scale_down);
        [ :elm_icon_scale_set, [ :evas_object_p, :eina_bool, :eina_bool ], :void ],
        # EAPI void elm_icon_scale_get(const Evas_Object *obj, Eina_Bool *scale_up, Eina_Bool *scale_down);
        [ :elm_icon_scale_get, [ :evas_object_p, :eina_bool_p, :eina_bool_p ], :void ],
        # EAPI void elm_icon_size_get(const Evas_Object *obj, int *w, int *h);
        [ :elm_icon_size_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_icon_fill_outside_set(Evas_Object *obj, Eina_Bool fill_outside);
        [ :elm_icon_fill_outside_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_icon_fill_outside_get(const Evas_Object *obj);
        [ :elm_icon_fill_outside_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_icon_prescale_set(Evas_Object *obj, int size);
        [ :elm_icon_prescale_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_icon_prescale_get(const Evas_Object *obj);
        [ :elm_icon_prescale_get, [ :evas_object_p ], :int ],
        # EAPI Evas_Object *elm_icon_object_get(Evas_Object *obj);
        [ :elm_icon_object_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_icon_order_lookup_set(Evas_Object *obj, Elm_Icon_Lookup_Order order);
        [ :elm_icon_order_lookup_set, [ :evas_object_p, :elm_icon_lookup_order ], :void ],
        # EAPI Elm_Icon_Lookup_Order elm_icon_order_lookup_get(const Evas_Object *obj);
        [ :elm_icon_order_lookup_get, [ :evas_object_p ], :elm_icon_lookup_order ],
        # EAPI void elm_icon_preload_set(Evas_Object *obj, Eina_Bool disable);
        [ :elm_icon_preload_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_icon_animated_available_get(const Evas_Object *obj);
        [ :elm_icon_animated_available_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_icon_animated_set(Evas_Object *obj, Eina_Bool animated);
        [ :elm_icon_animated_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_icon_animated_get(const Evas_Object *obj);
        [ :elm_icon_animated_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_icon_animated_play_set(Evas_Object *obj, Eina_Bool play);
        [ :elm_icon_animated_play_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_icon_animated_play_get(const Evas_Object *obj);
        [ :elm_icon_animated_play_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_image_add(Evas_Object *parent);
        [ :elm_image_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI Eina_Bool elm_image_file_set(Evas_Object *obj, const char *file, const char *group);
        [ :elm_image_file_set, [ :evas_object_p, :string, :string ], :eina_bool ],
        # EAPI void elm_image_file_get(const Evas_Object *obj, const char **file, const char **group);
        [ :elm_image_file_get, [ :evas_object_p, :string_array, :string_array ], :void ],
        # EAPI void elm_image_smooth_set(Evas_Object *obj, Eina_Bool smooth);
        [ :elm_image_smooth_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_image_smooth_get(const Evas_Object *obj);
        [ :elm_image_smooth_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_image_object_size_get(const Evas_Object *obj, int *w, int *h);
        [ :elm_image_object_size_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_image_no_scale_set(Evas_Object *obj, Eina_Bool no_scale);
        [ :elm_image_no_scale_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_image_no_scale_get(const Evas_Object *obj);
        [ :elm_image_no_scale_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_image_scale_set(Evas_Object *obj, Eina_Bool scale_up, Eina_Bool scale_down);
        [ :elm_image_scale_set, [ :evas_object_p, :eina_bool, :eina_bool ], :void ],
        # EAPI void elm_image_scale_get(const Evas_Object *obj, Eina_Bool *scale_up, Eina_Bool *scale_down);
        [ :elm_image_scale_get, [ :evas_object_p, :eina_bool_p, :eina_bool_p ], :void ],
        # EAPI void elm_image_fill_outside_set(Evas_Object *obj, Eina_Bool fill_outside);
        [ :elm_image_fill_outside_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_image_fill_outside_get(const Evas_Object *obj);
        [ :elm_image_fill_outside_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_image_prescale_set(Evas_Object *obj, int size);
        [ :elm_image_prescale_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_image_prescale_get(const Evas_Object *obj);
        [ :elm_image_prescale_get, [ :evas_object_p ], :int ],
        # EAPI void elm_image_orient_set(Evas_Object *obj, Elm_Image_Orient orient);
        [ :elm_image_orient_set, [ :evas_object_p, :elm_image_orient ], :void ],
        # EAPI Elm_Image_Orient elm_image_orient_get(const Evas_Object *obj);
        [ :elm_image_orient_get, [ :evas_object_p ], :elm_image_orient ],
        # EAPI void elm_image_editable_set(Evas_Object *obj, Eina_Bool set);
        [ :elm_image_editable_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_image_editable_get(const Evas_Object *obj);
        [ :elm_image_editable_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_image_object_get(const Evas_Object *obj);
        [ :elm_image_object_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_image_aspect_ratio_retained_set(Evas_Object *obj, Eina_Bool retained);
        [ :elm_image_aspect_ratio_retained_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_image_aspect_ratio_retained_get(const Evas_Object *obj);
        [ :elm_image_aspect_ratio_retained_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_glview_add(Evas_Object *parent);
        [ :elm_glview_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_glview_size_set(Evas_Object *obj, Evas_Coord width, Evas_Coord height);
        [ :elm_glview_size_set, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_glview_size_get(const Evas_Object *obj, Evas_Coord *width, Evas_Coord *height);
        [ :elm_glview_size_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI Evas_GL_API *elm_glview_gl_api_get(const Evas_Object *obj);
        [ :elm_glview_gl_api_get, [ :evas_object_p ], :evas_gl_api_p ],
        # EAPI Eina_Bool elm_glview_mode_set(Evas_Object *obj, Elm_GLView_Mode mode);
        [ :elm_glview_mode_set, [ :evas_object_p, :elm_glview_mode ], :eina_bool ],
        # EAPI Eina_Bool elm_glview_resize_policy_set(Evas_Object *obj, Elm_GLView_Resize_Policy policy);
        [ :elm_glview_resize_policy_set, [ :evas_object_p, :elm_glview_resize_policy ], :eina_bool ],
        # EAPI Eina_Bool elm_glview_render_policy_set(Evas_Object *obj, Elm_GLView_Render_Policy policy);
        [ :elm_glview_render_policy_set, [ :evas_object_p, :elm_glview_render_policy ], :eina_bool ],
        # EAPI void elm_glview_init_func_set(Evas_Object *obj, Elm_GLView_Func_Cb func);
        [ :elm_glview_init_func_set, [ :evas_object_p, :elm_glview_func_cb ], :void ],
        # EAPI void elm_glview_del_func_set(Evas_Object *obj, Elm_GLView_Func_Cb func);
        [ :elm_glview_del_func_set, [ :evas_object_p, :elm_glview_func_cb ], :void ],
        # EAPI void elm_glview_resize_func_set(Evas_Object *obj, Elm_GLView_Func_Cb func);
        [ :elm_glview_resize_func_set, [ :evas_object_p, :elm_glview_func_cb ], :void ],
        # EAPI void elm_glview_render_func_set(Evas_Object *obj, Elm_GLView_Func_Cb func);
        [ :elm_glview_render_func_set, [ :evas_object_p, :elm_glview_func_cb ], :void ],
        # EAPI void elm_glview_changed_set(Evas_Object *obj);
        [ :elm_glview_changed_set, [ :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_box_add(Evas_Object *parent);
        [ :elm_box_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_box_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_box_horizontal_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_box_horizontal_get(const Evas_Object *obj);
        [ :elm_box_horizontal_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_box_homogeneous_set(Evas_Object *obj, Eina_Bool homogeneous);
        [ :elm_box_homogeneous_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_box_homogeneous_get(const Evas_Object *obj);
        [ :elm_box_homogeneous_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_box_pack_start(Evas_Object *obj, Evas_Object *subobj);
        [ :elm_box_pack_start, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI void elm_box_pack_end(Evas_Object *obj, Evas_Object *subobj);
        [ :elm_box_pack_end, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI void elm_box_pack_before(Evas_Object *obj, Evas_Object *subobj, Evas_Object *before);
        [ :elm_box_pack_before, [ :evas_object_p, :evas_object_p, :evas_object_p ], :void ],
        # EAPI void elm_box_pack_after(Evas_Object *obj, Evas_Object *subobj, Evas_Object *after);
        [ :elm_box_pack_after, [ :evas_object_p, :evas_object_p, :evas_object_p ], :void ],
        # EAPI void elm_box_clear(Evas_Object *obj);
        [ :elm_box_clear, [ :evas_object_p ], :void ],
        # EAPI void elm_box_unpack(Evas_Object *obj, Evas_Object *subobj);
        [ :elm_box_unpack, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI void elm_box_unpack_all(Evas_Object *obj);
        [ :elm_box_unpack_all, [ :evas_object_p ], :void ],
        # EAPI const Eina_List *elm_box_children_get(const Evas_Object *obj);
        [ :elm_box_children_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI void elm_box_padding_set(Evas_Object *obj, Evas_Coord horizontal, Evas_Coord vertical);
        [ :elm_box_padding_set, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_box_padding_get(const Evas_Object *obj, Evas_Coord *horizontal, Evas_Coord *vertical);
        [ :elm_box_padding_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_box_align_set(Evas_Object *obj, double horizontal, double vertical);
        [ :elm_box_align_set, [ :evas_object_p, :double, :double ], :void ],
        # EAPI void elm_box_align_get(const Evas_Object *obj, double *horizontal, double *vertical);
        [ :elm_box_align_get, [ :evas_object_p, :double_p, :double_p ], :void ],
        # EAPI void elm_box_recalculate(Evas_Object *obj);
        [ :elm_box_recalculate, [ :evas_object_p ], :void ],
        # EAPI void elm_box_layout_set(Evas_Object *obj, Evas_Object_Box_Layout cb, const void *data, void (*free_data)(void *data));
        [ :elm_box_layout_set, [ :evas_object_p, :evas_object_box_layout, :void_p, :evas_free_data_cb ], :void ],
        # EAPI void elm_box_layout_transition(Evas_Object *obj, Evas_Object_Box_Data *priv, void *data);
        [ :elm_box_layout_transition, [ :evas_object_p, :evas_object_box_data_p, :void_p ], :void ],
        # EAPI Elm_Box_Transition *elm_box_transition_new(const double duration, Evas_Object_Box_Layout start_layout, void *start_layout_data, void(*start_layout_free_data)(void *data), Evas_Object_Box_Layout end_layout, void *end_layout_data, void(*end_layout_free_data)(void *data), void(*transition_end_cb)(void *data), void *transition_end_data);
        [ :elm_box_transition_new, [ :double, :evas_object_box_layout, :void_p, :evas_free_data_cb, :evas_object_box_layout, :void_p, :evas_free_data_cb, :elm_box_transition_end_cb, :void_p ], :elm_box_transition_p ],
        # EAPI void elm_box_transition_free(void *data);
        [ :elm_box_transition_free, [ :void_p ], :void ],
        # EAPI Evas_Object *elm_button_add(Evas_Object *parent);
        [ :elm_button_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_button_autorepeat_set(Evas_Object *obj, Eina_Bool on);
        [ :elm_button_autorepeat_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_button_autorepeat_get(const Evas_Object *obj);
        [ :elm_button_autorepeat_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_button_autorepeat_initial_timeout_set(Evas_Object *obj, double t);
        [ :elm_button_autorepeat_initial_timeout_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_button_autorepeat_initial_timeout_get(const Evas_Object *obj);
        [ :elm_button_autorepeat_initial_timeout_get, [ :evas_object_p ], :double ],
        # EAPI void elm_button_autorepeat_gap_timeout_set(Evas_Object *obj, double t);
        [ :elm_button_autorepeat_gap_timeout_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_button_autorepeat_gap_timeout_get(const Evas_Object *obj);
        [ :elm_button_autorepeat_gap_timeout_get, [ :evas_object_p ], :double ],
        # EAPI Evas_Object *elm_fileselector_button_add(Evas_Object *parent);
        [ :elm_fileselector_button_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_fileselector_button_icon_set(Evas_Object *obj, Evas_Object *icon);
        [ :elm_fileselector_button_icon_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_fileselector_button_icon_get(const Evas_Object *obj);
        [ :elm_fileselector_button_icon_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_fileselector_button_icon_unset(Evas_Object *obj);
        [ :elm_fileselector_button_icon_unset, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_fileselector_button_window_title_set(Evas_Object *obj, const char *title);
        [ :elm_fileselector_button_window_title_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_fileselector_button_window_title_get(const Evas_Object *obj);
        [ :elm_fileselector_button_window_title_get, [ :evas_object_p ], :string ],
        # EAPI void elm_fileselector_button_window_size_set(Evas_Object *obj, Evas_Coord width, Evas_Coord height);
        [ :elm_fileselector_button_window_size_set, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_fileselector_button_window_size_get(const Evas_Object *obj, Evas_Coord *width, Evas_Coord *height);
        [ :elm_fileselector_button_window_size_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_fileselector_button_path_set(Evas_Object *obj, const char *path);
        [ :elm_fileselector_button_path_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_fileselector_button_path_get(const Evas_Object *obj);
        [ :elm_fileselector_button_path_get, [ :evas_object_p ], :string ],
        # EAPI void elm_fileselector_button_expandable_set(Evas_Object *obj, Eina_Bool value);
        [ :elm_fileselector_button_expandable_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_button_expandable_get(const Evas_Object *obj);
        [ :elm_fileselector_button_expandable_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_fileselector_button_folder_only_set(Evas_Object *obj, Eina_Bool value);
        [ :elm_fileselector_button_folder_only_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_button_folder_only_get(const Evas_Object *obj);
        [ :elm_fileselector_button_folder_only_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_fileselector_button_is_save_set(Evas_Object *obj, Eina_Bool value);
        [ :elm_fileselector_button_is_save_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_button_is_save_get(const Evas_Object *obj);
        [ :elm_fileselector_button_is_save_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_fileselector_button_inwin_mode_set(Evas_Object *obj, Eina_Bool value);
        [ :elm_fileselector_button_inwin_mode_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_button_inwin_mode_get(const Evas_Object *obj);
        [ :elm_fileselector_button_inwin_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_fileselector_entry_add(Evas_Object *parent);
        [ :elm_fileselector_entry_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_fileselector_entry_button_icon_set(Evas_Object *obj, Evas_Object *icon);
        [ :elm_fileselector_entry_button_icon_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_fileselector_entry_button_icon_get(const Evas_Object *obj);
        [ :elm_fileselector_entry_button_icon_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_fileselector_entry_button_icon_unset(Evas_Object *obj);
        [ :elm_fileselector_entry_button_icon_unset, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_fileselector_entry_window_title_set(Evas_Object *obj, const char *title);
        [ :elm_fileselector_entry_window_title_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_fileselector_entry_window_title_get(const Evas_Object *obj);
        [ :elm_fileselector_entry_window_title_get, [ :evas_object_p ], :string ],
        # EAPI void elm_fileselector_entry_window_size_set(Evas_Object *obj, Evas_Coord width, Evas_Coord height);
        [ :elm_fileselector_entry_window_size_set, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_fileselector_entry_window_size_get(const Evas_Object *obj, Evas_Coord *width, Evas_Coord *height);
        [ :elm_fileselector_entry_window_size_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_fileselector_entry_path_set(Evas_Object *obj, const char *path);
        [ :elm_fileselector_entry_path_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_fileselector_entry_path_get(const Evas_Object *obj);
        [ :elm_fileselector_entry_path_get, [ :evas_object_p ], :string ],
        # EAPI void elm_fileselector_entry_expandable_set(Evas_Object *obj, Eina_Bool value);
        [ :elm_fileselector_entry_expandable_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_entry_expandable_get(const Evas_Object *obj);
        [ :elm_fileselector_entry_expandable_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_fileselector_entry_folder_only_set(Evas_Object *obj, Eina_Bool value);
        [ :elm_fileselector_entry_folder_only_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_entry_folder_only_get(const Evas_Object *obj);
        [ :elm_fileselector_entry_folder_only_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_fileselector_entry_is_save_set(Evas_Object *obj, Eina_Bool value);
        [ :elm_fileselector_entry_is_save_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_entry_is_save_get(const Evas_Object *obj);
        [ :elm_fileselector_entry_is_save_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_fileselector_entry_inwin_mode_set(Evas_Object *obj, Eina_Bool value);
        [ :elm_fileselector_entry_inwin_mode_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_entry_inwin_mode_get(const Evas_Object *obj);
        [ :elm_fileselector_entry_inwin_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_fileselector_entry_selected_set(Evas_Object *obj, const char *path);
        [ :elm_fileselector_entry_selected_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_fileselector_entry_selected_get(const Evas_Object *obj);
        [ :elm_fileselector_entry_selected_get, [ :evas_object_p ], :string ],
        # EAPI Evas_Object *elm_scroller_add(Evas_Object *parent);
        [ :elm_scroller_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_scroller_custom_widget_base_theme_set(Evas_Object *obj, const char *widget, const char *base);
        [ :elm_scroller_custom_widget_base_theme_set, [ :evas_object_p, :string, :string ], :void ],
        # EAPI void elm_scroller_content_min_limit(Evas_Object *obj, Eina_Bool w, Eina_Bool h);
        [ :elm_scroller_content_min_limit, [ :evas_object_p, :eina_bool, :eina_bool ], :void ],
        # EAPI void elm_scroller_region_show(Evas_Object *obj, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h);
        [ :elm_scroller_region_show, [ :evas_object_p, :int, :int, :int, :int ], :void ],
        # EAPI void elm_scroller_policy_set(Evas_Object *obj, Elm_Scroller_Policy policy_h, Elm_Scroller_Policy policy_v);
        [ :elm_scroller_policy_set, [ :evas_object_p, :elm_scroller_policy, :elm_scroller_policy ], :void ],
        # EAPI void elm_scroller_policy_get(const Evas_Object *obj, Elm_Scroller_Policy *policy_h, Elm_Scroller_Policy *policy_v);
        [ :elm_scroller_policy_get, [ :evas_object_p, :elm_scroller_policy_p, :elm_scroller_policy_p ], :void ],
        # EAPI void elm_scroller_region_get(const Evas_Object *obj, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        [ :elm_scroller_region_get, [ :evas_object_p, :int_p, :int_p, :int_p, :int_p ], :void ],
        # EAPI void elm_scroller_child_size_get(const Evas_Object *obj, Evas_Coord *w, Evas_Coord *h);
        [ :elm_scroller_child_size_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_scroller_bounce_set(Evas_Object *obj, Eina_Bool h_bounce, Eina_Bool v_bounce);
        [ :elm_scroller_bounce_set, [ :evas_object_p, :eina_bool, :eina_bool ], :void ],
        # EAPI void elm_scroller_bounce_get(const Evas_Object *obj, Eina_Bool *h_bounce, Eina_Bool *v_bounce);
        [ :elm_scroller_bounce_get, [ :evas_object_p, :eina_bool_p, :eina_bool_p ], :void ],
        # EAPI void elm_scroller_page_relative_set(Evas_Object *obj, double h_pagerel, double v_pagerel);
        [ :elm_scroller_page_relative_set, [ :evas_object_p, :double, :double ], :void ],
        # EAPI void elm_scroller_page_size_set(Evas_Object *obj, Evas_Coord h_pagesize, Evas_Coord v_pagesize);
        [ :elm_scroller_page_size_set, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_scroller_current_page_get(const Evas_Object *obj, int *h_pagenumber, int *v_pagenumber);
        [ :elm_scroller_current_page_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_scroller_last_page_get(const Evas_Object *obj, int *h_pagenumber, int *v_pagenumber);
        [ :elm_scroller_last_page_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_scroller_page_show(Evas_Object *obj, int h_pagenumber, int v_pagenumber);
        [ :elm_scroller_page_show, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_scroller_page_bring_in(Evas_Object *obj, int h_pagenumber, int v_pagenumber);
        [ :elm_scroller_page_bring_in, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_scroller_region_bring_in(Evas_Object *obj, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h);
        [ :elm_scroller_region_bring_in, [ :evas_object_p, :int, :int, :int, :int ], :void ],
        # EAPI void elm_scroller_propagate_events_set(Evas_Object *obj, Eina_Bool propagation);
        [ :elm_scroller_propagate_events_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_scroller_propagate_events_get(const Evas_Object *obj);
        [ :elm_scroller_propagate_events_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_scroller_gravity_set(Evas_Object *obj, double x, double y);
        [ :elm_scroller_gravity_set, [ :evas_object_p, :double, :double ], :void ],
        # EAPI void elm_scroller_gravity_get(const Evas_Object *obj, double *x, double *y);
        [ :elm_scroller_gravity_get, [ :evas_object_p, :double_p, :double_p ], :void ],
        # EAPI Evas_Object *elm_label_add(Evas_Object *parent);
        [ :elm_label_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_label_line_wrap_set(Evas_Object *obj, Elm_Wrap_Type wrap);
        [ :elm_label_line_wrap_set, [ :evas_object_p, :elm_wrap_type ], :void ],
        # EAPI Elm_Wrap_Type elm_label_line_wrap_get(const Evas_Object *obj);
        [ :elm_label_line_wrap_get, [ :evas_object_p ], :elm_wrap_type ],
        # EAPI void elm_label_wrap_width_set(Evas_Object *obj, Evas_Coord w);
        [ :elm_label_wrap_width_set, [ :evas_object_p, :int ], :void ],
        # EAPI Evas_Coord elm_label_wrap_width_get(const Evas_Object *obj);
        [ :elm_label_wrap_width_get, [ :evas_object_p ], :int ],
        # EAPI void elm_label_wrap_height_set(Evas_Object *obj, Evas_Coord h);
        [ :elm_label_wrap_height_set, [ :evas_object_p, :int ], :void ],
        # EAPI Evas_Coord elm_label_wrap_height_get(const Evas_Object *obj);
        [ :elm_label_wrap_height_get, [ :evas_object_p ], :int ],
        # EAPI void elm_label_fontsize_set(Evas_Object *obj, int fontsize);
        [ :elm_label_fontsize_set, [ :evas_object_p, :int ], :void ],
        # EAPI void elm_label_text_color_set(Evas_Object *obj, unsigned int r, unsigned int g, unsigned int b, unsigned int a);
        [ :elm_label_text_color_set, [ :evas_object_p, :uint, :uint, :uint, :uint ], :void ],
        # EAPI void elm_label_text_align_set(Evas_Object *obj, const char *alignmode);
        [ :elm_label_text_align_set, [ :evas_object_p, :string ], :void ],
        # EAPI void elm_label_background_color_set(Evas_Object *obj, unsigned int r, unsigned int g, unsigned int b, unsigned int a);
        [ :elm_label_background_color_set, [ :evas_object_p, :uint, :uint, :uint, :uint ], :void ],
        # EAPI void elm_label_ellipsis_set(Evas_Object *obj, Eina_Bool ellipsis);
        [ :elm_label_ellipsis_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI void elm_label_slide_set(Evas_Object *obj, Eina_Bool slide);
        [ :elm_label_slide_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_label_slide_get(Evas_Object *obj);
        [ :elm_label_slide_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_label_slide_duration_set(Evas_Object *obj, double duration);
        [ :elm_label_slide_duration_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_label_slide_duration_get(Evas_Object *obj);
        [ :elm_label_slide_duration_get, [ :evas_object_p ], :double ],
        # EAPI Evas_Object *elm_frame_add(Evas_Object *parent);
        [ :elm_frame_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_table_add(Evas_Object *parent);
        [ :elm_table_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_table_homogeneous_set(Evas_Object *obj, Eina_Bool homogeneous);
        [ :elm_table_homogeneous_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_table_homogeneous_get(const Evas_Object *obj);
        [ :elm_table_homogeneous_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_table_padding_set(Evas_Object *obj, Evas_Coord horizontal, Evas_Coord vertical);
        [ :elm_table_padding_set, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_table_padding_get(const Evas_Object *obj, Evas_Coord *horizontal, Evas_Coord *vertical);
        [ :elm_table_padding_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_table_pack(Evas_Object *obj, Evas_Object *subobj, int x, int y, int w, int h);
        [ :elm_table_pack, [ :evas_object_p, :evas_object_p, :int, :int, :int, :int ], :void ],
        # EAPI void elm_table_unpack(Evas_Object *obj, Evas_Object *subobj);
        [ :elm_table_unpack, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI void elm_table_clear(Evas_Object *obj, Eina_Bool clear);
        [ :elm_table_clear, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI void elm_table_pack_set(Evas_Object *subobj, int x, int y, int w, int h);
        [ :elm_table_pack_set, [ :evas_object_p, :int, :int, :int, :int ], :void ],
        # EAPI void elm_table_pack_get(Evas_Object *subobj, int *x, int *y, int *w, int *h);
        [ :elm_table_pack_get, [ :evas_object_p, :int_p, :int_p, :int_p, :int_p ], :void ],
        # EAPI Evas_Object *elm_gengrid_add(Evas_Object *parent);
        [ :elm_gengrid_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_gengrid_item_size_set(Evas_Object *obj, Evas_Coord w, Evas_Coord h);
        [ :elm_gengrid_item_size_set, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_gengrid_item_size_get(const Evas_Object *obj, Evas_Coord *w, Evas_Coord *h);
        [ :elm_gengrid_item_size_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_gengrid_group_item_size_set(Evas_Object *obj, Evas_Coord w, Evas_Coord h);
        [ :elm_gengrid_group_item_size_set, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_gengrid_group_item_size_get(const Evas_Object *obj, Evas_Coord *w, Evas_Coord *h);
        [ :elm_gengrid_group_item_size_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_gengrid_align_set(Evas_Object *obj, double align_x, double align_y);
        [ :elm_gengrid_align_set, [ :evas_object_p, :double, :double ], :void ],
        # EAPI void elm_gengrid_align_get(const Evas_Object *obj, double *align_x, double *align_y);
        [ :elm_gengrid_align_get, [ :evas_object_p, :double_p, :double_p ], :void ],
        # EAPI void elm_gengrid_reorder_mode_set(Evas_Object *obj, Eina_Bool reorder_mode);
        [ :elm_gengrid_reorder_mode_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_reorder_mode_get(const Evas_Object *obj);
        [ :elm_gengrid_reorder_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Elm_Gengrid_Item *elm_gengrid_item_append(Evas_Object *obj, const Elm_Gengrid_Item_Class *gic, const void *data, Evas_Smart_Cb func, const void *func_data);
        [ :elm_gengrid_item_append, [ :evas_object_p, :elm_gengrid_item_class_p, :void_p, :evas_smart_cb, :void_p ], :elm_gengrid_item_p ],
        # EAPI Elm_Gengrid_Item *elm_gengrid_item_prepend(Evas_Object *obj, const Elm_Gengrid_Item_Class *gic, const void *data, Evas_Smart_Cb func, const void *func_data);
        [ :elm_gengrid_item_prepend, [ :evas_object_p, :elm_gengrid_item_class_p, :void_p, :evas_smart_cb, :void_p ], :elm_gengrid_item_p ],
        # EAPI Elm_Gengrid_Item *elm_gengrid_item_insert_before(Evas_Object *obj, const Elm_Gengrid_Item_Class *gic, const void *data, Elm_Gengrid_Item *relative, Evas_Smart_Cb func, const void *func_data);
        [ :elm_gengrid_item_insert_before, [ :evas_object_p, :elm_gengrid_item_class_p, :void_p, :elm_gengrid_item_p, :evas_smart_cb, :void_p ], :elm_gengrid_item_p ],
        # EAPI Elm_Gengrid_Item *elm_gengrid_item_insert_after(Evas_Object *obj, const Elm_Gengrid_Item_Class *gic, const void *data, Elm_Gengrid_Item *relative, Evas_Smart_Cb func, const void *func_data);
        [ :elm_gengrid_item_insert_after, [ :evas_object_p, :elm_gengrid_item_class_p, :void_p, :elm_gengrid_item_p, :evas_smart_cb, :void_p ], :elm_gengrid_item_p ],
        # EAPI Elm_Gengrid_Item *elm_gengrid_item_sorted_insert(Evas_Object *obj, const Elm_Gengrid_Item_Class *gic, const void *data, Eina_Compare_Cb comp, Evas_Smart_Cb func, const void *func_data);
        [ :elm_gengrid_item_sorted_insert, [ :evas_object_p, :elm_gengrid_item_class_p, :void_p, :eina_compare_cb, :evas_smart_cb, :void_p ], :elm_gengrid_item_p ],
        # EAPI Elm_Gengrid_Item *elm_gengrid_item_direct_sorted_insert(Evas_Object *obj, const Elm_Gengrid_Item_Class *gic, const void *data, Eina_Compare_Cb comp, Evas_Smart_Cb func, const void *func_data);
        [ :elm_gengrid_item_direct_sorted_insert, [ :evas_object_p, :elm_gengrid_item_class_p, :void_p, :eina_compare_cb, :evas_smart_cb, :void_p ], :elm_gengrid_item_p
            ],
        # EAPI void elm_gengrid_always_select_mode_set(Evas_Object *obj, Eina_Bool always_select);
        [ :elm_gengrid_always_select_mode_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_always_select_mode_get(const Evas_Object *obj);
        [ :elm_gengrid_always_select_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_gengrid_no_select_mode_set(Evas_Object *obj, Eina_Bool no_select);
        [ :elm_gengrid_no_select_mode_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_no_select_mode_get(const Evas_Object *obj);
        [ :elm_gengrid_no_select_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_gengrid_multi_select_set(Evas_Object *obj, Eina_Bool multi);
        [ :elm_gengrid_multi_select_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_multi_select_get(const Evas_Object *obj);
        [ :elm_gengrid_multi_select_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_gengrid_bounce_set(Evas_Object *obj, Eina_Bool h_bounce, Eina_Bool v_bounce);
        [ :elm_gengrid_bounce_set, [ :evas_object_p, :eina_bool, :eina_bool ], :void ],
        # EAPI void elm_gengrid_bounce_get(const Evas_Object *obj, Eina_Bool *h_bounce, Eina_Bool *v_bounce);
        [ :elm_gengrid_bounce_get, [ :evas_object_p, :eina_bool_p, :eina_bool_p ], :void ],
        # EAPI void elm_gengrid_page_relative_set(Evas_Object *obj, double h_pagerel, double v_pagerel);
        [ :elm_gengrid_page_relative_set, [ :evas_object_p, :double, :double ], :void ],
        # EAPI void elm_gengrid_page_relative_get(const Evas_Object *obj, double *h_pagerel, double *v_pagerel);
        [ :elm_gengrid_page_relative_get, [ :evas_object_p, :double_p, :double_p ], :void ],
        # EAPI void elm_gengrid_page_size_set(Evas_Object *obj, Evas_Coord h_pagesize, Evas_Coord v_pagesize);
        [ :elm_gengrid_page_size_set, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_gengrid_current_page_get(const Evas_Object *obj, int *h_pagenumber, int *v_pagenumber);
        [ :elm_gengrid_current_page_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_gengrid_last_page_get(const Evas_Object *obj, int *h_pagenumber, int *v_pagenumber);
        [ :elm_gengrid_last_page_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_gengrid_page_show(const Evas_Object *obj, int h_pagenumber, int v_pagenumber);
        [ :elm_gengrid_page_show, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_gengrid_page_bring_in(const Evas_Object *obj, int h_pagenumber, int v_pagenumber);
        [ :elm_gengrid_page_bring_in, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_gengrid_horizontal_set(Evas_Object *obj, Eina_Bool setting);
        [ :elm_gengrid_horizontal_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_horizontal_get(const Evas_Object *obj);
        [ :elm_gengrid_horizontal_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Elm_Gengrid_Item *elm_gengrid_first_item_get(const Evas_Object *obj);
        [ :elm_gengrid_first_item_get, [ :evas_object_p ], :elm_gengrid_item_p ],
        # EAPI Elm_Gengrid_Item *elm_gengrid_last_item_get(const Evas_Object *obj);
        [ :elm_gengrid_last_item_get, [ :evas_object_p ], :elm_gengrid_item_p ],
        # EAPI Elm_Gengrid_Item *elm_gengrid_item_next_get(const Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_next_get, [ :elm_gengrid_item_p ], :elm_gengrid_item_p ],
        # EAPI Elm_Gengrid_Item *elm_gengrid_item_prev_get(const Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_prev_get, [ :elm_gengrid_item_p ], :elm_gengrid_item_p ],
        # EAPI Evas_Object *elm_gengrid_item_gengrid_get(const Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_gengrid_get, [ :elm_gengrid_item_p ], :evas_object_p ],
        # EAPI void elm_gengrid_item_del(Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_del, [ :elm_gengrid_item_p ], :void ],
        # EAPI void elm_gengrid_item_update(Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_update, [ :elm_gengrid_item_p ], :void ],
        # EAPI const Elm_Gengrid_Item_Class *elm_gengrid_item_item_class_get(const Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_item_class_get, [ :elm_gengrid_item_p ], :elm_gengrid_item_class_p ],
        # EAPI void elm_gengrid_item_item_class_set(Elm_Gengrid_Item *item, const Elm_Gengrid_Item_Class *gic);
        [ :elm_gengrid_item_item_class_set, [ :elm_gengrid_item_p, :elm_gengrid_item_class_p ], :void ],
        # EAPI void *elm_gengrid_item_data_get(const Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_data_get, [ :elm_gengrid_item_p ], :void_p ],
        # EAPI void elm_gengrid_item_data_set(Elm_Gengrid_Item *item, const void *data);
        [ :elm_gengrid_item_data_set, [ :elm_gengrid_item_p, :void_p ], :void ],
        # EAPI void elm_gengrid_item_pos_get(const Elm_Gengrid_Item *item, unsigned int *x, unsigned int *y);
        [ :elm_gengrid_item_pos_get, [ :elm_gengrid_item_p, :uint_p, :uint_p ], :void ],
        # EAPI void elm_gengrid_item_selected_set(Elm_Gengrid_Item *item, Eina_Bool selected);
        [ :elm_gengrid_item_selected_set, [ :elm_gengrid_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_item_selected_get(const Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_selected_get, [ :elm_gengrid_item_p ], :eina_bool ],
        # EAPI const Evas_Object *elm_gengrid_item_object_get(const Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_object_get, [ :elm_gengrid_item_p ], :evas_object_p ],
        # EAPI void elm_gengrid_item_show(Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_show, [ :elm_gengrid_item_p ], :void ],
        # EAPI void elm_gengrid_item_bring_in(Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_bring_in, [ :elm_gengrid_item_p ], :void ],
        # EAPI void elm_gengrid_item_disabled_set(Elm_Gengrid_Item *item, Eina_Bool disabled);
        [ :elm_gengrid_item_disabled_set, [ :elm_gengrid_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_item_disabled_get(const Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_disabled_get, [ :elm_gengrid_item_p ], :eina_bool ],
        # EAPI void elm_gengrid_item_tooltip_text_set(Elm_Gengrid_Item *item, const char *text);
        [ :elm_gengrid_item_tooltip_text_set, [ :elm_gengrid_item_p, :string ], :void ],
        # EAPI void elm_gengrid_item_tooltip_content_cb_set(Elm_Gengrid_Item *item, Elm_Tooltip_Item_Content_Cb func, const void *data, Evas_Smart_Cb del_cb);
        [ :elm_gengrid_item_tooltip_content_cb_set, [ :elm_gengrid_item_p, :elm_tooltip_item_content_cb, :void_p, :evas_smart_cb ], :void ],
        # EAPI void elm_gengrid_item_tooltip_unset(Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_tooltip_unset, [ :elm_gengrid_item_p ], :void ],
        # EAPI void elm_gengrid_item_tooltip_style_set(Elm_Gengrid_Item *item, const char *style);
        [ :elm_gengrid_item_tooltip_style_set, [ :elm_gengrid_item_p, :string ], :void ],
        # EAPI const char *elm_gengrid_item_tooltip_style_get(const Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_tooltip_style_get, [ :elm_gengrid_item_p ], :string ],
        # EAPI Eina_Bool elm_gengrid_item_tooltip_window_mode_set(Elm_Gengrid_Item *item, Eina_Bool disable);
        [ :elm_gengrid_item_tooltip_window_mode_set, [ :elm_gengrid_item_p, :eina_bool ], :eina_bool ],
        # EAPI Eina_Bool elm_gengrid_item_tooltip_window_mode_get(const Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_tooltip_window_mode_get, [ :elm_gengrid_item_p ], :eina_bool ],
        # EAPI void elm_gengrid_item_cursor_set(Elm_Gengrid_Item *item, const char *cursor);
        [ :elm_gengrid_item_cursor_set, [ :elm_gengrid_item_p, :string ], :void ],
        # EAPI const char *elm_gengrid_item_cursor_get(const Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_cursor_get, [ :elm_gengrid_item_p ], :string ],
        # EAPI void elm_gengrid_item_cursor_unset(Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_cursor_unset, [ :elm_gengrid_item_p ], :void ],
        # EAPI void elm_gengrid_item_cursor_style_set(Elm_Gengrid_Item *item, const char *style);
        [ :elm_gengrid_item_cursor_style_set, [ :elm_gengrid_item_p, :string ], :void ],
        # EAPI const char *elm_gengrid_item_cursor_style_get(const Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_cursor_style_get, [ :elm_gengrid_item_p ], :string ],
        # EAPI void elm_gengrid_item_cursor_engine_only_set(Elm_Gengrid_Item *item, Eina_Bool engine_only);
        [ :elm_gengrid_item_cursor_engine_only_set, [ :elm_gengrid_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_gengrid_item_cursor_engine_only_get(const Elm_Gengrid_Item *item);
        [ :elm_gengrid_item_cursor_engine_only_get, [ :elm_gengrid_item_p ], :eina_bool ],
        # EAPI void elm_gengrid_clear(Evas_Object *obj);
        [ :elm_gengrid_clear, [ :evas_object_p ], :void ],
        # EAPI Elm_Gengrid_Item *elm_gengrid_selected_item_get(const Evas_Object *obj);
        [ :elm_gengrid_selected_item_get, [ :evas_object_p ], :elm_gengrid_item_p ],
        # EAPI const Eina_List *elm_gengrid_selected_items_get(const Evas_Object *obj);
        [ :elm_gengrid_selected_items_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI Evas_Object *elm_clock_add(Evas_Object *parent);
        [ :elm_clock_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_clock_time_set(Evas_Object *obj, int hrs, int min, int sec);
        [ :elm_clock_time_set, [ :evas_object_p, :int, :int, :int ], :void ],
        # EAPI void elm_clock_time_get(const Evas_Object *obj, int *hrs, int *min, int *sec);
        [ :elm_clock_time_get, [ :evas_object_p, :int_p, :int_p, :int_p ], :void ],
        # EAPI void elm_clock_edit_set(Evas_Object *obj, Eina_Bool edit);
        [ :elm_clock_edit_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_clock_edit_get(const Evas_Object *obj);
        [ :elm_clock_edit_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_clock_digit_edit_set(Evas_Object *obj, Elm_Clock_Digedit digedit);
        [ :elm_clock_digit_edit_set, [ :evas_object_p, :elm_clock_digedit ], :void ],
        # EAPI Elm_Clock_Digedit elm_clock_digit_edit_get(const Evas_Object *obj);
        [ :elm_clock_digit_edit_get, [ :evas_object_p ], :elm_clock_digedit ],
        # EAPI void elm_clock_show_am_pm_set(Evas_Object *obj, Eina_Bool am_pm);
        [ :elm_clock_show_am_pm_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_clock_show_am_pm_get(const Evas_Object *obj);
        [ :elm_clock_show_am_pm_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_clock_show_seconds_set(Evas_Object *obj, Eina_Bool seconds);
        [ :elm_clock_show_seconds_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_clock_show_seconds_get(const Evas_Object *obj);
        [ :elm_clock_show_seconds_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_clock_interval_set(Evas_Object *obj, double interval);
        [ :elm_clock_interval_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_clock_interval_get(const Evas_Object *obj);
        [ :elm_clock_interval_get, [ :evas_object_p ], :double ],
        # EAPI Evas_Object *elm_layout_add(Evas_Object *parent);
        [ :elm_layout_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI Eina_Bool elm_layout_file_set(Evas_Object *obj, const char *file, const char *group);
        [ :elm_layout_file_set, [ :evas_object_p, :string, :string ], :eina_bool ],
        # EAPI Eina_Bool elm_layout_theme_set(Evas_Object *obj, const char *clas, const char *group, const char *style);
        [ :elm_layout_theme_set, [ :evas_object_p, :string, :string, :string ], :eina_bool ],
        # EAPI void elm_layout_box_append(Evas_Object *obj, const char *part, Evas_Object *child);
        [ :elm_layout_box_append, [ :evas_object_p, :string, :evas_object_p ], :void ],
        # EAPI void elm_layout_box_prepend(Evas_Object *obj, const char *part, Evas_Object *child);
        [ :elm_layout_box_prepend, [ :evas_object_p, :string, :evas_object_p ], :void ],
        # EAPI void elm_layout_box_insert_before(Evas_Object *obj, const char *part, Evas_Object *child, const Evas_Object *reference);
        [ :elm_layout_box_insert_before, [ :evas_object_p, :string, :evas_object_p, :evas_object_p ], :void ],
        # EAPI void elm_layout_box_insert_at(Evas_Object *obj, const char *part, Evas_Object *child, unsigned int pos);
        [ :elm_layout_box_insert_at, [ :evas_object_p, :string, :evas_object_p, :uint ], :void ],
        # EAPI Evas_Object *elm_layout_box_remove(Evas_Object *obj, const char *part, Evas_Object *child);
        [ :elm_layout_box_remove, [ :evas_object_p, :string, :evas_object_p ], :evas_object_p ],
        # EAPI void elm_layout_box_remove_all(Evas_Object *obj, const char *part, Eina_Bool clear);
        [ :elm_layout_box_remove_all, [ :evas_object_p, :string, :eina_bool ], :void ],
        # EAPI void elm_layout_table_pack(Evas_Object *obj, const char *part, Evas_Object *child_obj, unsigned short col, unsigned short row, unsigned short colspan, unsigned short rowspan);
        [ :elm_layout_table_pack, [ :evas_object_p, :string, :evas_object_p, :ushort, :ushort, :ushort, :ushort ], :void ],
        # EAPI Evas_Object *elm_layout_table_unpack(Evas_Object *obj, const char *part, Evas_Object *child_obj);
        [ :elm_layout_table_unpack, [ :evas_object_p, :string, :evas_object_p ], :evas_object_p ],
        # EAPI void elm_layout_table_clear(Evas_Object *obj, const char *part, Eina_Bool clear);
        [ :elm_layout_table_clear, [ :evas_object_p, :string, :eina_bool ], :void ],
        # EAPI Evas_Object *elm_layout_edje_get(const Evas_Object *obj);
        [ :elm_layout_edje_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI const char *elm_layout_data_get(const Evas_Object *obj, const char *key);
        [ :elm_layout_data_get, [ :evas_object_p, :string ], :string ],
        # EAPI void elm_layout_sizing_eval(Evas_Object *obj);
        [ :elm_layout_sizing_eval, [ :evas_object_p ], :void ],
        # EAPI Eina_Bool elm_layout_part_cursor_set(Evas_Object *obj, const char *part_name, const char *cursor);
        [ :elm_layout_part_cursor_set, [ :evas_object_p, :string, :string ], :eina_bool ],
        # EAPI const char *elm_layout_part_cursor_get(const Evas_Object *obj, const char *part_name);
        [ :elm_layout_part_cursor_get, [ :evas_object_p, :string ], :string ],
        # EAPI void elm_layout_part_cursor_unset(Evas_Object *obj, const char *part_name);
        [ :elm_layout_part_cursor_unset, [ :evas_object_p, :string ], :void ],
        # EAPI Eina_Bool elm_layout_part_cursor_style_set(Evas_Object *obj, const char *part_name, const char *style);
        [ :elm_layout_part_cursor_style_set, [ :evas_object_p, :string, :string ], :eina_bool ],
        # EAPI const char *elm_layout_part_cursor_style_get(const Evas_Object *obj, const char *part_name);
        [ :elm_layout_part_cursor_style_get, [ :evas_object_p, :string ], :string ],
        # EAPI Eina_Bool elm_layout_part_cursor_engine_only_set(Evas_Object *obj, const char *part_name, Eina_Bool engine_only);
        [ :elm_layout_part_cursor_engine_only_set, [ :evas_object_p, :string, :eina_bool ], :eina_bool ],
        # EAPI Eina_Bool elm_layout_part_cursor_engine_only_get(const Evas_Object *obj, const char *part_name);
        [ :elm_layout_part_cursor_engine_only_get, [ :evas_object_p, :string ], :eina_bool ],
        # EAPI Evas_Object *elm_notify_add(Evas_Object *parent);
        [ :elm_notify_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_notify_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_notify_parent_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_notify_parent_get(const Evas_Object *obj);
        [ :elm_notify_parent_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_notify_orient_set(Evas_Object *obj, Elm_Notify_Orient orient);
        [ :elm_notify_orient_set, [ :evas_object_p, :elm_notify_orient ], :void ],
        # EAPI Elm_Notify_Orient elm_notify_orient_get(const Evas_Object *obj);
        [ :elm_notify_orient_get, [ :evas_object_p ], :elm_notify_orient ],
        # EAPI void elm_notify_timeout_set(Evas_Object *obj, double timeout);
        [ :elm_notify_timeout_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_notify_timeout_get(const Evas_Object *obj);
        [ :elm_notify_timeout_get, [ :evas_object_p ], :double ],
        # EAPI void elm_notify_repeat_events_set(Evas_Object *obj, Eina_Bool repeat);
        [ :elm_notify_repeat_events_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_notify_repeat_events_get(const Evas_Object *obj);
        [ :elm_notify_repeat_events_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_hover_add(Evas_Object *parent);
        [ :elm_hover_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_hover_target_set(Evas_Object *obj, Evas_Object *target);
        [ :elm_hover_target_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_hover_target_get(const Evas_Object *obj);
        [ :elm_hover_target_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_hover_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_hover_parent_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_hover_parent_get(const Evas_Object *obj);
        [ :elm_hover_parent_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_hover_content_set(Evas_Object *obj, const char *swallow, Evas_Object *content);
        [ :elm_hover_content_set, [ :evas_object_p, :string, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_hover_content_get(const Evas_Object *obj, const char *swallow);
        [ :elm_hover_content_get, [ :evas_object_p, :string ], :evas_object_p ],
        # EAPI Evas_Object *elm_hover_content_unset(Evas_Object *obj, const char *swallow);
        [ :elm_hover_content_unset, [ :evas_object_p, :string ], :evas_object_p ],
        # EAPI const char *elm_hover_best_content_location_get(const Evas_Object *obj, Elm_Hover_Axis pref_axis);
        [ :elm_hover_best_content_location_get, [ :evas_object_p, :elm_hover_axis ], :string ],
        # EAPI Evas_Object *elm_entry_add(Evas_Object *parent);
        [ :elm_entry_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_entry_single_line_set(Evas_Object *obj, Eina_Bool single_line);
        [ :elm_entry_single_line_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_entry_single_line_get(const Evas_Object *obj);
        [ :elm_entry_single_line_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_entry_password_set(Evas_Object *obj, Eina_Bool password);
        [ :elm_entry_password_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_entry_password_get(const Evas_Object *obj);
        [ :elm_entry_password_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_entry_entry_set(Evas_Object *obj, const char *entry);
        [ :elm_entry_entry_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_entry_entry_get(const Evas_Object *obj);
        [ :elm_entry_entry_get, [ :evas_object_p ], :string ],
        # EAPI void elm_entry_entry_append(Evas_Object *obj, const char *entry);
        [ :elm_entry_entry_append, [ :evas_object_p, :string ], :void ],
        # EAPI Eina_Bool elm_entry_is_empty(const Evas_Object *obj);
        [ :elm_entry_is_empty, [ :evas_object_p ], :eina_bool ],
        # EAPI const char *elm_entry_selection_get(const Evas_Object *obj);
        [ :elm_entry_selection_get, [ :evas_object_p ], :string ],
        # EAPI const Evas_Object *elm_entry_textblock_get(const Evas_Object *obj);
        [ :elm_entry_textblock_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_entry_calc_force(const Evas_Object *obj);
        [ :elm_entry_calc_force, [ :evas_object_p ], :void ],
        # EAPI void elm_entry_entry_insert(Evas_Object *obj, const char *entry);
        [ :elm_entry_entry_insert, [ :evas_object_p, :string ], :void ],
        # EAPI void elm_entry_line_wrap_set(Evas_Object *obj, Elm_Wrap_Type wrap);
        [ :elm_entry_line_wrap_set, [ :evas_object_p, :elm_wrap_type ], :void ],
        # EAPI Elm_Wrap_Type elm_entry_line_wrap_get(const Evas_Object *obj);
        [ :elm_entry_line_wrap_get, [ :evas_object_p ], :elm_wrap_type ],
        # EAPI void elm_entry_editable_set(Evas_Object *obj, Eina_Bool editable);
        [ :elm_entry_editable_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_entry_editable_get(const Evas_Object *obj);
        [ :elm_entry_editable_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_entry_select_none(Evas_Object *obj);
        [ :elm_entry_select_none, [ :evas_object_p ], :void ],
        # EAPI void elm_entry_select_all(Evas_Object *obj);
        [ :elm_entry_select_all, [ :evas_object_p ], :void ],
        # EAPI Eina_Bool elm_entry_cursor_next(Evas_Object *obj);
        [ :elm_entry_cursor_next, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_entry_cursor_prev(Evas_Object *obj);
        [ :elm_entry_cursor_prev, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_entry_cursor_up(Evas_Object *obj);
        [ :elm_entry_cursor_up, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_entry_cursor_down(Evas_Object *obj);
        [ :elm_entry_cursor_down, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_entry_cursor_begin_set(Evas_Object *obj);
        [ :elm_entry_cursor_begin_set, [ :evas_object_p ], :void ],
        # EAPI void elm_entry_cursor_end_set(Evas_Object *obj);
        [ :elm_entry_cursor_end_set, [ :evas_object_p ], :void ],
        # EAPI void elm_entry_cursor_line_begin_set(Evas_Object *obj);
        [ :elm_entry_cursor_line_begin_set, [ :evas_object_p ], :void ],
        # EAPI void elm_entry_cursor_line_end_set(Evas_Object *obj);
        [ :elm_entry_cursor_line_end_set, [ :evas_object_p ], :void ],
        # EAPI void elm_entry_cursor_selection_begin(Evas_Object *obj);
        [ :elm_entry_cursor_selection_begin, [ :evas_object_p ], :void ],
        # EAPI void elm_entry_cursor_selection_end(Evas_Object *obj);
        [ :elm_entry_cursor_selection_end, [ :evas_object_p ], :void ],
        # EAPI Eina_Bool elm_entry_cursor_is_format_get(const Evas_Object *obj);
        [ :elm_entry_cursor_is_format_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_entry_cursor_is_visible_format_get(const Evas_Object *obj);
        [ :elm_entry_cursor_is_visible_format_get, [ :evas_object_p ], :eina_bool ],
        # EAPI const char *elm_entry_cursor_content_get(const Evas_Object *obj);
        [ :elm_entry_cursor_content_get, [ :evas_object_p ], :string ],
        # EAPI Eina_Bool elm_entry_cursor_geometry_get(const Evas_Object *obj, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        [ :elm_entry_cursor_geometry_get, [ :evas_object_p, :int_p, :int_p, :int_p, :int_p ], :eina_bool ],
        # EAPI void elm_entry_cursor_pos_set(Evas_Object *obj, int pos);
        [ :elm_entry_cursor_pos_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_entry_cursor_pos_get(const Evas_Object *obj);
        [ :elm_entry_cursor_pos_get, [ :evas_object_p ], :int ],
        # EAPI void elm_entry_selection_cut(Evas_Object *obj);
        [ :elm_entry_selection_cut, [ :evas_object_p ], :void ],
        # EAPI void elm_entry_selection_copy(Evas_Object *obj);
        [ :elm_entry_selection_copy, [ :evas_object_p ], :void ],
        # EAPI void elm_entry_selection_paste(Evas_Object *obj);
        [ :elm_entry_selection_paste, [ :evas_object_p ], :void ],
        # EAPI void elm_entry_context_menu_clear(Evas_Object *obj);
        [ :elm_entry_context_menu_clear, [ :evas_object_p ], :void ],
        # EAPI void elm_entry_context_menu_item_add(Evas_Object *obj, const char *label, const char *icon_file, Elm_Icon_Type icon_type, Evas_Smart_Cb func, const void *data);
        [ :elm_entry_context_menu_item_add, [ :evas_object_p, :string, :string, :elm_icon_type, :evas_smart_cb, :void_p ], :void ],
        # EAPI void elm_entry_context_menu_disabled_set(Evas_Object *obj, Eina_Bool disabled);
        [ :elm_entry_context_menu_disabled_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_entry_context_menu_disabled_get(const Evas_Object *obj);
        [ :elm_entry_context_menu_disabled_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_entry_item_provider_append(Evas_Object *obj, Evas_Object *(*func) (void *data, Evas_Object *entry, const char *item), void *data);
        # FIXME
        # EAPI void elm_entry_item_provider_prepend(Evas_Object *obj, Evas_Object *(*func) (void *data, Evas_Object *entry, const char *item), void *data);
        # FIXME
        # EAPI void elm_entry_item_provider_remove(Evas_Object *obj, Evas_Object *(*func) (void *data, Evas_Object *entry, const char *item), void *data);
        # FIXME
        # EAPI void elm_entry_text_filter_append(Evas_Object *obj, Elm_Entry_Filter_Cb func, void *data);
        [ :elm_entry_text_filter_append, [ :evas_object_p, :elm_entry_filter_cb, :void_p ], :void ],
        # EAPI void elm_entry_text_filter_prepend(Evas_Object *obj, Elm_Entry_Filter_Cb func, void *data);
        [ :elm_entry_text_filter_prepend, [ :evas_object_p, :elm_entry_filter_cb, :void_p ], :void ],
        # EAPI void elm_entry_text_filter_remove(Evas_Object *obj, Elm_Entry_Filter_Cb func, void *data);
        [ :elm_entry_text_filter_remove, [ :evas_object_p, :elm_entry_filter_cb, :void_p ], :void ],
        # EAPI char *elm_entry_markup_to_utf8(const char *s);
        [ :elm_entry_markup_to_utf8, [ :string ], :string ],
        # EAPI char *elm_entry_utf8_to_markup(const char *s);
        [ :elm_entry_utf8_to_markup, [ :string ], :string ],
        # EAPI void elm_entry_file_set(Evas_Object *obj, const char *file, Elm_Text_Format format);
        [ :elm_entry_file_set, [ :evas_object_p, :string, :elm_text_format ], :void ],
        # EAPI void elm_entry_file_get(const Evas_Object *obj, const char **file, Elm_Text_Format *format);
        [ :elm_entry_file_get, [ :evas_object_p, :string_array, :elm_text_format_p ], :void ],
        # EAPI void elm_entry_file_save(Evas_Object *obj);
        [ :elm_entry_file_save, [ :evas_object_p ], :void ],
        # EAPI void elm_entry_autosave_set(Evas_Object *obj, Eina_Bool autosave);
        [ :elm_entry_autosave_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_entry_autosave_get(const Evas_Object *obj);
        [ :elm_entry_autosave_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_entry_cnp_textonly_set(Evas_Object *obj, Eina_Bool textonly);
        [ :elm_entry_cnp_textonly_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_entry_cnp_textonly_get(const Evas_Object *obj);
        [ :elm_entry_cnp_textonly_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_entry_scrollable_set(Evas_Object *obj, Eina_Bool scroll);
        [ :elm_entry_scrollable_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_entry_scrollable_get(const Evas_Object *obj);
        [ :elm_entry_scrollable_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_entry_icon_set(Evas_Object *obj, Evas_Object *icon);
        [ :elm_entry_icon_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_entry_icon_get(const Evas_Object *obj);
        [ :elm_entry_icon_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_entry_icon_unset(Evas_Object *obj);
        [ :elm_entry_icon_unset, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_entry_icon_visible_set(Evas_Object *obj, Eina_Bool setting);
        [ :elm_entry_icon_visible_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI void elm_entry_end_set(Evas_Object *obj, Evas_Object *end);
        [ :elm_entry_end_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_entry_end_get(const Evas_Object *obj);
        [ :elm_entry_end_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_entry_end_unset(Evas_Object *obj);
        [ :elm_entry_end_unset, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_entry_end_visible_set(Evas_Object *obj, Eina_Bool setting);
        [ :elm_entry_end_visible_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI void elm_entry_scrollbar_policy_set(Evas_Object *obj, Elm_Scroller_Policy h, Elm_Scroller_Policy v);
        [ :elm_entry_scrollbar_policy_set, [ :evas_object_p, :elm_scroller_policy, :elm_scroller_policy ], :void ],
        # EAPI void elm_entry_bounce_set(Evas_Object *obj, Eina_Bool h_bounce, Eina_Bool v_bounce);
        [ :elm_entry_bounce_set, [ :evas_object_p, :eina_bool, :eina_bool ], :void ],
        # EAPI void elm_entry_bounce_get(const Evas_Object *obj, Eina_Bool *h_bounce, Eina_Bool *v_bounce);
        [ :elm_entry_bounce_get, [ :evas_object_p, :eina_bool_p, :eina_bool_p ], :void ],
        # EAPI void elm_entry_filter_limit_size(void *data, Evas_Object *entry, char **text);
        [ :elm_entry_filter_limit_size, [ :void_p, :evas_object_p, :string_array ], :void ],
        # EAPI void elm_entry_filter_accept_set(void *data, Evas_Object *entry, char **text);
        [ :elm_entry_filter_accept_set, [ :void_p, :evas_object_p, :string_array ], :void ],
        # EAPI void elm_entry_input_panel_layout_set(Evas_Object *obj, Elm_Input_Panel_Layout layout);
        [ :elm_entry_input_panel_layout_set, [ :evas_object_p, :elm_input_panel_layout ], :void ],
        # EAPI Elm_Input_Panel_Layout elm_entry_input_panel_layout_get(Evas_Object *obj);
        [ :elm_entry_input_panel_layout_get, [ :evas_object_p ], :elm_input_panel_layout ],
        # EAPI void elm_entry_autocapital_type_set(Evas_Object *obj, Elm_Autocapital_Type autocapital_type);
        [ :elm_entry_autocapital_type_set, [ :evas_object_p, :elm_autocapital_type ], :void ],
        # EAPI Elm_Autocapital_Type elm_entry_autocapital_type_get(Evas_Object *obj);
        [ :elm_entry_autocapital_type_get, [ :evas_object_p ], :elm_autocapital_type ],
        # EAPI void elm_entry_input_panel_enabled_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_entry_input_panel_enabled_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Evas_Object *elm_anchorview_add(Evas_Object *parent);
        [ :elm_anchorview_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_anchorview_hover_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_anchorview_hover_parent_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_anchorview_hover_parent_get(const Evas_Object *obj);
        [ :elm_anchorview_hover_parent_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_anchorview_hover_style_set(Evas_Object *obj, const char *style);
        [ :elm_anchorview_hover_style_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_anchorview_hover_style_get(const Evas_Object *obj);
        [ :elm_anchorview_hover_style_get, [ :evas_object_p ], :string ],
        # EAPI void elm_anchorview_hover_end(Evas_Object *obj);
        [ :elm_anchorview_hover_end, [ :evas_object_p ], :void ],
        # EAPI void elm_anchorview_bounce_set(Evas_Object *obj, Eina_Bool h_bounce, Eina_Bool v_bounce);
        [ :elm_anchorview_bounce_set, [ :evas_object_p, :eina_bool, :eina_bool ], :void ],
        # EAPI void elm_anchorview_bounce_get(const Evas_Object *obj, Eina_Bool *h_bounce, Eina_Bool *v_bounce);
        [ :elm_anchorview_bounce_get, [ :evas_object_p, :eina_bool_p, :eina_bool_p ], :void ],
        # EAPI void elm_anchorview_item_provider_append(Evas_Object *obj, Evas_Object *(*func) (void *data, Evas_Object *anchorview, const char *item), void *data);
        # FIXME
        # EAPI void elm_anchorview_item_provider_prepend(Evas_Object *obj, Evas_Object *(*func) (void *data, Evas_Object *anchorview, const char *item), void *data);
        # FIXME
        # EAPI void elm_anchorview_item_provider_remove(Evas_Object *obj, Evas_Object *(*func) (void *data, Evas_Object *anchorview, const char *item), void *data);
        # FIXME
        # EAPI Evas_Object *elm_anchorblock_add(Evas_Object *parent);
        [ :elm_anchorblock_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_anchorblock_hover_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_anchorblock_hover_parent_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_anchorblock_hover_parent_get(const Evas_Object *obj);
        [ :elm_anchorblock_hover_parent_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_anchorblock_hover_style_set(Evas_Object *obj, const char *style);
        [ :elm_anchorblock_hover_style_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_anchorblock_hover_style_get(const Evas_Object *obj);
        [ :elm_anchorblock_hover_style_get, [ :evas_object_p ], :string ],
        # EAPI void elm_anchorblock_hover_end(Evas_Object *obj);
        [ :elm_anchorblock_hover_end, [ :evas_object_p ], :void ],
        # EAPI void elm_anchorblock_item_provider_append(Evas_Object *obj, Evas_Object *(*func) (void *data, Evas_Object *anchorblock, const char *item), void *data);
        # FIXME
        # EAPI void elm_anchorblock_item_provider_prepend(Evas_Object *obj, Evas_Object *(*func) (void *data, Evas_Object *anchorblock, const char *item), void *data);
        # FIXME
        # EAPI void elm_anchorblock_item_provider_remove(Evas_Object *obj, Evas_Object *(*func) (void *data, Evas_Object *anchorblock, const char *item), void *data);
        # FIXME
        # EAPI Evas_Object *elm_bubble_add(Evas_Object *parent);
        [ :elm_bubble_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_bubble_corner_set(Evas_Object *obj, const char *corner);
        [ :elm_bubble_corner_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_bubble_corner_get(const Evas_Object *obj);
        [ :elm_bubble_corner_get, [ :evas_object_p ], :string ],
        # EAPI Evas_Object *elm_photo_add(Evas_Object *parent);
        [ :elm_photo_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI Eina_Bool elm_photo_file_set(Evas_Object *obj, const char *file);
        [ :elm_photo_file_set, [ :evas_object_p, :string ], :eina_bool ],
        # EAPI void elm_photo_thumb_set(const Evas_Object *obj, const char *file, const char *group);
        [ :elm_photo_thumb_set, [ :evas_object_p, :string, :string ], :void ],
        # EAPI void elm_photo_size_set(Evas_Object *obj, int size);
        [ :elm_photo_size_set, [ :evas_object_p, :int ], :void ],
        # EAPI void elm_photo_fill_inside_set(Evas_Object *obj, Eina_Bool fill);
        [ :elm_photo_fill_inside_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI void elm_photo_editable_set(Evas_Object *obj, Eina_Bool set);
        [ :elm_photo_editable_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI void elm_gesture_layer_cb_set(Evas_Object *obj, Elm_Gesture_Types idx, Elm_Gesture_State cb_type, Elm_Gesture_Event_Cb cb, void *data);
        [ :elm_gesture_layer_cb_set, [ :evas_object_p, :elm_gesture_types, :elm_gesture_state, :elm_gesture_event_cb, :void_p ], :void ],
        # EAPI Eina_Bool elm_gesture_layer_hold_events_get(Evas_Object *obj);
        [ :elm_gesture_layer_hold_events_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_gesture_layer_hold_events_set(Evas_Object *obj, Eina_Bool r);
        [ :elm_gesture_layer_hold_events_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI void elm_gesture_layer_zoom_step_set(Evas_Object *obj, double s);
        [ :elm_gesture_layer_zoom_step_set, [ :evas_object_p, :double ], :void ],
        # EAPI void elm_gesture_layer_rotate_step_set(Evas_Object *obj, double s);
        [ :elm_gesture_layer_rotate_step_set, [ :evas_object_p, :double ], :void ],
        # EAPI Eina_Bool elm_gesture_layer_attach(Evas_Object *obj, Evas_Object *t);
        [ :elm_gesture_layer_attach, [ :evas_object_p, :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_gesture_layer_add(Evas_Object *parent);
        [ :elm_gesture_layer_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_thumb_add(Evas_Object *parent);
        [ :elm_thumb_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_thumb_reload(Evas_Object *obj);
        [ :elm_thumb_reload, [ :evas_object_p ], :void ],
        # EAPI void elm_thumb_file_set(Evas_Object *obj, const char *file, const char *key);
        [ :elm_thumb_file_set, [ :evas_object_p, :string, :string ], :void ],
        # EAPI void elm_thumb_file_get(const Evas_Object *obj, const char **file, const char **key);
        [ :elm_thumb_file_get, [ :evas_object_p, :string_array, :string_array ], :void ],
        # EAPI void elm_thumb_path_get(const Evas_Object *obj, const char **file, const char **key);
        [ :elm_thumb_path_get, [ :evas_object_p, :string_array, :string_array ], :void ],
        # EAPI void elm_thumb_animate_set(Evas_Object *obj, Elm_Thumb_Animation_Setting s);
        [ :elm_thumb_animate_set, [ :evas_object_p, :elm_thumb_animation_setting ], :void ],
        # EAPI Elm_Thumb_Animation_Setting elm_thumb_animate_get(const Evas_Object *obj);
        [ :elm_thumb_animate_get, [ :evas_object_p ], :elm_thumb_animation_setting ],
        # EAPI void *elm_thumb_ethumb_client_get(void);
        [ :elm_thumb_ethumb_client_get, [  ], :void_p ],
        # EAPI Eina_Bool elm_thumb_ethumb_client_connected(void);
        [ :elm_thumb_ethumb_client_connected, [  ], :eina_bool ],
        # EAPI Eina_Bool elm_thumb_editable_set(Evas_Object *obj, Eina_Bool edit);
        [ :elm_thumb_editable_set, [ :evas_object_p, :eina_bool ], :eina_bool ],
        # EAPI Eina_Bool elm_thumb_editable_get(const Evas_Object *obj);
        [ :elm_thumb_editable_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_web_add(Evas_Object *parent);
        [ :elm_web_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_web_webkit_view_get(const Evas_Object *obj);
        [ :elm_web_webkit_view_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_web_window_create_hook_set(Evas_Object *obj, Elm_Web_Window_Open func, void *data);
        [ :elm_web_window_create_hook_set, [ :evas_object_p, :elm_web_window_open, :void_p ], :void ],
        # EAPI void elm_web_dialog_alert_hook_set(Evas_Object *obj, Elm_Web_Dialog_Alert func, void *data);
        [ :elm_web_dialog_alert_hook_set, [ :evas_object_p, :elm_web_dialog_alert, :void_p ], :void ],
        # EAPI void elm_web_dialog_confirm_hook_set(Evas_Object *obj, Elm_Web_Dialog_Confirm func, void *data);
        [ :elm_web_dialog_confirm_hook_set, [ :evas_object_p, :elm_web_dialog_confirm, :void_p ], :void ],
        # EAPI void elm_web_dialog_prompt_hook_set(Evas_Object *obj, Elm_Web_Dialog_Prompt func, void *data);
        [ :elm_web_dialog_prompt_hook_set, [ :evas_object_p, :elm_web_dialog_prompt, :void_p ], :void ],
        # EAPI void elm_web_dialog_file_selector_hook_set(Evas_Object *obj, Elm_Web_Dialog_File_Selector func, void *data);
        [ :elm_web_dialog_file_selector_hook_set, [ :evas_object_p, :elm_web_dialog_file_selector, :void_p ], :void ],
        # EAPI void elm_web_console_message_hook_set(Evas_Object *obj, Elm_Web_Console_Message func, void *data);
        [ :elm_web_console_message_hook_set, [ :evas_object_p, :elm_web_console_message, :void_p ], :void ],
        # EAPI Eina_Bool elm_web_tab_propagate_get(const Evas_Object *obj);
        [ :elm_web_tab_propagate_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_web_tab_propagate_set(Evas_Object *obj, Eina_Bool propagate);
        [ :elm_web_tab_propagate_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_web_uri_set(Evas_Object *obj, const char *uri);
        [ :elm_web_uri_set, [ :evas_object_p, :string ], :eina_bool ],
        # EAPI const char *elm_web_uri_get(const Evas_Object *obj);
        [ :elm_web_uri_get, [ :evas_object_p ], :string ],
        # EAPI const char *elm_web_title_get(const Evas_Object *obj);
        [ :elm_web_title_get, [ :evas_object_p ], :string ],
        # EAPI void elm_web_bg_color_set(Evas_Object *obj, int r, int g, int b, int a);
        [ :elm_web_bg_color_set, [ :evas_object_p, :int, :int, :int, :int ], :void ],
        # EAPI void elm_web_bg_color_get(const Evas_Object *obj, int *r, int *g, int *b, int *a);
        [ :elm_web_bg_color_get, [ :evas_object_p, :int_p, :int_p, :int_p, :int_p ], :void ],
        # EAPI void elm_web_popup_selected_set(Evas_Object *obj, int index);
        [ :elm_web_popup_selected_set, [ :evas_object_p, :int ], :void ],
        # EAPI Eina_Bool elm_web_popup_destroy(Evas_Object *obj);
        [ :elm_web_popup_destroy, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_web_text_search(const Evas_Object *obj, const char *string, Eina_Bool case_sensitive, Eina_Bool forward, Eina_Bool wrap);
        [ :elm_web_text_search, [ :evas_object_p, :string, :eina_bool, :eina_bool, :eina_bool ], :eina_bool ],
        # EAPI unsigned int elm_web_text_matches_mark(Evas_Object *obj, const char *string, Eina_Bool case_sensitive, Eina_Bool highlight, unsigned int limit);
        [ :elm_web_text_matches_mark, [ :evas_object_p, :string, :eina_bool, :eina_bool, :uint ], :uint ],
        # EAPI Eina_Bool elm_web_text_matches_unmark_all(Evas_Object *obj);
        [ :elm_web_text_matches_unmark_all, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_web_text_matches_highlight_set(Evas_Object *obj, Eina_Bool highlight);
        [ :elm_web_text_matches_highlight_set, [ :evas_object_p, :eina_bool ], :eina_bool ],
        # EAPI Eina_Bool elm_web_text_matches_highlight_get(const Evas_Object *obj);
        [ :elm_web_text_matches_highlight_get, [ :evas_object_p ], :eina_bool ],
        # EAPI double elm_web_load_progress_get(const Evas_Object *obj);
        [ :elm_web_load_progress_get, [ :evas_object_p ], :double ],
        # EAPI Eina_Bool elm_web_stop(Evas_Object *obj);
        [ :elm_web_stop, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_web_reload(Evas_Object *obj);
        [ :elm_web_reload, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_web_reload_full(Evas_Object *obj);
        [ :elm_web_reload_full, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_web_back(Evas_Object *obj);
        [ :elm_web_back, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_web_forward(Evas_Object *obj);
        [ :elm_web_forward, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_web_navigate(Evas_Object *obj, int steps);
        [ :elm_web_navigate, [ :evas_object_p, :int ], :eina_bool ],
        # EAPI Eina_Bool elm_web_back_possible(Evas_Object *obj);
        [ :elm_web_back_possible, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_web_forward_possible(Evas_Object *obj);
        [ :elm_web_forward_possible, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_web_navigate_possible(Evas_Object *obj, int steps);
        [ :elm_web_navigate_possible, [ :evas_object_p, :int ], :eina_bool ],
        # EAPI Eina_Bool elm_web_history_enable_get(const Evas_Object *obj);
        [ :elm_web_history_enable_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_web_history_enable_set(Evas_Object *obj, Eina_Bool enable);
        [ :elm_web_history_enable_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI void elm_web_zoom_set(Evas_Object *obj, double zoom);
        [ :elm_web_zoom_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_web_zoom_get(const Evas_Object *obj);
        [ :elm_web_zoom_get, [ :evas_object_p ], :double ],
        # EAPI void elm_web_zoom_mode_set(Evas_Object *obj, Elm_Web_Zoom_Mode mode);
        [ :elm_web_zoom_mode_set, [ :evas_object_p, :elm_web_zoom_mode ], :void ],
        # EAPI Elm_Web_Zoom_Mode elm_web_zoom_mode_get(const Evas_Object *obj);
        [ :elm_web_zoom_mode_get, [ :evas_object_p ], :elm_web_zoom_mode ],
        # EAPI void elm_web_region_show(Evas_Object *obj, int x, int y, int w, int h);
        [ :elm_web_region_show, [ :evas_object_p, :int, :int, :int, :int ], :void ],
        # EAPI void elm_web_region_bring_in(Evas_Object *obj, int x, int y, int w, int h);
        [ :elm_web_region_bring_in, [ :evas_object_p, :int, :int, :int, :int ], :void ],
        # EAPI void elm_web_inwin_mode_set(Evas_Object *obj, Eina_Bool value);
        [ :elm_web_inwin_mode_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_web_inwin_mode_get(const Evas_Object *obj);
        [ :elm_web_inwin_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_web_window_features_ref(Elm_Web_Window_Features *wf);
        [ :elm_web_window_features_ref, [ :elm_web_window_features_p ], :void ],
        # EAPI void elm_web_window_features_unref(Elm_Web_Window_Features *wf);
        [ :elm_web_window_features_unref, [ :elm_web_window_features_p ], :void ],
        # EAPI void elm_web_window_features_bool_property_get(const Elm_Web_Window_Features *wf, Eina_Bool *toolbar_visible, Eina_Bool *statusbar_visible, Eina_Bool *scrollbars_visible, Eina_Bool *menubar_visible, Eina_Bool *locationbar_visble, Eina_Bool *fullscreen);
        [ :elm_web_window_features_bool_property_get, [ :elm_web_window_features_p, :eina_bool_p, :eina_bool_p, :eina_bool_p, :eina_bool_p, :eina_bool_p, :eina_bool_p ],
            :void ],
        # EAPI void elm_web_window_features_int_property_get(const Elm_Web_Window_Features *wf, int *x, int *y, int *w, int *h);
        [ :elm_web_window_features_int_property_get, [ :elm_web_window_features_p, :int_p, :int_p, :int_p, :int_p ], :void ],
        # EAPI Evas_Object *elm_hoversel_add(Evas_Object *parent);
        [ :elm_hoversel_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_hoversel_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_hoversel_horizontal_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_hoversel_horizontal_get(const Evas_Object *obj);
        [ :elm_hoversel_horizontal_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_hoversel_hover_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_hoversel_hover_parent_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_hoversel_hover_parent_get(const Evas_Object *obj);
        [ :elm_hoversel_hover_parent_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_hoversel_hover_begin(Evas_Object *obj);
        [ :elm_hoversel_hover_begin, [ :evas_object_p ], :void ],
        # EAPI void elm_hoversel_hover_end(Evas_Object *obj);
        [ :elm_hoversel_hover_end, [ :evas_object_p ], :void ],
        # EAPI Eina_Bool elm_hoversel_expanded_get(const Evas_Object *obj);
        [ :elm_hoversel_expanded_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_hoversel_clear(Evas_Object *obj);
        [ :elm_hoversel_clear, [ :evas_object_p ], :void ],
        # EAPI const Eina_List *elm_hoversel_items_get(const Evas_Object *obj);
        [ :elm_hoversel_items_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI Elm_Object_Item *elm_hoversel_item_add(Evas_Object *obj, const char *label, const char *icon_file, Elm_Icon_Type icon_type, Evas_Smart_Cb func, const void *data);
        [ :elm_hoversel_item_add, [ :evas_object_p, :string, :string, :elm_icon_type, :evas_smart_cb, :void_p ], :elm_object_item_p ],
        # EAPI void elm_hoversel_item_del(Elm_Object_Item *it);
        [ :elm_hoversel_item_del, [ :elm_object_item_p ], :void ],
        # EAPI void elm_hoversel_item_del_cb_set(Elm_Object_Item *it, Evas_Smart_Cb func);
        [ :elm_hoversel_item_del_cb_set, [ :elm_object_item_p, :evas_smart_cb ], :void ],
        # EAPI void elm_hoversel_item_icon_set(Elm_Object_Item *it, const char *icon_file, const char *icon_group, Elm_Icon_Type icon_type);
        [ :elm_hoversel_item_icon_set, [ :elm_object_item_p, :string, :string, :elm_icon_type ], :void ],
        # EAPI void elm_hoversel_item_icon_get(const Elm_Object_Item *it, const char **icon_file, const char **icon_group, Elm_Icon_Type *icon_type);
        [ :elm_hoversel_item_icon_get, [ :elm_object_item_p, :string_array, :string_array, :elm_icon_type_p ], :void ],
        # EAPI Evas_Object *elm_toolbar_add(Evas_Object *parent);
        [ :elm_toolbar_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_toolbar_icon_size_set(Evas_Object *obj, int icon_size);
        [ :elm_toolbar_icon_size_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_toolbar_icon_size_get(const Evas_Object *obj);
        [ :elm_toolbar_icon_size_get, [ :evas_object_p ], :int ],
        # EAPI void elm_toolbar_icon_order_lookup_set(Evas_Object *obj, Elm_Icon_Lookup_Order order);
        [ :elm_toolbar_icon_order_lookup_set, [ :evas_object_p, :elm_icon_lookup_order ], :void ],
        # EAPI Elm_Icon_Lookup_Order elm_toolbar_icon_order_lookup_get(const Evas_Object *obj);
        [ :elm_toolbar_icon_order_lookup_get, [ :evas_object_p ], :elm_icon_lookup_order ],
        # EAPI void elm_toolbar_always_select_mode_set(Evas_Object *obj, Eina_Bool always_select);
        [ :elm_toolbar_always_select_mode_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_toolbar_always_select_mode_get(const Evas_Object *obj);
        [ :elm_toolbar_always_select_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_toolbar_no_select_mode_set(Evas_Object *obj, Eina_Bool no_select);
        [ :elm_toolbar_no_select_mode_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_toolbar_no_select_mode_get(const Evas_Object *obj);
        [ :elm_toolbar_no_select_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Elm_Object_Item *elm_toolbar_item_append(Evas_Object *obj, const char *icon, const char *label, Evas_Smart_Cb func, const void *data);
        [ :elm_toolbar_item_append, [ :evas_object_p, :string, :string, :evas_smart_cb, :void_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_toolbar_item_prepend(Evas_Object *obj, const char *icon, const char *label, Evas_Smart_Cb func, const void *data);
        [ :elm_toolbar_item_prepend, [ :evas_object_p, :string, :string, :evas_smart_cb, :void_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_toolbar_item_insert_before(Evas_Object *obj, Elm_Object_Item *before, const char *icon, const char *label, Evas_Smart_Cb func, const void *data);
        [ :elm_toolbar_item_insert_before, [ :evas_object_p, :elm_object_item_p, :string, :string, :evas_smart_cb, :void_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_toolbar_item_insert_after(Evas_Object *obj, Elm_Object_Item *after, const char *icon, const char *label, Evas_Smart_Cb func, const void *data);
        [ :elm_toolbar_item_insert_after, [ :evas_object_p, :elm_object_item_p, :string, :string, :evas_smart_cb, :void_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_toolbar_first_item_get(const Evas_Object *obj);
        [ :elm_toolbar_first_item_get, [ :evas_object_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_toolbar_last_item_get(const Evas_Object *obj);
        [ :elm_toolbar_last_item_get, [ :evas_object_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_toolbar_item_next_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_next_get, [ :elm_object_item_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_toolbar_item_prev_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_prev_get, [ :elm_object_item_p ], :elm_object_item_p ],
        # EAPI void elm_toolbar_item_priority_set(Elm_Object_Item *it, int priority);
        [ :elm_toolbar_item_priority_set, [ :elm_object_item_p, :int ], :void ],
        # EAPI int elm_toolbar_item_priority_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_priority_get, [ :elm_object_item_p ], :int ],
        # EAPI Elm_Object_Item *elm_toolbar_item_find_by_label(const Evas_Object *obj, const char *label);
        [ :elm_toolbar_item_find_by_label, [ :evas_object_p, :string ], :elm_object_item_p ],
        # EAPI Eina_Bool elm_toolbar_item_selected_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_selected_get, [ :elm_object_item_p ], :eina_bool ],
        # EAPI void elm_toolbar_item_selected_set(Elm_Object_Item *it, Eina_Bool selected);
        [ :elm_toolbar_item_selected_set, [ :elm_object_item_p, :eina_bool ], :void ],
        # EAPI Elm_Object_Item *elm_toolbar_selected_item_get(const Evas_Object *obj);
        [ :elm_toolbar_selected_item_get, [ :evas_object_p ], :elm_object_item_p ],
        # EAPI void elm_toolbar_item_icon_set(Elm_Object_Item *it, const char *icon);
        [ :elm_toolbar_item_icon_set, [ :elm_object_item_p, :string ], :void ],
        # EAPI const char *elm_toolbar_item_icon_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_icon_get, [ :elm_object_item_p ], :string ],
        # EAPI Evas_Object *elm_toolbar_item_object_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_object_get, [ :elm_object_item_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_toolbar_item_icon_object_get(Elm_Object_Item *it);
        [ :elm_toolbar_item_icon_object_get, [ :elm_object_item_p ], :evas_object_p ],
        # EAPI Eina_Bool elm_toolbar_item_icon_memfile_set(Elm_Object_Item *it, const void *img, size_t size, const char *format, const char *key);
        [ :elm_toolbar_item_icon_memfile_set, [ :elm_object_item_p, :void_p, :ulong, :string, :string ], :eina_bool ],
        # EAPI Eina_Bool elm_toolbar_item_icon_file_set(Elm_Object_Item *it, const char *file, const char *key);
        [ :elm_toolbar_item_icon_file_set, [ :elm_object_item_p, :string, :string ], :eina_bool ],
        # EAPI void elm_toolbar_item_del(Elm_Object_Item *it);
        [ :elm_toolbar_item_del, [ :elm_object_item_p ], :void ],
        # EAPI void elm_toolbar_item_del_cb_set(Elm_Object_Item *it, Evas_Smart_Cb func);
        [ :elm_toolbar_item_del_cb_set, [ :elm_object_item_p, :evas_smart_cb ], :void ],
        # EAPI void elm_toolbar_item_separator_set(Elm_Object_Item *it, Eina_Bool separator);
        [ :elm_toolbar_item_separator_set, [ :elm_object_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_toolbar_item_separator_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_separator_get, [ :elm_object_item_p ], :eina_bool ],
        # EAPI void elm_toolbar_mode_shrink_set(Evas_Object *obj, Elm_Toolbar_Shrink_Mode shrink_mode);
        [ :elm_toolbar_mode_shrink_set, [ :evas_object_p, :elm_toolbar_shrink_mode ], :void ],
        # EAPI Elm_Toolbar_Shrink_Mode elm_toolbar_mode_shrink_get(const Evas_Object *obj);
        [ :elm_toolbar_mode_shrink_get, [ :evas_object_p ], :elm_toolbar_shrink_mode ],
        # EAPI void elm_toolbar_homogeneous_set(Evas_Object *obj, Eina_Bool homogeneous);
        [ :elm_toolbar_homogeneous_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_toolbar_homogeneous_get(const Evas_Object *obj);
        [ :elm_toolbar_homogeneous_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_toolbar_menu_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_toolbar_menu_parent_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_toolbar_menu_parent_get(const Evas_Object *obj);
        [ :elm_toolbar_menu_parent_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_toolbar_align_set(Evas_Object *obj, double align);
        [ :elm_toolbar_align_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_toolbar_align_get(const Evas_Object *obj);
        [ :elm_toolbar_align_get, [ :evas_object_p ], :double ],
        # EAPI void elm_toolbar_item_menu_set(Elm_Object_Item *it, Eina_Bool menu);
        [ :elm_toolbar_item_menu_set, [ :elm_object_item_p, :eina_bool ], :void ],
        # EAPI Evas_Object *elm_toolbar_item_menu_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_menu_get, [ :elm_object_item_p ], :evas_object_p ],
        # EAPI Elm_Toolbar_Item_State *elm_toolbar_item_state_add(Elm_Object_Item *it, const char *icon, const char *label, Evas_Smart_Cb func, const void *data);
        [ :elm_toolbar_item_state_add, [ :elm_object_item_p, :string, :string, :evas_smart_cb, :void_p ], :elm_toolbar_item_state_p ],
        # EAPI Eina_Bool elm_toolbar_item_state_del(Elm_Object_Item *it, Elm_Toolbar_Item_State *state);
        [ :elm_toolbar_item_state_del, [ :elm_object_item_p, :elm_toolbar_item_state_p ], :eina_bool ],
        # EAPI Eina_Bool elm_toolbar_item_state_set(Elm_Object_Item *it, Elm_Toolbar_Item_State *state);
        [ :elm_toolbar_item_state_set, [ :elm_object_item_p, :elm_toolbar_item_state_p ], :eina_bool ],
        # EAPI void elm_toolbar_item_state_unset(Elm_Object_Item *it);
        [ :elm_toolbar_item_state_unset, [ :elm_object_item_p ], :void ],
        # EAPI Elm_Toolbar_Item_State *elm_toolbar_item_state_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_state_get, [ :elm_object_item_p ], :elm_toolbar_item_state_p ],
        # EAPI Elm_Toolbar_Item_State *elm_toolbar_item_state_next(Elm_Object_Item *it);
        [ :elm_toolbar_item_state_next, [ :elm_object_item_p ], :elm_toolbar_item_state_p ],
        # EAPI Elm_Toolbar_Item_State *elm_toolbar_item_state_prev(Elm_Object_Item *it);
        [ :elm_toolbar_item_state_prev, [ :elm_object_item_p ], :elm_toolbar_item_state_p ],
        # EAPI void elm_toolbar_item_tooltip_text_set(Elm_Object_Item *it, const char *text);
        [ :elm_toolbar_item_tooltip_text_set, [ :elm_object_item_p, :string ], :void ],
        # EAPI void elm_toolbar_item_tooltip_content_cb_set(Elm_Object_Item *it, Elm_Tooltip_Item_Content_Cb func, const void *data, Evas_Smart_Cb del_cb);
        [ :elm_toolbar_item_tooltip_content_cb_set, [ :elm_object_item_p, :elm_tooltip_item_content_cb, :void_p, :evas_smart_cb ], :void ],
        # EAPI void elm_toolbar_item_tooltip_unset(Elm_Object_Item *it);
        [ :elm_toolbar_item_tooltip_unset, [ :elm_object_item_p ], :void ],
        # EAPI void elm_toolbar_item_tooltip_style_set(Elm_Object_Item *it, const char *style);
        [ :elm_toolbar_item_tooltip_style_set, [ :elm_object_item_p, :string ], :void ],
        # EAPI const char *elm_toolbar_item_tooltip_style_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_tooltip_style_get, [ :elm_object_item_p ], :string ],
        # EAPI void elm_toolbar_item_cursor_set(Elm_Object_Item *it, const char *cursor);
        [ :elm_toolbar_item_cursor_set, [ :elm_object_item_p, :string ], :void ],
        # EAPI const char *elm_toolbar_item_cursor_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_cursor_get, [ :elm_object_item_p ], :string ],
        # EAPI void elm_toolbar_item_cursor_unset(Elm_Object_Item *it);
        [ :elm_toolbar_item_cursor_unset, [ :elm_object_item_p ], :void ],
        # EAPI void elm_toolbar_item_cursor_style_set(Elm_Object_Item *it, const char *style);
        [ :elm_toolbar_item_cursor_style_set, [ :elm_object_item_p, :string ], :void ],
        # EAPI const char *elm_toolbar_item_cursor_style_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_cursor_style_get, [ :elm_object_item_p ], :string ],
        # EAPI void elm_toolbar_item_cursor_engine_only_set(Elm_Object_Item *it, Eina_Bool engine_only);
        [ :elm_toolbar_item_cursor_engine_only_set, [ :elm_object_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_toolbar_item_cursor_engine_only_get(const Elm_Object_Item *it);
        [ :elm_toolbar_item_cursor_engine_only_get, [ :elm_object_item_p ], :eina_bool ],
        # EAPI void elm_toolbar_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_toolbar_horizontal_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_toolbar_horizontal_get(const Evas_Object *obj);
        [ :elm_toolbar_horizontal_get, [ :evas_object_p ], :eina_bool ],
        # EAPI double elm_tooltip_delay_get(void);
        [ :elm_tooltip_delay_get, [  ], :double ],
        # EAPI Eina_Bool elm_tooltip_delay_set(double delay);
        [ :elm_tooltip_delay_set, [ :double ], :eina_bool ],
        # EAPI void elm_object_tooltip_show(Evas_Object *obj);
        [ :elm_object_tooltip_show, [ :evas_object_p ], :void ],
        # EAPI void elm_object_tooltip_hide(Evas_Object *obj);
        [ :elm_object_tooltip_hide, [ :evas_object_p ], :void ],
        # EAPI void elm_object_tooltip_text_set(Evas_Object *obj, const char *text);
        [ :elm_object_tooltip_text_set, [ :evas_object_p, :string ], :void ],
        # EAPI void elm_object_tooltip_domain_translatable_text_set(Evas_Object *obj, const char *domain, const char *text);
        [ :elm_object_tooltip_domain_translatable_text_set, [ :evas_object_p, :string, :string ], :void ],
        # EAPI void elm_object_tooltip_content_cb_set(Evas_Object *obj, Elm_Tooltip_Content_Cb func, const void *data, Evas_Smart_Cb del_cb);
        [ :elm_object_tooltip_content_cb_set, [ :evas_object_p, :elm_tooltip_content_cb, :void_p, :evas_smart_cb ], :void ],
        # EAPI void elm_object_tooltip_unset(Evas_Object *obj);
        [ :elm_object_tooltip_unset, [ :evas_object_p ], :void ],
        # EAPI void elm_object_tooltip_style_set(Evas_Object *obj, const char *style);
        [ :elm_object_tooltip_style_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_object_tooltip_style_get(const Evas_Object *obj);
        [ :elm_object_tooltip_style_get, [ :evas_object_p ], :string ],
        # EAPI Eina_Bool elm_object_tooltip_window_mode_set(Evas_Object *obj, Eina_Bool disable);
        [ :elm_object_tooltip_window_mode_set, [ :evas_object_p, :eina_bool ], :eina_bool ],
        # EAPI Eina_Bool elm_object_tooltip_window_mode_get(const Evas_Object *obj);
        [ :elm_object_tooltip_window_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_object_cursor_set(Evas_Object *obj, const char *cursor);
        [ :elm_object_cursor_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_object_cursor_get(const Evas_Object *obj);
        [ :elm_object_cursor_get, [ :evas_object_p ], :string ],
        # EAPI void elm_object_cursor_unset(Evas_Object *obj);
        [ :elm_object_cursor_unset, [ :evas_object_p ], :void ],
        # EAPI void elm_object_cursor_style_set(Evas_Object *obj, const char *style);
        [ :elm_object_cursor_style_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_object_cursor_style_get(const Evas_Object *obj);
        [ :elm_object_cursor_style_get, [ :evas_object_p ], :string ],
        # EAPI void elm_object_cursor_engine_only_set(Evas_Object *obj, Eina_Bool engine_only);
        [ :elm_object_cursor_engine_only_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_object_cursor_engine_only_get(const Evas_Object *obj);
        [ :elm_object_cursor_engine_only_get, [ :evas_object_p ], :eina_bool ],
        # EAPI int elm_cursor_engine_only_get(void);
        [ :elm_cursor_engine_only_get, [  ], :int ],
        # EAPI Eina_Bool elm_cursor_engine_only_set(int engine_only);
        [ :elm_cursor_engine_only_set, [ :int ], :eina_bool ],
        # EAPI Evas_Object *elm_menu_add(Evas_Object *parent);
        [ :elm_menu_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_menu_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_menu_parent_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_menu_parent_get(const Evas_Object *obj);
        [ :elm_menu_parent_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_menu_move(Evas_Object *obj, Evas_Coord x, Evas_Coord y);
        [ :elm_menu_move, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_menu_close(Evas_Object *obj);
        [ :elm_menu_close, [ :evas_object_p ], :void ],
        # EAPI const Eina_List *elm_menu_items_get(const Evas_Object *obj);
        [ :elm_menu_items_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI Evas_Object *elm_menu_item_object_get(const Elm_Object_Item *it);
        [ :elm_menu_item_object_get, [ :elm_object_item_p ], :evas_object_p ],
        # EAPI Elm_Object_Item *elm_menu_item_add(Evas_Object *obj, Elm_Object_Item *parent, const char *icon, const char *label, Evas_Smart_Cb func, const void *data);
        [ :elm_menu_item_add, [ :evas_object_p, :elm_object_item_p, :string, :string, :evas_smart_cb, :void_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_menu_item_add_object(Evas_Object *obj, Elm_Object_Item *parent, Evas_Object *subobj, Evas_Smart_Cb func, const void *data);
        [ :elm_menu_item_add_object, [ :evas_object_p, :elm_object_item_p, :evas_object_p, :evas_smart_cb, :void_p ], :elm_object_item_p ],
        # EAPI void elm_menu_item_object_icon_name_set(Elm_Object_Item *it, const char *icon);
        [ :elm_menu_item_object_icon_name_set, [ :elm_object_item_p, :string ], :void ],
        # EAPI const char *elm_menu_item_object_icon_name_get(const Elm_Object_Item *it);
        [ :elm_menu_item_object_icon_name_get, [ :elm_object_item_p ], :string ],
        # EAPI void elm_menu_item_selected_set(Elm_Object_Item *it, Eina_Bool selected);
        [ :elm_menu_item_selected_set, [ :elm_object_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_menu_item_selected_get(const Elm_Object_Item *it);
        [ :elm_menu_item_selected_get, [ :elm_object_item_p ], :eina_bool ],
        # EAPI Elm_Object_Item *elm_menu_item_separator_add(Evas_Object *obj, Elm_Object_Item *parent);
        [ :elm_menu_item_separator_add, [ :evas_object_p, :elm_object_item_p ], :elm_object_item_p ],
        # EAPI Eina_Bool elm_menu_item_is_separator(Elm_Object_Item *it);
        [ :elm_menu_item_is_separator, [ :elm_object_item_p ], :eina_bool ],
        # EAPI void elm_menu_item_del(Elm_Object_Item *it);
        [ :elm_menu_item_del, [ :elm_object_item_p ], :void ],
        # EAPI void elm_menu_item_del_cb_set(Elm_Object_Item *it, Evas_Smart_Cb func);
        [ :elm_menu_item_del_cb_set, [ :elm_object_item_p, :evas_smart_cb ], :void ],
        # EAPI const Eina_List *elm_menu_item_subitems_get(const Elm_Object_Item *it);
        [ :elm_menu_item_subitems_get, [ :elm_object_item_p ], :eina_list_p ],
        # EAPI unsigned int elm_menu_item_index_get(const Elm_Object_Item *it);
        [ :elm_menu_item_index_get, [ :elm_object_item_p ], :uint ],
        # EAPI Evas_Object *elm_menu_item_menu_get(const Elm_Object_Item *it);
        [ :elm_menu_item_menu_get, [ :elm_object_item_p ], :evas_object_p ],
        # EAPI Elm_Object_Item *elm_menu_selected_item_get(const Evas_Object * obj);
        [ :elm_menu_selected_item_get, [ :evas_object_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_menu_last_item_get(const Evas_Object * obj);
        [ :elm_menu_last_item_get, [ :evas_object_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_menu_first_item_get(const Evas_Object * obj);
        [ :elm_menu_first_item_get, [ :evas_object_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_menu_item_next_get(const Elm_Object_Item *it);
        [ :elm_menu_item_next_get, [ :elm_object_item_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_menu_item_prev_get(const Elm_Object_Item *it);
        [ :elm_menu_item_prev_get, [ :elm_object_item_p ], :elm_object_item_p ],
        # EAPI Evas_Object *elm_list_add(Evas_Object *parent);
        [ :elm_list_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_list_go(Evas_Object *obj);
        [ :elm_list_go, [ :evas_object_p ], :void ],
        # EAPI void elm_list_multi_select_set(Evas_Object *obj, Eina_Bool multi);
        [ :elm_list_multi_select_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_list_multi_select_get(const Evas_Object *obj);
        [ :elm_list_multi_select_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_list_mode_set(Evas_Object *obj, Elm_List_Mode mode);
        [ :elm_list_mode_set, [ :evas_object_p, :elm_list_mode ], :void ],
        # EAPI Elm_List_Mode elm_list_mode_get(const Evas_Object *obj);
        [ :elm_list_mode_get, [ :evas_object_p ], :elm_list_mode ],
        # EAPI void elm_list_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_list_horizontal_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_list_horizontal_get(const Evas_Object *obj);
        [ :elm_list_horizontal_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_list_always_select_mode_set(Evas_Object *obj, Eina_Bool always_select);
        [ :elm_list_always_select_mode_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_list_always_select_mode_get(const Evas_Object *obj);
        [ :elm_list_always_select_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_list_bounce_set(Evas_Object *obj, Eina_Bool h_bounce, Eina_Bool v_bounce);
        [ :elm_list_bounce_set, [ :evas_object_p, :eina_bool, :eina_bool ], :void ],
        # EAPI void elm_list_bounce_get(const Evas_Object *obj, Eina_Bool *h_bounce, Eina_Bool *v_bounce);
        [ :elm_list_bounce_get, [ :evas_object_p, :eina_bool_p, :eina_bool_p ], :void ],
        # EAPI void elm_list_scroller_policy_set(Evas_Object *obj, Elm_Scroller_Policy policy_h, Elm_Scroller_Policy policy_v);
        [ :elm_list_scroller_policy_set, [ :evas_object_p, :elm_scroller_policy, :elm_scroller_policy ], :void ],
        # EAPI void elm_list_scroller_policy_get(const Evas_Object *obj, Elm_Scroller_Policy *policy_h, Elm_Scroller_Policy *policy_v);
        [ :elm_list_scroller_policy_get, [ :evas_object_p, :elm_scroller_policy_p, :elm_scroller_policy_p ], :void ],
        # EAPI Elm_List_Item *elm_list_item_append(Evas_Object *obj, const char *label, Evas_Object *icon, Evas_Object *end, Evas_Smart_Cb func, const void *data);
        [ :elm_list_item_append, [ :evas_object_p, :string, :evas_object_p, :evas_object_p, :evas_smart_cb, :void_p ], :elm_list_item_p ],
        # EAPI Elm_List_Item *elm_list_item_prepend(Evas_Object *obj, const char *label, Evas_Object *icon, Evas_Object *end, Evas_Smart_Cb func, const void *data);
        [ :elm_list_item_prepend, [ :evas_object_p, :string, :evas_object_p, :evas_object_p, :evas_smart_cb, :void_p ], :elm_list_item_p ],
        # EAPI Elm_List_Item *elm_list_item_insert_before(Evas_Object *obj, Elm_List_Item *before, const char *label, Evas_Object *icon, Evas_Object *end, Evas_Smart_Cb func, const void *data);
        [ :elm_list_item_insert_before, [ :evas_object_p, :elm_list_item_p, :string, :evas_object_p, :evas_object_p, :evas_smart_cb, :void_p ], :elm_list_item_p ],
        # EAPI Elm_List_Item *elm_list_item_insert_after(Evas_Object *obj, Elm_List_Item *after, const char *label, Evas_Object *icon, Evas_Object *end, Evas_Smart_Cb func, const void *data);
        [ :elm_list_item_insert_after, [ :evas_object_p, :elm_list_item_p, :string, :evas_object_p, :evas_object_p, :evas_smart_cb, :void_p ], :elm_list_item_p ],
        # EAPI Elm_List_Item *elm_list_item_sorted_insert(Evas_Object *obj, const char *label, Evas_Object *icon, Evas_Object *end, Evas_Smart_Cb func, const void *data, Eina_Compare_Cb cmp_func);
        [ :elm_list_item_sorted_insert, [ :evas_object_p, :string, :evas_object_p, :evas_object_p, :evas_smart_cb, :void_p, :eina_compare_cb ], :elm_list_item_p ],
        # EAPI void elm_list_clear(Evas_Object *obj);
        [ :elm_list_clear, [ :evas_object_p ], :void ],
        # EAPI const Eina_List *elm_list_items_get(const Evas_Object *obj);
        [ :elm_list_items_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI Elm_List_Item *elm_list_selected_item_get(const Evas_Object *obj);
        [ :elm_list_selected_item_get, [ :evas_object_p ], :elm_list_item_p ],
        # EAPI const Eina_List *elm_list_selected_items_get(const Evas_Object *obj);
        [ :elm_list_selected_items_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI void elm_list_item_selected_set(Elm_List_Item *item, Eina_Bool selected);
        [ :elm_list_item_selected_set, [ :elm_list_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_list_item_selected_get(const Elm_List_Item *item);
        [ :elm_list_item_selected_get, [ :elm_list_item_p ], :eina_bool ],
        # EAPI void elm_list_item_separator_set(Elm_List_Item *it, Eina_Bool setting);
        [ :elm_list_item_separator_set, [ :elm_list_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_list_item_separator_get(const Elm_List_Item *it);
        [ :elm_list_item_separator_get, [ :elm_list_item_p ], :eina_bool ],
        # EAPI void elm_list_item_show(Elm_List_Item *item);
        [ :elm_list_item_show, [ :elm_list_item_p ], :void ],
        # EAPI void elm_list_item_bring_in(Elm_List_Item *item);
        [ :elm_list_item_bring_in, [ :elm_list_item_p ], :void ],
        # EAPI void elm_list_item_del(Elm_List_Item *item);
        [ :elm_list_item_del, [ :elm_list_item_p ], :void ],
        # EAPI void elm_list_item_del_cb_set(Elm_List_Item *item, Evas_Smart_Cb func);
        [ :elm_list_item_del_cb_set, [ :elm_list_item_p, :evas_smart_cb ], :void ],
        # EAPI void *elm_list_item_data_get(const Elm_List_Item *item);
        [ :elm_list_item_data_get, [ :elm_list_item_p ], :void_p ],
        # EAPI Evas_Object *elm_list_item_icon_get(const Elm_List_Item *item);
        [ :elm_list_item_icon_get, [ :elm_list_item_p ], :evas_object_p ],
        # EAPI void elm_list_item_icon_set(Elm_List_Item *item, Evas_Object *icon);
        [ :elm_list_item_icon_set, [ :elm_list_item_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_list_item_end_get(const Elm_List_Item *item);
        [ :elm_list_item_end_get, [ :elm_list_item_p ], :evas_object_p ],
        # EAPI void elm_list_item_end_set(Elm_List_Item *item, Evas_Object *end);
        [ :elm_list_item_end_set, [ :elm_list_item_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_list_item_object_get(const Elm_List_Item *item);
        [ :elm_list_item_object_get, [ :elm_list_item_p ], :evas_object_p ],
        # EAPI const char *elm_list_item_label_get(const Elm_List_Item *item);
        [ :elm_list_item_label_get, [ :elm_list_item_p ], :string ],
        # EAPI void elm_list_item_label_set(Elm_List_Item *item, const char *text);
        [ :elm_list_item_label_set, [ :elm_list_item_p, :string ], :void ],
        # EAPI Elm_List_Item *elm_list_item_prev(const Elm_List_Item *it);
        [ :elm_list_item_prev, [ :elm_list_item_p ], :elm_list_item_p ],
        # EAPI Elm_List_Item *elm_list_item_next(const Elm_List_Item *it);
        [ :elm_list_item_next, [ :elm_list_item_p ], :elm_list_item_p ],
        # EAPI void elm_list_item_disabled_set(Elm_List_Item *it, Eina_Bool disabled);
        [ :elm_list_item_disabled_set, [ :elm_list_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_list_item_disabled_get(const Elm_List_Item *it);
        [ :elm_list_item_disabled_get, [ :elm_list_item_p ], :eina_bool ],
        # EAPI void elm_list_item_tooltip_text_set(Elm_List_Item *item, const char *text);
        [ :elm_list_item_tooltip_text_set, [ :elm_list_item_p, :string ], :void ],
        # EAPI Eina_Bool elm_list_item_tooltip_window_mode_set(Elm_List_Item *item, Eina_Bool disable);
        [ :elm_list_item_tooltip_window_mode_set, [ :elm_list_item_p, :eina_bool ], :eina_bool ],
        # EAPI Eina_Bool elm_list_item_tooltip_window_mode_get(const Elm_List_Item *item);
        [ :elm_list_item_tooltip_window_mode_get, [ :elm_list_item_p ], :eina_bool ],
        # EAPI void elm_list_item_tooltip_content_cb_set(Elm_List_Item *item, Elm_Tooltip_Item_Content_Cb func, const void *data, Evas_Smart_Cb del_cb);
        [ :elm_list_item_tooltip_content_cb_set, [ :elm_list_item_p, :elm_tooltip_item_content_cb, :void_p, :evas_smart_cb ], :void ],
        # EAPI void elm_list_item_tooltip_unset(Elm_List_Item *item);
        [ :elm_list_item_tooltip_unset, [ :elm_list_item_p ], :void ],
        # EAPI void elm_list_item_tooltip_style_set(Elm_List_Item *item, const char *style);
        [ :elm_list_item_tooltip_style_set, [ :elm_list_item_p, :string ], :void ],
        # EAPI const char *elm_list_item_tooltip_style_get(const Elm_List_Item *item);
        [ :elm_list_item_tooltip_style_get, [ :elm_list_item_p ], :string ],
        # EAPI void elm_list_item_cursor_set(Elm_List_Item *item, const char *cursor);
        [ :elm_list_item_cursor_set, [ :elm_list_item_p, :string ], :void ],
        # EAPI const char *elm_list_item_cursor_get(const Elm_List_Item *item);
        [ :elm_list_item_cursor_get, [ :elm_list_item_p ], :string ],
        # EAPI void elm_list_item_cursor_unset(Elm_List_Item *item);
        [ :elm_list_item_cursor_unset, [ :elm_list_item_p ], :void ],
        # EAPI void elm_list_item_cursor_style_set(Elm_List_Item *item, const char *style);
        [ :elm_list_item_cursor_style_set, [ :elm_list_item_p, :string ], :void ],
        # EAPI const char *elm_list_item_cursor_style_get(const Elm_List_Item *item);
        [ :elm_list_item_cursor_style_get, [ :elm_list_item_p ], :string ],
        # EAPI void elm_list_item_cursor_engine_only_set(Elm_List_Item *item, Eina_Bool engine_only);
        [ :elm_list_item_cursor_engine_only_set, [ :elm_list_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_list_item_cursor_engine_only_get(const Elm_List_Item *item);
        [ :elm_list_item_cursor_engine_only_get, [ :elm_list_item_p ], :eina_bool ],
        # EAPI Evas_Object *elm_slider_add(Evas_Object *parent);
        [ :elm_slider_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_slider_span_size_set(Evas_Object *obj, Evas_Coord size);
        [ :elm_slider_span_size_set, [ :evas_object_p, :int ], :void ],
        # EAPI Evas_Coord elm_slider_span_size_get(const Evas_Object *obj);
        [ :elm_slider_span_size_get, [ :evas_object_p ], :int ],
        # EAPI void elm_slider_unit_format_set(Evas_Object *obj, const char *format);
        [ :elm_slider_unit_format_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_slider_unit_format_get(const Evas_Object *obj);
        [ :elm_slider_unit_format_get, [ :evas_object_p ], :string ],
        # EAPI void elm_slider_indicator_format_set(Evas_Object *obj, const char *indicator);
        [ :elm_slider_indicator_format_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_slider_indicator_format_get(const Evas_Object *obj);
        [ :elm_slider_indicator_format_get, [ :evas_object_p ], :string ],
        # EAPI void elm_slider_indicator_format_function_set(Evas_Object *obj, const char *(*func)(double val), void (*free_func)(const char *str));
        # FIXME
        # EAPI void elm_slider_units_format_function_set(Evas_Object *obj, const char *(*func)(double val), void (*free_func)(const char *str));
        # FIXME
        # EAPI void elm_slider_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_slider_horizontal_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_slider_horizontal_get(const Evas_Object *obj);
        [ :elm_slider_horizontal_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_slider_min_max_set(Evas_Object *obj, double min, double max);
        [ :elm_slider_min_max_set, [ :evas_object_p, :double, :double ], :void ],
        # EAPI void elm_slider_min_max_get(const Evas_Object *obj, double *min, double *max);
        [ :elm_slider_min_max_get, [ :evas_object_p, :double_p, :double_p ], :void ],
        # EAPI void elm_slider_value_set(Evas_Object *obj, double val);
        [ :elm_slider_value_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_slider_value_get(const Evas_Object *obj);
        [ :elm_slider_value_get, [ :evas_object_p ], :double ],
        # EAPI void elm_slider_inverted_set(Evas_Object *obj, Eina_Bool inverted);
        [ :elm_slider_inverted_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_slider_inverted_get(const Evas_Object *obj);
        [ :elm_slider_inverted_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_slider_indicator_show_set(Evas_Object *obj, Eina_Bool show);
        [ :elm_slider_indicator_show_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_slider_indicator_show_get(const Evas_Object *obj);
        [ :elm_slider_indicator_show_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_actionslider_add(Evas_Object *parent);
        [ :elm_actionslider_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI const char *elm_actionslider_selected_label_get(const Evas_Object *obj);
        [ :elm_actionslider_selected_label_get, [ :evas_object_p ], :string ],
        # EAPI void elm_actionslider_indicator_pos_set(Evas_Object *obj, Elm_Actionslider_Pos pos);
        [ :elm_actionslider_indicator_pos_set, [ :evas_object_p, :elm_actionslider_pos ], :void ],
        # EAPI Elm_Actionslider_Pos elm_actionslider_indicator_pos_get(const Evas_Object *obj);
        [ :elm_actionslider_indicator_pos_get, [ :evas_object_p ], :elm_actionslider_pos ],
        # EAPI void elm_actionslider_magnet_pos_set(Evas_Object *obj, Elm_Actionslider_Pos pos);
        [ :elm_actionslider_magnet_pos_set, [ :evas_object_p, :elm_actionslider_pos ], :void ],
        # EAPI Elm_Actionslider_Pos elm_actionslider_magnet_pos_get(const Evas_Object *obj);
        [ :elm_actionslider_magnet_pos_get, [ :evas_object_p ], :elm_actionslider_pos ],
        # EAPI void elm_actionslider_enabled_pos_set(Evas_Object *obj, Elm_Actionslider_Pos pos);
        [ :elm_actionslider_enabled_pos_set, [ :evas_object_p, :elm_actionslider_pos ], :void ],
        # EAPI Elm_Actionslider_Pos elm_actionslider_enabled_pos_get(const Evas_Object *obj);
        [ :elm_actionslider_enabled_pos_get, [ :evas_object_p ], :elm_actionslider_pos ],
        # EAPI Evas_Object *elm_genlist_add(Evas_Object *parent);
        [ :elm_genlist_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_genlist_clear(Evas_Object *obj);
        [ :elm_genlist_clear, [ :evas_object_p ], :void ],
        # EAPI void elm_genlist_multi_select_set(Evas_Object *obj, Eina_Bool multi);
        [ :elm_genlist_multi_select_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_genlist_multi_select_get(const Evas_Object *obj);
        [ :elm_genlist_multi_select_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_genlist_horizontal_set(Evas_Object *obj, Elm_List_Mode mode);
        [ :elm_genlist_horizontal_set, [ :evas_object_p, :elm_list_mode ], :void ],
        # EAPI Elm_List_Mode elm_genlist_horizontal_get(const Evas_Object *obj);
        [ :elm_genlist_horizontal_get, [ :evas_object_p ], :elm_list_mode ],
        # EAPI void elm_genlist_always_select_mode_set(Evas_Object *obj, Eina_Bool always_select);
        [ :elm_genlist_always_select_mode_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_genlist_always_select_mode_get(const Evas_Object *obj);
        [ :elm_genlist_always_select_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_genlist_no_select_mode_set(Evas_Object *obj, Eina_Bool no_select);
        [ :elm_genlist_no_select_mode_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_genlist_no_select_mode_get(const Evas_Object *obj);
        [ :elm_genlist_no_select_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_genlist_compress_mode_set(Evas_Object *obj, Eina_Bool compress);
        [ :elm_genlist_compress_mode_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_genlist_compress_mode_get(const Evas_Object *obj);
        [ :elm_genlist_compress_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_genlist_height_for_width_mode_set(Evas_Object *obj, Eina_Bool height_for_width);
        [ :elm_genlist_height_for_width_mode_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_genlist_height_for_width_mode_get(const Evas_Object *obj);
        [ :elm_genlist_height_for_width_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_genlist_bounce_set(Evas_Object *obj, Eina_Bool h_bounce, Eina_Bool v_bounce);
        [ :elm_genlist_bounce_set, [ :evas_object_p, :eina_bool, :eina_bool ], :void ],
        # EAPI void elm_genlist_bounce_get(const Evas_Object *obj, Eina_Bool *h_bounce, Eina_Bool *v_bounce);
        [ :elm_genlist_bounce_get, [ :evas_object_p, :eina_bool_p, :eina_bool_p ], :void ],
        # EAPI void elm_genlist_homogeneous_set(Evas_Object *obj, Eina_Bool homogeneous);
        [ :elm_genlist_homogeneous_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_genlist_homogeneous_get(const Evas_Object *obj);
        [ :elm_genlist_homogeneous_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_genlist_block_count_set(Evas_Object *obj, int n);
        [ :elm_genlist_block_count_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_genlist_block_count_get(const Evas_Object *obj);
        [ :elm_genlist_block_count_get, [ :evas_object_p ], :int ],
        # EAPI void elm_genlist_longpress_timeout_set(Evas_Object *obj, double timeout);
        [ :elm_genlist_longpress_timeout_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_genlist_longpress_timeout_get(const Evas_Object *obj);
        [ :elm_genlist_longpress_timeout_get, [ :evas_object_p ], :double ],
        # EAPI Elm_Genlist_Item *elm_genlist_item_append(Evas_Object *obj, const Elm_Genlist_Item_Class *itc, const void *data, Elm_Genlist_Item *parent, Elm_Genlist_Item_Flags flags, Evas_Smart_Cb func, const void *func_data);
        [ :elm_genlist_item_append, [ :evas_object_p, :elm_genlist_item_class_p, :void_p, :elm_genlist_item_p, :elm_genlist_item_flags, :evas_smart_cb, :void_p ],
            :elm_genlist_item_p ],
        # EAPI Elm_Genlist_Item *elm_genlist_item_prepend(Evas_Object *obj, const Elm_Genlist_Item_Class *itc, const void *data, Elm_Genlist_Item *parent, Elm_Genlist_Item_Flags flags, Evas_Smart_Cb func, const void *func_data);
        [ :elm_genlist_item_prepend, [ :evas_object_p, :elm_genlist_item_class_p, :void_p, :elm_genlist_item_p, :elm_genlist_item_flags, :evas_smart_cb, :void_p ],
            :elm_genlist_item_p ],
        # EAPI Elm_Genlist_Item *elm_genlist_item_insert_before(Evas_Object *obj, const Elm_Genlist_Item_Class *itc, const void *data, Elm_Genlist_Item *parent, Elm_Genlist_Item *before, Elm_Genlist_Item_Flags flags, Evas_Smart_Cb func, const void *func_data);
        [ :elm_genlist_item_insert_before, [ :evas_object_p, :elm_genlist_item_class_p, :void_p, :elm_genlist_item_p, :elm_genlist_item_p, :elm_genlist_item_flags,
            :evas_smart_cb, :void_p ], :elm_genlist_item_p ],
        # EAPI Elm_Genlist_Item *elm_genlist_item_insert_after(Evas_Object *obj, const Elm_Genlist_Item_Class *itc, const void *data, Elm_Genlist_Item *parent, Elm_Genlist_Item *after, Elm_Genlist_Item_Flags flags, Evas_Smart_Cb func, const void *func_data);
        [ :elm_genlist_item_insert_after, [ :evas_object_p, :elm_genlist_item_class_p, :void_p, :elm_genlist_item_p, :elm_genlist_item_p, :elm_genlist_item_flags,
            :evas_smart_cb, :void_p ], :elm_genlist_item_p ],
        # EAPI Elm_Genlist_Item *elm_genlist_item_sorted_insert(Evas_Object *obj, const Elm_Genlist_Item_Class *itc, const void *data, Elm_Genlist_Item *parent, Elm_Genlist_Item_Flags flags, Eina_Compare_Cb comp, Evas_Smart_Cb func,const void *func_data);
        [ :elm_genlist_item_sorted_insert, [ :evas_object_p, :elm_genlist_item_class_p, :void_p, :elm_genlist_item_p, :elm_genlist_item_flags, :eina_compare_cb,
            :evas_smart_cb, :void_p ], :elm_genlist_item_p ],
        # EAPI Elm_Genlist_Item *elm_genlist_item_direct_sorted_insert(Evas_Object *obj, const Elm_Genlist_Item_Class *itc, const void *data, Elm_Genlist_Item *parent, Elm_Genlist_Item_Flags flags, Eina_Compare_Cb comp, Evas_Smart_Cb func, const void *func_data);
        [ :elm_genlist_item_direct_sorted_insert, [ :evas_object_p, :elm_genlist_item_class_p, :void_p, :elm_genlist_item_p, :elm_genlist_item_flags, :eina_compare_cb,
            :evas_smart_cb, :void_p ], :elm_genlist_item_p ],
        # EAPI Elm_Genlist_Item *elm_genlist_selected_item_get(const Evas_Object *obj);
        [ :elm_genlist_selected_item_get, [ :evas_object_p ], :elm_genlist_item_p ],
        # EAPI const Eina_List *elm_genlist_selected_items_get(const Evas_Object *obj);
        [ :elm_genlist_selected_items_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI const char *elm_genlist_mode_item_style_get(const Evas_Object *obj);
        [ :elm_genlist_mode_item_style_get, [ :evas_object_p ], :string ],
        # EAPI void elm_genlist_mode_item_style_set(Evas_Object *obj, const char *style);
        [ :elm_genlist_mode_item_style_set, [ :evas_object_p, :string ], :void ],
        # EAPI Eina_List *elm_genlist_realized_items_get(const Evas_Object *obj);
        [ :elm_genlist_realized_items_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI Elm_Genlist_Item *elm_genlist_at_xy_item_get(const Evas_Object *obj, Evas_Coord x, Evas_Coord y, int *posret);
        [ :elm_genlist_at_xy_item_get, [ :evas_object_p, :int, :int, :int_p ], :elm_genlist_item_p ],
        # EAPI Elm_Genlist_Item *elm_genlist_first_item_get(const Evas_Object *obj);
        [ :elm_genlist_first_item_get, [ :evas_object_p ], :elm_genlist_item_p ],
        # EAPI Elm_Genlist_Item *elm_genlist_last_item_get(const Evas_Object *obj);
        [ :elm_genlist_last_item_get, [ :evas_object_p ], :elm_genlist_item_p ],
        # EAPI void elm_genlist_scroller_policy_set(Evas_Object *obj, Elm_Scroller_Policy policy_h, Elm_Scroller_Policy policy_v);
        [ :elm_genlist_scroller_policy_set, [ :evas_object_p, :elm_scroller_policy, :elm_scroller_policy ], :void ],
        # EAPI void elm_genlist_scroller_policy_get(const Evas_Object *obj, Elm_Scroller_Policy *policy_h, Elm_Scroller_Policy *policy_v);
        [ :elm_genlist_scroller_policy_get, [ :evas_object_p, :elm_scroller_policy_p, :elm_scroller_policy_p ], :void ],
        # EAPI Elm_Genlist_Item *elm_genlist_item_next_get(const Elm_Genlist_Item *item);
        [ :elm_genlist_item_next_get, [ :elm_genlist_item_p ], :elm_genlist_item_p ],
        # EAPI Elm_Genlist_Item *elm_genlist_item_prev_get(const Elm_Genlist_Item *item);
        [ :elm_genlist_item_prev_get, [ :elm_genlist_item_p ], :elm_genlist_item_p ],
        # EAPI Evas_Object *elm_genlist_item_genlist_get(const Elm_Genlist_Item *item);
        [ :elm_genlist_item_genlist_get, [ :elm_genlist_item_p ], :evas_object_p ],
        # EAPI Elm_Genlist_Item *elm_genlist_item_parent_get(const Elm_Genlist_Item *it);
        [ :elm_genlist_item_parent_get, [ :elm_genlist_item_p ], :elm_genlist_item_p ],
        # EAPI void elm_genlist_item_subitems_clear(Elm_Genlist_Item *item);
        [ :elm_genlist_item_subitems_clear, [ :elm_genlist_item_p ], :void ],
        # EAPI void elm_genlist_item_selected_set(Elm_Genlist_Item *item, Eina_Bool selected);
        [ :elm_genlist_item_selected_set, [ :elm_genlist_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_genlist_item_selected_get(const Elm_Genlist_Item *item);
        [ :elm_genlist_item_selected_get, [ :elm_genlist_item_p ], :eina_bool ],
        # EAPI void elm_genlist_item_expanded_set(Elm_Genlist_Item *item, Eina_Bool expanded);
        [ :elm_genlist_item_expanded_set, [ :elm_genlist_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_genlist_item_expanded_get(const Elm_Genlist_Item *item);
        [ :elm_genlist_item_expanded_get, [ :elm_genlist_item_p ], :eina_bool ],
        # EAPI int elm_genlist_item_expanded_depth_get(const Elm_Genlist_Item *it);
        [ :elm_genlist_item_expanded_depth_get, [ :elm_genlist_item_p ], :int ],
        # EAPI void elm_genlist_item_disabled_set(Elm_Genlist_Item *item, Eina_Bool disabled);
        [ :elm_genlist_item_disabled_set, [ :elm_genlist_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_genlist_item_disabled_get(const Elm_Genlist_Item *item);
        [ :elm_genlist_item_disabled_get, [ :elm_genlist_item_p ], :eina_bool ],
        # EAPI void elm_genlist_item_display_only_set(Elm_Genlist_Item *it, Eina_Bool display_only);
        [ :elm_genlist_item_display_only_set, [ :elm_genlist_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_genlist_item_display_only_get(const Elm_Genlist_Item *it);
        [ :elm_genlist_item_display_only_get, [ :elm_genlist_item_p ], :eina_bool ],
        # EAPI void elm_genlist_item_show(Elm_Genlist_Item *item);
        [ :elm_genlist_item_show, [ :elm_genlist_item_p ], :void ],
        # EAPI void elm_genlist_item_bring_in(Elm_Genlist_Item *item);
        [ :elm_genlist_item_bring_in, [ :elm_genlist_item_p ], :void ],
        # EAPI void elm_genlist_item_top_show(Elm_Genlist_Item *item);
        [ :elm_genlist_item_top_show, [ :elm_genlist_item_p ], :void ],
        # EAPI void elm_genlist_item_top_bring_in(Elm_Genlist_Item *item);
        [ :elm_genlist_item_top_bring_in, [ :elm_genlist_item_p ], :void ],
        # EAPI void elm_genlist_item_middle_show(Elm_Genlist_Item *it);
        [ :elm_genlist_item_middle_show, [ :elm_genlist_item_p ], :void ],
        # EAPI void elm_genlist_item_middle_bring_in(Elm_Genlist_Item *it);
        [ :elm_genlist_item_middle_bring_in, [ :elm_genlist_item_p ], :void ],
        # EAPI void elm_genlist_item_del(Elm_Genlist_Item *item);
        [ :elm_genlist_item_del, [ :elm_genlist_item_p ], :void ],
        # EAPI void *elm_genlist_item_data_get(const Elm_Genlist_Item *item);
        [ :elm_genlist_item_data_get, [ :elm_genlist_item_p ], :void_p ],
        # EAPI void elm_genlist_item_data_set(Elm_Genlist_Item *it, const void *data);
        [ :elm_genlist_item_data_set, [ :elm_genlist_item_p, :void_p ], :void ],
        # EAPI void elm_genlist_item_contents_orphan(Elm_Genlist_Item *it);
        [ :elm_genlist_item_contents_orphan, [ :elm_genlist_item_p ], :void ],
        # EAPI const Evas_Object *elm_genlist_item_object_get(const Elm_Genlist_Item *it);
        [ :elm_genlist_item_object_get, [ :elm_genlist_item_p ], :evas_object_p ],
        # EAPI void elm_genlist_item_update(Elm_Genlist_Item *item);
        [ :elm_genlist_item_update, [ :elm_genlist_item_p ], :void ],
        # EAPI void elm_genlist_item_promote(Elm_Gen_Item *it);
        [ :elm_genlist_item_promote, [ :elm_gen_item_p ], :void ],
        # EAPI void elm_genlist_item_demote(Elm_Gen_Item *it);
        [ :elm_genlist_item_demote, [ :elm_gen_item_p ], :void ],
        # EAPI void elm_genlist_item_fields_update(Elm_Genlist_Item *it, const char *parts, Elm_Genlist_Item_Field_Flags itf);
        [ :elm_genlist_item_fields_update, [ :elm_genlist_item_p, :string, :elm_genlist_item_field_flags ], :void ],
        # EAPI void elm_genlist_item_item_class_update(Elm_Genlist_Item *it, const Elm_Genlist_Item_Class *itc);
        [ :elm_genlist_item_item_class_update, [ :elm_genlist_item_p, :elm_genlist_item_class_p ], :void ],
        # EAPI const Elm_Genlist_Item_Class *elm_genlist_item_item_class_get(const Elm_Genlist_Item *it);
        [ :elm_genlist_item_item_class_get, [ :elm_genlist_item_p ], :elm_genlist_item_class_p ],
        # EAPI void elm_genlist_item_tooltip_text_set(Elm_Genlist_Item *item, const char *text);
        [ :elm_genlist_item_tooltip_text_set, [ :elm_genlist_item_p, :string ], :void ],
        # EAPI void elm_genlist_item_tooltip_content_cb_set(Elm_Genlist_Item *item, Elm_Tooltip_Item_Content_Cb func, const void *data, Evas_Smart_Cb del_cb);
        [ :elm_genlist_item_tooltip_content_cb_set, [ :elm_genlist_item_p, :elm_tooltip_item_content_cb, :void_p, :evas_smart_cb ], :void ],
        # EAPI void elm_genlist_item_tooltip_unset(Elm_Genlist_Item *item);
        [ :elm_genlist_item_tooltip_unset, [ :elm_genlist_item_p ], :void ],
        # EAPI void elm_genlist_item_tooltip_style_set(Elm_Genlist_Item *item, const char *style);
        [ :elm_genlist_item_tooltip_style_set, [ :elm_genlist_item_p, :string ], :void ],
        # EAPI const char *elm_genlist_item_tooltip_style_get(const Elm_Genlist_Item *item);
        [ :elm_genlist_item_tooltip_style_get, [ :elm_genlist_item_p ], :string ],
        # EAPI Eina_Bool elm_genlist_item_tooltip_window_mode_set(Elm_Genlist_Item *item, Eina_Bool disable);
        [ :elm_genlist_item_tooltip_window_mode_set, [ :elm_genlist_item_p, :eina_bool ], :eina_bool ],
        # EAPI Eina_Bool elm_genlist_item_tooltip_window_mode_get(const Elm_Genlist_Item *item);
        [ :elm_genlist_item_tooltip_window_mode_get, [ :elm_genlist_item_p ], :eina_bool ],
        # EAPI void elm_genlist_item_cursor_set(Elm_Genlist_Item *item, const char *cursor);
        [ :elm_genlist_item_cursor_set, [ :elm_genlist_item_p, :string ], :void ],
        # EAPI const char *elm_genlist_item_cursor_get(const Elm_Genlist_Item *item);
        [ :elm_genlist_item_cursor_get, [ :elm_genlist_item_p ], :string ],
        # EAPI void elm_genlist_item_cursor_unset(Elm_Genlist_Item *item);
        [ :elm_genlist_item_cursor_unset, [ :elm_genlist_item_p ], :void ],
        # EAPI void elm_genlist_item_cursor_style_set(Elm_Genlist_Item *item, const char *style);
        [ :elm_genlist_item_cursor_style_set, [ :elm_genlist_item_p, :string ], :void ],
        # EAPI const char *elm_genlist_item_cursor_style_get(const Elm_Genlist_Item *item);
        [ :elm_genlist_item_cursor_style_get, [ :elm_genlist_item_p ], :string ],
        # EAPI void elm_genlist_item_cursor_engine_only_set(Elm_Genlist_Item *item, Eina_Bool engine_only);
        [ :elm_genlist_item_cursor_engine_only_set, [ :elm_genlist_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_genlist_item_cursor_engine_only_get(const Elm_Genlist_Item *item);
        [ :elm_genlist_item_cursor_engine_only_get, [ :elm_genlist_item_p ], :eina_bool ],
        # EAPI void elm_genlist_realized_items_update(Evas_Object *obj);
        [ :elm_genlist_realized_items_update, [ :evas_object_p ], :void ],
        # EAPI void elm_genlist_item_mode_set(Elm_Genlist_Item *it, const char *mode_type, Eina_Bool mode_set);
        [ :elm_genlist_item_mode_set, [ :elm_genlist_item_p, :string, :eina_bool ], :void ],
        # EAPI const char *elm_genlist_mode_get(const Evas_Object *obj);
        [ :elm_genlist_mode_get, [ :evas_object_p ], :string ],
        # EAPI const Elm_Genlist_Item *elm_genlist_mode_item_get(const Evas_Object *obj);
        [ :elm_genlist_mode_item_get, [ :evas_object_p ], :elm_genlist_item_p ],
        # EAPI void elm_genlist_reorder_mode_set(Evas_Object *obj, Eina_Bool reorder_mode);
        [ :elm_genlist_reorder_mode_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_genlist_reorder_mode_get(const Evas_Object *obj);
        [ :elm_genlist_reorder_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_check_add(Evas_Object *parent);
        [ :elm_check_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_check_state_set(Evas_Object *obj, Eina_Bool state);
        [ :elm_check_state_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_check_state_get(const Evas_Object *obj);
        [ :elm_check_state_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_check_state_pointer_set(Evas_Object *obj, Eina_Bool *statep);
        [ :elm_check_state_pointer_set, [ :evas_object_p, :eina_bool_p ], :void ],
        # EAPI Evas_Object *elm_radio_add(Evas_Object *parent);
        [ :elm_radio_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_radio_group_add(Evas_Object *obj, Evas_Object *group);
        [ :elm_radio_group_add, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI void elm_radio_state_value_set(Evas_Object *obj, int value);
        [ :elm_radio_state_value_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_radio_state_value_get(const Evas_Object *obj);
        [ :elm_radio_state_value_get, [ :evas_object_p ], :int ],
        # EAPI void elm_radio_value_set(Evas_Object *obj, int value);
        [ :elm_radio_value_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_radio_value_get(const Evas_Object *obj);
        [ :elm_radio_value_get, [ :evas_object_p ], :int ],
        # EAPI void elm_radio_value_pointer_set(Evas_Object *obj, int *valuep);
        [ :elm_radio_value_pointer_set, [ :evas_object_p, :int_p ], :void ],
        # EAPI Evas_Object *elm_pager_add(Evas_Object *parent);
        [ :elm_pager_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_pager_content_push(Evas_Object *obj, Evas_Object *content);
        [ :elm_pager_content_push, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI void elm_pager_content_pop(Evas_Object *obj);
        [ :elm_pager_content_pop, [ :evas_object_p ], :void ],
        # EAPI void elm_pager_content_promote(Evas_Object *obj, Evas_Object *content);
        [ :elm_pager_content_promote, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_pager_content_bottom_get(const Evas_Object *obj);
        [ :elm_pager_content_bottom_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_pager_content_top_get(const Evas_Object *obj);
        [ :elm_pager_content_top_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_slideshow_add(Evas_Object *parent);
        [ :elm_slideshow_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI Elm_Object_Item *elm_slideshow_item_add(Evas_Object *obj, const Elm_Slideshow_Item_Class *itc, const void *data);
        [ :elm_slideshow_item_add, [ :evas_object_p, :elm_slideshow_item_class_p, :void_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_slideshow_item_sorted_insert(Evas_Object *obj, const Elm_Slideshow_Item_Class *itc, const void *data, Eina_Compare_Cb func);
        [ :elm_slideshow_item_sorted_insert, [ :evas_object_p, :elm_slideshow_item_class_p, :void_p, :eina_compare_cb ], :elm_object_item_p ],
        # EAPI void elm_slideshow_show(Elm_Object_Item *it);
        [ :elm_slideshow_show, [ :elm_object_item_p ], :void ],
        # EAPI void elm_slideshow_next(Evas_Object *obj);
        [ :elm_slideshow_next, [ :evas_object_p ], :void ],
        # EAPI void elm_slideshow_previous(Evas_Object *obj);
        [ :elm_slideshow_previous, [ :evas_object_p ], :void ],
        # EAPI const Eina_List *elm_slideshow_transitions_get(const Evas_Object *obj);
        [ :elm_slideshow_transitions_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI void elm_slideshow_transition_set(Evas_Object *obj, const char *transition);
        [ :elm_slideshow_transition_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_slideshow_transition_get(const Evas_Object *obj);
        [ :elm_slideshow_transition_get, [ :evas_object_p ], :string ],
        # EAPI void elm_slideshow_timeout_set(Evas_Object *obj, double timeout);
        [ :elm_slideshow_timeout_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_slideshow_timeout_get(const Evas_Object *obj);
        [ :elm_slideshow_timeout_get, [ :evas_object_p ], :double ],
        # EAPI void elm_slideshow_loop_set(Evas_Object *obj, Eina_Bool loop);
        [ :elm_slideshow_loop_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_slideshow_loop_get(const Evas_Object *obj);
        [ :elm_slideshow_loop_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_slideshow_clear(Evas_Object *obj);
        [ :elm_slideshow_clear, [ :evas_object_p ], :void ],
        # EAPI const Eina_List *elm_slideshow_items_get(const Evas_Object *obj);
        [ :elm_slideshow_items_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI void elm_slideshow_item_del(Elm_Object_Item *it);
        [ :elm_slideshow_item_del, [ :elm_object_item_p ], :void ],
        # EAPI Elm_Object_Item *elm_slideshow_item_current_get(const Evas_Object *obj);
        [ :elm_slideshow_item_current_get, [ :evas_object_p ], :elm_object_item_p ],
        # EAPI Evas_Object* elm_slideshow_item_object_get(const Elm_Object_Item* it);
        [ :elm_slideshow_item_object_get, [ :elm_object_item_p ], :evas_object_p ],
        # EAPI Elm_Object_Item *elm_slideshow_item_nth_get(const Evas_Object *obj, unsigned int nth);
        [ :elm_slideshow_item_nth_get, [ :evas_object_p, :uint ], :elm_object_item_p ],
        # EAPI void elm_slideshow_layout_set(Evas_Object *obj, const char *layout);
        [ :elm_slideshow_layout_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_slideshow_layout_get(const Evas_Object *obj);
        [ :elm_slideshow_layout_get, [ :evas_object_p ], :string ],
        # EAPI const Eina_List *elm_slideshow_layouts_get(const Evas_Object *obj);
        [ :elm_slideshow_layouts_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI void elm_slideshow_cache_before_set(Evas_Object *obj, int count);
        [ :elm_slideshow_cache_before_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_slideshow_cache_before_get(const Evas_Object *obj);
        [ :elm_slideshow_cache_before_get, [ :evas_object_p ], :int ],
        # EAPI void elm_slideshow_cache_after_set(Evas_Object *obj, int count);
        [ :elm_slideshow_cache_after_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_slideshow_cache_after_get(const Evas_Object *obj);
        [ :elm_slideshow_cache_after_get, [ :evas_object_p ], :int ],
        # EAPI unsigned int elm_slideshow_count_get(const Evas_Object *obj);
        [ :elm_slideshow_count_get, [ :evas_object_p ], :uint ],
        # EAPI Evas_Object *elm_fileselector_add(Evas_Object *parent);
        [ :elm_fileselector_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_fileselector_is_save_set(Evas_Object *obj, Eina_Bool is_save);
        [ :elm_fileselector_is_save_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_is_save_get(const Evas_Object *obj);
        [ :elm_fileselector_is_save_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_fileselector_folder_only_set(Evas_Object *obj, Eina_Bool only);
        [ :elm_fileselector_folder_only_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_folder_only_get(const Evas_Object *obj);
        [ :elm_fileselector_folder_only_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_fileselector_buttons_ok_cancel_set(Evas_Object *obj, Eina_Bool buttons);
        [ :elm_fileselector_buttons_ok_cancel_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_buttons_ok_cancel_get(const Evas_Object *obj);
        [ :elm_fileselector_buttons_ok_cancel_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_fileselector_expandable_set(Evas_Object *obj, Eina_Bool expand);
        [ :elm_fileselector_expandable_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_expandable_get(const Evas_Object *obj);
        [ :elm_fileselector_expandable_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_fileselector_path_set(Evas_Object *obj, const char *path);
        [ :elm_fileselector_path_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_fileselector_path_get(const Evas_Object *obj);
        [ :elm_fileselector_path_get, [ :evas_object_p ], :string ],
        # EAPI Eina_Bool elm_fileselector_selected_set(Evas_Object *obj, const char *path);
        [ :elm_fileselector_selected_set, [ :evas_object_p, :string ], :eina_bool ],
        # EAPI const char *elm_fileselector_selected_get(const Evas_Object *obj);
        [ :elm_fileselector_selected_get, [ :evas_object_p ], :string ],
        # EAPI void elm_fileselector_mode_set(Evas_Object *obj, Elm_Fileselector_Mode mode);
        [ :elm_fileselector_mode_set, [ :evas_object_p, :elm_fileselector_mode ], :void ],
        # EAPI Elm_Fileselector_Mode elm_fileselector_mode_get(const Evas_Object *obj);
        [ :elm_fileselector_mode_get, [ :evas_object_p ], :elm_fileselector_mode ],
        # EAPI Evas_Object *elm_progressbar_add(Evas_Object *parent);
        [ :elm_progressbar_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_progressbar_pulse_set(Evas_Object *obj, Eina_Bool pulse);
        [ :elm_progressbar_pulse_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_progressbar_pulse_get(const Evas_Object *obj);
        [ :elm_progressbar_pulse_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_progressbar_pulse(Evas_Object *obj, Eina_Bool state);
        [ :elm_progressbar_pulse, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI void elm_progressbar_value_set(Evas_Object *obj, double val);
        [ :elm_progressbar_value_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_progressbar_value_get(const Evas_Object *obj);
        [ :elm_progressbar_value_get, [ :evas_object_p ], :double ],
        # EAPI void elm_progressbar_span_size_set(Evas_Object *obj, Evas_Coord size);
        [ :elm_progressbar_span_size_set, [ :evas_object_p, :int ], :void ],
        # EAPI Evas_Coord elm_progressbar_span_size_get(const Evas_Object *obj);
        [ :elm_progressbar_span_size_get, [ :evas_object_p ], :int ],
        # EAPI void elm_progressbar_unit_format_set(Evas_Object *obj, const char *format);
        [ :elm_progressbar_unit_format_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_progressbar_unit_format_get(const Evas_Object *obj);
        [ :elm_progressbar_unit_format_get, [ :evas_object_p ], :string ],
        # EAPI void elm_progressbar_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_progressbar_horizontal_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_progressbar_horizontal_get(const Evas_Object *obj);
        [ :elm_progressbar_horizontal_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_progressbar_inverted_set(Evas_Object *obj, Eina_Bool inverted);
        [ :elm_progressbar_inverted_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_progressbar_inverted_get(const Evas_Object *obj);
        [ :elm_progressbar_inverted_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_separator_add(Evas_Object *parent);
        [ :elm_separator_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_separator_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_separator_horizontal_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_separator_horizontal_get(const Evas_Object *obj);
        [ :elm_separator_horizontal_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_spinner_add(Evas_Object *parent);
        [ :elm_spinner_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_spinner_label_format_set(Evas_Object *obj, const char *fmt);
        [ :elm_spinner_label_format_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_spinner_label_format_get(const Evas_Object *obj);
        [ :elm_spinner_label_format_get, [ :evas_object_p ], :string ],
        # EAPI void elm_spinner_min_max_set(Evas_Object *obj, double min, double max);
        [ :elm_spinner_min_max_set, [ :evas_object_p, :double, :double ], :void ],
        # EAPI void elm_spinner_min_max_get(const Evas_Object *obj, double *min, double *max);
        [ :elm_spinner_min_max_get, [ :evas_object_p, :double_p, :double_p ], :void ],
        # EAPI void elm_spinner_step_set(Evas_Object *obj, double step);
        [ :elm_spinner_step_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_spinner_step_get(const Evas_Object *obj);
        [ :elm_spinner_step_get, [ :evas_object_p ], :double ],
        # EAPI void elm_spinner_value_set(Evas_Object *obj, double val);
        [ :elm_spinner_value_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_spinner_value_get(const Evas_Object *obj);
        [ :elm_spinner_value_get, [ :evas_object_p ], :double ],
        # EAPI void elm_spinner_wrap_set(Evas_Object *obj, Eina_Bool wrap);
        [ :elm_spinner_wrap_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_spinner_wrap_get(const Evas_Object *obj);
        [ :elm_spinner_wrap_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_spinner_editable_set(Evas_Object *obj, Eina_Bool editable);
        [ :elm_spinner_editable_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_spinner_editable_get(const Evas_Object *obj);
        [ :elm_spinner_editable_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_spinner_special_value_add(Evas_Object *obj, double value, const char *label);
        [ :elm_spinner_special_value_add, [ :evas_object_p, :double, :string ], :void ],
        # EAPI void elm_spinner_interval_set(Evas_Object *obj, double interval);
        [ :elm_spinner_interval_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_spinner_interval_get(const Evas_Object *obj);
        [ :elm_spinner_interval_get, [ :evas_object_p ], :double ],
        # EAPI Evas_Object *elm_index_add(Evas_Object *parent);
        [ :elm_index_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_index_active_set(Evas_Object *obj, Eina_Bool active);
        [ :elm_index_active_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_index_active_get(const Evas_Object *obj);
        [ :elm_index_active_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_index_item_level_set(Evas_Object *obj, int level);
        [ :elm_index_item_level_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_index_item_level_get(const Evas_Object *obj);
        [ :elm_index_item_level_get, [ :evas_object_p ], :int ],
        # EAPI Elm_Index_Item *elm_index_item_selected_get(const Evas_Object *obj, int level);
        [ :elm_index_item_selected_get, [ :evas_object_p, :int ], :elm_index_item_p ],
        # EAPI void elm_index_item_append(Evas_Object *obj, const char *letter, const void *item);
        [ :elm_index_item_append, [ :evas_object_p, :string, :void_p ], :void ],
        # EAPI void elm_index_item_prepend(Evas_Object *obj, const char *letter, const void *item);
        [ :elm_index_item_prepend, [ :evas_object_p, :string, :void_p ], :void ],
        # EAPI void elm_index_item_append_relative(Evas_Object *obj, const char *letter, const void *item, const Elm_Index_Item *relative);
        [ :elm_index_item_append_relative, [ :evas_object_p, :string, :void_p, :elm_index_item_p ], :void ],
        # EAPI void elm_index_item_prepend_relative(Evas_Object *obj, const char *letter, const void *item, const Elm_Index_Item *relative);
        [ :elm_index_item_prepend_relative, [ :evas_object_p, :string, :void_p, :elm_index_item_p ], :void ],
        # EAPI void elm_index_item_sorted_insert(Evas_Object *obj, const char *letter, const void *item, Eina_Compare_Cb cmp_func, Eina_Compare_Cb cmp_data_func);
        [ :elm_index_item_sorted_insert, [ :evas_object_p, :string, :void_p, :eina_compare_cb, :eina_compare_cb ], :void ],
        # EAPI void elm_index_item_del(Evas_Object *obj, Elm_Index_Item *item);
        [ :elm_index_item_del, [ :evas_object_p, :elm_index_item_p ], :void ],
        # EAPI Elm_Index_Item *elm_index_item_find(Evas_Object *obj, const void *item);
        [ :elm_index_item_find, [ :evas_object_p, :void_p ], :elm_index_item_p ],
        # EAPI void elm_index_item_clear(Evas_Object *obj);
        [ :elm_index_item_clear, [ :evas_object_p ], :void ],
        # EAPI void elm_index_item_go(Evas_Object *obj, int level);
        [ :elm_index_item_go, [ :evas_object_p, :int ], :void ],
        # EAPI void *elm_index_item_data_get(const Elm_Index_Item *item);
        [ :elm_index_item_data_get, [ :elm_index_item_p ], :void_p ],
        # EAPI void elm_index_item_data_set(Elm_Index_Item *it, const void *data);
        [ :elm_index_item_data_set, [ :elm_index_item_p, :void_p ], :void ],
        # EAPI void elm_index_item_del_cb_set(Elm_Index_Item *it, Evas_Smart_Cb func);
        [ :elm_index_item_del_cb_set, [ :elm_index_item_p, :evas_smart_cb ], :void ],
        # EAPI const char *elm_index_item_letter_get(const Elm_Index_Item *item);
        [ :elm_index_item_letter_get, [ :elm_index_item_p ], :string ],
        # EAPI Evas_Object *elm_photocam_add(Evas_Object *parent);
        [ :elm_photocam_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Load_Error elm_photocam_file_set(Evas_Object *obj, const char *file);
        [ :elm_photocam_file_set, [ :evas_object_p, :string ], :evas_load_error ],
        # EAPI const char *elm_photocam_file_get(const Evas_Object *obj);
        [ :elm_photocam_file_get, [ :evas_object_p ], :string ],
        # EAPI void elm_photocam_zoom_set(Evas_Object *obj, double zoom);
        [ :elm_photocam_zoom_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_photocam_zoom_get(const Evas_Object *obj);
        [ :elm_photocam_zoom_get, [ :evas_object_p ], :double ],
        # EAPI void elm_photocam_zoom_mode_set(Evas_Object *obj, Elm_Photocam_Zoom_Mode mode);
        [ :elm_photocam_zoom_mode_set, [ :evas_object_p, :elm_photocam_zoom_mode ], :void ],
        # EAPI Elm_Photocam_Zoom_Mode elm_photocam_zoom_mode_get(const Evas_Object *obj);
        [ :elm_photocam_zoom_mode_get, [ :evas_object_p ], :elm_photocam_zoom_mode ],
        # EAPI void elm_photocam_image_size_get(const Evas_Object *obj, int *w, int *h);
        [ :elm_photocam_image_size_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_photocam_region_get(const Evas_Object *obj, int *x, int *y, int *w, int *h);
        [ :elm_photocam_region_get, [ :evas_object_p, :int_p, :int_p, :int_p, :int_p ], :void ],
        # EAPI void elm_photocam_image_region_show(Evas_Object *obj, int x, int y, int w, int h);
        [ :elm_photocam_image_region_show, [ :evas_object_p, :int, :int, :int, :int ], :void ],
        # EAPI void elm_photocam_image_region_bring_in(Evas_Object *obj, int x, int y, int w, int h);
        [ :elm_photocam_image_region_bring_in, [ :evas_object_p, :int, :int, :int, :int ], :void ],
        # EAPI void elm_photocam_paused_set(Evas_Object *obj, Eina_Bool paused);
        [ :elm_photocam_paused_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_photocam_paused_get(const Evas_Object *obj);
        [ :elm_photocam_paused_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_photocam_internal_image_get(const Evas_Object *obj);
        [ :elm_photocam_internal_image_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_photocam_bounce_set(Evas_Object *obj, Eina_Bool h_bounce, Eina_Bool v_bounce);
        [ :elm_photocam_bounce_set, [ :evas_object_p, :eina_bool, :eina_bool ], :void ],
        # EAPI void elm_photocam_bounce_get(const Evas_Object *obj, Eina_Bool *h_bounce, Eina_Bool *v_bounce);
        [ :elm_photocam_bounce_get, [ :evas_object_p, :eina_bool_p, :eina_bool_p ], :void ],
        # EAPI Evas_Object *elm_map_add(Evas_Object *parent);
        [ :elm_map_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_map_zoom_set(Evas_Object *obj, int zoom);
        [ :elm_map_zoom_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_map_zoom_get(const Evas_Object *obj);
        [ :elm_map_zoom_get, [ :evas_object_p ], :int ],
        # EAPI void elm_map_zoom_mode_set(Evas_Object *obj, Elm_Map_Zoom_Mode mode);
        [ :elm_map_zoom_mode_set, [ :evas_object_p, :elm_map_zoom_mode ], :void ],
        # EAPI Elm_Map_Zoom_Mode elm_map_zoom_mode_get(const Evas_Object *obj);
        [ :elm_map_zoom_mode_get, [ :evas_object_p ], :elm_map_zoom_mode ],
        # EAPI void elm_map_geo_region_get(const Evas_Object *obj, double *lon, double *lat);
        [ :elm_map_geo_region_get, [ :evas_object_p, :double_p, :double_p ], :void ],
        # EAPI void elm_map_geo_region_bring_in(Evas_Object *obj, double lon, double lat);
        [ :elm_map_geo_region_bring_in, [ :evas_object_p, :double, :double ], :void ],
        # EAPI void elm_map_geo_region_show(Evas_Object *obj, double lon, double lat);
        [ :elm_map_geo_region_show, [ :evas_object_p, :double, :double ], :void ],
        # EAPI void elm_map_paused_set(Evas_Object *obj, Eina_Bool paused);
        [ :elm_map_paused_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_map_paused_get(const Evas_Object *obj);
        [ :elm_map_paused_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_map_paused_markers_set(Evas_Object *obj, Eina_Bool paused);
        [ :elm_map_paused_markers_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_map_paused_markers_get(const Evas_Object *obj);
        [ :elm_map_paused_markers_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_map_utils_downloading_status_get(const Evas_Object *obj, int *try_num, int *finish_num);
        [ :elm_map_utils_downloading_status_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_map_utils_convert_coord_into_geo(const Evas_Object *obj, int x, int y, int size, double *lon, double *lat);
        [ :elm_map_utils_convert_coord_into_geo, [ :evas_object_p, :int, :int, :int, :double_p, :double_p ], :void ],
        # EAPI void elm_map_utils_convert_geo_into_coord(const Evas_Object *obj, double lon, double lat, int size, int *x, int *y);
        [ :elm_map_utils_convert_geo_into_coord, [ :evas_object_p, :double, :double, :int, :int_p, :int_p ], :void ],
        # EAPI Elm_Map_Name *elm_map_utils_convert_coord_into_name(const Evas_Object *obj, double lon, double lat);
        [ :elm_map_utils_convert_coord_into_name, [ :evas_object_p, :double, :double ], :elm_map_name_p ],
        # EAPI Elm_Map_Name *elm_map_utils_convert_name_into_coord(const Evas_Object *obj, char *address);
        [ :elm_map_utils_convert_name_into_coord, [ :evas_object_p, :string ], :elm_map_name_p ],
        # EAPI void elm_map_utils_rotate_coord(const Evas_Object *obj, const Evas_Coord x, const Evas_Coord y, const Evas_Coord cx, const Evas_Coord cy, const double degree, Evas_Coord *xx, Evas_Coord *yy);
        [ :elm_map_utils_rotate_coord, [ :evas_object_p, :int, :int, :int, :int, :double, :int_p, :int_p ], :void ],
        # EAPI Elm_Map_Marker *elm_map_marker_add(Evas_Object *obj, double lon, double lat, Elm_Map_Marker_Class *clas, Elm_Map_Group_Class *clas_group, void *data);
        [ :elm_map_marker_add, [ :evas_object_p, :double, :double, :elm_map_marker_class_p, :elm_map_group_class_p, :void_p ], :elm_map_marker_p ],
        # EAPI void elm_map_max_marker_per_group_set(Evas_Object *obj, int max);
        [ :elm_map_max_marker_per_group_set, [ :evas_object_p, :int ], :void ],
        # EAPI void elm_map_marker_remove(Elm_Map_Marker *marker);
        [ :elm_map_marker_remove, [ :elm_map_marker_p ], :void ],
        # EAPI void elm_map_marker_region_get(const Elm_Map_Marker *marker, double *lon, double *lat);
        [ :elm_map_marker_region_get, [ :elm_map_marker_p, :double_p, :double_p ], :void ],
        # EAPI void elm_map_marker_bring_in(Elm_Map_Marker *marker);
        [ :elm_map_marker_bring_in, [ :elm_map_marker_p ], :void ],
        # EAPI void elm_map_marker_show(Elm_Map_Marker *marker);
        [ :elm_map_marker_show, [ :elm_map_marker_p ], :void ],
        # EAPI void elm_map_markers_list_show(Eina_List *markers);
        [ :elm_map_markers_list_show, [ :eina_list_p ], :void ],
        # EAPI Evas_Object *elm_map_marker_object_get(const Elm_Map_Marker *marker);
        [ :elm_map_marker_object_get, [ :elm_map_marker_p ], :evas_object_p ],
        # EAPI void elm_map_marker_update(Elm_Map_Marker *marker);
        [ :elm_map_marker_update, [ :elm_map_marker_p ], :void ],
        # EAPI void elm_map_bubbles_close(Evas_Object *obj);
        [ :elm_map_bubbles_close, [ :evas_object_p ], :void ],
        # EAPI Elm_Map_Group_Class *elm_map_group_class_new(Evas_Object *obj);
        [ :elm_map_group_class_new, [ :evas_object_p ], :elm_map_group_class_p ],
        # EAPI void elm_map_group_class_style_set(Elm_Map_Group_Class *clas, const char *style);
        [ :elm_map_group_class_style_set, [ :elm_map_group_class_p, :string ], :void ],
        # EAPI void elm_map_group_class_icon_cb_set(Elm_Map_Group_Class *clas, ElmMapGroupIconGetFunc icon_get);
        [ :elm_map_group_class_icon_cb_set, [ :elm_map_group_class_p, :elmmapgroupicongetfunc ], :void ],
        # EAPI void elm_map_group_class_data_set(Elm_Map_Group_Class *clas, void *data);
        [ :elm_map_group_class_data_set, [ :elm_map_group_class_p, :void_p ], :void ],
        # EAPI void elm_map_group_class_zoom_displayed_set(Elm_Map_Group_Class *clas, int zoom);
        [ :elm_map_group_class_zoom_displayed_set, [ :elm_map_group_class_p, :int ], :void ],
        # EAPI void elm_map_group_class_zoom_grouped_set(Elm_Map_Group_Class *clas, int zoom);
        [ :elm_map_group_class_zoom_grouped_set, [ :elm_map_group_class_p, :int ], :void ],
        # EAPI void elm_map_group_class_hide_set(Evas_Object *obj, Elm_Map_Group_Class *clas, Eina_Bool hide);
        [ :elm_map_group_class_hide_set, [ :evas_object_p, :elm_map_group_class_p, :eina_bool ], :void ],
        # EAPI Elm_Map_Marker_Class *elm_map_marker_class_new(Evas_Object *obj);
        [ :elm_map_marker_class_new, [ :evas_object_p ], :elm_map_marker_class_p ],
        # EAPI void elm_map_marker_class_style_set(Elm_Map_Marker_Class *clas, const char *style);
        [ :elm_map_marker_class_style_set, [ :elm_map_marker_class_p, :string ], :void ],
        # EAPI void elm_map_marker_class_icon_cb_set(Elm_Map_Marker_Class *clas, ElmMapMarkerIconGetFunc icon_get);
        [ :elm_map_marker_class_icon_cb_set, [ :elm_map_marker_class_p, :elmmapmarkericongetfunc ], :void ],
        # EAPI void elm_map_marker_class_get_cb_set(Elm_Map_Marker_Class *clas, ElmMapMarkerGetFunc get);
        [ :elm_map_marker_class_get_cb_set, [ :elm_map_marker_class_p, :elmmapmarkergetfunc ], :void ],
        # EAPI void elm_map_marker_class_del_cb_set(Elm_Map_Marker_Class *clas, ElmMapMarkerDelFunc del);
        [ :elm_map_marker_class_del_cb_set, [ :elm_map_marker_class_p, :elmmapmarkerdelfunc ], :void ],
        # EAPI const char **elm_map_source_names_get(const Evas_Object *obj);
        [ :elm_map_source_names_get, [ :evas_object_p ], :string_array ],
        # EAPI void elm_map_source_name_set(Evas_Object *obj, const char *source_name);
        [ :elm_map_source_name_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_map_source_name_get(const Evas_Object *obj);
        [ :elm_map_source_name_get, [ :evas_object_p ], :string ],
        # EAPI void elm_map_route_source_set(Evas_Object *obj, Elm_Map_Route_Sources source);
        [ :elm_map_route_source_set, [ :evas_object_p, :elm_map_route_sources ], :void ],
        # EAPI Elm_Map_Route_Sources elm_map_route_source_get(const Evas_Object *obj);
        [ :elm_map_route_source_get, [ :evas_object_p ], :elm_map_route_sources ],
        # EAPI void elm_map_source_zoom_min_set(Evas_Object *obj, int zoom);
        [ :elm_map_source_zoom_min_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_map_source_zoom_min_get(const Evas_Object *obj);
        [ :elm_map_source_zoom_min_get, [ :evas_object_p ], :int ],
        # EAPI void elm_map_source_zoom_max_set(Evas_Object *obj, int zoom);
        [ :elm_map_source_zoom_max_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_map_source_zoom_max_get(const Evas_Object *obj);
        [ :elm_map_source_zoom_max_get, [ :evas_object_p ], :int ],
        # EAPI void elm_map_user_agent_set(Evas_Object *obj, const char *user_agent);
        [ :elm_map_user_agent_set, [ :evas_object_p, :string ], :void ],
        # EAPI const char *elm_map_user_agent_get(const Evas_Object *obj);
        [ :elm_map_user_agent_get, [ :evas_object_p ], :string ],
        # EAPI Elm_Map_Route *elm_map_route_add(Evas_Object *obj, Elm_Map_Route_Type type, Elm_Map_Route_Method method, double flon, double flat, double tlon, double tlat);
        [ :elm_map_route_add, [ :evas_object_p, :elm_map_route_type, :elm_map_route_method, :double, :double, :double, :double ], :elm_map_route_p ],
        # EAPI void elm_map_route_remove(Elm_Map_Route *route);
        [ :elm_map_route_remove, [ :elm_map_route_p ], :void ],
        # EAPI void elm_map_route_color_set(Elm_Map_Route *route, int r, int g , int b, int a);
        [ :elm_map_route_color_set, [ :elm_map_route_p, :int, :int, :int, :int ], :void ],
        # EAPI void elm_map_route_color_get(const Elm_Map_Route *route, int *r, int *g , int *b, int *a);
        [ :elm_map_route_color_get, [ :elm_map_route_p, :int_p, :int_p, :int_p, :int_p ], :void ],
        # EAPI double elm_map_route_distance_get(const Elm_Map_Route *route);
        [ :elm_map_route_distance_get, [ :elm_map_route_p ], :double ],
        # EAPI const char *elm_map_route_node_get(const Elm_Map_Route *route);
        [ :elm_map_route_node_get, [ :elm_map_route_p ], :string ],
        # EAPI const char *elm_map_route_waypoint_get(const Elm_Map_Route *route);
        [ :elm_map_route_waypoint_get, [ :elm_map_route_p ], :string ],
        # EAPI const char *elm_map_name_address_get(const Elm_Map_Name *name);
        [ :elm_map_name_address_get, [ :elm_map_name_p ], :string ],
        # EAPI void elm_map_name_region_get(const Elm_Map_Name *name, double *lon, double *lat);
        [ :elm_map_name_region_get, [ :elm_map_name_p, :double_p, :double_p ], :void ],
        # EAPI void elm_map_name_remove(Elm_Map_Name *name);
        [ :elm_map_name_remove, [ :elm_map_name_p ], :void ],
        # EAPI void elm_map_rotate_set(Evas_Object *obj, double degree, Evas_Coord cx, Evas_Coord cy);
        [ :elm_map_rotate_set, [ :evas_object_p, :double, :int, :int ], :void ],
        # EAPI void elm_map_rotate_get(const Evas_Object *obj, double *degree, Evas_Coord *cx, Evas_Coord *cy);
        [ :elm_map_rotate_get, [ :evas_object_p, :double_p, :int_p, :int_p ], :void ],
        # EAPI void elm_map_wheel_disabled_set(Evas_Object *obj, Eina_Bool disabled);
        [ :elm_map_wheel_disabled_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_map_wheel_disabled_get(const Evas_Object *obj);
        [ :elm_map_wheel_disabled_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_map_track_add(Evas_Object *obj, EMap_Route *emap);
        [ :elm_map_track_add, [ :evas_object_p, :emap_route_p ], :evas_object_p ],
        # EAPI void elm_map_track_remove(Evas_Object *obj, Evas_Object *route);
        [ :elm_map_track_remove, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_route_add(Evas_Object *parent);
        [ :elm_route_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_route_emap_set(Evas_Object *obj, EMap_Route *emap);
        [ :elm_route_emap_set, [ :evas_object_p, :emap_route_p ], :void ],
        # EAPI double elm_route_lon_min_get(Evas_Object *obj);
        [ :elm_route_lon_min_get, [ :evas_object_p ], :double ],
        # EAPI double elm_route_lat_min_get(Evas_Object *obj);
        [ :elm_route_lat_min_get, [ :evas_object_p ], :double ],
        # EAPI double elm_route_lon_max_get(Evas_Object *obj);
        [ :elm_route_lon_max_get, [ :evas_object_p ], :double ],
        # EAPI double elm_route_lat_max_get(Evas_Object *obj);
        [ :elm_route_lat_max_get, [ :evas_object_p ], :double ],
        # EAPI Evas_Object *elm_panel_add(Evas_Object *parent);
        [ :elm_panel_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_panel_orient_set(Evas_Object *obj, Elm_Panel_Orient orient);
        [ :elm_panel_orient_set, [ :evas_object_p, :elm_panel_orient ], :void ],
        # EAPI Elm_Panel_Orient elm_panel_orient_get(const Evas_Object *obj);
        [ :elm_panel_orient_get, [ :evas_object_p ], :elm_panel_orient ],
        # EAPI void elm_panel_hidden_set(Evas_Object *obj, Eina_Bool hidden);
        [ :elm_panel_hidden_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_panel_hidden_get(const Evas_Object *obj);
        [ :elm_panel_hidden_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_panel_toggle(Evas_Object *obj);
        [ :elm_panel_toggle, [ :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_panes_add(Evas_Object *parent);
        [ :elm_panes_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI double elm_panes_content_left_size_get(const Evas_Object *obj);
        [ :elm_panes_content_left_size_get, [ :evas_object_p ], :double ],
        # EAPI void elm_panes_content_left_size_set(Evas_Object *obj, double size);
        [ :elm_panes_content_left_size_set, [ :evas_object_p, :double ], :void ],
        # EAPI void elm_panes_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_panes_horizontal_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_panes_horizontal_get(const Evas_Object *obj);
        [ :elm_panes_horizontal_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_panes_fixed_set(Evas_Object *obj, Eina_Bool fixed);
        [ :elm_panes_fixed_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_panes_fixed_get(const Evas_Object *obj);
        [ :elm_panes_fixed_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_flip_add(Evas_Object *parent);
        [ :elm_flip_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_flip_content_front_set(Evas_Object *obj, Evas_Object *content);
        [ :elm_flip_content_front_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI void elm_flip_content_back_set(Evas_Object *obj, Evas_Object *content);
        [ :elm_flip_content_back_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_flip_content_front_get(const Evas_Object *obj);
        [ :elm_flip_content_front_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_flip_content_back_get(const Evas_Object *obj);
        [ :elm_flip_content_back_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_flip_content_front_unset(Evas_Object *obj);
        [ :elm_flip_content_front_unset, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_flip_content_back_unset(Evas_Object *obj);
        [ :elm_flip_content_back_unset, [ :evas_object_p ], :evas_object_p ],
        # EAPI Eina_Bool elm_flip_front_get(const Evas_Object *obj);
        [ :elm_flip_front_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_flip_perspective_set(Evas_Object *obj, Evas_Coord foc, Evas_Coord x, Evas_Coord y);
        [ :elm_flip_perspective_set, [ :evas_object_p, :int, :int, :int ], :void ],
        # EAPI void elm_flip_go(Evas_Object *obj, Elm_Flip_Mode mode);
        [ :elm_flip_go, [ :evas_object_p, :elm_flip_mode ], :void ],
        # EAPI void elm_flip_interaction_set(Evas_Object *obj, Elm_Flip_Interaction mode);
        [ :elm_flip_interaction_set, [ :evas_object_p, :elm_flip_interaction ], :void ],
        # EAPI Elm_Flip_Interaction elm_flip_interaction_get(const Evas_Object *obj);
        [ :elm_flip_interaction_get, [ :evas_object_p ], :elm_flip_interaction ],
        # EAPI void elm_flip_interacton_direction_enabled_set(Evas_Object *obj, Elm_Flip_Direction dir, Eina_Bool enabled);
        [ :elm_flip_interacton_direction_enabled_set, [ :evas_object_p, :elm_flip_direction, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_flip_interacton_direction_enabled_get(Evas_Object *obj, Elm_Flip_Direction dir);
        [ :elm_flip_interacton_direction_enabled_get, [ :evas_object_p, :elm_flip_direction ], :eina_bool ],
        # EAPI void elm_flip_interacton_direction_hitsize_set(Evas_Object *obj, Elm_Flip_Direction dir, double hitsize);
        [ :elm_flip_interacton_direction_hitsize_set, [ :evas_object_p, :elm_flip_direction, :double ], :void ],
        # EAPI double elm_flip_interacton_direction_hitsize_get(Evas_Object *obj, Elm_Flip_Direction dir);
        [ :elm_flip_interacton_direction_hitsize_get, [ :evas_object_p, :elm_flip_direction ], :double ],
        # EAPI Evas_Object *elm_conformant_add(Evas_Object *parent);
        [ :elm_conformant_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_conformant_content_area_get(const Evas_Object *obj);
        [ :elm_conformant_content_area_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_mapbuf_add(Evas_Object *parent);
        [ :elm_mapbuf_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_mapbuf_enabled_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_mapbuf_enabled_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_mapbuf_enabled_get(const Evas_Object *obj);
        [ :elm_mapbuf_enabled_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_mapbuf_smooth_set(Evas_Object *obj, Eina_Bool smooth);
        [ :elm_mapbuf_smooth_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_mapbuf_smooth_get(const Evas_Object *obj);
        [ :elm_mapbuf_smooth_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_mapbuf_alpha_set(Evas_Object *obj, Eina_Bool alpha);
        [ :elm_mapbuf_alpha_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_mapbuf_alpha_get(const Evas_Object *obj);
        [ :elm_mapbuf_alpha_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_flipselector_add(Evas_Object *parent);
        [ :elm_flipselector_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_flipselector_flip_next(Evas_Object *obj);
        [ :elm_flipselector_flip_next, [ :evas_object_p ], :void ],
        # EAPI void elm_flipselector_flip_prev(Evas_Object *obj);
        [ :elm_flipselector_flip_prev, [ :evas_object_p ], :void ],
        # EAPI Elm_Object_Item *elm_flipselector_item_append(Evas_Object *obj, const char *label, Evas_Smart_Cb func, void *data);
        [ :elm_flipselector_item_append, [ :evas_object_p, :string, :evas_smart_cb, :void_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_flipselector_item_prepend(Evas_Object *obj, const char *label, Evas_Smart_Cb func, void *data);
        [ :elm_flipselector_item_prepend, [ :evas_object_p, :string, :evas_smart_cb, :void_p ], :elm_object_item_p ],
        # EAPI const Eina_List *elm_flipselector_items_get(const Evas_Object *obj);
        [ :elm_flipselector_items_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI Elm_Object_Item *elm_flipselector_first_item_get(const Evas_Object *obj);
        [ :elm_flipselector_first_item_get, [ :evas_object_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_flipselector_last_item_get(const Evas_Object *obj);
        [ :elm_flipselector_last_item_get, [ :evas_object_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_flipselector_selected_item_get(const Evas_Object *obj);
        [ :elm_flipselector_selected_item_get, [ :evas_object_p ], :elm_object_item_p ],
        # EAPI void elm_flipselector_item_selected_set(Elm_Object_Item *it, Eina_Bool selected);
        [ :elm_flipselector_item_selected_set, [ :elm_object_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_flipselector_item_selected_get(const Elm_Object_Item *it);
        [ :elm_flipselector_item_selected_get, [ :elm_object_item_p ], :eina_bool ],
        # EAPI void elm_flipselector_item_del(Elm_Object_Item *it);
        [ :elm_flipselector_item_del, [ :elm_object_item_p ], :void ],
        # EAPI Elm_Object_Item *elm_flipselector_item_prev_get(Elm_Object_Item *it);
        [ :elm_flipselector_item_prev_get, [ :elm_object_item_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_flipselector_item_next_get(Elm_Object_Item *it);
        [ :elm_flipselector_item_next_get, [ :elm_object_item_p ], :elm_object_item_p ],
        # EAPI void elm_flipselector_interval_set(Evas_Object *obj, double interval);
        [ :elm_flipselector_interval_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_flipselector_interval_get(const Evas_Object *obj);
        [ :elm_flipselector_interval_get, [ :evas_object_p ], :double ],
        # EAPI Evas_Object *elm_calendar_add(Evas_Object *parent);
        [ :elm_calendar_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI const char **elm_calendar_weekdays_names_get(const Evas_Object *obj);
        [ :elm_calendar_weekdays_names_get, [ :evas_object_p ], :string_array ],
        # EAPI void elm_calendar_weekdays_names_set(Evas_Object *obj, const char *weekdays[]);
        # FIXME
        # EAPI void elm_calendar_min_max_year_set(Evas_Object *obj, int min, int max);
        [ :elm_calendar_min_max_year_set, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_calendar_min_max_year_get(const Evas_Object *obj, int *min, int *max);
        [ :elm_calendar_min_max_year_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_calendar_day_selection_enabled_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_calendar_day_selection_enabled_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_calendar_day_selection_enabled_get(const Evas_Object *obj);
        [ :elm_calendar_day_selection_enabled_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_calendar_selected_time_set(Evas_Object *obj, struct tm *selected_time);
        [ :elm_calendar_selected_time_set, [ :evas_object_p, :pointer ], :void ],
        # EAPI Eina_Bool elm_calendar_selected_time_get(const Evas_Object *obj, struct tm *selected_time);
        [ :elm_calendar_selected_time_get, [ :evas_object_p, :pointer ], :eina_bool ],
        # EAPI void elm_calendar_format_function_set(Evas_Object *obj, char * (*format_function) (struct tm *stime));
        # FIXME
        # EAPI Elm_Calendar_Mark *elm_calendar_mark_add(Evas_Object *obj, const char *mark_type, struct tm *mark_time, Elm_Calendar_Mark_Repeat repeat);
        [ :elm_calendar_mark_add, [ :evas_object_p, :string, :pointer, :elm_calendar_mark_repeat ], :elm_calendar_mark_p ],
        # EAPI void elm_calendar_mark_del(Elm_Calendar_Mark *mark);
        [ :elm_calendar_mark_del, [ :elm_calendar_mark_p ], :void ],
        # EAPI void elm_calendar_marks_clear(Evas_Object *obj);
        [ :elm_calendar_marks_clear, [ :evas_object_p ], :void ],
        # EAPI const Eina_List *elm_calendar_marks_get(const Evas_Object *obj);
        [ :elm_calendar_marks_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI void elm_calendar_marks_draw(Evas_Object *obj);
        [ :elm_calendar_marks_draw, [ :evas_object_p ], :void ],
        # EAPI void elm_calendar_interval_set(Evas_Object *obj, double interval);
        [ :elm_calendar_interval_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_calendar_interval_get(const Evas_Object *obj);
        [ :elm_calendar_interval_get, [ :evas_object_p ], :double ],
        # EAPI Evas_Object *elm_diskselector_add(Evas_Object *parent);
        [ :elm_diskselector_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_diskselector_round_set(Evas_Object *obj, Eina_Bool round);
        [ :elm_diskselector_round_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_diskselector_round_get(const Evas_Object *obj);
        [ :elm_diskselector_round_get, [ :evas_object_p ], :eina_bool ],
        # EAPI int elm_diskselector_side_label_length_get(const Evas_Object *obj);
        [ :elm_diskselector_side_label_length_get, [ :evas_object_p ], :int ],
        # EAPI void elm_diskselector_side_label_length_set(Evas_Object *obj, int len);
        [ :elm_diskselector_side_label_length_set, [ :evas_object_p, :int ], :void ],
        # EAPI void elm_diskselector_display_item_num_set(Evas_Object *obj, int num);
        [ :elm_diskselector_display_item_num_set, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_diskselector_display_item_num_get(const Evas_Object *obj);
        [ :elm_diskselector_display_item_num_get, [ :evas_object_p ], :int ],
        # EAPI void elm_diskselector_bounce_set(Evas_Object *obj, Eina_Bool h_bounce, Eina_Bool v_bounce);
        [ :elm_diskselector_bounce_set, [ :evas_object_p, :eina_bool, :eina_bool ], :void ],
        # EAPI void elm_diskselector_bounce_get(const Evas_Object *obj, Eina_Bool *h_bounce, Eina_Bool *v_bounce);
        [ :elm_diskselector_bounce_get, [ :evas_object_p, :eina_bool_p, :eina_bool_p ], :void ],
        # EAPI void elm_diskselector_scroller_policy_get(const Evas_Object *obj, Elm_Scroller_Policy *policy_h, Elm_Scroller_Policy *policy_v);
        [ :elm_diskselector_scroller_policy_get, [ :evas_object_p, :elm_scroller_policy_p, :elm_scroller_policy_p ], :void ],
        # EAPI void elm_diskselector_scroller_policy_set(Evas_Object *obj, Elm_Scroller_Policy policy_h, Elm_Scroller_Policy policy_v);
        [ :elm_diskselector_scroller_policy_set, [ :evas_object_p, :elm_scroller_policy, :elm_scroller_policy ], :void ],
        # EAPI void elm_diskselector_clear(Evas_Object *obj);
        [ :elm_diskselector_clear, [ :evas_object_p ], :void ],
        # EAPI const Eina_List *elm_diskselector_items_get(const Evas_Object *obj);
        [ :elm_diskselector_items_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI Elm_Diskselector_Item *elm_diskselector_item_append(Evas_Object *obj, const char *label, Evas_Object *icon, Evas_Smart_Cb func, const void *data);
        [ :elm_diskselector_item_append, [ :evas_object_p, :string, :evas_object_p, :evas_smart_cb, :void_p ], :elm_diskselector_item_p ],
        # EAPI void elm_diskselector_item_del(Elm_Diskselector_Item *item);
        [ :elm_diskselector_item_del, [ :elm_diskselector_item_p ], :void ],
        # EAPI void elm_diskselector_item_del_cb_set(Elm_Diskselector_Item *item, Evas_Smart_Cb func);
        [ :elm_diskselector_item_del_cb_set, [ :elm_diskselector_item_p, :evas_smart_cb ], :void ],
        # EAPI void *elm_diskselector_item_data_get(const Elm_Diskselector_Item *item);
        [ :elm_diskselector_item_data_get, [ :elm_diskselector_item_p ], :void_p ],
        # EAPI void elm_diskselector_item_icon_set(Elm_Diskselector_Item *item, Evas_Object *icon);
        [ :elm_diskselector_item_icon_set, [ :elm_diskselector_item_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_diskselector_item_icon_get(const Elm_Diskselector_Item *item);
        [ :elm_diskselector_item_icon_get, [ :elm_diskselector_item_p ], :evas_object_p ],
        # EAPI void elm_diskselector_item_label_set(Elm_Diskselector_Item *item, const char *label);
        [ :elm_diskselector_item_label_set, [ :elm_diskselector_item_p, :string ], :void ],
        # EAPI const char *elm_diskselector_item_label_get(const Elm_Diskselector_Item *item);
        [ :elm_diskselector_item_label_get, [ :elm_diskselector_item_p ], :string ],
        # EAPI Elm_Diskselector_Item *elm_diskselector_selected_item_get(const Evas_Object *obj);
        [ :elm_diskselector_selected_item_get, [ :evas_object_p ], :elm_diskselector_item_p ],
        # EAPI void elm_diskselector_item_selected_set(Elm_Diskselector_Item *item, Eina_Bool selected);
        [ :elm_diskselector_item_selected_set, [ :elm_diskselector_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_diskselector_item_selected_get(const Elm_Diskselector_Item *item);
        [ :elm_diskselector_item_selected_get, [ :elm_diskselector_item_p ], :eina_bool ],
        # EAPI Elm_Diskselector_Item *elm_diskselector_first_item_get(const Evas_Object *obj);
        [ :elm_diskselector_first_item_get, [ :evas_object_p ], :elm_diskselector_item_p ],
        # EAPI Elm_Diskselector_Item *elm_diskselector_last_item_get(const Evas_Object *obj);
        [ :elm_diskselector_last_item_get, [ :evas_object_p ], :elm_diskselector_item_p ],
        # EAPI Elm_Diskselector_Item *elm_diskselector_item_prev_get(const Elm_Diskselector_Item *item);
        [ :elm_diskselector_item_prev_get, [ :elm_diskselector_item_p ], :elm_diskselector_item_p ],
        # EAPI Elm_Diskselector_Item *elm_diskselector_item_next_get(const Elm_Diskselector_Item *item);
        [ :elm_diskselector_item_next_get, [ :elm_diskselector_item_p ], :elm_diskselector_item_p ],
        # EAPI void elm_diskselector_item_tooltip_text_set(Elm_Diskselector_Item *item, const char *text);
        [ :elm_diskselector_item_tooltip_text_set, [ :elm_diskselector_item_p, :string ], :void ],
        # EAPI void elm_diskselector_item_tooltip_content_cb_set(Elm_Diskselector_Item *item, Elm_Tooltip_Item_Content_Cb func, const void *data, Evas_Smart_Cb del_cb);
        [ :elm_diskselector_item_tooltip_content_cb_set, [ :elm_diskselector_item_p, :elm_tooltip_item_content_cb, :void_p, :evas_smart_cb ], :void ],
        # EAPI void elm_diskselector_item_tooltip_unset(Elm_Diskselector_Item *item);
        [ :elm_diskselector_item_tooltip_unset, [ :elm_diskselector_item_p ], :void ],
        # EAPI void elm_diskselector_item_tooltip_style_set(Elm_Diskselector_Item *item, const char *style);
        [ :elm_diskselector_item_tooltip_style_set, [ :elm_diskselector_item_p, :string ], :void ],
        # EAPI const char *elm_diskselector_item_tooltip_style_get(const Elm_Diskselector_Item *item);
        [ :elm_diskselector_item_tooltip_style_get, [ :elm_diskselector_item_p ], :string ],
        # EAPI void elm_diskselector_item_cursor_set(Elm_Diskselector_Item *item, const char *cursor);
        [ :elm_diskselector_item_cursor_set, [ :elm_diskselector_item_p, :string ], :void ],
        # EAPI const char *elm_diskselector_item_cursor_get(const Elm_Diskselector_Item *item);
        [ :elm_diskselector_item_cursor_get, [ :elm_diskselector_item_p ], :string ],
        # EAPI void elm_diskselector_item_cursor_unset(Elm_Diskselector_Item *item);
        [ :elm_diskselector_item_cursor_unset, [ :elm_diskselector_item_p ], :void ],
        # EAPI void elm_diskselector_item_cursor_style_set(Elm_Diskselector_Item *item, const char *style);
        [ :elm_diskselector_item_cursor_style_set, [ :elm_diskselector_item_p, :string ], :void ],
        # EAPI const char *elm_diskselector_item_cursor_style_get(const Elm_Diskselector_Item *item);
        [ :elm_diskselector_item_cursor_style_get, [ :elm_diskselector_item_p ], :string ],
        # EAPI void elm_diskselector_item_cursor_engine_only_set(Elm_Diskselector_Item *item, Eina_Bool engine_only);
        [ :elm_diskselector_item_cursor_engine_only_set, [ :elm_diskselector_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_diskselector_item_cursor_engine_only_get(const Elm_Diskselector_Item *item);
        [ :elm_diskselector_item_cursor_engine_only_get, [ :elm_diskselector_item_p ], :eina_bool ],
        # EAPI Evas_Object *elm_colorselector_add(Evas_Object *parent);
        [ :elm_colorselector_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_colorselector_color_set(Evas_Object *obj, int r, int g , int b, int a);
        [ :elm_colorselector_color_set, [ :evas_object_p, :int, :int, :int, :int ], :void ],
        # EAPI void elm_colorselector_color_get(const Evas_Object *obj, int *r, int *g , int *b, int *a);
        [ :elm_colorselector_color_get, [ :evas_object_p, :int_p, :int_p, :int_p, :int_p ], :void ],
        # EAPI Evas_Object *elm_ctxpopup_add(Evas_Object *parent);
        [ :elm_ctxpopup_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_ctxpopup_hover_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_ctxpopup_hover_parent_set, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_ctxpopup_hover_parent_get(const Evas_Object *obj);
        [ :elm_ctxpopup_hover_parent_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_ctxpopup_clear(Evas_Object *obj);
        [ :elm_ctxpopup_clear, [ :evas_object_p ], :void ],
        # EAPI void elm_ctxpopup_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_ctxpopup_horizontal_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_ctxpopup_horizontal_get(const Evas_Object *obj);
        [ :elm_ctxpopup_horizontal_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_ctxpopup_item_del(Elm_Object_Item *it);
        [ :elm_ctxpopup_item_del, [ :elm_object_item_p ], :void ],
        # EAPI Eina_Bool elm_ctxpopup_item_disabled_get(const Elm_Object_Item *it);
        [ :elm_ctxpopup_item_disabled_get, [ :elm_object_item_p ], :eina_bool ],
        # EAPI void elm_ctxpopup_direction_priority_set(Evas_Object *obj, Elm_Ctxpopup_Direction first, Elm_Ctxpopup_Direction second, Elm_Ctxpopup_Direction third, Elm_Ctxpopup_Direction fourth);
        [ :elm_ctxpopup_direction_priority_set, [ :evas_object_p, :elm_ctxpopup_direction, :elm_ctxpopup_direction, :elm_ctxpopup_direction, :elm_ctxpopup_direction ],
            :void ],
        # EAPI void elm_ctxpopup_direction_priority_get(Evas_Object *obj, Elm_Ctxpopup_Direction *first, Elm_Ctxpopup_Direction *second, Elm_Ctxpopup_Direction *third, Elm_Ctxpopup_Direction *fourth);
        [ :elm_ctxpopup_direction_priority_get, [ :evas_object_p, :elm_ctxpopup_direction_p, :elm_ctxpopup_direction_p, :elm_ctxpopup_direction_p,
            :elm_ctxpopup_direction_p ], :void ],
        # EAPI Elm_Ctxpopup_Direction elm_ctxpopup_direction_get(const Evas_Object *obj);
        [ :elm_ctxpopup_direction_get, [ :evas_object_p ], :elm_ctxpopup_direction ],
        # EAPI Elm_Transit *elm_transit_add(void);
        [ :elm_transit_add, [  ], :elm_transit_p ],
        # EAPI void elm_transit_del(Elm_Transit *transit);
        [ :elm_transit_del, [ :elm_transit_p ], :void ],
        # EAPI void elm_transit_effect_add(Elm_Transit *transit, Elm_Transit_Effect_Transition_Cb transition_cb, Elm_Transit_Effect *effect, Elm_Transit_Effect_End_Cb end_cb);
        [ :elm_transit_effect_add, [ :elm_transit_p, :elm_transit_effect_transition_cb, :void_p, :elm_transit_effect_end_cb ], :void ],
        # EAPI void elm_transit_effect_del(Elm_Transit *transit, Elm_Transit_Effect_Transition_Cb transition_cb, Elm_Transit_Effect *effect);
        [ :elm_transit_effect_del, [ :elm_transit_p, :elm_transit_effect_transition_cb, :void_p ], :void ],
        # EAPI void elm_transit_object_add(Elm_Transit *transit, Evas_Object *obj);
        [ :elm_transit_object_add, [ :elm_transit_p, :evas_object_p ], :void ],
        # EAPI void elm_transit_object_remove(Elm_Transit *transit, Evas_Object *obj);
        [ :elm_transit_object_remove, [ :elm_transit_p, :evas_object_p ], :void ],
        # EAPI const Eina_List *elm_transit_objects_get(const Elm_Transit *transit);
        [ :elm_transit_objects_get, [ :elm_transit_p ], :eina_list_p ],
        # EAPI void elm_transit_objects_final_state_keep_set(Elm_Transit *transit, Eina_Bool state_keep);
        [ :elm_transit_objects_final_state_keep_set, [ :elm_transit_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_transit_objects_final_state_keep_get(const Elm_Transit *transit);
        [ :elm_transit_objects_final_state_keep_get, [ :elm_transit_p ], :eina_bool ],
        # EAPI void elm_transit_event_enabled_set(Elm_Transit *transit, Eina_Bool enabled);
        [ :elm_transit_event_enabled_set, [ :elm_transit_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_transit_event_enabled_get(const Elm_Transit *transit);
        [ :elm_transit_event_enabled_get, [ :elm_transit_p ], :eina_bool ],
        # EAPI void elm_transit_del_cb_set(Elm_Transit *transit, Elm_Transit_Del_Cb cb, void *data);
        [ :elm_transit_del_cb_set, [ :elm_transit_p, :elm_transit_del_cb, :void_p ], :void ],
        # EAPI void elm_transit_auto_reverse_set(Elm_Transit *transit, Eina_Bool reverse);
        [ :elm_transit_auto_reverse_set, [ :elm_transit_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_transit_auto_reverse_get(const Elm_Transit *transit);
        [ :elm_transit_auto_reverse_get, [ :elm_transit_p ], :eina_bool ],
        # EAPI void elm_transit_repeat_times_set(Elm_Transit *transit, int repeat);
        [ :elm_transit_repeat_times_set, [ :elm_transit_p, :int ], :void ],
        # EAPI int elm_transit_repeat_times_get(const Elm_Transit *transit);
        [ :elm_transit_repeat_times_get, [ :elm_transit_p ], :int ],
        # EAPI void elm_transit_tween_mode_set(Elm_Transit *transit, Elm_Transit_Tween_Mode tween_mode);
        [ :elm_transit_tween_mode_set, [ :elm_transit_p, :elm_transit_tween_mode ], :void ],
        # EAPI Elm_Transit_Tween_Mode elm_transit_tween_mode_get(const Elm_Transit *transit);
        [ :elm_transit_tween_mode_get, [ :elm_transit_p ], :elm_transit_tween_mode ],
        # EAPI void elm_transit_duration_set(Elm_Transit *transit, double duration);
        [ :elm_transit_duration_set, [ :elm_transit_p, :double ], :void ],
        # EAPI double elm_transit_duration_get(const Elm_Transit *transit);
        [ :elm_transit_duration_get, [ :elm_transit_p ], :double ],
        # EAPI void elm_transit_go(Elm_Transit *transit);
        [ :elm_transit_go, [ :elm_transit_p ], :void ],
        # EAPI void elm_transit_paused_set(Elm_Transit *transit, Eina_Bool paused);
        [ :elm_transit_paused_set, [ :elm_transit_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_transit_paused_get(const Elm_Transit *transit);
        [ :elm_transit_paused_get, [ :elm_transit_p ], :eina_bool ],
        # EAPI double elm_transit_progress_value_get(const Elm_Transit *transit);
        [ :elm_transit_progress_value_get, [ :elm_transit_p ], :double ],
        # EAPI void elm_transit_chain_transit_add(Elm_Transit *transit, Elm_Transit *chain_transit);
        [ :elm_transit_chain_transit_add, [ :elm_transit_p, :elm_transit_p ], :void ],
        # EAPI void elm_transit_chain_transit_del(Elm_Transit *transit, Elm_Transit *chain_transit);
        [ :elm_transit_chain_transit_del, [ :elm_transit_p, :elm_transit_p ], :void ],
        # EAPI Eina_List *elm_transit_chain_transits_get(const Elm_Transit *transit);
        [ :elm_transit_chain_transits_get, [ :elm_transit_p ], :eina_list_p ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_resizing_add(Elm_Transit* transit, Evas_Coord from_w, Evas_Coord from_h, Evas_Coord to_w, Evas_Coord to_h);
        [ :elm_transit_effect_resizing_add, [ :elm_transit_p, :int, :int, :int, :int ], :void_p ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_translation_add(Elm_Transit* transit, Evas_Coord from_dx, Evas_Coord from_dy, Evas_Coord to_dx, Evas_Coord to_dy);
        [ :elm_transit_effect_translation_add, [ :elm_transit_p, :int, :int, :int, :int ], :void_p ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_zoom_add(Elm_Transit *transit, float from_rate, float to_rate);
        [ :elm_transit_effect_zoom_add, [ :elm_transit_p, :float, :float ], :void_p ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_flip_add(Elm_Transit *transit, Elm_Transit_Effect_Flip_Axis axis, Eina_Bool cw);
        [ :elm_transit_effect_flip_add, [ :elm_transit_p, :elm_transit_effect_flip_axis, :eina_bool ], :void_p ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_resizable_flip_add(Elm_Transit *transit, Elm_Transit_Effect_Flip_Axis axis, Eina_Bool cw);
        [ :elm_transit_effect_resizable_flip_add, [ :elm_transit_p, :elm_transit_effect_flip_axis, :eina_bool ], :void_p ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_wipe_add(Elm_Transit *transit, Elm_Transit_Effect_Wipe_Type type, Elm_Transit_Effect_Wipe_Dir dir);
        [ :elm_transit_effect_wipe_add, [ :elm_transit_p, :elm_transit_effect_wipe_type, :elm_transit_effect_wipe_dir ], :void_p ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_color_add(Elm_Transit *transit, unsigned int from_r, unsigned int from_g, unsigned int from_b, unsigned int from_a, unsigned int to_r, unsigned int to_g, unsigned int to_b, unsigned int to_a);
        [ :elm_transit_effect_color_add, [ :elm_transit_p, :uint, :uint, :uint, :uint, :uint, :uint, :uint, :uint ], :void_p ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_fade_add(Elm_Transit *transit);
        [ :elm_transit_effect_fade_add, [ :elm_transit_p ], :void_p ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_blend_add(Elm_Transit *transit);
        [ :elm_transit_effect_blend_add, [ :elm_transit_p ], :void_p ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_rotation_add(Elm_Transit *transit, float from_degree, float to_degree);
        [ :elm_transit_effect_rotation_add, [ :elm_transit_p, :float, :float ], :void_p ],
        # EAPI Elm_Transit_Effect *elm_transit_effect_image_animation_add(Elm_Transit *transit, Eina_List *images);
        [ :elm_transit_effect_image_animation_add, [ :elm_transit_p, :eina_list_p ], :void_p ],
        # EAPI void elm_store_free(Elm_Store *st);
        [ :elm_store_free, [ :elm_store_p ], :void ],
        # EAPI Elm_Store *elm_store_filesystem_new(void);
        [ :elm_store_filesystem_new, [  ], :elm_store_p ],
        # EAPI void elm_store_filesystem_directory_set(Elm_Store *st, const char *dir);
        [ :elm_store_filesystem_directory_set, [ :elm_store_p, :string ], :void ],
        # EAPI const char *elm_store_filesystem_directory_get(const Elm_Store *st);
        [ :elm_store_filesystem_directory_get, [ :elm_store_p ], :string ],
        # EAPI const char *elm_store_item_filesystem_path_get(const Elm_Store_Item *sti);
        [ :elm_store_item_filesystem_path_get, [ :elm_store_item_p ], :string ],
        # EAPI void elm_store_target_genlist_set(Elm_Store *st, Evas_Object *obj);
        [ :elm_store_target_genlist_set, [ :elm_store_p, :evas_object_p ], :void ],
        # EAPI void elm_store_cache_set(Elm_Store *st, int max);
        [ :elm_store_cache_set, [ :elm_store_p, :int ], :void ],
        # EAPI int elm_store_cache_get(const Elm_Store *st);
        [ :elm_store_cache_get, [ :elm_store_p ], :int ],
        # EAPI void elm_store_list_func_set(Elm_Store *st, Elm_Store_Item_List_Cb func, const void *data);
        [ :elm_store_list_func_set, [ :elm_store_p, :elm_store_item_list_cb, :void_p ], :void ],
        # EAPI void elm_store_fetch_func_set(Elm_Store *st, Elm_Store_Item_Fetch_Cb func, const void *data);
        [ :elm_store_fetch_func_set, [ :elm_store_p, :elm_store_item_fetch_cb, :void_p ], :void ],
        # EAPI void elm_store_fetch_thread_set(Elm_Store *st, Eina_Bool use_thread);
        [ :elm_store_fetch_thread_set, [ :elm_store_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_store_fetch_thread_get(const Elm_Store *st);
        [ :elm_store_fetch_thread_get, [ :elm_store_p ], :eina_bool ],
        # EAPI void elm_store_unfetch_func_set(Elm_Store *st, Elm_Store_Item_Unfetch_Cb func, const void *data);
        [ :elm_store_unfetch_func_set, [ :elm_store_p, :elm_store_item_unfetch_cb, :void_p ], :void ],
        # EAPI void elm_store_sorted_set(Elm_Store *st, Eina_Bool sorted);
        [ :elm_store_sorted_set, [ :elm_store_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_store_sorted_get(const Elm_Store *st);
        [ :elm_store_sorted_get, [ :elm_store_p ], :eina_bool ],
        # EAPI void elm_store_item_data_set(Elm_Store_Item *sti, void *data);
        [ :elm_store_item_data_set, [ :elm_store_item_p, :void_p ], :void ],
        # EAPI void *elm_store_item_data_get(Elm_Store_Item *sti);
        [ :elm_store_item_data_get, [ :elm_store_item_p ], :void_p ],
        # EAPI const Elm_Store *elm_store_item_store_get(const Elm_Store_Item *sti);
        [ :elm_store_item_store_get, [ :elm_store_item_p ], :elm_store_p ],
        # EAPI const Elm_Genlist_Item *elm_store_item_genlist_item_get(const Elm_Store_Item *sti);
        [ :elm_store_item_genlist_item_get, [ :elm_store_item_p ], :elm_genlist_item_p ],
        # EAPI Evas_Object *elm_segment_control_add(Evas_Object *parent);
        [ :elm_segment_control_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI Elm_Segment_Item *elm_segment_control_item_add(Evas_Object *obj, Evas_Object *icon, const char *label);
        [ :elm_segment_control_item_add, [ :evas_object_p, :evas_object_p, :string ], :elm_segment_item_p ],
        # EAPI Elm_Segment_Item *elm_segment_control_item_insert_at(Evas_Object *obj, Evas_Object *icon, const char *label, int index);
        [ :elm_segment_control_item_insert_at, [ :evas_object_p, :evas_object_p, :string, :int ], :elm_segment_item_p ],
        # EAPI void elm_segment_control_item_del(Elm_Segment_Item *it);
        [ :elm_segment_control_item_del, [ :elm_segment_item_p ], :void ],
        # EAPI void elm_segment_control_item_del_at(Evas_Object *obj, int index);
        [ :elm_segment_control_item_del_at, [ :evas_object_p, :int ], :void ],
        # EAPI int elm_segment_control_item_count_get(const Evas_Object *obj);
        [ :elm_segment_control_item_count_get, [ :evas_object_p ], :int ],
        # EAPI Elm_Segment_Item *elm_segment_control_item_get(const Evas_Object *obj, int index);
        [ :elm_segment_control_item_get, [ :evas_object_p, :int ], :elm_segment_item_p ],
        # EAPI const char *elm_segment_control_item_label_get(const Evas_Object *obj, int index);
        [ :elm_segment_control_item_label_get, [ :evas_object_p, :int ], :string ],
        # EAPI void elm_segment_control_item_label_set(Elm_Segment_Item* it, const char* label);
        [ :elm_segment_control_item_label_set, [ :elm_segment_item_p, :string ], :void ],
        # EAPI Evas_Object *elm_segment_control_item_icon_get(const Evas_Object *obj, int index);
        [ :elm_segment_control_item_icon_get, [ :evas_object_p, :int ], :evas_object_p ],
        # EAPI void elm_segment_control_item_icon_set(Elm_Segment_Item *it, Evas_Object *icon);
        [ :elm_segment_control_item_icon_set, [ :elm_segment_item_p, :evas_object_p ], :void ],
        # EAPI int elm_segment_control_item_index_get(const Elm_Segment_Item *it);
        [ :elm_segment_control_item_index_get, [ :elm_segment_item_p ], :int ],
        # EAPI Evas_Object *elm_segment_control_item_object_get(const Elm_Segment_Item *it);
        [ :elm_segment_control_item_object_get, [ :elm_segment_item_p ], :evas_object_p ],
        # EAPI Elm_Segment_Item *elm_segment_control_item_selected_get(const Evas_Object *obj);
        [ :elm_segment_control_item_selected_get, [ :evas_object_p ], :elm_segment_item_p ],
        # EAPI void elm_segment_control_item_selected_set(Elm_Segment_Item *it, Eina_Bool select);
        [ :elm_segment_control_item_selected_set, [ :elm_segment_item_p, :eina_bool ], :void ],
        # EAPI Evas_Object *elm_grid_add(Evas_Object *parent);
        [ :elm_grid_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_grid_size_set(Evas_Object *obj, int w, int h);
        [ :elm_grid_size_set, [ :evas_object_p, :int, :int ], :void ],
        # EAPI void elm_grid_size_get(Evas_Object *obj, int *w, int *h);
        [ :elm_grid_size_get, [ :evas_object_p, :int_p, :int_p ], :void ],
        # EAPI void elm_grid_pack(Evas_Object *obj, Evas_Object *subobj, int x, int y, int w, int h);
        [ :elm_grid_pack, [ :evas_object_p, :evas_object_p, :int, :int, :int, :int ], :void ],
        # EAPI void elm_grid_unpack(Evas_Object *obj, Evas_Object *subobj);
        [ :elm_grid_unpack, [ :evas_object_p, :evas_object_p ], :void ],
        # EAPI void elm_grid_clear(Evas_Object *obj, Eina_Bool clear);
        [ :elm_grid_clear, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI void elm_grid_pack_set(Evas_Object *subobj, int x, int y, int w, int h);
        [ :elm_grid_pack_set, [ :evas_object_p, :int, :int, :int, :int ], :void ],
        # EAPI void elm_grid_pack_get(Evas_Object *subobj, int *x, int *y, int *w, int *h);
        [ :elm_grid_pack_get, [ :evas_object_p, :int_p, :int_p, :int_p, :int_p ], :void ],
        # EAPI Evas_Object *elm_factory_add(Evas_Object *parent);
        [ :elm_factory_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_factory_maxmin_mode_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_factory_maxmin_mode_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_factory_maxmin_mode_get(const Evas_Object *obj);
        [ :elm_factory_maxmin_mode_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_factory_maxmin_reset_set(Evas_Object *obj);
        [ :elm_factory_maxmin_reset_set, [ :evas_object_p ], :void ],
        # EAPI Evas_Object *elm_player_add(Evas_Object *parent);
        [ :elm_player_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI Evas_Object *elm_video_add(Evas_Object *parent);
        [ :elm_video_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_video_file_set(Evas_Object *video, const char *filename);
        [ :elm_video_file_set, [ :evas_object_p, :string ], :void ],
        # EAPI void elm_video_uri_set(Evas_Object *video, const char *uri);
        [ :elm_video_uri_set, [ :evas_object_p, :string ], :void ],
        # EAPI Evas_Object *elm_video_emotion_get(const Evas_Object *video);
        [ :elm_video_emotion_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_video_play(Evas_Object *video);
        [ :elm_video_play, [ :evas_object_p ], :void ],
        # EAPI void elm_video_pause(Evas_Object *video);
        [ :elm_video_pause, [ :evas_object_p ], :void ],
        # EAPI void elm_video_stop(Evas_Object *video);
        [ :elm_video_stop, [ :evas_object_p ], :void ],
        # EAPI Eina_Bool elm_video_is_playing(const Evas_Object *video);
        [ :elm_video_is_playing, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_video_is_seekable(const Evas_Object *video);
        [ :elm_video_is_seekable, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Bool elm_video_audio_mute_get(const Evas_Object *video);
        [ :elm_video_audio_mute_get, [ :evas_object_p ], :eina_bool ],
        # EAPI void elm_video_audio_mute_set(Evas_Object *video, Eina_Bool mute);
        [ :elm_video_audio_mute_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI double elm_video_audio_level_get(const Evas_Object *video);
        [ :elm_video_audio_level_get, [ :evas_object_p ], :double ],
        # EAPI void elm_video_audio_level_set(Evas_Object *video, double volume);
        [ :elm_video_audio_level_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_video_play_position_get(const Evas_Object *video);
        [ :elm_video_play_position_get, [ :evas_object_p ], :double ],
        # EAPI void elm_video_play_position_set(Evas_Object *video, double position);
        [ :elm_video_play_position_set, [ :evas_object_p, :double ], :void ],
        # EAPI double elm_video_play_length_get(const Evas_Object *video);
        [ :elm_video_play_length_get, [ :evas_object_p ], :double ],
        # EAPI void elm_video_remember_position_set(Evas_Object *video, Eina_Bool remember);
        [ :elm_video_remember_position_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_video_remember_position_get(const Evas_Object *video);
        [ :elm_video_remember_position_get, [ :evas_object_p ], :eina_bool ],
        # EAPI const char *elm_video_title_get(const Evas_Object *video);
        [ :elm_video_title_get, [ :evas_object_p ], :string ],
        # EAPI Evas_Object *elm_naviframe_add(Evas_Object *parent);
        [ :elm_naviframe_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI Elm_Object_Item *elm_naviframe_item_push(Evas_Object *obj, const char *title_label, Evas_Object *prev_btn, Evas_Object *next_btn, Evas_Object *content, const char *item_style);
        [ :elm_naviframe_item_push, [ :evas_object_p, :string, :evas_object_p, :evas_object_p, :evas_object_p, :string ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_naviframe_item_insert_before(Elm_Object_Item *before, const char *title_label, Evas_Object *prev_btn, Evas_Object *next_btn, Evas_Object *content, const char *item_style);
        [ :elm_naviframe_item_insert_before, [ :elm_object_item_p, :string, :evas_object_p, :evas_object_p, :evas_object_p, :string ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_naviframe_item_insert_after(Elm_Object_Item *after, const char *title_label, Evas_Object *prev_btn, Evas_Object *next_btn, Evas_Object *content, const char *item_style);
        [ :elm_naviframe_item_insert_after, [ :elm_object_item_p, :string, :evas_object_p, :evas_object_p, :evas_object_p, :string ], :elm_object_item_p ],
        # EAPI Evas_Object *elm_naviframe_item_pop(Evas_Object *obj);
        [ :elm_naviframe_item_pop, [ :evas_object_p ], :evas_object_p ],
        # EAPI void elm_naviframe_item_pop_to(Elm_Object_Item *it);
        [ :elm_naviframe_item_pop_to, [ :elm_object_item_p ], :void ],
        # EAPI void elm_naviframe_item_promote(Elm_Object_Item *it);
        [ :elm_naviframe_item_promote, [ :elm_object_item_p ], :void ],
        # EAPI void elm_naviframe_item_del(Elm_Object_Item *it);
        [ :elm_naviframe_item_del, [ :elm_object_item_p ], :void ],
        # EAPI void elm_naviframe_content_preserve_on_pop_set(Evas_Object *obj, Eina_Bool preserve);
        [ :elm_naviframe_content_preserve_on_pop_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_naviframe_content_preserve_on_pop_get(const Evas_Object *obj);
        [ :elm_naviframe_content_preserve_on_pop_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Elm_Object_Item *elm_naviframe_top_item_get(const Evas_Object *obj);
        [ :elm_naviframe_top_item_get, [ :evas_object_p ], :elm_object_item_p ],
        # EAPI Elm_Object_Item *elm_naviframe_bottom_item_get(const Evas_Object *obj);
        [ :elm_naviframe_bottom_item_get, [ :evas_object_p ], :elm_object_item_p ],
        # EAPI void elm_naviframe_item_style_set(Elm_Object_Item *it, const char *item_style);
        [ :elm_naviframe_item_style_set, [ :elm_object_item_p, :string ], :void ],
        # EAPI const char *elm_naviframe_item_style_get(const Elm_Object_Item *it);
        [ :elm_naviframe_item_style_get, [ :elm_object_item_p ], :string ],
        # EAPI void elm_naviframe_item_title_visible_set(Elm_Object_Item *it, Eina_Bool visible);
        [ :elm_naviframe_item_title_visible_set, [ :elm_object_item_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_naviframe_item_title_visible_get(const Elm_Object_Item *it);
        [ :elm_naviframe_item_title_visible_get, [ :elm_object_item_p ], :eina_bool ],
        # EAPI void elm_naviframe_prev_btn_auto_pushed_set(Evas_Object *obj, Eina_Bool auto_pushed);
        [ :elm_naviframe_prev_btn_auto_pushed_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_naviframe_prev_btn_auto_pushed_get(const Evas_Object *obj);
        [ :elm_naviframe_prev_btn_auto_pushed_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Eina_Inlist *elm_naviframe_items_get(const Evas_Object *obj);
        [ :elm_naviframe_items_get, [ :evas_object_p ], :pointer ],
        # EAPI void elm_naviframe_event_enabled_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_naviframe_event_enabled_set, [ :evas_object_p, :eina_bool ], :void ],
        # EAPI Eina_Bool elm_naviframe_event_enabled_get(const Evas_Object *obj);
        [ :elm_naviframe_event_enabled_get, [ :evas_object_p ], :eina_bool ],
        # EAPI Evas_Object *elm_multibuttonentry_add(Evas_Object *parent);
        [ :elm_multibuttonentry_add, [ :evas_object_p ], :evas_object_p ],
        # EAPI const char *elm_multibuttonentry_label_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_label_get, [ :evas_object_p ], :string ],
        # EAPI void elm_multibuttonentry_label_set(Evas_Object *obj, const char *label);
        [ :elm_multibuttonentry_label_set, [ :evas_object_p, :string ], :void ],
        # EAPI Evas_Object *elm_multibuttonentry_entry_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_entry_get, [ :evas_object_p ], :evas_object_p ],
        # EAPI const char * elm_multibuttonentry_guide_text_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_guide_text_get, [ :evas_object_p ], :string ],
        # EAPI void elm_multibuttonentry_guide_text_set(Evas_Object *obj, const char *guidetext);
        [ :elm_multibuttonentry_guide_text_set, [ :evas_object_p, :string ], :void ],
        # EAPI int elm_multibuttonentry_shrink_mode_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_shrink_mode_get, [ :evas_object_p ], :int ],
        # EAPI void elm_multibuttonentry_shrink_mode_set(Evas_Object *obj, int shrink);
        [ :elm_multibuttonentry_shrink_mode_set, [ :evas_object_p, :int ], :void ],
        # EAPI Elm_Multibuttonentry_Item *elm_multibuttonentry_item_prepend(Evas_Object *obj, const char *label, void *data);
        [ :elm_multibuttonentry_item_prepend, [ :evas_object_p, :string, :void_p ], :elm_multibuttonentry_item_p ],
        # EAPI Elm_Multibuttonentry_Item *elm_multibuttonentry_item_append(Evas_Object *obj, const char *label, void *data);
        [ :elm_multibuttonentry_item_append, [ :evas_object_p, :string, :void_p ], :elm_multibuttonentry_item_p ],
        # EAPI Elm_Multibuttonentry_Item *elm_multibuttonentry_item_insert_before(Evas_Object *obj, Elm_Multibuttonentry_Item *before, const char *label, void *data);
        [ :elm_multibuttonentry_item_insert_before, [ :evas_object_p, :elm_multibuttonentry_item_p, :string, :void_p ], :elm_multibuttonentry_item_p ],
        # EAPI Elm_Multibuttonentry_Item *elm_multibuttonentry_item_insert_after(Evas_Object *obj, Elm_Multibuttonentry_Item *after, const char *label, void *data);
        [ :elm_multibuttonentry_item_insert_after, [ :evas_object_p, :elm_multibuttonentry_item_p, :string, :void_p ], :elm_multibuttonentry_item_p ],
        # EAPI const Eina_List *elm_multibuttonentry_items_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_items_get, [ :evas_object_p ], :eina_list_p ],
        # EAPI Elm_Multibuttonentry_Item *elm_multibuttonentry_first_item_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_first_item_get, [ :evas_object_p ], :elm_multibuttonentry_item_p ],
        # EAPI Elm_Multibuttonentry_Item *elm_multibuttonentry_last_item_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_last_item_get, [ :evas_object_p ], :elm_multibuttonentry_item_p ],
        # EAPI Elm_Multibuttonentry_Item *elm_multibuttonentry_selected_item_get(const Evas_Object *obj);
        [ :elm_multibuttonentry_selected_item_get, [ :evas_object_p ], :elm_multibuttonentry_item_p ],
        # EAPI void elm_multibuttonentry_item_select(Elm_Multibuttonentry_Item *item, Eina_Bool selected);
        [ :elm_multibuttonentry_item_select, [ :elm_multibuttonentry_item_p, :eina_bool ], :void ],
        # EAPI void elm_multibuttonentry_item_unselect_all(Evas_Object *obj);
        [ :elm_multibuttonentry_item_unselect_all, [ :evas_object_p ], :void ],
        # EAPI void elm_multibuttonentry_item_del(Elm_Multibuttonentry_Item *item);
        [ :elm_multibuttonentry_item_del, [ :elm_multibuttonentry_item_p ], :void ],
        # EAPI void elm_multibuttonentry_clear(Evas_Object *obj);
        [ :elm_multibuttonentry_clear, [ :evas_object_p ], :void ],
        # EAPI const char *elm_multibuttonentry_item_label_get(const Elm_Multibuttonentry_Item *item);
        [ :elm_multibuttonentry_item_label_get, [ :elm_multibuttonentry_item_p ], :string ],
        # EAPI void elm_multibuttonentry_item_label_set(Elm_Multibuttonentry_Item *item, const char *str);
        [ :elm_multibuttonentry_item_label_set, [ :elm_multibuttonentry_item_p, :string ], :void ],
        # EAPI Elm_Multibuttonentry_Item *elm_multibuttonentry_item_prev_get(const Elm_Multibuttonentry_Item *item);
        [ :elm_multibuttonentry_item_prev_get, [ :elm_multibuttonentry_item_p ], :elm_multibuttonentry_item_p ],
        # EAPI Elm_Multibuttonentry_Item *elm_multibuttonentry_item_next_get(const Elm_Multibuttonentry_Item *item);
        [ :elm_multibuttonentry_item_next_get, [ :elm_multibuttonentry_item_p ], :elm_multibuttonentry_item_p ],
        # EAPI void elm_multibuttonentry_item_filter_append(Evas_Object *obj, Elm_Multibuttonentry_Item_Filter_callback func, void *data);
        [ :elm_multibuttonentry_item_filter_append, [ :evas_object_p, :elm_multibuttonentry_item_filter_callback, :void_p ], :void ],
        # EAPI void elm_multibuttonentry_item_filter_prepend(Evas_Object *obj, Elm_Multibuttonentry_Item_Filter_callback func, void *data);
        [ :elm_multibuttonentry_item_filter_prepend, [ :evas_object_p, :elm_multibuttonentry_item_filter_callback, :void_p ], :void ],
        # EAPI void elm_multibuttonentry_item_filter_remove(Evas_Object *obj, Elm_Multibuttonentry_Item_Filter_callback func, void *data);
        [ :elm_multibuttonentry_item_filter_remove, [ :evas_object_p, :elm_multibuttonentry_item_filter_callback, :void_p ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
