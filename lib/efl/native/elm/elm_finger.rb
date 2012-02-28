#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmFinger
        #
        FCT_PREFIX = 'elm_finger_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'elementary-ver-pre-svn-09.so.0'
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Coord elm_finger_size_get(void);
        [ :elm_finger_size_get, [  ], :int ],
        # EAPI void elm_finger_size_set(Evas_Coord size);
        [ :elm_finger_size_set, [ :int ], :void ],
        # EAPI void elm_coords_finger_size_adjust(int times_w, Evas_Coord *w, int times_h, Evas_Coord *h);
        [ :elm_coords_finger_size_adjust, [ :int, :pointer, :int, :pointer ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
