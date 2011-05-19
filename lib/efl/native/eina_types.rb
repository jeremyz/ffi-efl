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
        extend Efl::FFIHelper
        #
        ffi_lib 'eina'
        #
        # ENUMS
        #
        # TYPEDEFS
        # typedef unsigned char Eina_Bool;
        typedef :bool, :eina_bool
        typedef :pointer, :eina_bool_p
        #
        # CALLBACKS
        # typedef int (*Eina_Compare_Cb) (const void *data1, const void *data2);
        callback :eina_compare_cb, [ :void_p, :void_p ], :int
        # typedef Eina_Bool (*Eina_Each_Cb) (const void *container, void *data, void *fdata);
        callback :eina_each_cb, [ :void_p, :void_p, :void_p ], :eina_bool
        # typedef void (*Eina_Free_Cb) (void *data);
        callback :eina_free_cb, [ :void_p ], :void
        #
        # VARIABLES
        #
        # FUNCTIONS
        fcts = [
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
