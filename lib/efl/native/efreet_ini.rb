#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module EfreetIni
        #
        FCT_PREFIX = 'efreet_ini_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'efreet.so.1'
        #
        # TYPEDEFS
        # typedef struct Efreet_Ini Efreet_Ini;
        typedef :pointer, :efreet_ini
        #
        # FUNCTIONS
        fcts = [
        # EAPI Efreet_Ini *efreet_ini_new(const char *file);
        [ :efreet_ini_new, [ :string ], :efreet_ini ],
        # EAPI void efreet_ini_free(Efreet_Ini *ini);
        [ :efreet_ini_free, [ :efreet_ini ], :void ],
        # EAPI int efreet_ini_save(Efreet_Ini *ini, const char *path);
        [ :efreet_ini_save, [ :efreet_ini, :string ], :int ],
        # EAPI int efreet_ini_section_set(Efreet_Ini *ini, const char *section);
        [ :efreet_ini_section_set, [ :efreet_ini, :string ], :int ],
        # EAPI void efreet_ini_section_add(Efreet_Ini *ini, const char *section);
        [ :efreet_ini_section_add, [ :efreet_ini, :string ], :void ],
        # EAPI const char *efreet_ini_string_get(Efreet_Ini *ini, const char *key);
        [ :efreet_ini_string_get, [ :efreet_ini, :string ], :string ],
        # EAPI void efreet_ini_string_set(Efreet_Ini *ini, const char *key, const char *value);
        [ :efreet_ini_string_set, [ :efreet_ini, :string, :string ], :void ],
        # EAPI const char *efreet_ini_localestring_get(Efreet_Ini *ini, const char *key);
        [ :efreet_ini_localestring_get, [ :efreet_ini, :string ], :string ],
        # EAPI void efreet_ini_localestring_set(Efreet_Ini *ini, const char *key, const char *value);
        [ :efreet_ini_localestring_set, [ :efreet_ini, :string, :string ], :void ],
        # EAPI unsigned int efreet_ini_boolean_get(Efreet_Ini *ini, const char *key);
        [ :efreet_ini_boolean_get, [ :efreet_ini, :string ], :uint ],
        # EAPI void efreet_ini_boolean_set(Efreet_Ini *ini, const char *key, unsigned int value);
        [ :efreet_ini_boolean_set, [ :efreet_ini, :string, :uint ], :void ],
        # EAPI int efreet_ini_int_get(Efreet_Ini *ini, const char *key);
        [ :efreet_ini_int_get, [ :efreet_ini, :string ], :int ],
        # EAPI void efreet_ini_int_set(Efreet_Ini *ini, const char *key, int value);
        [ :efreet_ini_int_set, [ :efreet_ini, :string, :int ], :void ],
        # EAPI double efreet_ini_double_get(Efreet_Ini *ini, const char *key);
        [ :efreet_ini_double_get, [ :efreet_ini, :string ], :double ],
        # EAPI void efreet_ini_double_set(Efreet_Ini *ini, const char *key, double value);
        [ :efreet_ini_double_set, [ :efreet_ini, :string, :double ], :void ],
        # EAPI void efreet_ini_key_unset(Efreet_Ini *ini, const char *key);
        [ :efreet_ini_key_unset, [ :efreet_ini, :string ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
