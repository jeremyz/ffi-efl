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
        ffi_lib 'elementary-ver-pre-svn-09.so.0'
        #
        # FUNCTIONS
        fcts = [
        # EAPI Eina_Bool elm_config_save(void);
        [ :elm_config_save, [  ], :bool ],
        # EAPI void elm_config_reload(void);
        [ :elm_config_reload, [  ], :void ],
        # EAPI void elm_config_all_flush(void);
        [ :elm_config_all_flush, [  ], :void ],
        # EAPI const char *elm_profile_current_get(void);
        [ :elm_profile_current_get, [  ], :string ],
        # EAPI const char *elm_profile_dir_get(const char *profile, Eina_Bool is_user);
        [ :elm_profile_dir_get, [ :string, :bool ], :string ],
        # EAPI void elm_profile_dir_free(const char *p_dir);
        [ :elm_profile_dir_free, [ :string ], :void ],
        # EAPI Eina_List *elm_profile_list_get(void);
        [ :elm_profile_list_get, [  ], :eina_list ],
        # EAPI void elm_profile_list_free(Eina_List *l);
        [ :elm_profile_list_free, [ :eina_list ], :void ],
        # EAPI void elm_profile_set(const char *profile);
        [ :elm_profile_set, [ :string ], :void ],
        # EAPI Eina_Bool elm_scroll_bounce_enabled_get(void);
        [ :elm_scroll_bounce_enabled_get, [  ], :bool ],
        # EAPI void elm_scroll_bounce_enabled_set(Eina_Bool enabled);
        [ :elm_scroll_bounce_enabled_set, [ :bool ], :void ],
        # EAPI double elm_scroll_bounce_friction_get(void);
        [ :elm_scroll_bounce_friction_get, [  ], :double ],
        # EAPI void elm_scroll_bounce_friction_set(double friction);
        [ :elm_scroll_bounce_friction_set, [ :double ], :void ],
        # EAPI double elm_scroll_page_scroll_friction_get(void);
        [ :elm_scroll_page_scroll_friction_get, [  ], :double ],
        # EAPI void elm_scroll_page_scroll_friction_set(double friction);
        [ :elm_scroll_page_scroll_friction_set, [ :double ], :void ],
        # EAPI double elm_scroll_bring_in_scroll_friction_get(void);
        [ :elm_scroll_bring_in_scroll_friction_get, [  ], :double ],
        # EAPI void elm_scroll_bring_in_scroll_friction_set(double friction);
        [ :elm_scroll_bring_in_scroll_friction_set, [ :double ], :void ],
        # EAPI double elm_scroll_zoom_friction_get(void);
        [ :elm_scroll_zoom_friction_get, [  ], :double ],
        # EAPI void elm_scroll_zoom_friction_set(double friction);
        [ :elm_scroll_zoom_friction_set, [ :double ], :void ],
        # EAPI Eina_Bool elm_scroll_thumbscroll_enabled_get(void);
        [ :elm_scroll_thumbscroll_enabled_get, [  ], :bool ],
        # EAPI void elm_scroll_thumbscroll_enabled_set(Eina_Bool enabled);
        [ :elm_scroll_thumbscroll_enabled_set, [ :bool ], :void ],
        # EAPI unsigned int elm_scroll_thumbscroll_threshold_get(void);
        [ :elm_scroll_thumbscroll_threshold_get, [  ], :uint ],
        # EAPI void elm_scroll_thumbscroll_threshold_set(unsigned int threshold);
        [ :elm_scroll_thumbscroll_threshold_set, [ :uint ], :void ],
        # EAPI double elm_scroll_thumbscroll_momentum_threshold_get(void);
        [ :elm_scroll_thumbscroll_momentum_threshold_get, [  ], :double ],
        # EAPI void elm_scroll_thumbscroll_momentum_threshold_set(double threshold);
        [ :elm_scroll_thumbscroll_momentum_threshold_set, [ :double ], :void ],
        # EAPI double elm_scroll_thumbscroll_friction_get(void);
        [ :elm_scroll_thumbscroll_friction_get, [  ], :double ],
        # EAPI void elm_scroll_thumbscroll_friction_set(double friction);
        [ :elm_scroll_thumbscroll_friction_set, [ :double ], :void ],
        # EAPI double elm_scroll_thumbscroll_border_friction_get(void);
        [ :elm_scroll_thumbscroll_border_friction_get, [  ], :double ],
        # EAPI void elm_scroll_thumbscroll_border_friction_set(double friction);
        [ :elm_scroll_thumbscroll_border_friction_set, [ :double ], :void ],
        # EAPI double elm_scroll_thumbscroll_sensitivity_friction_get(void);
        [ :elm_scroll_thumbscroll_sensitivity_friction_get, [  ], :double ],
        # EAPI void elm_scroll_thumbscroll_sensitivity_friction_set(double friction);
        [ :elm_scroll_thumbscroll_sensitivity_friction_set, [ :double ], :void ],
        # EAPI double elm_longpress_timeout_get(void);
        [ :elm_longpress_timeout_get, [  ], :double ],
        # EAPI void elm_longpress_timeout_set(double longpress_timeout);
        [ :elm_longpress_timeout_set, [ :double ], :void ],
        # EAPI double elm_config_tooltip_delay_get(void);
        [ :elm_config_tooltip_delay_get, [  ], :double ],
        # EAPI Eina_Bool elm_config_tooltip_delay_set(double delay);
        [ :elm_config_tooltip_delay_set, [ :double ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
