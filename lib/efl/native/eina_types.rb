#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi'
#
module Efl
    #
    module Eina
        #
        def self.method_missing m, *args, &block
            m_s = m.to_s
            if m_s =~/^(.*)=$/
                m_s = $1+'_set'
                args_s = '*args[0]'
            elsif m_s =~/^(.*)\?$/
                m_s = $1+'_get'
                args_s = '*args'
            else
                args_s = '*args'
            end
            sym = (
                if Efl::Native.respond_to? 'eina_'+m_s
                    'eina_'+m_s
                elsif Efl::Native.respond_to? m_s
                    m_s
                elsif Efl::Native.respond_to? 'eina_'+m_s+'_get'
                    'eina_'+m_s+'_get'
                elsif Efl::Native.respond_to? m_s+'_get'
                    m_s+'_get'
                else
                    raise NameError.new "#{self.name}.#{m_s} (#{m})"
                end
            )
            self.module_eval "def self.#{m} *args, &block; r=Efl::Native.#{sym}(*args); yield r if block_given?; r; end"
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
