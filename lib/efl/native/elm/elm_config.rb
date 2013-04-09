#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmConfig
        #
        FCT_PREFIX = 'elm_config_' unless const_defined? :FCT_PREFIX
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
        # typedef enum _Elm_Softcursor_Mode {...} Elm_Softcursor_Mode;
        enum :elm_softcursor_mode, [ :elm_softcursor_mode_auto, :elm_softcursor_mode_on, :elm_softcursor_mode_off ]
        #
        # TYPEDEFS
        # typedef struct _Elm_Text_Class Elm_Text_Class;
        typedef :pointer, :elm_text_class
        # typedef struct _Elm_Font_Overlay Elm_Font_Overlay;
        typedef :pointer, :elm_font_overlay
        #
        # FUNCTIONS
        fcts = [
        # EAPI Eina_Bool elm_config_save(void);
        [ :elm_config_save, [  ], :bool ],
        # EAPI void elm_config_reload(void);
        [ :elm_config_reload, [  ], :void ],
        # EAPI void elm_config_all_flush(void);
        [ :elm_config_all_flush, [  ], :void ],
        # EAPI const char *elm_config_profile_get(void);
        [ :elm_config_profile_get, [  ], :string ],
        # EAPI const char *elm_config_profile_dir_get(const char *profile, Eina_Bool is_user);
        [ :elm_config_profile_dir_get, [ :string, :bool ], :string ],
        # EAPI void elm_config_profile_dir_free(const char *p_dir);
        [ :elm_config_profile_dir_free, [ :string ], :void ],
        # EAPI Eina_List *elm_config_profile_list_get(void);
        [ :elm_config_profile_list_get, [  ], :eina_list ],
        # EAPI void elm_config_profile_list_free(Eina_List *l);
        [ :elm_config_profile_list_free, [ :eina_list ], :void ],
        # EAPI void elm_config_profile_set(const char *profile);
        [ :elm_config_profile_set, [ :string ], :void ],
        # EAPI Eina_Bool elm_config_scroll_bounce_enabled_get(void);
        [ :elm_config_scroll_bounce_enabled_get, [  ], :bool ],
        # EAPI void elm_config_scroll_bounce_enabled_set(Eina_Bool enabled);
        [ :elm_config_scroll_bounce_enabled_set, [ :bool ], :void ],
        # EAPI double elm_config_scroll_bounce_friction_get(void);
        [ :elm_config_scroll_bounce_friction_get, [  ], :double ],
        # EAPI void elm_config_scroll_bounce_friction_set(double friction);
        [ :elm_config_scroll_bounce_friction_set, [ :double ], :void ],
        # EAPI double elm_config_scroll_page_scroll_friction_get(void);
        [ :elm_config_scroll_page_scroll_friction_get, [  ], :double ],
        # EAPI void elm_config_scroll_page_scroll_friction_set(double friction);
        [ :elm_config_scroll_page_scroll_friction_set, [ :double ], :void ],
        # EAPI double elm_config_scroll_bring_in_scroll_friction_get(void);
        [ :elm_config_scroll_bring_in_scroll_friction_get, [  ], :double ],
        # EAPI void elm_config_scroll_bring_in_scroll_friction_set(double friction);
        [ :elm_config_scroll_bring_in_scroll_friction_set, [ :double ], :void ],
        # EAPI double elm_config_scroll_zoom_friction_get(void);
        [ :elm_config_scroll_zoom_friction_get, [  ], :double ],
        # EAPI void elm_config_scroll_zoom_friction_set(double friction);
        [ :elm_config_scroll_zoom_friction_set, [ :double ], :void ],
        # EAPI Eina_Bool elm_config_scroll_thumbscroll_enabled_get(void);
        [ :elm_config_scroll_thumbscroll_enabled_get, [  ], :bool ],
        # EAPI void elm_config_scroll_thumbscroll_enabled_set(Eina_Bool enabled);
        [ :elm_config_scroll_thumbscroll_enabled_set, [ :bool ], :void ],
        # EAPI unsigned int elm_config_scroll_thumbscroll_threshold_get(void);
        [ :elm_config_scroll_thumbscroll_threshold_get, [  ], :uint ],
        # EAPI void elm_config_scroll_thumbscroll_threshold_set(unsigned int threshold);
        [ :elm_config_scroll_thumbscroll_threshold_set, [ :uint ], :void ],
        # EAPI double elm_config_scroll_thumbscroll_momentum_threshold_get(void);
        [ :elm_config_scroll_thumbscroll_momentum_threshold_get, [  ], :double ],
        # EAPI void elm_config_scroll_thumbscroll_momentum_threshold_set(double threshold);
        [ :elm_config_scroll_thumbscroll_momentum_threshold_set, [ :double ], :void ],
        # EAPI double elm_config_scroll_thumbscroll_friction_get(void);
        [ :elm_config_scroll_thumbscroll_friction_get, [  ], :double ],
        # EAPI void elm_config_scroll_thumbscroll_friction_set(double friction);
        [ :elm_config_scroll_thumbscroll_friction_set, [ :double ], :void ],
        # EAPI double elm_config_scroll_thumbscroll_border_friction_get(void);
        [ :elm_config_scroll_thumbscroll_border_friction_get, [  ], :double ],
        # EAPI void elm_config_scroll_thumbscroll_border_friction_set(double friction);
        [ :elm_config_scroll_thumbscroll_border_friction_set, [ :double ], :void ],
        # EAPI double elm_config_scroll_thumbscroll_sensitivity_friction_get(void);
        [ :elm_config_scroll_thumbscroll_sensitivity_friction_get, [  ], :double ],
        # EAPI void elm_config_scroll_thumbscroll_sensitivity_friction_set(double friction);
        [ :elm_config_scroll_thumbscroll_sensitivity_friction_set, [ :double ], :void ],
        # EAPI double elm_config_longpress_timeout_get(void);
        [ :elm_config_longpress_timeout_get, [  ], :double ],
        # EAPI void elm_config_longpress_timeout_set(double longpress_timeout);
        [ :elm_config_longpress_timeout_set, [ :double ], :void ],
        # EAPI void elm_config_softcursor_mode_set(Elm_Softcursor_Mode mode);
        [ :elm_config_softcursor_mode_set, [ :elm_softcursor_mode ], :void ],
        # EAPI Elm_Softcursor_Mode elm_config_softcursor_mode_get(void);
        [ :elm_config_softcursor_mode_get, [  ], :elm_softcursor_mode ],
        # EAPI double elm_config_tooltip_delay_get(void);
        [ :elm_config_tooltip_delay_get, [  ], :double ],
        # EAPI void elm_config_tooltip_delay_set(double delay);
        [ :elm_config_tooltip_delay_set, [ :double ], :void ],
        # EAPI Eina_Bool elm_config_cursor_engine_only_get(void);
        [ :elm_config_cursor_engine_only_get, [  ], :bool ],
        # EAPI void elm_config_cursor_engine_only_set(Eina_Bool engine_only);
        [ :elm_config_cursor_engine_only_set, [ :bool ], :void ],
        # EAPI double elm_config_scale_get(void);
        [ :elm_config_scale_get, [  ], :double ],
        # EAPI void elm_config_scale_set(double scale);
        [ :elm_config_scale_set, [ :double ], :void ],
        # EAPI Eina_Bool elm_config_password_show_last_get(void);
        [ :elm_config_password_show_last_get, [  ], :bool ],
        # EAPI void elm_config_password_show_last_set(Eina_Bool password_show_last);
        [ :elm_config_password_show_last_set, [ :bool ], :void ],
        # EAPI double elm_config_password_show_last_timeout_get(void);
        [ :elm_config_password_show_last_timeout_get, [  ], :double ],
        # EAPI void elm_config_password_show_last_timeout_set(double password_show_last_timeout);
        [ :elm_config_password_show_last_timeout_set, [ :double ], :void ],
        # EAPI const char *elm_config_engine_get(void);
        [ :elm_config_engine_get, [  ], :string ],
        # EAPI void elm_config_engine_set(const char *engine);
        [ :elm_config_engine_set, [ :string ], :void ],
        # EAPI const char *elm_config_preferred_engine_get(void);
        [ :elm_config_preferred_engine_get, [  ], :string ],
        # EAPI void elm_config_preferred_engine_set(const char *engine);
        [ :elm_config_preferred_engine_set, [ :string ], :void ],
        # EAPI Eina_List *elm_config_text_classes_list_get(void);
        [ :elm_config_text_classes_list_get, [  ], :eina_list ],
        # EAPI void elm_config_text_classes_list_free(Eina_List *list);
        [ :elm_config_text_classes_list_free, [ :eina_list ], :void ],
        # EAPI const Eina_List *elm_config_font_overlay_list_get(void);
        [ :elm_config_font_overlay_list_get, [  ], :eina_list ],
        # EAPI void elm_config_font_overlay_set(const char *text_class, const char *font, Evas_Font_Size size);
        [ :elm_config_font_overlay_set, [ :string, :string, :int ], :void ],
        # EAPI Eina_Bool elm_config_access_get(void);
        [ :elm_config_access_get, [  ], :bool ],
        # EAPI void elm_config_access_set(Eina_Bool is_access);
        [ :elm_config_access_set, [ :bool ], :void ],
        # EAPI void elm_config_font_overlay_unset(const char *text_class);
        [ :elm_config_font_overlay_unset, [ :string ], :void ],
        # EAPI void elm_config_font_overlay_apply(void);
        [ :elm_config_font_overlay_apply, [  ], :void ],
        # EAPI Evas_Coord elm_config_finger_size_get(void);
        [ :elm_config_finger_size_get, [  ], :int ],
        # EAPI void elm_config_finger_size_set(Evas_Coord size);
        [ :elm_config_finger_size_set, [ :int ], :void ],
        # EAPI int elm_config_cache_flush_interval_get(void);
        [ :elm_config_cache_flush_interval_get, [  ], :int ],
        # EAPI void elm_config_cache_flush_interval_set(int size);
        [ :elm_config_cache_flush_interval_set, [ :int ], :void ],
        # EAPI Eina_Bool elm_config_cache_flush_enabled_get(void);
        [ :elm_config_cache_flush_enabled_get, [  ], :bool ],
        # EAPI void elm_config_cache_flush_enabled_set(Eina_Bool enabled);
        [ :elm_config_cache_flush_enabled_set, [ :bool ], :void ],
        # EAPI int elm_config_cache_font_cache_size_get(void);
        [ :elm_config_cache_font_cache_size_get, [  ], :int ],
        # EAPI void elm_config_cache_font_cache_size_set(int size);
        [ :elm_config_cache_font_cache_size_set, [ :int ], :void ],
        # EAPI int elm_config_cache_image_cache_size_get(void);
        [ :elm_config_cache_image_cache_size_get, [  ], :int ],
        # EAPI void elm_config_cache_image_cache_size_set(int size);
        [ :elm_config_cache_image_cache_size_set, [ :int ], :void ],
        # EAPI int elm_config_cache_edje_file_cache_size_get(void);
        [ :elm_config_cache_edje_file_cache_size_get, [  ], :int ],
        # EAPI void elm_config_cache_edje_file_cache_size_set(int size);
        [ :elm_config_cache_edje_file_cache_size_set, [ :int ], :void ],
        # EAPI int elm_config_cache_edje_collection_cache_size_get(void);
        [ :elm_config_cache_edje_collection_cache_size_get, [  ], :int ],
        # EAPI void elm_config_cache_edje_collection_cache_size_set(int size);
        [ :elm_config_cache_edje_collection_cache_size_set, [ :int ], :void ],
        # EAPI Eina_Bool elm_config_focus_highlight_enabled_get(void);
        [ :elm_config_focus_highlight_enabled_get, [  ], :bool ],
        # EAPI void elm_config_focus_highlight_enabled_set(Eina_Bool enable);
        [ :elm_config_focus_highlight_enabled_set, [ :bool ], :void ],
        # EAPI Eina_Bool elm_config_focus_highlight_animate_get(void);
        [ :elm_config_focus_highlight_animate_get, [  ], :bool ],
        # EAPI void elm_config_focus_highlight_animate_set(Eina_Bool animate);
        [ :elm_config_focus_highlight_animate_set, [ :bool ], :void ],
        # EAPI Eina_Bool elm_config_mirrored_get(void);
        [ :elm_config_mirrored_get, [  ], :bool ],
        # EAPI void elm_config_mirrored_set(Eina_Bool mirrored);
        [ :elm_config_mirrored_set, [ :bool ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
