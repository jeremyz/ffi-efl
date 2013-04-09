#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/eina_list'
#
module Efl
    #
    module EfreetDesktop
        #
        FCT_PREFIX = 'efreet_desktop_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'efreet.so.1'
        #
        # TYPEDEFS
        # typedef struct _Efreet_Desktop Efreet_Desktop;
        typedef :pointer, :efreet_desktop
        #
        # CALLBACKS
        # typedef void *(*Efreet_Desktop_Command_Cb) (void *data, Efreet_Desktop *desktop, char *command, int remaining);
        callback :efreet_desktop_command_cb, [ :pointer, :efreet_desktop, :string, :int ], :pointer
        # typedef int (*Efreet_Desktop_Progress_Cb) (void *data, Efreet_Desktop *desktop, char *uri, long int total, long int current);
        callback :efreet_desktop_progress_cb, [ :pointer, :efreet_desktop, :string, :long, :long ], :int
        # typedef void *(*Efreet_Desktop_Type_Parse_Cb) (Efreet_Desktop *desktop, Efreet_Ini *ini);
        callback :efreet_desktop_type_parse_cb, [ :efreet_desktop, :pointer ], :pointer
        # typedef void (*Efreet_Desktop_Type_Save_Cb) (Efreet_Desktop *desktop, Efreet_Ini *ini);
        callback :efreet_desktop_type_save_cb, [ :efreet_desktop, :pointer ], :void
        # typedef void *(*Efreet_Desktop_Type_Free_Cb) (void *data);
        callback :efreet_desktop_type_free_cb, [ :pointer ], :pointer
        #
        # VARIABLES
        # EAPI extern int EFREET_DESKTOP_TYPE_APPLICATION;
        attach_variable :EFREET_DESKTOP_TYPE_APPLICATION, :int
        # EAPI extern int EFREET_DESKTOP_TYPE_LINK;
        attach_variable :EFREET_DESKTOP_TYPE_LINK, :int
        # EAPI extern int EFREET_DESKTOP_TYPE_DIRECTORY;
        attach_variable :EFREET_DESKTOP_TYPE_DIRECTORY, :int
        # EAPI extern int EFREET_EVENT_DESKTOP_CACHE_UPDATE;
        attach_variable :EFREET_EVENT_DESKTOP_CACHE_UPDATE, :int
        # EAPI extern int EFREET_EVENT_DESKTOP_CACHE_BUILD;
        attach_variable :EFREET_EVENT_DESKTOP_CACHE_BUILD, :int
        #
        # FUNCTIONS
        fcts = [
        # EAPI Efreet_Desktop *efreet_desktop_get(const char *file);
        [ :efreet_desktop_get, [ :string ], :efreet_desktop ],
        # EAPI int efreet_desktop_ref(Efreet_Desktop *desktop);
        [ :efreet_desktop_ref, [ :efreet_desktop ], :int ],
        # EAPI Efreet_Desktop *efreet_desktop_empty_new(const char *file);
        [ :efreet_desktop_empty_new, [ :string ], :efreet_desktop ],
        # EAPI Efreet_Desktop *efreet_desktop_new(const char *file);
        [ :efreet_desktop_new, [ :string ], :efreet_desktop ],
        # EAPI Efreet_Desktop *efreet_desktop_uncached_new(const char *file);
        [ :efreet_desktop_uncached_new, [ :string ], :efreet_desktop ],
        # EAPI void efreet_desktop_free(Efreet_Desktop *desktop);
        [ :efreet_desktop_free, [ :efreet_desktop ], :void ],
        # EAPI int efreet_desktop_save(Efreet_Desktop *desktop);
        [ :efreet_desktop_save, [ :efreet_desktop ], :int ],
        # EAPI int efreet_desktop_save_as(Efreet_Desktop *desktop, const char *file);
        [ :efreet_desktop_save_as, [ :efreet_desktop, :string ], :int ],
        # EAPI void efreet_desktop_exec(Efreet_Desktop *desktop, Eina_List *files, void *data);
        [ :efreet_desktop_exec, [ :efreet_desktop, :eina_list, :pointer ], :void ],
        # EAPI void efreet_desktop_environment_set(const char *environment);
        [ :efreet_desktop_environment_set, [ :string ], :void ],
        # EAPI const char *efreet_desktop_environment_get(void);
        [ :efreet_desktop_environment_get, [  ], :string ],
        # EAPI void *efreet_desktop_command_progress_get(Efreet_Desktop *desktop, Eina_List *files, Efreet_Desktop_Command_Cb cb_command, Efreet_Desktop_Progress_Cb cb_prog, void *data);
        [ :efreet_desktop_command_progress_get, [ :efreet_desktop, :eina_list, :efreet_desktop_command_cb, :efreet_desktop_progress_cb, :pointer ],
            :pointer ],
        # EAPI void *efreet_desktop_command_get(Efreet_Desktop *desktop, Eina_List *files, Efreet_Desktop_Command_Cb func, void *data);
        [ :efreet_desktop_command_get, [ :efreet_desktop, :eina_list, :efreet_desktop_command_cb, :pointer ], :pointer ],
        # EAPI Eina_List * efreet_desktop_command_local_get(Efreet_Desktop *desktop, Eina_List *files);
        [ :efreet_desktop_command_local_get, [ :efreet_desktop, :eina_list ], :eina_list ],
        # EAPI unsigned int efreet_desktop_category_count_get(Efreet_Desktop *desktop);
        [ :efreet_desktop_category_count_get, [ :efreet_desktop ], :uint ],
        # EAPI void efreet_desktop_category_add(Efreet_Desktop *desktop, const char *category);
        [ :efreet_desktop_category_add, [ :efreet_desktop, :string ], :void ],
        # EAPI int efreet_desktop_category_del(Efreet_Desktop *desktop, const char *category);
        [ :efreet_desktop_category_del, [ :efreet_desktop, :string ], :int ],
        # EAPI int efreet_desktop_type_add(const char *type, Efreet_Desktop_Type_Parse_Cb parse_func, Efreet_Desktop_Type_Save_Cb save_func, Efreet_Desktop_Type_Free_Cb free_func);
        [ :efreet_desktop_type_add, [ :string, :efreet_desktop_type_parse_cb, :efreet_desktop_type_save_cb, :efreet_desktop_type_free_cb ], :int ],
        # EAPI int efreet_desktop_type_alias (int from_type, const char *alias);
        [ :efreet_desktop_type_alias, [ :int, :string ], :int ],
        # EAPI void *efreet_desktop_type_data_get(Efreet_Desktop *desktop);
        [ :efreet_desktop_type_data_get, [ :efreet_desktop ], :pointer ],
        # EAPI Eina_List *efreet_desktop_string_list_parse(const char *string);
        [ :efreet_desktop_string_list_parse, [ :string ], :eina_list ],
        # EAPI char *efreet_desktop_string_list_join(Eina_List *list);
        [ :efreet_desktop_string_list_join, [ :eina_list ], :string ],
        # EAPI Eina_Bool efreet_desktop_x_field_set(Efreet_Desktop *desktop, const char *key, const char *data);
        [ :efreet_desktop_x_field_set, [ :efreet_desktop, :string, :string ], :bool ],
        # EAPI const char * efreet_desktop_x_field_get(Efreet_Desktop *desktop, const char *key);
        [ :efreet_desktop_x_field_get, [ :efreet_desktop, :string ], :string ],
        # EAPI Eina_Bool efreet_desktop_x_field_del(Efreet_Desktop *desktop, const char *key);
        [ :efreet_desktop_x_field_del, [ :efreet_desktop, :string ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
