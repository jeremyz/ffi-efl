#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/edje'
require 'efl/native/elementary'
require 'efl/native/elm/elm_icon'
require 'efl/native/elm/elm_scroller'
#
module Efl
    #
    module ElmEntry
        #
        FCT_PREFIX = 'elm_entry_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Text_Format;
        enum :elm_text_format, [ :elm_text_format_plain_utf8, :elm_text_format_markup_utf8 ]
        # typedef enum {...} Elm_Wrap_Type;
        enum :elm_wrap_type, [ :elm_wrap_none, 0, :elm_wrap_char, 1, :elm_wrap_word, 2, :elm_wrap_mixed, 3, :elm_wrap_last, 4 ]
        # typedef enum {...} Elm_Input_Panel_Layout;
        enum :elm_input_panel_layout, [ :elm_input_panel_layout_normal, :elm_input_panel_layout_number, :elm_input_panel_layout_email,
            :elm_input_panel_layout_url, :elm_input_panel_layout_phonenumber, :elm_input_panel_layout_ip, :elm_input_panel_layout_month,
            :elm_input_panel_layout_numberonly, :elm_input_panel_layout_invalid, :elm_input_panel_layout_hex, :elm_input_panel_layout_terminal,
            :elm_input_panel_layout_password ]
        # typedef enum {...} Elm_Input_Panel_Lang;
        enum :elm_input_panel_lang, [ :elm_input_panel_lang_automatic, :elm_input_panel_lang_alphabet ]
        # typedef enum {...} Elm_Autocapital_Type;
        enum :elm_autocapital_type, [ :elm_autocapital_type_none, :elm_autocapital_type_word, :elm_autocapital_type_sentence,
            :elm_autocapital_type_allcharacter ]
        # typedef enum {...} Elm_Input_Panel_Return_Key_Type;
        enum :elm_input_panel_return_key_type, [ :elm_input_panel_return_key_type_default, :elm_input_panel_return_key_type_done,
            :elm_input_panel_return_key_type_go, :elm_input_panel_return_key_type_join, :elm_input_panel_return_key_type_login,
            :elm_input_panel_return_key_type_next, :elm_input_panel_return_key_type_search, :elm_input_panel_return_key_type_send ]
        # typedef enum {...} Elm_Cnp_Mode;
        enum :elm_cnp_mode, [ :elm_cnp_mode_markup, :elm_cnp_mode_no_image, :elm_cnp_mode_plaintext ]
        #
        # TYPEDEFS
        # typedef struct _Elm_Entry_Anchor_Info Elm_Entry_Anchor_Info;
        typedef :pointer, :elm_entry_anchor_info
        # typedef struct _Elm_Entry_Anchor_Hover_Info Elm_Entry_Anchor_Hover_Info;
        typedef :pointer, :elm_entry_anchor_hover_info
        # typedef Edje_Entry_Change_Info Elm_Entry_Change_Info;
        typedef :edje_entry_change_info, :elm_entry_change_info
        # typedef struct _Elm_Entry_Filter_Limit_Size Elm_Entry_Filter_Limit_Size;
        typedef :pointer, :elm_entry_filter_limit_size
        # typedef struct _Elm_Entry_Filter_Accept_Set Elm_Entry_Filter_Accept_Set;
        typedef :pointer, :elm_entry_filter_accept_set
        #
        # CALLBACKS
        # typedef Evas_Object * (*Elm_Entry_Item_Provider_Cb) (void *data, Evas_Object * entry, const char *item);
        callback :elm_entry_item_provider_cb, [ :pointer, :evas_object, :string ], :evas_object
        # typedef void (*Elm_Entry_Filter_Cb) (void *data, Evas_Object *entry, char **text);
        callback :elm_entry_filter_cb, [ :pointer, :evas_object, :pointer ], :void
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_entry_add(Evas_Object *parent);
        [ :elm_entry_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_entry_text_style_user_push(Evas_Object *obj, const char *style);
        [ :elm_entry_text_style_user_push, [ :evas_object, :string ], :void ],
        # EAPI void elm_entry_text_style_user_pop(Evas_Object *obj);
        [ :elm_entry_text_style_user_pop, [ :evas_object ], :void ],
        # EAPI const char* elm_entry_text_style_user_peek(const Evas_Object *obj);
        [ :elm_entry_text_style_user_peek, [ :evas_object ], :pointer ],
        # EAPI void elm_entry_single_line_set(Evas_Object *obj, Eina_Bool single_line);
        [ :elm_entry_single_line_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_entry_single_line_get(const Evas_Object *obj);
        [ :elm_entry_single_line_get, [ :evas_object ], :bool ],
        # EAPI void elm_entry_password_set(Evas_Object *obj, Eina_Bool password);
        [ :elm_entry_password_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_entry_password_get(const Evas_Object *obj);
        [ :elm_entry_password_get, [ :evas_object ], :bool ],
        # EAPI void elm_entry_entry_set(Evas_Object *obj, const char *entry);
        [ :elm_entry_entry_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_entry_entry_get(const Evas_Object *obj);
        [ :elm_entry_entry_get, [ :evas_object ], :string ],
        # EAPI void elm_entry_entry_append(Evas_Object *obj, const char *entry);
        [ :elm_entry_entry_append, [ :evas_object, :string ], :void ],
        # EAPI Eina_Bool elm_entry_is_empty(const Evas_Object *obj);
        [ :elm_entry_is_empty, [ :evas_object ], :bool ],
        # EAPI const char *elm_entry_selection_get(const Evas_Object *obj);
        [ :elm_entry_selection_get, [ :evas_object ], :string ],
        # EAPI Evas_Object * elm_entry_textblock_get(Evas_Object *obj);
        [ :elm_entry_textblock_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_entry_calc_force(Evas_Object *obj);
        [ :elm_entry_calc_force, [ :evas_object ], :void ],
        # EAPI void elm_entry_entry_insert(Evas_Object *obj, const char *entry);
        [ :elm_entry_entry_insert, [ :evas_object, :string ], :void ],
        # EAPI void elm_entry_line_wrap_set(Evas_Object *obj, Elm_Wrap_Type wrap);
        [ :elm_entry_line_wrap_set, [ :evas_object, :elm_wrap_type ], :void ],
        # EAPI Elm_Wrap_Type elm_entry_line_wrap_get(const Evas_Object *obj);
        [ :elm_entry_line_wrap_get, [ :evas_object ], :elm_wrap_type ],
        # EAPI void elm_entry_editable_set(Evas_Object *obj, Eina_Bool editable);
        [ :elm_entry_editable_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_entry_editable_get(const Evas_Object *obj);
        [ :elm_entry_editable_get, [ :evas_object ], :bool ],
        # EAPI void elm_entry_select_none(Evas_Object *obj);
        [ :elm_entry_select_none, [ :evas_object ], :void ],
        # EAPI void elm_entry_select_all(Evas_Object *obj);
        [ :elm_entry_select_all, [ :evas_object ], :void ],
        # EAPI Eina_Bool elm_entry_cursor_next(Evas_Object *obj);
        [ :elm_entry_cursor_next, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_entry_cursor_prev(Evas_Object *obj);
        [ :elm_entry_cursor_prev, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_entry_cursor_up(Evas_Object *obj);
        [ :elm_entry_cursor_up, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_entry_cursor_down(Evas_Object *obj);
        [ :elm_entry_cursor_down, [ :evas_object ], :bool ],
        # EAPI void elm_entry_cursor_begin_set(Evas_Object *obj);
        [ :elm_entry_cursor_begin_set, [ :evas_object ], :void ],
        # EAPI void elm_entry_cursor_end_set(Evas_Object *obj);
        [ :elm_entry_cursor_end_set, [ :evas_object ], :void ],
        # EAPI void elm_entry_cursor_line_begin_set(Evas_Object *obj);
        [ :elm_entry_cursor_line_begin_set, [ :evas_object ], :void ],
        # EAPI void elm_entry_cursor_line_end_set(Evas_Object *obj);
        [ :elm_entry_cursor_line_end_set, [ :evas_object ], :void ],
        # EAPI void elm_entry_cursor_selection_begin(Evas_Object *obj);
        [ :elm_entry_cursor_selection_begin, [ :evas_object ], :void ],
        # EAPI void elm_entry_cursor_selection_end(Evas_Object *obj);
        [ :elm_entry_cursor_selection_end, [ :evas_object ], :void ],
        # EAPI Eina_Bool elm_entry_cursor_is_format_get(const Evas_Object *obj);
        [ :elm_entry_cursor_is_format_get, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_entry_cursor_is_visible_format_get(const Evas_Object *obj);
        [ :elm_entry_cursor_is_visible_format_get, [ :evas_object ], :bool ],
        # EAPI char *elm_entry_cursor_content_get(const Evas_Object *obj);
        [ :elm_entry_cursor_content_get, [ :evas_object ], :string ],
        # EAPI Eina_Bool elm_entry_cursor_geometry_get(const Evas_Object *obj, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        [ :elm_entry_cursor_geometry_get, [ :evas_object, :pointer, :pointer, :pointer, :pointer ], :bool ],
        # EAPI void elm_entry_cursor_pos_set(Evas_Object *obj, int pos);
        [ :elm_entry_cursor_pos_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_entry_cursor_pos_get(const Evas_Object *obj);
        [ :elm_entry_cursor_pos_get, [ :evas_object ], :int ],
        # EAPI void elm_entry_selection_cut(Evas_Object *obj);
        [ :elm_entry_selection_cut, [ :evas_object ], :void ],
        # EAPI void elm_entry_selection_copy(Evas_Object *obj);
        [ :elm_entry_selection_copy, [ :evas_object ], :void ],
        # EAPI void elm_entry_selection_paste(Evas_Object *obj);
        [ :elm_entry_selection_paste, [ :evas_object ], :void ],
        # EAPI void elm_entry_context_menu_clear(Evas_Object *obj);
        [ :elm_entry_context_menu_clear, [ :evas_object ], :void ],
        # EAPI void elm_entry_context_menu_item_add(Evas_Object *obj, const char *label, const char *icon_file, Elm_Icon_Type icon_type, Evas_Smart_Cb func, const void *data);
        [ :elm_entry_context_menu_item_add, [ :evas_object, :string, :string, :elm_icon_type, :evas_smart_cb, :pointer ], :void ],
        # EAPI void elm_entry_context_menu_disabled_set(Evas_Object *obj, Eina_Bool disabled);
        [ :elm_entry_context_menu_disabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_entry_context_menu_disabled_get(const Evas_Object *obj);
        [ :elm_entry_context_menu_disabled_get, [ :evas_object ], :bool ],
        # EAPI void elm_entry_item_provider_append(Evas_Object *obj, Elm_Entry_Item_Provider_Cb func, void *data);
        [ :elm_entry_item_provider_append, [ :evas_object, :elm_entry_item_provider_cb, :pointer ], :void ],
        # EAPI void elm_entry_item_provider_prepend(Evas_Object *obj, Elm_Entry_Item_Provider_Cb func, void *data);
        [ :elm_entry_item_provider_prepend, [ :evas_object, :elm_entry_item_provider_cb, :pointer ], :void ],
        # EAPI void elm_entry_item_provider_remove(Evas_Object *obj, Elm_Entry_Item_Provider_Cb func, void *data);
        [ :elm_entry_item_provider_remove, [ :evas_object, :elm_entry_item_provider_cb, :pointer ], :void ],
        # EAPI void elm_entry_markup_filter_append(Evas_Object *obj, Elm_Entry_Filter_Cb func, void *data);
        [ :elm_entry_markup_filter_append, [ :evas_object, :elm_entry_filter_cb, :pointer ], :void ],
        # EAPI void elm_entry_markup_filter_prepend(Evas_Object *obj, Elm_Entry_Filter_Cb func, void *data);
        [ :elm_entry_markup_filter_prepend, [ :evas_object, :elm_entry_filter_cb, :pointer ], :void ],
        # EAPI void elm_entry_markup_filter_remove(Evas_Object *obj, Elm_Entry_Filter_Cb func, void *data);
        [ :elm_entry_markup_filter_remove, [ :evas_object, :elm_entry_filter_cb, :pointer ], :void ],
        # EAPI char *elm_entry_markup_to_utf8(const char *s);
        [ :elm_entry_markup_to_utf8, [ :string ], :string ],
        # EAPI char *elm_entry_utf8_to_markup(const char *s);
        [ :elm_entry_utf8_to_markup, [ :string ], :string ],
        # EAPI Eina_Bool elm_entry_file_set(Evas_Object *obj, const char *file, Elm_Text_Format format);
        [ :elm_entry_file_set, [ :evas_object, :string, :elm_text_format ], :bool ],
        # EAPI void elm_entry_file_get(const Evas_Object *obj, const char **file, Elm_Text_Format *format);
        [ :elm_entry_file_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_entry_file_save(Evas_Object *obj);
        [ :elm_entry_file_save, [ :evas_object ], :void ],
        # EAPI void elm_entry_autosave_set(Evas_Object *obj, Eina_Bool autosave);
        [ :elm_entry_autosave_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_entry_autosave_get(const Evas_Object *obj);
        [ :elm_entry_autosave_get, [ :evas_object ], :bool ],
        # EAPI void elm_entry_scrollable_set(Evas_Object *obj, Eina_Bool scroll);
        [ :elm_entry_scrollable_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_entry_scrollable_get(const Evas_Object *obj);
        [ :elm_entry_scrollable_get, [ :evas_object ], :bool ],
        # EAPI void elm_entry_icon_visible_set(Evas_Object *obj, Eina_Bool setting);
        [ :elm_entry_icon_visible_set, [ :evas_object, :bool ], :void ],
        # EAPI void elm_entry_end_visible_set(Evas_Object *obj, Eina_Bool setting);
        [ :elm_entry_end_visible_set, [ :evas_object, :bool ], :void ],
        # EAPI void elm_entry_scrollbar_policy_set(Evas_Object *obj, Elm_Scroller_Policy h, Elm_Scroller_Policy v);
        [ :elm_entry_scrollbar_policy_set, [ :evas_object, :elm_scroller_policy, :elm_scroller_policy ], :void ],
        # EAPI void elm_entry_bounce_set(Evas_Object *obj, Eina_Bool h_bounce, Eina_Bool v_bounce);
        [ :elm_entry_bounce_set, [ :evas_object, :bool, :bool ], :void ],
        # EAPI void elm_entry_bounce_get(const Evas_Object *obj, Eina_Bool *h_bounce, Eina_Bool *v_bounce);
        [ :elm_entry_bounce_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_entry_input_panel_layout_set(Evas_Object *obj, Elm_Input_Panel_Layout layout);
        [ :elm_entry_input_panel_layout_set, [ :evas_object, :elm_input_panel_layout ], :void ],
        # EAPI Elm_Input_Panel_Layout elm_entry_input_panel_layout_get(const Evas_Object *obj);
        [ :elm_entry_input_panel_layout_get, [ :evas_object ], :elm_input_panel_layout ],
        # EAPI void elm_entry_autocapital_type_set(Evas_Object *obj, Elm_Autocapital_Type autocapital_type);
        [ :elm_entry_autocapital_type_set, [ :evas_object, :elm_autocapital_type ], :void ],
        # EAPI Elm_Autocapital_Type elm_entry_autocapital_type_get(const Evas_Object *obj);
        [ :elm_entry_autocapital_type_get, [ :evas_object ], :elm_autocapital_type ],
        # EAPI void elm_entry_input_panel_enabled_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_entry_input_panel_enabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_entry_input_panel_enabled_get(const Evas_Object *obj);
        [ :elm_entry_input_panel_enabled_get, [ :evas_object ], :bool ],
        # EAPI void elm_entry_input_panel_show(Evas_Object *obj);
        [ :elm_entry_input_panel_show, [ :evas_object ], :void ],
        # EAPI void elm_entry_input_panel_hide(Evas_Object *obj);
        [ :elm_entry_input_panel_hide, [ :evas_object ], :void ],
        # EAPI void elm_entry_input_panel_language_set(Evas_Object *obj, Elm_Input_Panel_Lang lang);
        [ :elm_entry_input_panel_language_set, [ :evas_object, :elm_input_panel_lang ], :void ],
        # EAPI Elm_Input_Panel_Lang elm_entry_input_panel_language_get(const Evas_Object *obj);
        [ :elm_entry_input_panel_language_get, [ :evas_object ], :elm_input_panel_lang ],
        # EAPI void elm_entry_input_panel_imdata_set(Evas_Object *obj, const void *data, int len);
        [ :elm_entry_input_panel_imdata_set, [ :evas_object, :pointer, :int ], :void ],
        # EAPI void elm_entry_input_panel_imdata_get(const Evas_Object *obj, void *data, int *len);
        [ :elm_entry_input_panel_imdata_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_entry_input_panel_return_key_type_set(Evas_Object *obj, Elm_Input_Panel_Return_Key_Type return_key_type);
        [ :elm_entry_input_panel_return_key_type_set, [ :evas_object, :elm_input_panel_return_key_type ], :void ],
        # EAPI Elm_Input_Panel_Return_Key_Type elm_entry_input_panel_return_key_type_get(const Evas_Object *obj);
        [ :elm_entry_input_panel_return_key_type_get, [ :evas_object ], :elm_input_panel_return_key_type ],
        # EAPI void elm_entry_input_panel_return_key_disabled_set(Evas_Object *obj, Eina_Bool disabled);
        [ :elm_entry_input_panel_return_key_disabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_entry_input_panel_return_key_disabled_get(const Evas_Object *obj);
        [ :elm_entry_input_panel_return_key_disabled_get, [ :evas_object ], :bool ],
        # EAPI void elm_entry_input_panel_return_key_autoenabled_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_entry_input_panel_return_key_autoenabled_set, [ :evas_object, :bool ], :void ],
        # EAPI void elm_entry_imf_context_reset(Evas_Object *obj);
        [ :elm_entry_imf_context_reset, [ :evas_object ], :void ],
        # EAPI void elm_entry_prediction_allow_set(Evas_Object *obj, Eina_Bool prediction);
        [ :elm_entry_prediction_allow_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_entry_prediction_allow_get(const Evas_Object *obj);
        [ :elm_entry_prediction_allow_get, [ :evas_object ], :bool ],
        # EAPI void elm_entry_filter_limit_size(void *data, Evas_Object *entry, char **text);
        [ :elm_entry_filter_limit_size, [ :pointer, :evas_object, :pointer ], :void ],
        # EAPI void elm_entry_filter_accept_set(void *data, Evas_Object *entry, char **text);
        [ :elm_entry_filter_accept_set, [ :pointer, :evas_object, :pointer ], :void ],
        # EAPI void *elm_entry_imf_context_get(Evas_Object *obj);
        [ :elm_entry_imf_context_get, [ :evas_object ], :pointer ],
        # EAPI void elm_entry_cnp_mode_set(Evas_Object *obj, Elm_Cnp_Mode cnp_mode);
        [ :elm_entry_cnp_mode_set, [ :evas_object, :elm_cnp_mode ], :void ],
        # EAPI Elm_Cnp_Mode elm_entry_cnp_mode_get(const Evas_Object *obj);
        [ :elm_entry_cnp_mode_get, [ :evas_object ], :elm_cnp_mode ],
        # EAPI void elm_entry_anchor_hover_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_entry_anchor_hover_parent_set, [ :evas_object, :evas_object ], :void ],
        # EAPI Evas_Object *elm_entry_anchor_hover_parent_get(const Evas_Object *obj);
        [ :elm_entry_anchor_hover_parent_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_entry_anchor_hover_style_set(Evas_Object *obj, const char *style);
        [ :elm_entry_anchor_hover_style_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_entry_anchor_hover_style_get(const Evas_Object *obj);
        [ :elm_entry_anchor_hover_style_get, [ :evas_object ], :string ],
        # EAPI void elm_entry_anchor_hover_end(Evas_Object *obj);
        [ :elm_entry_anchor_hover_end, [ :evas_object ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
