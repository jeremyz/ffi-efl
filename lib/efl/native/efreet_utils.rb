#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/efreet_desktop'
#
module Efl
    #
    module EfreetUtils
        #
        FCT_PREFIX = 'efreet_utils_' unless const_defined? :FCT_PREFIX
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
        # FUNCTIONS
        fcts = [
        # EAPI const char *efreet_util_path_to_file_id(const char *path);
        [ :efreet_util_path_to_file_id, [ :string ], :string ],
        # EAPI Eina_List *efreet_util_desktop_mime_list(const char *mime);
        [ :efreet_util_desktop_mime_list, [ :string ], :eina_list ],
        # EAPI Efreet_Desktop *efreet_util_desktop_wm_class_find(const char *wmname, const char *wmclass);
        [ :efreet_util_desktop_wm_class_find, [ :string, :string ], :efreet_desktop ],
        # EAPI Efreet_Desktop *efreet_util_desktop_file_id_find(const char *file_id);
        [ :efreet_util_desktop_file_id_find, [ :string ], :efreet_desktop ],
        # EAPI Efreet_Desktop *efreet_util_desktop_exec_find(const char *exec);
        [ :efreet_util_desktop_exec_find, [ :string ], :efreet_desktop ],
        # EAPI Efreet_Desktop *efreet_util_desktop_name_find(const char *name);
        [ :efreet_util_desktop_name_find, [ :string ], :efreet_desktop ],
        # EAPI Efreet_Desktop *efreet_util_desktop_generic_name_find(const char *generic_name);
        [ :efreet_util_desktop_generic_name_find, [ :string ], :efreet_desktop ],
        # EAPI Eina_List *efreet_util_desktop_name_glob_list(const char *glob);
        [ :efreet_util_desktop_name_glob_list, [ :string ], :eina_list ],
        # EAPI Eina_List *efreet_util_desktop_exec_glob_list(const char *glob);
        [ :efreet_util_desktop_exec_glob_list, [ :string ], :eina_list ],
        # EAPI Eina_List *efreet_util_desktop_generic_name_glob_list(const char *glob);
        [ :efreet_util_desktop_generic_name_glob_list, [ :string ], :eina_list ],
        # EAPI Eina_List *efreet_util_desktop_comment_glob_list(const char *glob);
        [ :efreet_util_desktop_comment_glob_list, [ :string ], :eina_list ],
        # EAPI Eina_List *efreet_util_desktop_categories_list(void);
        [ :efreet_util_desktop_categories_list, [  ], :eina_list ],
        # EAPI Eina_List *efreet_util_desktop_category_list(const char *category);
        [ :efreet_util_desktop_category_list, [ :string ], :eina_list ],
        # EAPI Eina_List *efreet_util_menus_find(void);
        [ :efreet_util_menus_find, [  ], :eina_list ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
