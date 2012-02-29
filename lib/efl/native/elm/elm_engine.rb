#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmEngine
        #
        FCT_PREFIX = 'elm_engine_' unless const_defined? :FCT_PREFIX
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
        # EAPI const char *elm_engine_get(void);
        [ :elm_engine_get, [  ], :string ],
        # EAPI void elm_engine_set(const char *engine);
        [ :elm_engine_set, [ :string ], :void ],
        # EAPI const char *elm_preferred_engine_get(void);
        [ :elm_preferred_engine_get, [  ], :string ],
        # EAPI void elm_preferred_engine_set(const char *engine);
        [ :elm_preferred_engine_set, [ :string ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
