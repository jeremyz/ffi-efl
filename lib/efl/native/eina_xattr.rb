#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi'
#
module Efl
    #
    module EinaXattr
        #
        FCT_PREFIX = 'eina_xattr_'
        #
        def self.method_missing m, *args, &block
            sym, args_s = ModuleHelper.find_function m, FCT_PREFIX
            self.module_eval "def self.#{m} *args, &block; r=Efl::Native.#{sym}(#{args_s}); yield r if block_given?; r; end"
            self.send m, *args, &block
        end
        #
    end
    #
    module Native
        #
        ffi_lib 'eina'
        #
        # ENUMS
        # typedef enum {...} Eina_Xattr_Flags;
        enum :eina_xattr_flags, [ :eina_xattr_insert, :eina_xattr_replace, :eina_xattr_created ]
        #
        # TYPEDEFS
        #
        # CALLBACKS
        #
        # VARIABLES
        #
        # FUNCTIONS
        fcts = [
        # EAPI Eina_Iterator *eina_xattr_ls(const char *file);
        [ :eina_xattr_ls, [ :string ], :eina_iterator_p ],
        # EAPI void *eina_xattr_get(const char *file, const char *attribute, ssize_t *size);
        [ :eina_xattr_get, [ :string, :string, :long_p ], :void_p ],
        # EAPI Eina_Bool eina_xattr_set(const char *file, const char *attribute, const void *data, ssize_t length, Eina_Xattr_Flags flags);
        [ :eina_xattr_set, [ :string, :string, :void_p, :long, :eina_xattr_flags ], :eina_bool ],
        # EAPI Eina_Bool eina_xattr_string_set(const char *file, const char *attribute, const char *data, Eina_Xattr_Flags flags);
        [ :eina_xattr_string_set, [ :string, :string, :string, :eina_xattr_flags ], :eina_bool ],
        # EAPI char *eina_xattr_string_get(const char *file, const char *attribute);
        [ :eina_xattr_string_get, [ :string, :string ], :string ],
        # EAPI Eina_Bool eina_xattr_double_set(const char *file, const char *attribute, double value, Eina_Xattr_Flags flags);
        [ :eina_xattr_double_set, [ :string, :string, :double, :eina_xattr_flags ], :eina_bool ],
        # EAPI Eina_Bool eina_xattr_double_get(const char *file, const char *attribute, double *value);
        [ :eina_xattr_double_get, [ :string, :string, :double_p ], :eina_bool ],
        # EAPI Eina_Bool eina_xattr_int_set(const char *file, const char *attribute, int value, Eina_Xattr_Flags flags);
        [ :eina_xattr_int_set, [ :string, :string, :int, :eina_xattr_flags ], :eina_bool ],
        # EAPI Eina_Bool eina_xattr_int_get(const char *file, const char *attribute, int *value);
        [ :eina_xattr_int_get, [ :string, :string, :int_p ], :eina_bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
