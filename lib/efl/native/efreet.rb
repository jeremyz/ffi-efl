#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module Efreet
        #
        FCT_PREFIX = 'efreet_' unless const_defined? :FCT_PREFIX
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
        # typedef struct _Efreet_Version Efreet_Version;
        typedef :pointer, :efreet_version
        #
        # VARIABLES
        # EAPI extern Efreet_Version *efreet_version;
        attach_variable :efreet_version, :efreet_version
        #
        # FUNCTIONS
        fcts = [
        # EAPI int efreet_init(void);
        [ :efreet_init, [  ], :int ],
        # EAPI int efreet_shutdown(void);
        [ :efreet_shutdown, [  ], :int ],
        # EAPI void efreet_lang_reset(void);
        [ :efreet_lang_reset, [  ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
