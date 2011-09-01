#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi'
#
module Efl
    #
    module Eina
        #
        FCT_PREFIX = 'eina_'
        #
        def self.method_missing m, *args, &block
            sym, args_s = ModuleHelper.find_function m, FCT_PREFIX
            self.module_eval "def self.#{m} *args, &block; r=Efl::Native.#{sym}(#{args_s}); yield r if block_given?; r; end"
            self.send m, *args, &block
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
        typedef :pointer, :eina_version_p
        #
        # CALLBACKS
        #
        # VARIABLES
        # EAPI extern Eina_Version *eina_version;
        attach_variable :eina_version, :eina_version_p
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
