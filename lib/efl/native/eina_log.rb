#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module EinaLog
        #
        FCT_PREFIX = 'eina_log_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'eina.so.1'
        #
        # ENUMS
        # typedef enum _Eina_Log_Level {...} Eina_Log_Level;
        enum :eina_log_level, [ :eina_log_level_critical, 0, :eina_log_level_err, 1, :eina_log_level_warn, 2, :eina_log_level_info, 3,
            :eina_log_level_dbg, 4, :eina_log_levels, 5, :eina_log_level_unknown, (-2147483647-1) ]
        #
        # TYPEDEFS
        # typedef struct _Eina_Log_Domain Eina_Log_Domain;
        typedef :pointer, :eina_log_domain
        #
        # CALLBACKS
        # typedef void (*Eina_Log_Print_Cb) (const Eina_Log_Domain *d, Eina_Log_Level level, const char *file, const char *fnc, int line, const char *fmt, void *data, va_list args);
        callback :eina_log_print_cb, [ :eina_log_domain, :eina_log_level, :string, :string, :int, :string, :pointer, :pointer ], :void
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
        [ :eina_log_print_cb_set, [ :eina_log_print_cb, :pointer ], :void ],
        # EAPI void eina_log_level_set(int level);
        [ :eina_log_level_set, [ :int ], :void ],
        # EAPI int eina_log_level_get(void);
        [ :eina_log_level_get, [  ], :int ],
        # EAPI Eina_Bool eina_log_main_thread_check(void);
        [ :eina_log_main_thread_check, [  ], :bool ],
        # EAPI void eina_log_color_disable_set(Eina_Bool disabled);
        [ :eina_log_color_disable_set, [ :bool ], :void ],
        # EAPI Eina_Bool eina_log_color_disable_get(void);
        [ :eina_log_color_disable_get, [  ], :bool ],
        # EAPI void eina_log_file_disable_set(Eina_Bool disabled);
        [ :eina_log_file_disable_set, [ :bool ], :void ],
        # EAPI Eina_Bool eina_log_file_disable_get(void);
        [ :eina_log_file_disable_get, [  ], :bool ],
        # EAPI void eina_log_function_disable_set(Eina_Bool disabled);
        [ :eina_log_function_disable_set, [ :bool ], :void ],
        # EAPI Eina_Bool eina_log_function_disable_get(void);
        [ :eina_log_function_disable_get, [  ], :bool ],
        # EAPI void eina_log_abort_on_critical_set(Eina_Bool abort_on_critical);
        [ :eina_log_abort_on_critical_set, [ :bool ], :void ],
        # EAPI Eina_Bool eina_log_abort_on_critical_get(void);
        [ :eina_log_abort_on_critical_get, [  ], :bool ],
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
        [ :eina_log_print_cb_stdout, [ :eina_log_domain, :eina_log_level, :string, :string, :int, :string, :pointer, :pointer ], :void ],
        # EAPI void eina_log_print_cb_stderr(const Eina_Log_Domain *d, Eina_Log_Level level, const char *file, const char *fnc, int line, const char *fmt, void *data, va_list args);
        [ :eina_log_print_cb_stderr, [ :eina_log_domain, :eina_log_level, :string, :string, :int, :string, :pointer, :pointer ], :void ],
        # EAPI void eina_log_print_cb_file(const Eina_Log_Domain *d, Eina_Log_Level level, const char *file, const char *fnc, int line, const char *fmt, void *data, va_list args);
        [ :eina_log_print_cb_file, [ :eina_log_domain, :eina_log_level, :string, :string, :int, :string, :pointer, :pointer ], :void ],
        # EAPI void eina_log_console_color_set(FILE *fp, const char *color);
        [ :eina_log_console_color_set, [ :pointer, :string ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
