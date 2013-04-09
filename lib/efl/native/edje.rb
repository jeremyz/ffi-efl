#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/evas'
#
module Efl
    #
    module Edje
        #
        FCT_PREFIX = 'edje_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'edje.so.1'
        #
        # ENUMS
        # typedef enum _Edje_Message_Type {...} Edje_Message_Type;
        enum :edje_message_type, [ :edje_message_none, 0, :edje_message_signal, 1, :edje_message_string, 2, :edje_message_int, 3, :edje_message_float,
            4, :edje_message_string_set, 5, :edje_message_int_set, 6, :edje_message_float_set, 7, :edje_message_string_int, 8, :edje_message_string_float, 9,
            :edje_message_string_int_set, 10, :edje_message_string_float_set, 11 ]
        # typedef enum _Edje_Aspect_Control {...} Edje_Aspect_Control;
        enum :edje_aspect_control, [ :edje_aspect_control_none, 0, :edje_aspect_control_neither, 1, :edje_aspect_control_horizontal, 2,
            :edje_aspect_control_vertical, 3, :edje_aspect_control_both, 4 ]
        # typedef enum _Edje_Object_Table_Homogeneous_Mode {...} Edje_Object_Table_Homogeneous_Mode;
        enum :edje_object_table_homogeneous_mode, [ :edje_object_table_homogeneous_none, 0, :edje_object_table_homogeneous_table, 1,
            :edje_object_table_homogeneous_item, 2 ]
        # typedef enum _Edje_Part_Type {...} Edje_Part_Type;
        enum :edje_part_type, [ :edje_part_type_none, 0, :edje_part_type_rectangle, 1, :edje_part_type_text, 2, :edje_part_type_image, 3,
            :edje_part_type_swallow, 4, :edje_part_type_textblock, 5, :edje_part_type_gradient, 6, :edje_part_type_group, 7, :edje_part_type_box, 8,
            :edje_part_type_table, 9, :edje_part_type_external, 10, :edje_part_type_proxy, 11, :edje_part_type_spacer, 12, :edje_part_type_last, 13 ]
        # typedef enum _Edje_Text_Effect {...} Edje_Text_Effect;
        enum :edje_text_effect, [ :edje_text_effect_none, 0, :edje_text_effect_plain, 1, :edje_text_effect_outline, 2, :edje_text_effect_soft_outline,
            3, :edje_text_effect_shadow, 4, :edje_text_effect_soft_shadow, 5, :edje_text_effect_outline_shadow, 6, :edje_text_effect_outline_soft_shadow, 7,
            :edje_text_effect_far_shadow, 8, :edje_text_effect_far_soft_shadow, 9, :edje_text_effect_glow, 10, :edje_text_effect_last, 11,
            :edje_text_effect_shadow_direction_bottom_right, (0x0<<4), :edje_text_effect_shadow_direction_bottom, (0x1<<4),
            :edje_text_effect_shadow_direction_bottom_left, (0x2<<4), :edje_text_effect_shadow_direction_left, (0x3<<4),
            :edje_text_effect_shadow_direction_top_left, (0x4<<4), :edje_text_effect_shadow_direction_top, (0x5<<4), :edje_text_effect_shadow_direction_top_right,
            (0x6<<4), :edje_text_effect_shadow_direction_right, (0x7<<4) ]
        # typedef enum _Edje_Action_Type {...} Edje_Action_Type;
        enum :edje_action_type, [ :edje_action_type_none, 0, :edje_action_type_state_set, 1, :edje_action_type_action_stop, 2,
            :edje_action_type_signal_emit, 3, :edje_action_type_drag_val_set, 4, :edje_action_type_drag_val_step, 5, :edje_action_type_drag_val_page, 6,
            :edje_action_type_script, 7, :edje_action_type_focus_set, 8, :edje_action_type_reserved00, 9, :edje_action_type_focus_object, 10,
            :edje_action_type_param_copy, 11, :edje_action_type_param_set, 12, :edje_action_type_sound_sample, 13, :edje_action_type_sound_tone, 14,
            :edje_action_type_last, 15 ]
        # typedef enum _Edje_Tween_Mode {...} Edje_Tween_Mode;
        enum :edje_tween_mode, [ :edje_tween_mode_none, 0, :edje_tween_mode_linear, 1, :edje_tween_mode_sinusoidal, 2, :edje_tween_mode_accelerate, 3,
            :edje_tween_mode_decelerate, 4, :edje_tween_mode_accelerate_factor, 5, :edje_tween_mode_decelerate_factor, 6, :edje_tween_mode_sinusoidal_factor, 7,
            :edje_tween_mode_divisor_interp, 8, :edje_tween_mode_bounce, 9, :edje_tween_mode_spring, 10, :edje_tween_mode_last, 11, :edje_tween_mode_mask, 0xff,
            :edje_tween_mode_opt_from_current, (1<<31) ]
        # typedef enum _Edje_Cursor {...} Edje_Cursor;
        enum :edje_cursor, [ :edje_cursor_main, :edje_cursor_selection_begin, :edje_cursor_selection_end, :edje_cursor_preedit_start,
            :edje_cursor_preedit_end, :edje_cursor_user, :edje_cursor_user_extra ]
        # typedef enum _Edje_Drag_Dir {...} Edje_Drag_Dir;
        enum :edje_drag_dir, [ :edje_drag_dir_none, 0, :edje_drag_dir_x, 1, :edje_drag_dir_y, 2, :edje_drag_dir_xy, 3 ]
        # typedef enum _Edje_Load_Error {...} Edje_Load_Error;
        enum :edje_load_error, [ :edje_load_error_none, 0, :edje_load_error_generic, 1, :edje_load_error_does_not_exist, 2,
            :edje_load_error_permission_denied, 3, :edje_load_error_resource_allocation_failed, 4, :edje_load_error_corrupt_file, 5,
            :edje_load_error_unknown_format, 6, :edje_load_error_incompatible_file, 7, :edje_load_error_unknown_collection, 8,
            :edje_load_error_recursive_reference, 9 ]
        # typedef enum _Edje_Text_Filter_Type {...} Edje_Text_Filter_Type;
        enum :edje_text_filter_type, [ :edje_text_filter_text, 0, :edje_text_filter_format, 1, :edje_text_filter_markup, 2 ]
        # typedef enum _Edje_Text_Autocapital_Type {...} Edje_Text_Autocapital_Type;
        enum :edje_text_autocapital_type, [ :edje_text_autocapital_type_none, :edje_text_autocapital_type_word, :edje_text_autocapital_type_sentence,
            :edje_text_autocapital_type_allcharacter ]
        # typedef enum _Edje_External_Param_Type {...} Edje_External_Param_Type;
        enum :edje_external_param_type, [ :edje_external_param_type_int, :edje_external_param_type_double, :edje_external_param_type_string,
            :edje_external_param_type_bool, :edje_external_param_type_choice, :edje_external_param_type_max ]
        # typedef enum _Edje_External_Param_Flags {...} Edje_External_Param_Flags;
        enum :edje_external_param_flags, [ :edje_external_param_flags_none, 0, :edje_external_param_flags_get, (1<<0), :edje_external_param_flags_set,
            (1<<1), :edje_external_param_flags_state, (1<<2), :edje_external_param_flags_constructor, (1<<3), :edje_external_param_flags_regular,
            (1<<0)|(1<<1)|(1<<2) ]
        # typedef enum _Edje_Input_Panel_Layout {...} Edje_Input_Panel_Layout;
        enum :edje_input_panel_layout, [ :edje_input_panel_layout_normal, :edje_input_panel_layout_number, :edje_input_panel_layout_email,
            :edje_input_panel_layout_url, :edje_input_panel_layout_phonenumber, :edje_input_panel_layout_ip, :edje_input_panel_layout_month,
            :edje_input_panel_layout_numberonly, :edje_input_panel_layout_invalid, :edje_input_panel_layout_hex, :edje_input_panel_layout_terminal,
            :edje_input_panel_layout_password ]
        # typedef enum _Edje_Input_Panel_Lang {...} Edje_Input_Panel_Lang;
        enum :edje_input_panel_lang, [ :edje_input_panel_lang_automatic, :edje_input_panel_lang_alphabet ]
        # typedef enum _Edje_Input_Panel_Return_Key_Type {...} Edje_Input_Panel_Return_Key_Type;
        enum :edje_input_panel_return_key_type, [ :edje_input_panel_return_key_type_default, :edje_input_panel_return_key_type_done,
            :edje_input_panel_return_key_type_go, :edje_input_panel_return_key_type_join, :edje_input_panel_return_key_type_login,
            :edje_input_panel_return_key_type_next, :edje_input_panel_return_key_type_search, :edje_input_panel_return_key_type_send ]
        #
        # TYPEDEFS
        # typedef struct _Edje_Version Edje_Version;
        typedef :pointer, :edje_version
        # typedef struct _Edje_Entry_Change_Info Edje_Entry_Change_Info;
        typedef :pointer, :edje_entry_change_info
        # typedef struct _Edje_Message_String Edje_Message_String;
        typedef :pointer, :edje_message_string
        # typedef struct _Edje_Message_Int Edje_Message_Int;
        typedef :pointer, :edje_message_int
        # typedef struct _Edje_Message_Float Edje_Message_Float;
        typedef :pointer, :edje_message_float
        # typedef struct _Edje_Message_String_Set Edje_Message_String_Set;
        typedef :pointer, :edje_message_string_set
        # typedef struct _Edje_Message_Int_Set Edje_Message_Int_Set;
        typedef :pointer, :edje_message_int_set
        # typedef struct _Edje_Message_Float_Set Edje_Message_Float_Set;
        typedef :pointer, :edje_message_float_set
        # typedef struct _Edje_Message_String_Int Edje_Message_String_Int;
        typedef :pointer, :edje_message_string_int
        # typedef struct _Edje_Message_String_Float Edje_Message_String_Float;
        typedef :pointer, :edje_message_string_float
        # typedef struct _Edje_Message_String_Int_Set Edje_Message_String_Int_Set;
        typedef :pointer, :edje_message_string_int_set
        # typedef struct _Edje_Message_String_Float_Set Edje_Message_String_Float_Set;
        typedef :pointer, :edje_message_string_float_set
        # typedef struct _Edje_External_Param Edje_External_Param;
        typedef :pointer, :edje_external_param
        # typedef struct _Edje_External_Param_Info Edje_External_Param_Info;
        typedef :pointer, :edje_external_param_info
        # typedef struct _Edje_External_Type Edje_External_Type;
        typedef :pointer, :edje_external_type
        # typedef struct _Edje_External_Type_Info Edje_External_Type_Info;
        typedef :pointer, :edje_external_type_info
        # typedef struct _Edje_Perspective Edje_Perspective;
        typedef :pointer, :edje_perspective
        #
        # CALLBACKS
        # typedef void (*Edje_Signal_Cb) (void *data, Evas_Object *obj, const char *emission, const char *source);
        callback :edje_signal_cb, [ :pointer, :evas_object, :string, :string ], :void
        # typedef void (*Edje_Text_Change_Cb) (void *data, Evas_Object *obj, const char *part);
        callback :edje_text_change_cb, [ :pointer, :evas_object, :string ], :void
        # typedef void (*Edje_Message_Handler_Cb) (void *data, Evas_Object *obj, Edje_Message_Type type, int id, void *msg);
        callback :edje_message_handler_cb, [ :pointer, :evas_object, :edje_message_type, :int, :pointer ], :void
        # typedef void (*Edje_Text_Filter_Cb) (void *data, Evas_Object *obj, const char *part, Edje_Text_Filter_Type type, char **text);
        callback :edje_text_filter_cb, [ :pointer, :evas_object, :string, :edje_text_filter_type, :pointer ], :void
        # typedef void (*Edje_Markup_Filter_Cb) (void *data, Evas_Object *obj, const char *part, char **text);
        callback :edje_markup_filter_cb, [ :pointer, :evas_object, :string, :pointer ], :void
        # typedef Evas_Object *(*Edje_Item_Provider_Cb) (void *data, Evas_Object *obj, const char *part, const char *item);
        callback :edje_item_provider_cb, [ :pointer, :evas_object, :string, :string ], :evas_object
        #
        # VARIABLES
        # EAPI extern Edje_Version *edje_version;
        attach_variable :edje_version, :edje_version
        #
        # FUNCTIONS
        fcts = [
        # EAPI const char *edje_external_param_type_str(Edje_External_Param_Type type);
        [ :edje_external_param_type_str, [ :edje_external_param_type ], :string ],
        # EAPI int edje_init (void);
        [ :edje_init, [  ], :int ],
        # EAPI int edje_shutdown (void);
        [ :edje_shutdown, [  ], :int ],
        # EAPI void edje_frametime_set (double t);
        [ :edje_frametime_set, [ :double ], :void ],
        # EAPI double edje_frametime_get (void);
        [ :edje_frametime_get, [  ], :double ],
        # EAPI void edje_freeze (void);
        [ :edje_freeze, [  ], :void ],
        # EAPI void edje_thaw (void);
        [ :edje_thaw, [  ], :void ],
        # EAPI void edje_fontset_append_set (const char *fonts);
        [ :edje_fontset_append_set, [ :string ], :void ],
        # EAPI const char *edje_fontset_append_get (void);
        [ :edje_fontset_append_get, [  ], :string ],
        # EAPI void edje_scale_set (double scale);
        [ :edje_scale_set, [ :double ], :void ],
        # EAPI double edje_scale_get (void);
        [ :edje_scale_get, [  ], :double ],
        # EAPI void edje_password_show_last_set(Eina_Bool password_show_last);
        [ :edje_password_show_last_set, [ :bool ], :void ],
        # EAPI void edje_password_show_last_timeout_set(double password_show_last_timeout);
        [ :edje_password_show_last_timeout_set, [ :double ], :void ],
        # EAPI Eina_Bool edje_object_scale_set (Evas_Object *obj, double scale);
        [ :edje_object_scale_set, [ :evas_object, :double ], :bool ],
        # EAPI double edje_object_scale_get (const Evas_Object *obj);
        [ :edje_object_scale_get, [ :evas_object ], :double ],
        # EAPI void edje_object_mirrored_set (Evas_Object *obj, Eina_Bool rtl);
        [ :edje_object_mirrored_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool edje_object_mirrored_get (const Evas_Object *obj);
        [ :edje_object_mirrored_get, [ :evas_object ], :bool ],
        # EAPI Eina_List *edje_file_collection_list (const char *file);
        [ :edje_file_collection_list, [ :string ], :eina_list ],
        # EAPI void edje_file_collection_list_free (Eina_List *lst);
        [ :edje_file_collection_list_free, [ :eina_list ], :void ],
        # EAPI Eina_Bool edje_file_group_exists (const char *file, const char *glob);
        [ :edje_file_group_exists, [ :string, :string ], :bool ],
        # EAPI char *edje_file_data_get (const char *file, const char *key);
        [ :edje_file_data_get, [ :string, :string ], :string ],
        # EAPI void edje_file_cache_set (int count);
        [ :edje_file_cache_set, [ :int ], :void ],
        # EAPI int edje_file_cache_get (void);
        [ :edje_file_cache_get, [  ], :int ],
        # EAPI void edje_file_cache_flush (void);
        [ :edje_file_cache_flush, [  ], :void ],
        # EAPI void edje_collection_cache_set (int count);
        [ :edje_collection_cache_set, [ :int ], :void ],
        # EAPI int edje_collection_cache_get (void);
        [ :edje_collection_cache_get, [  ], :int ],
        # EAPI void edje_collection_cache_flush (void);
        [ :edje_collection_cache_flush, [  ], :void ],
        # EAPI Eina_Bool edje_color_class_set (const char *color_class, int r, int g, int b, int a, int r2, int g2, int b2, int a2, int r3, int g3, int b3, int a3);
        [ :edje_color_class_set, [ :string, :int, :int, :int, :int, :int, :int, :int, :int, :int, :int, :int, :int ], :bool ],
        # EAPI Eina_Bool edje_color_class_get (const char *color_class, int *r, int *g, int *b, int *a, int *r2, int *g2, int *b2, int *a2, int *r3, int *g3, int *b3, int *a3);
        [ :edje_color_class_get, [ :string, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer,
            :pointer, :pointer ], :bool ],
        # EAPI void edje_color_class_del (const char *color_class);
        [ :edje_color_class_del, [ :string ], :void ],
        # EAPI Eina_List *edje_color_class_list (void);
        [ :edje_color_class_list, [  ], :eina_list ],
        # EAPI Eina_Bool edje_text_class_set (const char *text_class, const char *font, Evas_Font_Size size);
        [ :edje_text_class_set, [ :string, :string, :int ], :bool ],
        # EAPI void edje_text_class_del (const char *text_class);
        [ :edje_text_class_del, [ :string ], :void ],
        # EAPI Eina_List *edje_text_class_list (void);
        [ :edje_text_class_list, [  ], :eina_list ],
        # EAPI void edje_extern_object_min_size_set (Evas_Object *obj, Evas_Coord minw, Evas_Coord minh);
        [ :edje_extern_object_min_size_set, [ :evas_object, :int, :int ], :void ],
        # EAPI void edje_extern_object_max_size_set (Evas_Object *obj, Evas_Coord maxw, Evas_Coord maxh);
        [ :edje_extern_object_max_size_set, [ :evas_object, :int, :int ], :void ],
        # EAPI void edje_extern_object_aspect_set (Evas_Object *obj, Edje_Aspect_Control aspect, Evas_Coord aw, Evas_Coord ah);
        [ :edje_extern_object_aspect_set, [ :evas_object, :edje_aspect_control, :int, :int ], :void ],
        # EAPI void edje_box_layout_register (const char *name, Evas_Object_Box_Layout func, void *(*layout_data_get)(void *), void (*layout_data_free)(void *), void (*free_data)(void *), void *data);
        [ :edje_box_layout_register, [ :string, :evas_object_box_layout_cb, (callback [:pointer], :pointer), (callback [:pointer], :void),
            (callback [:pointer], :void), :pointer ], :void ],
        # EAPI Evas_Object *edje_object_add (Evas *evas);
        [ :edje_object_add, [ :evas ], :evas_object ],
        # EAPI const char *edje_object_data_get (const Evas_Object *obj, const char *key);
        [ :edje_object_data_get, [ :evas_object, :string ], :string ],
        # EAPI Eina_Bool edje_object_file_set (Evas_Object *obj, const char *file, const char *group);
        [ :edje_object_file_set, [ :evas_object, :string, :string ], :bool ],
        # EAPI void edje_object_file_get (const Evas_Object *obj, const char **file, const char **group);
        [ :edje_object_file_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI Edje_Load_Error edje_object_load_error_get (const Evas_Object *obj);
        [ :edje_object_load_error_get, [ :evas_object ], :edje_load_error ],
        # EAPI const char *edje_load_error_str (Edje_Load_Error error);
        [ :edje_load_error_str, [ :edje_load_error ], :string ],
        # EAPI Eina_Bool edje_object_preload (Evas_Object *obj, Eina_Bool cancel);
        [ :edje_object_preload, [ :evas_object, :bool ], :bool ],
        # EAPI void edje_object_signal_callback_add (Evas_Object *obj, const char *emission, const char *source, Edje_Signal_Cb func, void *data);
        [ :edje_object_signal_callback_add, [ :evas_object, :string, :string, :edje_signal_cb, :pointer ], :void ],
        # EAPI void *edje_object_signal_callback_del (Evas_Object *obj, const char *emission, const char *source, Edje_Signal_Cb func);
        [ :edje_object_signal_callback_del, [ :evas_object, :string, :string, :edje_signal_cb ], :pointer ],
        # EAPI void *edje_object_signal_callback_del_full(Evas_Object *obj, const char *emission, const char *source, Edje_Signal_Cb func, void *data);
        [ :edje_object_signal_callback_del_full, [ :evas_object, :string, :string, :edje_signal_cb, :pointer ], :pointer ],
        # EAPI void edje_object_signal_emit (Evas_Object *obj, const char *emission, const char *source);
        [ :edje_object_signal_emit, [ :evas_object, :string, :string ], :void ],
        # EAPI void * edje_object_signal_callback_extra_data_get(void);
        [ :edje_object_signal_callback_extra_data_get, [  ], :pointer ],
        # EAPI void edje_object_play_set (Evas_Object *obj, Eina_Bool play);
        [ :edje_object_play_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool edje_object_play_get (const Evas_Object *obj);
        [ :edje_object_play_get, [ :evas_object ], :bool ],
        # EAPI void edje_object_animation_set (Evas_Object *obj, Eina_Bool on);
        [ :edje_object_animation_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool edje_object_animation_get (const Evas_Object *obj);
        [ :edje_object_animation_get, [ :evas_object ], :bool ],
        # EAPI int edje_object_freeze (Evas_Object *obj);
        [ :edje_object_freeze, [ :evas_object ], :int ],
        # EAPI int edje_object_thaw (Evas_Object *obj);
        [ :edje_object_thaw, [ :evas_object ], :int ],
        # EAPI Eina_Bool edje_object_color_class_set (Evas_Object *obj, const char *color_class, int r, int g, int b, int a, int r2, int g2, int b2, int a2, int r3, int g3, int b3, int a3);
        [ :edje_object_color_class_set, [ :evas_object, :string, :int, :int, :int, :int, :int, :int, :int, :int, :int, :int, :int, :int ], :bool ],
        # EAPI Eina_Bool edje_object_color_class_get (const Evas_Object *o, const char *color_class, int *r, int *g, int *b, int *a, int *r2, int *g2, int *b2, int *a2, int *r3, int *g3, int *b3, int *a3);
        [ :edje_object_color_class_get, [ :evas_object, :string, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer,
            :pointer, :pointer, :pointer, :pointer ], :bool ],
        # EAPI void edje_object_color_class_del (Evas_Object *obj, const char *color_class);
        [ :edje_object_color_class_del, [ :evas_object, :string ], :void ],
        # EAPI Eina_Bool edje_object_text_class_set (Evas_Object *obj, const char *text_class, const char *font, Evas_Font_Size size);
        [ :edje_object_text_class_set, [ :evas_object, :string, :string, :int ], :bool ],
        # EAPI void edje_object_size_min_get (const Evas_Object *obj, Evas_Coord *minw, Evas_Coord *minh);
        [ :edje_object_size_min_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void edje_object_update_hints_set(Evas_Object *obj, Eina_Bool update);
        [ :edje_object_update_hints_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool edje_object_update_hints_get(Evas_Object *obj);
        [ :edje_object_update_hints_get, [ :evas_object ], :bool ],
        # EAPI void edje_object_size_max_get (const Evas_Object *obj, Evas_Coord *maxw, Evas_Coord *maxh);
        [ :edje_object_size_max_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void edje_object_calc_force (Evas_Object *obj);
        [ :edje_object_calc_force, [ :evas_object ], :void ],
        # EAPI void edje_object_size_min_calc (Evas_Object *obj, Evas_Coord *minw, Evas_Coord *minh);
        [ :edje_object_size_min_calc, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI Eina_Bool edje_object_parts_extends_calc (Evas_Object *obj, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        [ :edje_object_parts_extends_calc, [ :evas_object, :pointer, :pointer, :pointer, :pointer ], :bool ],
        # EAPI void edje_object_size_min_restricted_calc(Evas_Object *obj, Evas_Coord *minw, Evas_Coord *minh, Evas_Coord restrictedw, Evas_Coord restrictedh);
        [ :edje_object_size_min_restricted_calc, [ :evas_object, :pointer, :pointer, :int, :int ], :void ],
        # EAPI Eina_Bool edje_object_part_exists (const Evas_Object *obj, const char *part);
        [ :edje_object_part_exists, [ :evas_object, :string ], :bool ],
        # EAPI const Evas_Object *edje_object_part_object_get (const Evas_Object *obj, const char *part);
        [ :edje_object_part_object_get, [ :evas_object, :string ], :evas_object ],
        # EAPI Eina_Bool edje_object_part_geometry_get (const Evas_Object *obj, const char *part, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        [ :edje_object_part_geometry_get, [ :evas_object, :string, :pointer, :pointer, :pointer, :pointer ], :bool ],
        # EAPI void edje_object_item_provider_set (Evas_Object *obj, Edje_Item_Provider_Cb func, void *data);
        [ :edje_object_item_provider_set, [ :evas_object, :edje_item_provider_cb, :pointer ], :void ],
        # EAPI void edje_object_text_change_cb_set (Evas_Object *obj, Edje_Text_Change_Cb func, void *data);
        [ :edje_object_text_change_cb_set, [ :evas_object, :edje_text_change_cb, :pointer ], :void ],
        # EAPI Eina_Bool edje_object_part_text_set (Evas_Object *obj, const char *part, const char *text);
        [ :edje_object_part_text_set, [ :evas_object, :string, :string ], :bool ],
        # EAPI Eina_Bool edje_object_part_text_escaped_set (Evas_Object *obj, const char *part, const char *text);
        [ :edje_object_part_text_escaped_set, [ :evas_object, :string, :string ], :bool ],
        # EAPI const char *edje_object_part_text_get (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_get, [ :evas_object, :string ], :string ],
        # EAPI void edje_object_part_text_style_user_push(Evas_Object *obj, const char *part, const char *style);
        [ :edje_object_part_text_style_user_push, [ :evas_object, :string, :string ], :void ],
        # EAPI const char *edje_object_part_text_style_user_peek(const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_style_user_peek, [ :evas_object, :string ], :string ],
        # EAPI void edje_object_part_text_style_user_pop(Evas_Object *obj, const char *part);
        [ :edje_object_part_text_style_user_pop, [ :evas_object, :string ], :void ],
        # EAPI Eina_Bool edje_object_part_text_unescaped_set (Evas_Object *obj, const char *part, const char *text_to_escape);
        [ :edje_object_part_text_unescaped_set, [ :evas_object, :string, :string ], :bool ],
        # EAPI char *edje_object_part_text_unescaped_get (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_unescaped_get, [ :evas_object, :string ], :string ],
        # EAPI const char *edje_object_part_text_selection_get (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_selection_get, [ :evas_object, :string ], :string ],
        # EAPI void edje_object_part_text_select_none (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_select_none, [ :evas_object, :string ], :void ],
        # EAPI void edje_object_part_text_select_all (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_select_all, [ :evas_object, :string ], :void ],
        # EAPI void edje_object_part_text_insert (Evas_Object *obj, const char *part, const char *text);
        [ :edje_object_part_text_insert, [ :evas_object, :string, :string ], :void ],
        # EAPI void edje_object_part_text_append(Evas_Object *obj, const char *part, const char *text);
        [ :edje_object_part_text_append, [ :evas_object, :string, :string ], :void ],
        # EAPI const Eina_List *edje_object_part_text_anchor_list_get (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_anchor_list_get, [ :evas_object, :string ], :eina_list ],
        # EAPI const Eina_List *edje_object_part_text_anchor_geometry_get (const Evas_Object *obj, const char *part, const char *anchor);
        [ :edje_object_part_text_anchor_geometry_get, [ :evas_object, :string, :string ], :eina_list ],
        # EAPI const Eina_List *edje_object_part_text_item_list_get (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_item_list_get, [ :evas_object, :string ], :eina_list ],
        # EAPI Eina_Bool edje_object_part_text_item_geometry_get (const Evas_Object *obj, const char *part, const char *item, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch);
        [ :edje_object_part_text_item_geometry_get, [ :evas_object, :string, :string, :pointer, :pointer, :pointer, :pointer ], :bool ],
        # EAPI void edje_object_part_text_cursor_geometry_get (const Evas_Object *obj, const char *part, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        [ :edje_object_part_text_cursor_geometry_get, [ :evas_object, :string, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void edje_object_part_text_user_insert (const Evas_Object *obj, const char *part, const char *text);
        [ :edje_object_part_text_user_insert, [ :evas_object, :string, :string ], :void ],
        # EAPI void edje_object_part_text_select_allow_set (const Evas_Object *obj, const char *part, Eina_Bool allow);
        [ :edje_object_part_text_select_allow_set, [ :evas_object, :string, :bool ], :void ],
        # EAPI void edje_object_part_text_select_abort (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_select_abort, [ :evas_object, :string ], :void ],
        # EAPI void edje_object_part_text_select_begin (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_select_begin, [ :evas_object, :string ], :void ],
        # EAPI void edje_object_part_text_select_extend (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_select_extend, [ :evas_object, :string ], :void ],
        # EAPI Eina_Bool edje_object_part_text_cursor_next (Evas_Object *obj, const char *part, Edje_Cursor cur);
        [ :edje_object_part_text_cursor_next, [ :evas_object, :string, :edje_cursor ], :bool ],
        # EAPI Eina_Bool edje_object_part_text_cursor_prev (Evas_Object *obj, const char *part, Edje_Cursor cur);
        [ :edje_object_part_text_cursor_prev, [ :evas_object, :string, :edje_cursor ], :bool ],
        # EAPI Eina_Bool edje_object_part_text_cursor_up (Evas_Object *obj, const char *part, Edje_Cursor cur);
        [ :edje_object_part_text_cursor_up, [ :evas_object, :string, :edje_cursor ], :bool ],
        # EAPI Eina_Bool edje_object_part_text_cursor_down (Evas_Object *obj, const char *part, Edje_Cursor cur);
        [ :edje_object_part_text_cursor_down, [ :evas_object, :string, :edje_cursor ], :bool ],
        # EAPI void edje_object_part_text_cursor_begin_set (Evas_Object *obj, const char *part, Edje_Cursor cur);
        [ :edje_object_part_text_cursor_begin_set, [ :evas_object, :string, :edje_cursor ], :void ],
        # EAPI void edje_object_part_text_cursor_end_set (Evas_Object *obj, const char *part, Edje_Cursor cur);
        [ :edje_object_part_text_cursor_end_set, [ :evas_object, :string, :edje_cursor ], :void ],
        # EAPI void edje_object_part_text_cursor_copy (Evas_Object *obj, const char *part, Edje_Cursor src, Edje_Cursor dst);
        [ :edje_object_part_text_cursor_copy, [ :evas_object, :string, :edje_cursor, :edje_cursor ], :void ],
        # EAPI void edje_object_part_text_cursor_line_begin_set (Evas_Object *obj, const char *part, Edje_Cursor cur);
        [ :edje_object_part_text_cursor_line_begin_set, [ :evas_object, :string, :edje_cursor ], :void ],
        # EAPI void edje_object_part_text_cursor_line_end_set (Evas_Object *obj, const char *part, Edje_Cursor cur);
        [ :edje_object_part_text_cursor_line_end_set, [ :evas_object, :string, :edje_cursor ], :void ],
        # EAPI Eina_Bool edje_object_part_text_cursor_coord_set (Evas_Object *obj, const char *part, Edje_Cursor cur, Evas_Coord x, Evas_Coord y);
        [ :edje_object_part_text_cursor_coord_set, [ :evas_object, :string, :edje_cursor, :int, :int ], :bool ],
        # EAPI Eina_Bool edje_object_part_text_cursor_is_format_get (const Evas_Object *obj, const char *part, Edje_Cursor cur);
        [ :edje_object_part_text_cursor_is_format_get, [ :evas_object, :string, :edje_cursor ], :bool ],
        # EAPI Eina_Bool edje_object_part_text_cursor_is_visible_format_get(const Evas_Object *obj, const char *part, Edje_Cursor cur);
        [ :edje_object_part_text_cursor_is_visible_format_get, [ :evas_object, :string, :edje_cursor ], :bool ],
        # EAPI char *edje_object_part_text_cursor_content_get (const Evas_Object *obj, const char *part, Edje_Cursor cur);
        [ :edje_object_part_text_cursor_content_get, [ :evas_object, :string, :edje_cursor ], :string ],
        # EAPI void edje_object_part_text_cursor_pos_set (Evas_Object *obj, const char *part, Edje_Cursor cur, int pos);
        [ :edje_object_part_text_cursor_pos_set, [ :evas_object, :string, :edje_cursor, :int ], :void ],
        # EAPI int edje_object_part_text_cursor_pos_get (const Evas_Object *obj, const char *part, Edje_Cursor cur);
        [ :edje_object_part_text_cursor_pos_get, [ :evas_object, :string, :edje_cursor ], :int ],
        # EAPI void edje_object_part_text_imf_context_reset (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_imf_context_reset, [ :evas_object, :string ], :void ],
        # EAPI void *edje_object_part_text_imf_context_get (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_imf_context_get, [ :evas_object, :string ], :pointer ],
        # EAPI void edje_object_part_text_input_panel_layout_set (Evas_Object *obj, const char *part, Edje_Input_Panel_Layout layout);
        [ :edje_object_part_text_input_panel_layout_set, [ :evas_object, :string, :edje_input_panel_layout ], :void ],
        # EAPI Edje_Input_Panel_Layout edje_object_part_text_input_panel_layout_get (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_input_panel_layout_get, [ :evas_object, :string ], :edje_input_panel_layout ],
        # EAPI void edje_object_part_text_autocapital_type_set (Evas_Object *obj, const char *part, Edje_Text_Autocapital_Type autocapital_type);
        [ :edje_object_part_text_autocapital_type_set, [ :evas_object, :string, :edje_text_autocapital_type ], :void ],
        # EAPI Edje_Text_Autocapital_Type edje_object_part_text_autocapital_type_get (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_autocapital_type_get, [ :evas_object, :string ], :edje_text_autocapital_type ],
        # EAPI void edje_object_part_text_prediction_allow_set (Evas_Object *obj, const char *part, Eina_Bool prediction);
        [ :edje_object_part_text_prediction_allow_set, [ :evas_object, :string, :bool ], :void ],
        # EAPI Eina_Bool edje_object_part_text_prediction_allow_get (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_prediction_allow_get, [ :evas_object, :string ], :bool ],
        # EAPI void edje_object_part_text_input_panel_enabled_set (Evas_Object *obj, const char *part, Eina_Bool enabled);
        [ :edje_object_part_text_input_panel_enabled_set, [ :evas_object, :string, :bool ], :void ],
        # EAPI Eina_Bool edje_object_part_text_input_panel_enabled_get (const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_input_panel_enabled_get, [ :evas_object, :string ], :bool ],
        # EAPI void edje_object_part_text_input_panel_show(const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_input_panel_show, [ :evas_object, :string ], :void ],
        # EAPI void edje_object_part_text_input_panel_hide(const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_input_panel_hide, [ :evas_object, :string ], :void ],
        # EAPI void edje_object_part_text_input_panel_language_set(Evas_Object *obj, const char *part, Edje_Input_Panel_Lang lang);
        [ :edje_object_part_text_input_panel_language_set, [ :evas_object, :string, :edje_input_panel_lang ], :void ],
        # EAPI Edje_Input_Panel_Lang edje_object_part_text_input_panel_language_get(const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_input_panel_language_get, [ :evas_object, :string ], :edje_input_panel_lang ],
        # EAPI void edje_object_part_text_input_panel_imdata_set(Evas_Object *obj, const char *part, const void *data, int len);
        [ :edje_object_part_text_input_panel_imdata_set, [ :evas_object, :string, :pointer, :int ], :void ],
        # EAPI void edje_object_part_text_input_panel_imdata_get(const Evas_Object *obj, const char *part, void *data, int *len);
        [ :edje_object_part_text_input_panel_imdata_get, [ :evas_object, :string, :pointer, :pointer ], :void ],
        # EAPI void edje_object_part_text_input_panel_return_key_type_set(Evas_Object *obj, const char *part, Edje_Input_Panel_Return_Key_Type return_key_type);
        [ :edje_object_part_text_input_panel_return_key_type_set, [ :evas_object, :string, :edje_input_panel_return_key_type ], :void ],
        # EAPI Edje_Input_Panel_Return_Key_Type edje_object_part_text_input_panel_return_key_type_get(const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_input_panel_return_key_type_get, [ :evas_object, :string ], :edje_input_panel_return_key_type ],
        # EAPI void edje_object_part_text_input_panel_return_key_disabled_set(Evas_Object *obj, const char *part, Eina_Bool disabled);
        [ :edje_object_part_text_input_panel_return_key_disabled_set, [ :evas_object, :string, :bool ], :void ],
        # EAPI Eina_Bool edje_object_part_text_input_panel_return_key_disabled_get(const Evas_Object *obj, const char *part);
        [ :edje_object_part_text_input_panel_return_key_disabled_get, [ :evas_object, :string ], :bool ],
        # EAPI void edje_object_text_insert_filter_callback_add (Evas_Object *obj, const char *part, Edje_Text_Filter_Cb func, void *data);
        [ :edje_object_text_insert_filter_callback_add, [ :evas_object, :string, :edje_text_filter_cb, :pointer ], :void ],
        # EAPI void *edje_object_text_insert_filter_callback_del (Evas_Object *obj, const char *part, Edje_Text_Filter_Cb func);
        [ :edje_object_text_insert_filter_callback_del, [ :evas_object, :string, :edje_text_filter_cb ], :pointer ],
        # EAPI void *edje_object_text_insert_filter_callback_del_full (Evas_Object *obj, const char *part, Edje_Text_Filter_Cb func, void *data);
        [ :edje_object_text_insert_filter_callback_del_full, [ :evas_object, :string, :edje_text_filter_cb, :pointer ], :pointer ],
        # EAPI void edje_object_text_markup_filter_callback_add(Evas_Object *obj, const char *part, Edje_Markup_Filter_Cb func, void *data);
        [ :edje_object_text_markup_filter_callback_add, [ :evas_object, :string, :edje_markup_filter_cb, :pointer ], :void ],
        # EAPI void *edje_object_text_markup_filter_callback_del(Evas_Object *obj, const char *part, Edje_Markup_Filter_Cb func);
        [ :edje_object_text_markup_filter_callback_del, [ :evas_object, :string, :edje_markup_filter_cb ], :pointer ],
        # EAPI void *edje_object_text_markup_filter_callback_del_full(Evas_Object *obj, const char *part, Edje_Markup_Filter_Cb func, void *data);
        [ :edje_object_text_markup_filter_callback_del_full, [ :evas_object, :string, :edje_markup_filter_cb, :pointer ], :pointer ],
        # EAPI Eina_Bool edje_object_part_swallow (Evas_Object *obj, const char *part, Evas_Object *obj_swallow);
        [ :edje_object_part_swallow, [ :evas_object, :string, :evas_object ], :bool ],
        # EAPI void edje_object_part_unswallow (Evas_Object *obj, Evas_Object *obj_swallow);
        [ :edje_object_part_unswallow, [ :evas_object, :evas_object ], :void ],
        # EAPI Evas_Object *edje_object_part_swallow_get (const Evas_Object *obj, const char *part);
        [ :edje_object_part_swallow_get, [ :evas_object, :string ], :evas_object ],
        # EAPI const char *edje_object_part_state_get (const Evas_Object *obj, const char *part, double *val_ret);
        [ :edje_object_part_state_get, [ :evas_object, :string, :pointer ], :string ],
        # EAPI Edje_Drag_Dir edje_object_part_drag_dir_get (const Evas_Object *obj, const char *part);
        [ :edje_object_part_drag_dir_get, [ :evas_object, :string ], :edje_drag_dir ],
        # EAPI Eina_Bool edje_object_part_drag_value_set (Evas_Object *obj, const char *part, double dx, double dy);
        [ :edje_object_part_drag_value_set, [ :evas_object, :string, :double, :double ], :bool ],
        # EAPI Eina_Bool edje_object_part_drag_value_get (const Evas_Object *obj, const char *part, double *dx, double *dy);
        [ :edje_object_part_drag_value_get, [ :evas_object, :string, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool edje_object_part_drag_size_set (Evas_Object *obj, const char *part, double dw, double dh);
        [ :edje_object_part_drag_size_set, [ :evas_object, :string, :double, :double ], :bool ],
        # EAPI Eina_Bool edje_object_part_drag_size_get (const Evas_Object *obj, const char *part, double *dw, double *dh);
        [ :edje_object_part_drag_size_get, [ :evas_object, :string, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool edje_object_part_drag_step_set (Evas_Object *obj, const char *part, double dx, double dy);
        [ :edje_object_part_drag_step_set, [ :evas_object, :string, :double, :double ], :bool ],
        # EAPI Eina_Bool edje_object_part_drag_step_get (const Evas_Object *obj, const char *part, double *dx, double *dy);
        [ :edje_object_part_drag_step_get, [ :evas_object, :string, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool edje_object_part_drag_page_set (Evas_Object *obj, const char *part, double dx, double dy);
        [ :edje_object_part_drag_page_set, [ :evas_object, :string, :double, :double ], :bool ],
        # EAPI Eina_Bool edje_object_part_drag_page_get (const Evas_Object *obj, const char *part, double *dx, double *dy);
        [ :edje_object_part_drag_page_get, [ :evas_object, :string, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool edje_object_part_drag_step (Evas_Object *obj, const char *part, double dx, double dy);
        [ :edje_object_part_drag_step, [ :evas_object, :string, :double, :double ], :bool ],
        # EAPI Eina_Bool edje_object_part_drag_page (Evas_Object *obj, const char *part, double dx, double dy);
        [ :edje_object_part_drag_page, [ :evas_object, :string, :double, :double ], :bool ],
        # EAPI Evas_Object *edje_object_part_external_object_get (const Evas_Object *obj, const char *part);
        [ :edje_object_part_external_object_get, [ :evas_object, :string ], :evas_object ],
        # EAPI Eina_Bool edje_object_part_external_param_set (Evas_Object *obj, const char *part, const Edje_External_Param *param);
        [ :edje_object_part_external_param_set, [ :evas_object, :string, :edje_external_param ], :bool ],
        # EAPI Eina_Bool edje_object_part_external_param_get (const Evas_Object *obj, const char *part, Edje_External_Param *param);
        [ :edje_object_part_external_param_get, [ :evas_object, :string, :edje_external_param ], :bool ],
        # EAPI Evas_Object *edje_object_part_external_content_get (const Evas_Object *obj, const char *part, const char *content);
        [ :edje_object_part_external_content_get, [ :evas_object, :string, :string ], :evas_object ],
        # EAPI Edje_External_Param_Type edje_object_part_external_param_type_get (const Evas_Object *obj, const char *part, const char *param);
        [ :edje_object_part_external_param_type_get, [ :evas_object, :string, :string ], :edje_external_param_type ],
        # EAPI Eina_Bool edje_object_part_box_append (Evas_Object *obj, const char *part, Evas_Object *child);
        [ :edje_object_part_box_append, [ :evas_object, :string, :evas_object ], :bool ],
        # EAPI Eina_Bool edje_object_part_box_prepend (Evas_Object *obj, const char *part, Evas_Object *child);
        [ :edje_object_part_box_prepend, [ :evas_object, :string, :evas_object ], :bool ],
        # EAPI Eina_Bool edje_object_part_box_insert_before (Evas_Object *obj, const char *part, Evas_Object *child, const Evas_Object *reference);
        [ :edje_object_part_box_insert_before, [ :evas_object, :string, :evas_object, :evas_object ], :bool ],
        # EAPI Eina_Bool edje_object_part_box_insert_at (Evas_Object *obj, const char *part, Evas_Object *child, unsigned int pos);
        [ :edje_object_part_box_insert_at, [ :evas_object, :string, :evas_object, :uint ], :bool ],
        # EAPI Evas_Object *edje_object_part_box_remove (Evas_Object *obj, const char *part, Evas_Object *child);
        [ :edje_object_part_box_remove, [ :evas_object, :string, :evas_object ], :evas_object ],
        # EAPI Evas_Object *edje_object_part_box_remove_at (Evas_Object *obj, const char *part, unsigned int pos);
        [ :edje_object_part_box_remove_at, [ :evas_object, :string, :uint ], :evas_object ],
        # EAPI Eina_Bool edje_object_part_box_remove_all (Evas_Object *obj, const char *part, Eina_Bool clear);
        [ :edje_object_part_box_remove_all, [ :evas_object, :string, :bool ], :bool ],
        # EAPI Eina_List * edje_object_access_part_list_get (const Evas_Object *obj);
        [ :edje_object_access_part_list_get, [ :evas_object ], :eina_list ],
        # EAPI Evas_Object *edje_object_part_table_child_get (const Evas_Object *obj, const char *part, unsigned int col, unsigned int row);
        [ :edje_object_part_table_child_get, [ :evas_object, :string, :uint, :uint ], :evas_object ],
        # EAPI Eina_Bool edje_object_part_table_pack (Evas_Object *obj, const char *part, Evas_Object *child_obj, unsigned short col, unsigned short row, unsigned short colspan, unsigned short rowspan);
        [ :edje_object_part_table_pack, [ :evas_object, :string, :evas_object, :ushort, :ushort, :ushort, :ushort ], :bool ],
        # EAPI Eina_Bool edje_object_part_table_unpack (Evas_Object *obj, const char *part, Evas_Object *child_obj);
        [ :edje_object_part_table_unpack, [ :evas_object, :string, :evas_object ], :bool ],
        # EAPI Eina_Bool edje_object_part_table_col_row_size_get (const Evas_Object *obj, const char *part, int *cols, int *rows);
        [ :edje_object_part_table_col_row_size_get, [ :evas_object, :string, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool edje_object_part_table_clear (Evas_Object *obj, const char *part, Eina_Bool clear);
        [ :edje_object_part_table_clear, [ :evas_object, :string, :bool ], :bool ],
        # EAPI void edje_object_message_send (Evas_Object *obj, Edje_Message_Type type, int id, void *msg);
        [ :edje_object_message_send, [ :evas_object, :edje_message_type, :int, :pointer ], :void ],
        # EAPI void edje_object_message_handler_set (Evas_Object *obj, Edje_Message_Handler_Cb func, void *data);
        [ :edje_object_message_handler_set, [ :evas_object, :edje_message_handler_cb, :pointer ], :void ],
        # EAPI void edje_object_message_signal_process (Evas_Object *obj);
        [ :edje_object_message_signal_process, [ :evas_object ], :void ],
        # EAPI void edje_message_signal_process (void);
        [ :edje_message_signal_process, [  ], :void ],
        # EAPI Eina_Bool edje_external_type_register (const char *type_name, const Edje_External_Type *type_info);
        [ :edje_external_type_register, [ :string, :edje_external_type ], :bool ],
        # EAPI Eina_Bool edje_external_type_unregister (const char *type_name);
        [ :edje_external_type_unregister, [ :string ], :bool ],
        # EAPI void edje_external_type_array_register (const Edje_External_Type_Info *array);
        [ :edje_external_type_array_register, [ :edje_external_type_info ], :void ],
        # EAPI void edje_external_type_array_unregister (const Edje_External_Type_Info *array);
        [ :edje_external_type_array_unregister, [ :edje_external_type_info ], :void ],
        # EAPI unsigned int edje_external_type_abi_version_get (void);
        [ :edje_external_type_abi_version_get, [  ], :uint ],
        # EAPI Eina_Iterator *edje_external_iterator_get (void);
        [ :edje_external_iterator_get, [  ], :pointer ],
        # EAPI Edje_External_Param *edje_external_param_find (const Eina_List *params, const char *key);
        [ :edje_external_param_find, [ :eina_list, :string ], :edje_external_param ],
        # EAPI Eina_Bool edje_external_param_int_get (const Eina_List *params, const char *key, int *ret);
        [ :edje_external_param_int_get, [ :eina_list, :string, :pointer ], :bool ],
        # EAPI Eina_Bool edje_external_param_double_get (const Eina_List *params, const char *key, double *ret);
        [ :edje_external_param_double_get, [ :eina_list, :string, :pointer ], :bool ],
        # EAPI Eina_Bool edje_external_param_string_get (const Eina_List *params, const char *key, const char **ret);
        [ :edje_external_param_string_get, [ :eina_list, :string, :pointer ], :bool ],
        # EAPI Eina_Bool edje_external_param_bool_get (const Eina_List *params, const char *key, Eina_Bool *ret);
        [ :edje_external_param_bool_get, [ :eina_list, :string, :pointer ], :bool ],
        # EAPI Eina_Bool edje_external_param_choice_get (const Eina_List *params, const char *key, const char **ret);
        [ :edje_external_param_choice_get, [ :eina_list, :string, :pointer ], :bool ],
        # EAPI const Edje_External_Param_Info *edje_external_param_info_get (const char *type_name);
        [ :edje_external_param_info_get, [ :string ], :edje_external_param_info ],
        # EAPI const Edje_External_Type *edje_external_type_get (const char *type_name);
        [ :edje_external_type_get, [ :string ], :edje_external_type ],
        # EAPI Eina_Bool edje_module_load (const char *module);
        [ :edje_module_load, [ :string ], :bool ],
        # EAPI const Eina_List *edje_available_modules_get (void);
        [ :edje_available_modules_get, [  ], :eina_list ],
        # EAPI Edje_Perspective *edje_perspective_new (Evas *e);
        [ :edje_perspective_new, [ :evas ], :edje_perspective ],
        # EAPI void edje_perspective_free (Edje_Perspective *ps);
        [ :edje_perspective_free, [ :edje_perspective ], :void ],
        # EAPI void edje_perspective_set (Edje_Perspective *ps, Evas_Coord px, Evas_Coord py, Evas_Coord z0, Evas_Coord foc);
        [ :edje_perspective_set, [ :edje_perspective, :int, :int, :int, :int ], :void ],
        # EAPI void edje_perspective_global_set (Edje_Perspective *ps, Eina_Bool global);
        [ :edje_perspective_global_set, [ :edje_perspective, :bool ], :void ],
        # EAPI Eina_Bool edje_perspective_global_get (const Edje_Perspective *ps);
        [ :edje_perspective_global_get, [ :edje_perspective ], :bool ],
        # EAPI const Edje_Perspective *edje_evas_global_perspective_get(const Evas *e);
        [ :edje_evas_global_perspective_get, [ :evas ], :edje_perspective ],
        # EAPI void edje_object_perspective_set (Evas_Object *obj, Edje_Perspective *ps);
        [ :edje_object_perspective_set, [ :evas_object, :edje_perspective ], :void ],
        # EAPI const Edje_Perspective *edje_object_perspective_get (const Evas_Object *obj);
        [ :edje_object_perspective_get, [ :evas_object ], :edje_perspective ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
