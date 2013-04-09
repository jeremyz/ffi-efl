#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elm/elm_general'
require 'efl/native/elm/elm_tooltip'
#
module Efl
    #
    module Elm
        #
        FCT_PREFIX = 'elm_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'elementary.so.1'
        #
        # TYPEDEFS
        # typedef struct _Elm_Version Elm_Version;
        typedef :pointer, :elm_version
        #
        # VARIABLES
        # EAPI extern Elm_Version *elm_version;
        attach_variable :elm_version, :elm_version
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
