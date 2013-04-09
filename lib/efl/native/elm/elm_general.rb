#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/evas'
require 'efl/native/elementary'
#
module Efl
    #
    module Elm
        #
        FCT_PREFIX = 'elm_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Object_Layer;
        enum :elm_object_layer, [ :elm_object_layer_background, EVAS_LAYER_MIN+64, :elm_object_layer_default, 0, :elm_object_layer_focus,
            EVAS_LAYER_MAX-128, :elm_object_layer_tooltip, EVAS_LAYER_MAX-64, :elm_object_layer_cursor, EVAS_LAYER_MAX-32, :elm_object_layer_last, 32736 ]
        # typedef enum {...} Elm_Policy;
        enum :elm_policy, [ :elm_policy_quit, :elm_policy_last ]
        # typedef enum {...} Elm_Policy_Quit;
        enum :elm_policy_quit, [ :elm_policy_quit_none, 0, :elm_policy_quit_last_window_closed, 1 ]
        # typedef enum {...} Elm_Focus_Direction;
        enum :elm_focus_direction, [ :elm_focus_previous, :elm_focus_next ]
        # typedef enum {...} Elm_Object_Select_Mode;
        enum :elm_object_select_mode, [ :elm_object_select_mode_default, 0, :elm_object_select_mode_always, 1, :elm_object_select_mode_none, 2,
            :elm_object_select_mode_display_only, 3, :elm_object_select_mode_max, 4 ]
        #
        # TYPEDEFS
        # typedef struct _Elm_Event_Policy_Changed Elm_Event_Policy_Changed;
        typedef :pointer, :elm_event_policy_changed
        # typedef struct _Elm_Object_Item Elm_Object_Item;
        typedef :pointer, :elm_object_item
        #
        # CALLBACKS
        # typedef Eina_Bool (*Elm_Event_Cb) (void *data, Evas_Object *obj, Evas_Object *src, Evas_Callback_Type type, void *event_info);
        callback :elm_event_cb, [ :pointer, :evas_object, :evas_object, :evas_callback_type, :pointer ], :bool
        #
        # VARIABLES
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
        [ :elm_init, [ :int, :pointer ], :int ],
        # EAPI int elm_shutdown(void);
        [ :elm_shutdown, [  ], :int ],
        # EAPI void elm_run(void);
        [ :elm_run, [  ], :void ],
        # EAPI void elm_exit(void);
        [ :elm_exit, [  ], :void ],
        # EAPI void elm_quicklaunch_mode_set(Eina_Bool ql_on);
        [ :elm_quicklaunch_mode_set, [ :bool ], :void ],
        # EAPI Eina_Bool elm_quicklaunch_mode_get(void);
        [ :elm_quicklaunch_mode_get, [  ], :bool ],
        # EAPI int elm_quicklaunch_init(int argc, char **argv);
        [ :elm_quicklaunch_init, [ :int, :pointer ], :int ],
        # EAPI int elm_quicklaunch_sub_init(int argc, char **argv);
        [ :elm_quicklaunch_sub_init, [ :int, :pointer ], :int ],
        # EAPI int elm_quicklaunch_sub_shutdown(void);
        [ :elm_quicklaunch_sub_shutdown, [  ], :int ],
        # EAPI int elm_quicklaunch_shutdown(void);
        [ :elm_quicklaunch_shutdown, [  ], :int ],
        # EAPI void elm_quicklaunch_seed(void);
        [ :elm_quicklaunch_seed, [  ], :void ],
        # EAPI Eina_Bool elm_quicklaunch_prepare(int argc, char **argv);
        [ :elm_quicklaunch_prepare, [ :int, :pointer ], :bool ],
        # EAPI Eina_Bool elm_quicklaunch_fork(int argc, char **argv, char *cwd, void (postfork_func) (void *data), void *postfork_data);
        [ :elm_quicklaunch_fork, [ :int, :pointer, :string, (callback [:pointer], :void), :pointer], :bool ],
        # EAPI void elm_quicklaunch_cleanup(void);
        [ :elm_quicklaunch_cleanup, [  ], :void ],
        # EAPI int elm_quicklaunch_fallback(int argc, char **argv);
        [ :elm_quicklaunch_fallback, [ :int, :pointer ], :int ],
        # EAPI char *elm_quicklaunch_exe_path_get(const char *exe);
        [ :elm_quicklaunch_exe_path_get, [ :string ], :string ],
        # EAPI Eina_Bool elm_policy_set(unsigned int policy, int value);
        [ :elm_policy_set, [ :uint, :int ], :bool ],
        # EAPI int elm_policy_get(unsigned int policy);
        [ :elm_policy_get, [ :uint ], :int ],
        # EAPI void elm_language_set(const char *lang);
        [ :elm_language_set, [ :string ], :void ],
        # EAPI void elm_object_domain_translatable_text_part_set(Evas_Object *obj, const char *part, const char *domain, const char *text);
        [ :elm_object_domain_translatable_text_part_set, [ :evas_object, :string, :string, :string ], :void ],
        # EAPI const char *elm_object_translatable_text_part_get(const Evas_Object *obj, const char *part);
        [ :elm_object_translatable_text_part_get, [ :evas_object, :string ], :string ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
