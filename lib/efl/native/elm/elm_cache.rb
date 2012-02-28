#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmCache
        #
        FCT_PREFIX = 'elm_cache_' unless const_defined? :FCT_PREFIX
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
        # EAPI void elm_cache_all_flush(void);
        [ :elm_cache_all_flush, [  ], :void ],
        # EAPI int elm_cache_flush_interval_get(void);
        [ :elm_cache_flush_interval_get, [  ], :int ],
        # EAPI void elm_cache_flush_interval_set(int size);
        [ :elm_cache_flush_interval_set, [ :int ], :void ],
        # EAPI Eina_Bool elm_cache_flush_enabled_get(void);
        [ :elm_cache_flush_enabled_get, [  ], :bool ],
        # EAPI void elm_cache_flush_enabled_set(Eina_Bool enabled);
        [ :elm_cache_flush_enabled_set, [ :bool ], :void ],
        # EAPI int elm_font_cache_get(void);
        [ :elm_font_cache_get, [  ], :int ],
        # EAPI void elm_font_cache_set(int size);
        [ :elm_font_cache_set, [ :int ], :void ],
        # EAPI int elm_image_cache_get(void);
        [ :elm_image_cache_get, [  ], :int ],
        # EAPI void elm_image_cache_set(int size);
        [ :elm_image_cache_set, [ :int ], :void ],
        # EAPI int elm_edje_file_cache_get(void);
        [ :elm_edje_file_cache_get, [  ], :int ],
        # EAPI void elm_edje_file_cache_set(int size);
        [ :elm_edje_file_cache_set, [ :int ], :void ],
        # EAPI int elm_edje_collection_cache_get(void);
        [ :elm_edje_collection_cache_get, [  ], :int ],
        # EAPI void elm_edje_collection_cache_set(int size);
        [ :elm_edje_collection_cache_set, [ :int ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
