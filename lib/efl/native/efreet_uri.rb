#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module EfreetUri
        #
        FCT_PREFIX = 'efreet_uri_' unless const_defined? :FCT_PREFIX
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
        # typedef struct Efreet_Uri Efreet_Uri;
        typedef :pointer, :efreet_uri
        #
        # FUNCTIONS
        fcts = [
        # EAPI const char *efreet_uri_encode(Efreet_Uri *uri);
        [ :efreet_uri_encode, [ :efreet_uri ], :string ],
        # EAPI Efreet_Uri *efreet_uri_decode(const char *val);
        [ :efreet_uri_decode, [ :string ], :efreet_uri ],
        # EAPI void efreet_uri_free(Efreet_Uri *uri);
        [ :efreet_uri_free, [ :efreet_uri ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
