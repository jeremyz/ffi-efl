#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module EfreetMime
        #
        FCT_PREFIX = 'efreet_mime_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'efreet_mime.so.1'
        #
        # FUNCTIONS
        fcts = [
        # EAPI int efreet_mime_init(void);
        [ :efreet_mime_init, [  ], :int ],
        # EAPI int efreet_mime_shutdown(void);
        [ :efreet_mime_shutdown, [  ], :int ],
        # EAPI const char *efreet_mime_type_get(const char *file);
        [ :efreet_mime_type_get, [ :string ], :string ],
        # EAPI const char *efreet_mime_magic_type_get(const char *file);
        [ :efreet_mime_magic_type_get, [ :string ], :string ],
        # EAPI const char *efreet_mime_globs_type_get(const char *file);
        [ :efreet_mime_globs_type_get, [ :string ], :string ],
        # EAPI const char *efreet_mime_special_type_get(const char *file);
        [ :efreet_mime_special_type_get, [ :string ], :string ],
        # EAPI const char *efreet_mime_fallback_type_get(const char *file);
        [ :efreet_mime_fallback_type_get, [ :string ], :string ],
        # EAPI const char *efreet_mime_type_icon_get(const char *mime, const char *theme, unsigned int size);
        [ :efreet_mime_type_icon_get, [ :string, :string, :uint ], :string ],
        # EAPI void efreet_mime_type_cache_clear(void);
        [ :efreet_mime_type_cache_clear, [  ], :void ],
        # EAPI void efreet_mime_type_cache_flush(void);
        [ :efreet_mime_type_cache_flush, [  ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
