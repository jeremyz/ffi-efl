#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmNeed
        #
        FCT_PREFIX = 'elm_need_' unless const_defined? :FCT_PREFIX
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
        # FUNCTIONS
        fcts = [
        # EAPI Eina_Bool elm_need_efreet(void);
        [ :elm_need_efreet, [  ], :bool ],
        # EAPI Eina_Bool elm_need_e_dbus(void);
        [ :elm_need_e_dbus, [  ], :bool ],
        # EAPI Eina_Bool elm_need_ethumb(void);
        [ :elm_need_ethumb, [  ], :bool ],
        # EAPI Eina_Bool elm_need_web(void);
        [ :elm_need_web, [  ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
