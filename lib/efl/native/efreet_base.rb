#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/eina_list'
#
module Efl
    #
    module EfreetBase
        #
        FCT_PREFIX = 'efreet_base_' unless const_defined? :FCT_PREFIX
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
        # typedef struct _Efreet_Event_Cache_Update Efreet_Event_Cache_Update;
        typedef :pointer, :efreet_event_cache_update
        #
        # FUNCTIONS
        fcts = [
        # EAPI const char *efreet_data_home_get(void);
        [ :efreet_data_home_get, [  ], :string ],
        # EAPI Eina_List *efreet_data_dirs_get(void);
        [ :efreet_data_dirs_get, [  ], :eina_list ],
        # EAPI const char *efreet_config_home_get(void);
        [ :efreet_config_home_get, [  ], :string ],
        # EAPI const char *efreet_desktop_dir_get(void);
        [ :efreet_desktop_dir_get, [  ], :string ],
        # EAPI Eina_List *efreet_config_dirs_get(void);
        [ :efreet_config_dirs_get, [  ], :eina_list ],
        # EAPI const char *efreet_cache_home_get(void);
        [ :efreet_cache_home_get, [  ], :string ],
        # EAPI const char *efreet_hostname_get(void);
        [ :efreet_hostname_get, [  ], :string ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
