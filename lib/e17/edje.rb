#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/ffi_helper'
#
module E17
    module EDJE
        #
        extend FFIHelper
        extend FFI::Library
        #
        ffi_lib 'edje'
        #
        fcts = [
            # TODO
            # http://docs.enlightenment.org/auto/edje/Edje_8h.html
            [ :edje_init, [], :int],
            [ :edje_shutdown, [], :int],
        ]
        #
        attach_fcts fcts
        #
        create_aliases 'edje_'.length, fcts
        #
    end
end
#
# EOF
