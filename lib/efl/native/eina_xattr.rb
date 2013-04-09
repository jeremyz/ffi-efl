#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module EinaXattr
        #
        FCT_PREFIX = 'eina_xattr_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'eina.so.1'
        #
        # ENUMS
        # typedef enum {...} Eina_Xattr_Flags;
        enum :eina_xattr_flags, [ :eina_xattr_insert, :eina_xattr_replace, :eina_xattr_created ]
        #
        # TYPEDEFS
        # typedef struct _Eina_Xattr Eina_Xattr;
        typedef :pointer, :eina_xattr
        #
        # FUNCTIONS
        fcts = [
        # EAPI Eina_Iterator *eina_xattr_ls(const char *file);
        [ :eina_xattr_ls, [ :string ], :pointer ],
        # EAPI Eina_Iterator *eina_xattr_value_ls(const char *file);
        [ :eina_xattr_value_ls, [ :string ], :pointer ],
        # EAPI Eina_Iterator *eina_xattr_fd_ls(int fd);
        [ :eina_xattr_fd_ls, [ :int ], :pointer ],
        # EAPI Eina_Iterator *eina_xattr_value_fd_ls(int fd);
        [ :eina_xattr_value_fd_ls, [ :int ], :pointer ],
        # EAPI void *eina_xattr_get(const char *file, const char *attribute, ssize_t *size);
        [ :eina_xattr_get, [ :string, :string, :pointer ], :pointer ],
        # EAPI Eina_Bool eina_xattr_set(const char *file, const char *attribute, const void *data, ssize_t length, Eina_Xattr_Flags flags);
        [ :eina_xattr_set, [ :string, :string, :pointer, :long, :eina_xattr_flags ], :bool ],
        # EAPI Eina_Bool eina_xattr_string_set(const char *file, const char *attribute, const char *data, Eina_Xattr_Flags flags);
        [ :eina_xattr_string_set, [ :string, :string, :string, :eina_xattr_flags ], :bool ],
        # EAPI char *eina_xattr_string_get(const char *file, const char *attribute);
        [ :eina_xattr_string_get, [ :string, :string ], :string ],
        # EAPI Eina_Bool eina_xattr_double_set(const char *file, const char *attribute, double value, Eina_Xattr_Flags flags);
        [ :eina_xattr_double_set, [ :string, :string, :double, :eina_xattr_flags ], :bool ],
        # EAPI Eina_Bool eina_xattr_double_get(const char *file, const char *attribute, double *value);
        [ :eina_xattr_double_get, [ :string, :string, :pointer ], :bool ],
        # EAPI Eina_Bool eina_xattr_int_set(const char *file, const char *attribute, int value, Eina_Xattr_Flags flags);
        [ :eina_xattr_int_set, [ :string, :string, :int, :eina_xattr_flags ], :bool ],
        # EAPI Eina_Bool eina_xattr_int_get(const char *file, const char *attribute, int *value);
        [ :eina_xattr_int_get, [ :string, :string, :pointer ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
