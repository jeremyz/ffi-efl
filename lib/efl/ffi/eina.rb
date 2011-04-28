#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi'
#
module Efl
    #
    module Eina
        def self.method_missing m, *args, &block
            return Efl::FFI.send 'eina_'+m.to_s, *args, &block
        end
    end
    #
    module FFI
        #
        #
        ffi_lib 'eina'
        #
        # ENUMS
        #
        # TYPEDEFS
        # typedef struct _Eina_Version Eina_Version;
        typedef :pointer, :eina_version
        #
        # CALLBACKS
        #
        # FUNCTIONS
        fcts = [
        # EAPI extern Eina_Version *eina_version;
        # FIXME
        # EAPI int eina_init(void);
        [ :eina_init, [  ], :int ],
        # EAPI int eina_shutdown(void);
        [ :eina_shutdown, [  ], :int ],
        # EAPI int eina_threads_init(void);
        [ :eina_threads_init, [  ], :int ],
        # EAPI int eina_threads_shutdown(void);
        [ :eina_threads_shutdown, [  ], :int ],
        ]
        #
        attach_fcts fcts
    end
end
#
# EOF
