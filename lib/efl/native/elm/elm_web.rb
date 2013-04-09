#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmWeb
        #
        FCT_PREFIX = 'elm_web_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Web_Menu_Item_Type;
        enum :elm_web_menu_item_type, [ :elm_web_menu_separator, :elm_web_menu_group, :elm_web_menu_option ]
        # typedef enum {...} Elm_Web_Zoom_Mode;
        enum :elm_web_zoom_mode, [ :elm_web_zoom_mode_manual, 0, :elm_web_zoom_mode_auto_fit, 1, :elm_web_zoom_mode_auto_fill, 2,
            :elm_web_zoom_mode_last, 3 ]
        # typedef enum {...} Elm_Web_Window_Feature_Flag;
        enum :elm_web_window_feature_flag, [ :elm_web_window_feature_toolbar, :elm_web_window_feature_statusbar, :elm_web_window_feature_scrollbars,
            :elm_web_window_feature_menubar, :elm_web_window_feature_locationbar, :elm_web_window_feature_fullscreen ]
        #
        # TYPEDEFS
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
        #
        # CALLBACKS
        # typedef Evas_Object *(*Elm_Web_Window_Open) (void *data, Evas_Object *obj, Eina_Bool js, const Elm_Web_Window_Features *window_features);
        callback :elm_web_window_open_cb, [ :pointer, :evas_object, :bool, :elm_web_window_features ], :evas_object
        # typedef Evas_Object *(*Elm_Web_Dialog_Alert) (void *data, Evas_Object *obj, const char *message);
        callback :elm_web_dialog_alert_cb, [ :pointer, :evas_object, :string ], :evas_object
        # typedef Evas_Object *(*Elm_Web_Dialog_Confirm) (void *data, Evas_Object *obj, const char *message, Eina_Bool *ret);
        callback :elm_web_dialog_confirm_cb, [ :pointer, :evas_object, :string, :pointer ], :evas_object
        # typedef Evas_Object *(*Elm_Web_Dialog_Prompt) (void *data, Evas_Object *obj, const char *message, const char *def_value, const char **value, Eina_Bool *ret);
        callback :elm_web_dialog_prompt_cb, [ :pointer, :evas_object, :string, :string, :pointer, :pointer ], :evas_object
        # typedef Evas_Object *(*Elm_Web_Dialog_File_Selector) (void *data, Evas_Object *obj, Eina_Bool allows_multiple, Eina_List *accept_types, Eina_List **selected, Eina_Bool *ret);
        callback :elm_web_dialog_file_selector_cb, [ :pointer, :evas_object, :bool, :eina_list, :eina_list, :pointer ], :evas_object
        # typedef void (*Elm_Web_Console_Message) (void *data, Evas_Object *obj, const char *message, unsigned int line_number, const char *source_id);
        callback :elm_web_console_message_cb, [ :pointer, :evas_object, :string, :uint, :string ], :void
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_web_add(Evas_Object *parent);
        [ :elm_web_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_web_useragent_set(Evas_Object *obj, const char *user_agent);
        [ :elm_web_useragent_set, [ :evas_object, :string ], :void ],
        # EAPI const char* elm_web_useragent_get(const Evas_Object *obj);
        [ :elm_web_useragent_get, [ :evas_object ], :pointer ],
        # EAPI Evas_Object *elm_web_webkit_view_get(const Evas_Object *obj);
        [ :elm_web_webkit_view_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_web_window_create_hook_set(Evas_Object *obj, Elm_Web_Window_Open func, void *data);
        [ :elm_web_window_create_hook_set, [ :evas_object, :elm_web_window_open_cb, :pointer ], :void ],
        # EAPI void elm_web_dialog_alert_hook_set(Evas_Object *obj, Elm_Web_Dialog_Alert func, void *data);
        [ :elm_web_dialog_alert_hook_set, [ :evas_object, :elm_web_dialog_alert_cb, :pointer ], :void ],
        # EAPI void elm_web_dialog_confirm_hook_set(Evas_Object *obj, Elm_Web_Dialog_Confirm func, void *data);
        [ :elm_web_dialog_confirm_hook_set, [ :evas_object, :elm_web_dialog_confirm_cb, :pointer ], :void ],
        # EAPI void elm_web_dialog_prompt_hook_set(Evas_Object *obj, Elm_Web_Dialog_Prompt func, void *data);
        [ :elm_web_dialog_prompt_hook_set, [ :evas_object, :elm_web_dialog_prompt_cb, :pointer ], :void ],
        # EAPI void elm_web_dialog_file_selector_hook_set(Evas_Object *obj, Elm_Web_Dialog_File_Selector func, void *data);
        [ :elm_web_dialog_file_selector_hook_set, [ :evas_object, :elm_web_dialog_file_selector_cb, :pointer ], :void ],
        # EAPI void elm_web_console_message_hook_set(Evas_Object *obj, Elm_Web_Console_Message func, void *data);
        [ :elm_web_console_message_hook_set, [ :evas_object, :elm_web_console_message_cb, :pointer ], :void ],
        # EAPI Eina_Bool elm_web_tab_propagate_get(const Evas_Object *obj);
        [ :elm_web_tab_propagate_get, [ :evas_object ], :bool ],
        # EAPI void elm_web_tab_propagate_set(Evas_Object *obj, Eina_Bool propagate);
        [ :elm_web_tab_propagate_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_web_uri_set(Evas_Object *obj, const char *uri);
        [ :elm_web_uri_set, [ :evas_object, :string ], :bool ],
        # EAPI const char *elm_web_uri_get(const Evas_Object *obj);
        [ :elm_web_uri_get, [ :evas_object ], :string ],
        # EAPI const char *elm_web_title_get(const Evas_Object *obj);
        [ :elm_web_title_get, [ :evas_object ], :string ],
        # EAPI void elm_web_bg_color_set(Evas_Object *obj, int r, int g, int b, int a);
        [ :elm_web_bg_color_set, [ :evas_object, :int, :int, :int, :int ], :void ],
        # EAPI void elm_web_bg_color_get(const Evas_Object *obj, int *r, int *g, int *b, int *a);
        [ :elm_web_bg_color_get, [ :evas_object, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI const char *elm_web_selection_get(const Evas_Object *obj);
        [ :elm_web_selection_get, [ :evas_object ], :string ],
        # EAPI void elm_web_popup_selected_set(Evas_Object *obj, int index);
        [ :elm_web_popup_selected_set, [ :evas_object, :int ], :void ],
        # EAPI Eina_Bool elm_web_popup_destroy(Evas_Object *obj);
        [ :elm_web_popup_destroy, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_web_text_search(const Evas_Object *obj, const char *string, Eina_Bool case_sensitive, Eina_Bool forward, Eina_Bool wrap);
        [ :elm_web_text_search, [ :evas_object, :string, :bool, :bool, :bool ], :bool ],
        # EAPI unsigned int elm_web_text_matches_mark(Evas_Object *obj, const char *string, Eina_Bool case_sensitive, Eina_Bool highlight, unsigned int limit);
        [ :elm_web_text_matches_mark, [ :evas_object, :string, :bool, :bool, :uint ], :uint ],
        # EAPI Eina_Bool elm_web_text_matches_unmark_all(Evas_Object *obj);
        [ :elm_web_text_matches_unmark_all, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_web_text_matches_highlight_set(Evas_Object *obj, Eina_Bool highlight);
        [ :elm_web_text_matches_highlight_set, [ :evas_object, :bool ], :bool ],
        # EAPI Eina_Bool elm_web_text_matches_highlight_get(const Evas_Object *obj);
        [ :elm_web_text_matches_highlight_get, [ :evas_object ], :bool ],
        # EAPI double elm_web_load_progress_get(const Evas_Object *obj);
        [ :elm_web_load_progress_get, [ :evas_object ], :double ],
        # EAPI Eina_Bool elm_web_stop(Evas_Object *obj);
        [ :elm_web_stop, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_web_reload(Evas_Object *obj);
        [ :elm_web_reload, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_web_reload_full(Evas_Object *obj);
        [ :elm_web_reload_full, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_web_back(Evas_Object *obj);
        [ :elm_web_back, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_web_forward(Evas_Object *obj);
        [ :elm_web_forward, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_web_navigate(Evas_Object *obj, int steps);
        [ :elm_web_navigate, [ :evas_object, :int ], :bool ],
        # EAPI Eina_Bool elm_web_back_possible_get(Evas_Object *obj);
        [ :elm_web_back_possible_get, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_web_forward_possible_get(Evas_Object *obj);
        [ :elm_web_forward_possible_get, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_web_navigate_possible_get(Evas_Object *obj, int steps);
        [ :elm_web_navigate_possible_get, [ :evas_object, :int ], :bool ],
        # EAPI Eina_Bool elm_web_history_enabled_get(const Evas_Object *obj);
        [ :elm_web_history_enabled_get, [ :evas_object ], :bool ],
        # EAPI void elm_web_history_enabled_set(Evas_Object *obj, Eina_Bool enabled);
        [ :elm_web_history_enabled_set, [ :evas_object, :bool ], :void ],
        # EAPI void elm_web_zoom_set(Evas_Object *obj, double zoom);
        [ :elm_web_zoom_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_web_zoom_get(const Evas_Object *obj);
        [ :elm_web_zoom_get, [ :evas_object ], :double ],
        # EAPI void elm_web_zoom_mode_set(Evas_Object *obj, Elm_Web_Zoom_Mode mode);
        [ :elm_web_zoom_mode_set, [ :evas_object, :elm_web_zoom_mode ], :void ],
        # EAPI Elm_Web_Zoom_Mode elm_web_zoom_mode_get(const Evas_Object *obj);
        [ :elm_web_zoom_mode_get, [ :evas_object ], :elm_web_zoom_mode ],
        # EAPI void elm_web_region_show(Evas_Object *obj, int x, int y, int w, int h);
        [ :elm_web_region_show, [ :evas_object, :int, :int, :int, :int ], :void ],
        # EAPI void elm_web_region_bring_in(Evas_Object *obj, int x, int y, int w, int h);
        [ :elm_web_region_bring_in, [ :evas_object, :int, :int, :int, :int ], :void ],
        # EAPI void elm_web_inwin_mode_set(Evas_Object *obj, Eina_Bool value);
        [ :elm_web_inwin_mode_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_web_inwin_mode_get(const Evas_Object *obj);
        [ :elm_web_inwin_mode_get, [ :evas_object ], :bool ],
        # EAPI void elm_web_window_features_ref(Elm_Web_Window_Features *wf);
        [ :elm_web_window_features_ref, [ :elm_web_window_features ], :void ],
        # EAPI void elm_web_window_features_unref(Elm_Web_Window_Features *wf);
        [ :elm_web_window_features_unref, [ :elm_web_window_features ], :void ],
        # EAPI Eina_Bool elm_web_window_features_property_get(const Elm_Web_Window_Features *wf, Elm_Web_Window_Feature_Flag flag);
        [ :elm_web_window_features_property_get, [ :elm_web_window_features, :elm_web_window_feature_flag ], :bool ],
        # EAPI void elm_web_window_features_region_get(const Elm_Web_Window_Features *wf, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        [ :elm_web_window_features_region_get, [ :elm_web_window_features, :pointer, :pointer, :pointer, :pointer ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
