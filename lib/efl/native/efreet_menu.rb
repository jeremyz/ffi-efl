#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/efreet_desktop'
#
module Efl
    #
    module EfreetMenu
        #
        FCT_PREFIX = 'efreet_menu_' unless const_defined? :FCT_PREFIX
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
        # typedef enum Efreet_Menu_Entry_Type {...} Efreet_Menu_Entry_Type;
        enum :efreet_menu_entry_type, [ :efreet_menu_entry_menu, :efreet_menu_entry_desktop, :efreet_menu_entry_separator, :efreet_menu_entry_header ]
        #
        # TYPEDEFS
        # typedef struct Efreet_Menu Efreet_Menu;
        typedef :pointer, :efreet_menu
        #
        # FUNCTIONS
        fcts = [
        # EAPI int efreet_menu_kde_legacy_init(void);
        [ :efreet_menu_kde_legacy_init, [  ], :int ],
        # EAPI Efreet_Menu *efreet_menu_new(const char *name);
        [ :efreet_menu_new, [ :string ], :efreet_menu ],
        # EAPI void efreet_menu_file_set(const char *file);
        [ :efreet_menu_file_set, [ :string ], :void ],
        # EAPI Efreet_Menu *efreet_menu_get(void);
        [ :efreet_menu_get, [  ], :efreet_menu ],
        # EAPI Efreet_Menu *efreet_menu_parse(const char *path);
        [ :efreet_menu_parse, [ :string ], :efreet_menu ],
        # EAPI int efreet_menu_save(Efreet_Menu *menu, const char *path);
        [ :efreet_menu_save, [ :efreet_menu, :string ], :int ],
        # EAPI void efreet_menu_free(Efreet_Menu *menu);
        [ :efreet_menu_free, [ :efreet_menu ], :void ],
        # EAPI int efreet_menu_desktop_insert(Efreet_Menu *menu, Efreet_Desktop *desktop, int pos);
        [ :efreet_menu_desktop_insert, [ :efreet_menu, :efreet_desktop, :int ], :int ],
        # EAPI int efreet_menu_desktop_remove(Efreet_Menu *menu, Efreet_Desktop *desktop);
        [ :efreet_menu_desktop_remove, [ :efreet_menu, :efreet_desktop ], :int ],
        # EAPI void efreet_menu_dump(Efreet_Menu *menu, const char *indent);
        [ :efreet_menu_dump, [ :efreet_menu, :string ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
