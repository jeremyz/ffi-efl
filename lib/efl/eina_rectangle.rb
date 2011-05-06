#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
module Efl
    #
    module Native
        #
        class EinaRectangleStruct < FFI::Struct
            layout  :x, :int,
                    :y, :int,
                    :w, :int,
                    :h, :int
        end
    end
    #
end
#
# EOF
