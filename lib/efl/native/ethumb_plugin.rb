#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/evas'
require 'efl/native/ecore_evas'
require 'efl/native/ethumb'
#
module Efl
    #
    module EthumbPlugin
        #
        FCT_PREFIX = 'ethumb_plugin_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'ethumb.so.1'
        #
        # TYPEDEFS
        # typedef struct _Ethumb_Plugin Ethumb_Plugin;
        typedef :pointer, :ethumb_plugin
        #
        # FUNCTIONS
        fcts = [
        # EAPI void ethumb_calculate_aspect_from_ratio(Ethumb *e, float ia, int *w, int *h);
        [ :ethumb_calculate_aspect_from_ratio, [ :ethumb, :float, :pointer, :pointer ], :void ],
        # EAPI void ethumb_calculate_aspect(Ethumb *e, int iw, int ih, int *w, int *h);
        [ :ethumb_calculate_aspect, [ :ethumb, :int, :int, :pointer, :pointer ], :void ],
        # EAPI void ethumb_calculate_fill_from_ratio(Ethumb *e, float ia, int *fx, int *fy, int *fw, int *fh);
        [ :ethumb_calculate_fill_from_ratio, [ :ethumb, :float, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void ethumb_calculate_fill(Ethumb *e, int iw, int ih, int *fx, int *fy, int *fw, int *fh);
        [ :ethumb_calculate_fill, [ :ethumb, :int, :int, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI Eina_Bool ethumb_plugin_image_resize(Ethumb *e, int w, int h);
        [ :ethumb_plugin_image_resize, [ :ethumb, :int, :int ], :bool ],
        # EAPI Eina_Bool ethumb_image_save(Ethumb *e);
        [ :ethumb_image_save, [ :ethumb ], :bool ],
        # EAPI void ethumb_finished_callback_call(Ethumb *e, int result);
        [ :ethumb_finished_callback_call, [ :ethumb, :int ], :void ],
        # EAPI Evas * ethumb_evas_get(const Ethumb *e);
        [ :ethumb_evas_get, [ :ethumb ], :evas ],
        # EAPI Ecore_Evas * ethumb_ecore_evas_get(const Ethumb *e);
        [ :ethumb_ecore_evas_get, [ :ethumb ], :ecore_evas ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
