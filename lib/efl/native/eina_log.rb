#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi'
#
module Efl
    #
    module EinaLog
        #
        FCT_PREFIX = 'eina_log_'
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
        ffi_lib 'eina'
        #
        # ENUMS
        # typedef enum _Eina_Log_Level {...} Eina_Log_Level;
        enum :eina_log_level, [ :eina_log_level_critical, :eina_log_level_err, :eina_log_level_warn, :eina_log_level_info, :eina_log_level_dbg, :eina_log_levels,
            :eina_log_level_unknown ]
        #
        # TYPEDEFS
        # typedef struct _Eina_Log_Domain Eina_Log_Domain;
        typedef :pointer, :eina_log_domain
        typedef :pointer, :eina_log_domain_p
        #
        # CALLBACKS
        # typedef void (*Eina_Log_Print_Cb) (const Eina_Log_Domain *d, Eina_Log_Level level, const char *file, const char *fnc, int line, const char *fmt, void *data, va_list args);
        callback :eina_log_print_cb, [ :eina_log_domain_p, :eina_log_level, :string, :string, :int, :string, :void_p, :pointer ], :void
        #
        # VARIABLES
        # EAPI extern int EINA_LOG_DOMAIN_GLOBAL;
        attach_variable :EINA_LOG_DOMAIN_GLOBAL, :int
        #
        # FUNCTIONS
        fcts = [
        # EAPI void eina_log_threads_enable(void);
        [ :eina_log_threads_enable, [  ], :void ],
        # EAPI void eina_log_print_cb_set(Eina_Log_Print_Cb cb, void *data);
        [ :eina_log_print_cb_set, [ :eina_log_print_cb, :void_p ], :void ],
        # EAPI void eina_log_level_set(int level);
        [ :eina_log_level_set, [ :int ], :void ],
        # EAPI int eina_log_level_get(void);
        [ :eina_log_level_get, [  ], :int ],
        # EAPI Eina_Bool eina_log_main_thread_check(void);
        [ :eina_log_main_thread_check, [  ], :eina_bool ],
        # EAPI void eina_log_color_disable_set(Eina_Bool disabled);
        [ :eina_log_color_disable_set, [ :eina_bool ], :void ],
        # EAPI Eina_Bool eina_log_color_disable_get(void);
        [ :eina_log_color_disable_get, [  ], :eina_bool ],
        # EAPI void eina_log_file_disable_set(Eina_Bool disabled);
        [ :eina_log_file_disable_set, [ :eina_bool ], :void ],
        # EAPI Eina_Bool eina_log_file_disable_get(void);
        [ :eina_log_file_disable_get, [  ], :eina_bool ],
        # EAPI void eina_log_function_disable_set(Eina_Bool disabled);
        [ :eina_log_function_disable_set, [ :eina_bool ], :void ],
        # EAPI Eina_Bool eina_log_function_disable_get(void);
        [ :eina_log_function_disable_get, [  ], :eina_bool ],
        # EAPI void eina_log_abort_on_critical_set(Eina_Bool abort_on_critical);
        [ :eina_log_abort_on_critical_set, [ :eina_bool ], :void ],
        # EAPI Eina_Bool eina_log_abort_on_critical_get(void);
        [ :eina_log_abort_on_critical_get, [  ], :eina_bool ],
        # EAPI void eina_log_abort_on_critical_level_set(int critical_level);
        [ :eina_log_abort_on_critical_level_set, [ :int ], :void ],
        # EAPI int eina_log_abort_on_critical_level_get(void);
        [ :eina_log_abort_on_critical_level_get, [  ], :int ],
        # EAPI void eina_log_domain_level_set(const char *domain_name, int level);
        [ :eina_log_domain_level_set, [ :string, :int ], :void ],
        # EAPI int eina_log_domain_level_get(const char *domain_name);
        [ :eina_log_domain_level_get, [ :string ], :int ],
        # EAPI int eina_log_domain_registered_level_get(int domain);
        [ :eina_log_domain_registered_level_get, [ :int ], :int ],
        # EAPI int eina_log_domain_register(const char *name, const char *color);
        [ :eina_log_domain_register, [ :string, :string ], :int ],
        # EAPI void eina_log_domain_unregister(int domain);
        [ :eina_log_domain_unregister, [ :int ], :void ],
        # EAPI void eina_log_print(int domain, Eina_Log_Level level, const char *file, const char *function, int line, const char *fmt, ...);
        [ :eina_log_print, [ :int, :eina_log_level, :string, :string, :int, :string, :varargs ], :void ],
        # EAPI void eina_log_vprint(int domain, Eina_Log_Level level, const char *file, const char *fnc, int line, const char *fmt, va_list args);
        [ :eina_log_vprint, [ :int, :eina_log_level, :string, :string, :int, :string, :pointer ], :void ],
        # EAPI void eina_log_print_cb_stdout(const Eina_Log_Domain *d, Eina_Log_Level level, const char *file, const char *fnc, int line, const char *fmt, void *data, va_list args);
        [ :eina_log_print_cb_stdout, [ :eina_log_domain_p, :eina_log_level, :string, :string, :int, :string, :void_p, :pointer ], :void ],
        # EAPI void eina_log_print_cb_stderr(const Eina_Log_Domain *d, Eina_Log_Level level, const char *file, const char *fnc, int line, const char *fmt, void *data, va_list args);
        [ :eina_log_print_cb_stderr, [ :eina_log_domain_p, :eina_log_level, :string, :string, :int, :string, :void_p, :pointer ], :void ],
        # EAPI void eina_log_print_cb_file(const Eina_Log_Domain *d, Eina_Log_Level level, const char *file, const char *fnc, int line, const char *fmt, void *data, va_list args);
        [ :eina_log_print_cb_file, [ :eina_log_domain_p, :eina_log_level, :string, :string, :int, :string, :void_p, :pointer ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
