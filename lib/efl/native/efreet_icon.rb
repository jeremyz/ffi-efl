#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/eina_list'
#
module Efl
    #
    module EfreetIcon
        #
        FCT_PREFIX = 'efreet_icon_' unless const_defined? :FCT_PREFIX
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
        # ENUMS
        # typedef enum Efreet_Icon_Theme_Context {...} Efreet_Icon_Theme_Context;
        enum :efreet_icon_theme_context, [ :efreet_icon_theme_context_none, :efreet_icon_theme_context_actions, :efreet_icon_theme_context_devices,
            :efreet_icon_theme_context_filesystems, :efreet_icon_theme_context_mimetypes ]
        # typedef enum Efreet_Icon_Size_Type {...} Efreet_Icon_Size_Type;
        enum :efreet_icon_size_type, [ :efreet_icon_size_type_none, :efreet_icon_size_type_fixed, :efreet_icon_size_type_scalable,
            :efreet_icon_size_type_threshold ]
        #
        # TYPEDEFS
        # typedef struct Efreet_Icon_Theme Efreet_Icon_Theme;
        typedef :pointer, :efreet_icon_theme
        # typedef struct Efreet_Icon_Theme_Directory Efreet_Icon_Theme_Directory;
        typedef :pointer, :efreet_icon_theme_directory
        # typedef struct Efreet_Icon Efreet_Icon;
        typedef :pointer, :efreet_icon
        # typedef struct Efreet_Icon_Point Efreet_Icon_Point;
        typedef :pointer, :efreet_icon_point
        #
        # VARIABLES
        # EAPI extern int EFREET_EVENT_ICON_CACHE_UPDATE;
        attach_variable :EFREET_EVENT_ICON_CACHE_UPDATE, :int
        #
        # FUNCTIONS
        fcts = [
        # EAPI const char *efreet_icon_user_dir_get(void);
        [ :efreet_icon_user_dir_get, [  ], :string ],
        # EAPI const char *efreet_icon_deprecated_user_dir_get(void);
        [ :efreet_icon_deprecated_user_dir_get, [  ], :string ],
        # EAPI void efreet_icon_extension_add(const char *ext);
        [ :efreet_icon_extension_add, [ :string ], :void ],
        # EAPI Eina_List **efreet_icon_extra_list_get(void);
        [ :efreet_icon_extra_list_get, [  ], :eina_list ],
        # EAPI Eina_List *efreet_icon_extensions_list_get(void);
        [ :efreet_icon_extensions_list_get, [  ], :eina_list ],
        # EAPI Eina_List *efreet_icon_theme_list_get(void);
        [ :efreet_icon_theme_list_get, [  ], :eina_list ],
        # EAPI Efreet_Icon_Theme *efreet_icon_theme_find(const char *theme_name);
        [ :efreet_icon_theme_find, [ :string ], :efreet_icon_theme ],
        # EAPI Efreet_Icon *efreet_icon_find(const char *theme_name, const char *icon, unsigned int size);
        [ :efreet_icon_find, [ :string, :string, :uint ], :efreet_icon ],
        # EAPI const char *efreet_icon_list_find(const char *theme_name, Eina_List *icons, unsigned int size);
        [ :efreet_icon_list_find, [ :string, :eina_list, :uint ], :string ],
        # EAPI const char *efreet_icon_path_find(const char *theme_name, const char *icon, unsigned int size);
        [ :efreet_icon_path_find, [ :string, :string, :uint ], :string ],
        # EAPI void efreet_icon_free(Efreet_Icon *icon);
        [ :efreet_icon_free, [ :efreet_icon ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
