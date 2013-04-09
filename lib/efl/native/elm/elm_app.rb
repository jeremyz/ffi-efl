#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmApp
        #
        FCT_PREFIX = 'elm_app_' unless const_defined? :FCT_PREFIX
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
        # EAPI void elm_app_info_set(void *mainfunc, const char *dom, const char *checkfile);
        [ :elm_app_info_set, [ :pointer, :string, :string ], :void ],
        # EAPI void elm_app_compile_bin_dir_set(const char *dir);
        [ :elm_app_compile_bin_dir_set, [ :string ], :void ],
        # EAPI void elm_app_compile_lib_dir_set(const char *dir);
        [ :elm_app_compile_lib_dir_set, [ :string ], :void ],
        # EAPI void elm_app_compile_data_dir_set(const char *dir);
        [ :elm_app_compile_data_dir_set, [ :string ], :void ],
        # EAPI void elm_app_compile_locale_set(const char *dir);
        [ :elm_app_compile_locale_set, [ :string ], :void ],
        # EAPI const char *elm_app_prefix_dir_get(void);
        [ :elm_app_prefix_dir_get, [  ], :string ],
        # EAPI const char *elm_app_bin_dir_get(void);
        [ :elm_app_bin_dir_get, [  ], :string ],
        # EAPI const char *elm_app_lib_dir_get(void);
        [ :elm_app_lib_dir_get, [  ], :string ],
        # EAPI const char *elm_app_data_dir_get(void);
        [ :elm_app_data_dir_get, [  ], :string ],
        # EAPI const char *elm_app_locale_dir_get(void);
        [ :elm_app_locale_dir_get, [  ], :string ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
