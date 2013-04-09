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
        ffi_lib 'eina.so.1'
        #
        # TYPEDEFS
        # typedef unsigned char Eina_Bool;
        typedef :bool, :eina_bool
        #
        # CALLBACKS
        # typedef int (*Eina_Compare_Cb) (const void *data1, const void *data2);
        callback :eina_compare_cb, [ :pointer, :pointer ], :int
        # typedef Eina_Bool (*Eina_Each_Cb) (const void *container, void *data, void *fdata);
        callback :eina_each_cb, [ :pointer, :pointer, :pointer ], :bool
        # typedef void (*Eina_Free_Cb) (void *data);
        callback :eina_free_cb, [ :pointer ], :void
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
