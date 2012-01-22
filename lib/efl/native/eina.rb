#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module Eina
        #
        FCT_PREFIX = 'eina_' unless const_defined? :FCT_PREFIX
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
        # VARIABLES
        # EAPI extern Eina_Version *eina_version;
        attach_variable :eina_version, :pointer
        #
        # FUNCTIONS
        fcts = [
        # EAPI int eina_init(void);
        [ :eina_init, [  ], :int ],
        # EAPI int eina_shutdown(void);
        [ :eina_shutdown, [  ], :int ],
        # EAPI int eina_threads_init(void);
        [ :eina_threads_init, [  ], :int ],
        # EAPI int eina_threads_shutdown(void);
        [ :eina_threads_shutdown, [  ], :int ],
        # EAPI Eina_Bool eina_main_loop_is(void);
        [ :eina_main_loop_is, [  ], :eina_bool ],
        # EAPI void eina_main_loop_define(void);
        [ :eina_main_loop_define, [  ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
