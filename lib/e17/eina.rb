#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/ffi_helper'
#
module E17
    module EINA
        #
        extend FFIHelper
        extend FFI::Library
        #
        ffi_lib 'eina'
        #
        fcts = [
            [ :eina_init, [], :int],
            [ :eina_shutdown, [], :int],
        ]
        #
        attach_fcts fcts
        #
        create_aliases 'eina_'.length, fcts
        #
    end
end
#
# EOF
