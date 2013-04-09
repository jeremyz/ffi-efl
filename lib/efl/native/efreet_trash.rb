#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/eina_list'
require 'efl/native/efreet_uri'
#
module Efl
    #
    module EfreetTrash
        #
        FCT_PREFIX = 'efreet_trash_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'efreet_trash.so.1'
        #
        # FUNCTIONS
        fcts = [
        # EAPI int efreet_trash_init(void);
        [ :efreet_trash_init, [  ], :int ],
        # EAPI int efreet_trash_shutdown(void);
        [ :efreet_trash_shutdown, [  ], :int ],
        # EAPI const char *efreet_trash_dir_get(const char *for_file);
        [ :efreet_trash_dir_get, [ :string ], :string ],
        # EAPI int efreet_trash_delete_uri(Efreet_Uri *uri, int force_delete);
        [ :efreet_trash_delete_uri, [ :efreet_uri, :int ], :int ],
        # EAPI Eina_List *efreet_trash_ls(void);
        [ :efreet_trash_ls, [  ], :eina_list ],
        # EAPI int efreet_trash_is_empty(void);
        [ :efreet_trash_is_empty, [  ], :int ],
        # EAPI int efreet_trash_empty_trash(void);
        [ :efreet_trash_empty_trash, [  ], :int ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
