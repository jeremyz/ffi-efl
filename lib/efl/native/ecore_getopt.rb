#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/eina_list'
#
module Efl
    #
    module EcoreGetopt
        #
        FCT_PREFIX = 'ecore_getopt_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'ecore.so.1'
        #
        # ENUMS
        # typedef enum {...} Ecore_Getopt_Action;
        enum :ecore_getopt_action, [ :ecore_getopt_action_store, :ecore_getopt_action_store_const, :ecore_getopt_action_store_true,
            :ecore_getopt_action_store_false, :ecore_getopt_action_choice, :ecore_getopt_action_append, :ecore_getopt_action_count, :ecore_getopt_action_callback,
            :ecore_getopt_action_help, :ecore_getopt_action_version, :ecore_getopt_action_copyright, :ecore_getopt_action_license ]
        # typedef enum {...} Ecore_Getopt_Type;
        enum :ecore_getopt_type, [ :ecore_getopt_type_str, :ecore_getopt_type_bool, :ecore_getopt_type_short, :ecore_getopt_type_int,
            :ecore_getopt_type_long, :ecore_getopt_type_ushort, :ecore_getopt_type_uint, :ecore_getopt_type_ulong, :ecore_getopt_type_double ]
        # typedef enum {...} Ecore_Getopt_Desc_Arg_Requirement;
        enum :ecore_getopt_desc_arg_requirement, [ :ecore_getopt_desc_arg_requirement_no, 0, :ecore_getopt_desc_arg_requirement_yes, 1,
            :ecore_getopt_desc_arg_requirement_optional, 3 ]
        #
        # TYPEDEFS
        # typedef union _Ecore_Getopt_Value Ecore_Getopt_Value;
        typedef :pointer, :ecore_getopt_value
        # typedef struct _Ecore_Getopt_Desc_Store Ecore_Getopt_Desc_Store;
        typedef :pointer, :ecore_getopt_desc_store
        # typedef struct _Ecore_Getopt_Desc_Callback Ecore_Getopt_Desc_Callback;
        typedef :pointer, :ecore_getopt_desc_callback
        # typedef struct _Ecore_Getopt_Desc Ecore_Getopt_Desc;
        typedef :pointer, :ecore_getopt_desc
        # typedef struct _Ecore_Getopt Ecore_Getopt;
        typedef :pointer, :ecore_getopt
        #
        # FUNCTIONS
        fcts = [
        # EAPI void ecore_getopt_help(FILE *fp, const Ecore_Getopt *info);
        [ :ecore_getopt_help, [ :pointer, :ecore_getopt ], :void ],
        # EAPI Eina_Bool ecore_getopt_parser_has_duplicates(const Ecore_Getopt *parser);
        [ :ecore_getopt_parser_has_duplicates, [ :ecore_getopt ], :bool ],
        # EAPI int ecore_getopt_parse(const Ecore_Getopt *parser, Ecore_Getopt_Value *values, int argc, char **argv);
        [ :ecore_getopt_parse, [ :ecore_getopt, :ecore_getopt_value, :int, :pointer ], :int ],
        # EAPI Eina_List *ecore_getopt_list_free(Eina_List *list);
        [ :ecore_getopt_list_free, [ :eina_list ], :eina_list ],
        # EAPI Eina_Bool ecore_getopt_callback_geometry_parse(const Ecore_Getopt *parser, const Ecore_Getopt_Desc *desc, const char *str, void *data, Ecore_Getopt_Value *storage);
        [ :ecore_getopt_callback_geometry_parse, [ :ecore_getopt, :ecore_getopt_desc, :string, :pointer, :ecore_getopt_value ], :bool ],
        # EAPI Eina_Bool ecore_getopt_callback_size_parse(const Ecore_Getopt *parser, const Ecore_Getopt_Desc *desc, const char *str, void *data, Ecore_Getopt_Value *storage);
        [ :ecore_getopt_callback_size_parse, [ :ecore_getopt, :ecore_getopt_desc, :string, :pointer, :ecore_getopt_value ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
