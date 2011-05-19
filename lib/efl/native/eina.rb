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
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
