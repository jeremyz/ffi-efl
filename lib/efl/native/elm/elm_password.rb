#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmPassword
        #
        FCT_PREFIX = 'elm_password_' unless const_defined? :FCT_PREFIX
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
        # EAPI Eina_Bool elm_password_show_last_get(void);
        [ :elm_password_show_last_get, [  ], :bool ],
        # EAPI void elm_password_show_last_set(Eina_Bool password_show_last);
        [ :elm_password_show_last_set, [ :bool ], :void ],
        # EAPI double elm_password_show_last_timeout_get(void);
        [ :elm_password_show_last_timeout_get, [  ], :double ],
        # EAPI void elm_password_show_last_timeout_set(double password_show_last_timeout);
        [ :elm_password_show_last_timeout_set, [ :double ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
