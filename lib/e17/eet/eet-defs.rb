#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/ffi_helper'
#
module E17
    module Eet
        #
        extend FFI::Library
        extend FFIHelper
        #
        # ENUMS
        # typedef enum _Eet_Error {...} Eet_Error;
        enum :eet_error, [ :none, :bad_object, :empty, :not_writable, :out_of_memory, :write_error, :write_error_file_too_big, :write_error_io_error,
            :write_error_out_of_space, :write_error_file_closed, :mmap_failed, :x509_encoding_failed, :signature_failed, :invalid_signature, :not_signed,
            :not_implemented, :prng_not_seeded, :encrypt_failed, :decrypt_failed ]
        # typedef enum _Eet_File_Mode {...} Eet_File_Mode;
        enum :eet_file_mode, [ :invalid , -1, :read, :write, :read_write ]
        #
        # TYPEDEFS
        # typedef struct _Eet_Version Eet_Version;
        typedef :pointer, :eet_version
        typedef :pointer, :eet_version_p
        # typedef struct _Eet_File Eet_File;
        typedef :pointer, :eet_file
        typedef :pointer, :eet_file_p
        # typedef struct _Eet_Dictionary Eet_Dictionary;
        typedef :pointer, :eet_dictionary
        typedef :pointer, :eet_dictionary_p
        # typedef struct _Eet_Key Eet_Key;
        typedef :pointer, :eet_key
        typedef :pointer, :eet_key_p
        # typedef struct _Eet_Data_Descriptor Eet_Data_Descriptor;
        typedef :pointer, :eet_data_descriptor
        typedef :pointer, :eet_data_descriptor_p
        # typedef struct _Eet_Data_Descriptor_Class Eet_Data_Descriptor_Class;
        typedef :pointer, :eet_data_descriptor_class
        typedef :pointer, :eet_data_descriptor_class_p
        # typedef struct _Eet_Node Eet_Node;
        typedef :pointer, :eet_node
        typedef :pointer, :eet_node_p
        # typedef struct _Eet_Node_Data Eet_Node_Data;
        typedef :pointer, :eet_node_data
        typedef :pointer, :eet_node_data_p
        # typedef struct _Eet_Node_Walk Eet_Node_Walk;
        typedef :pointer, :eet_node_walk
        typedef :pointer, :eet_node_walk_p
        # typedef struct _Eet_Connection Eet_Connection;
        typedef :pointer, :eet_connection
        typedef :pointer, :eet_connection_p
        #
        # CALLBACKS
        # typedef int (*Eet_Key_Password_Callback) (char *buffer, int size, int rwflag, void *data);
        callback :eet_key_password_callback, [ :string, :int, :int, :void_p ], :int
        # typedef int (*Eet_Descriptor_Hash_Foreach_Callback_Callback) (void *h, const char *k, void *dt, void *fdt);
        callback :eet_descriptor_hash_foreach_callback_callback, [ :void_p, :string, :void_p, :void_p ], :int
        # typedef void *(*Eet_Descriptor_Mem_Alloc_Callback) (size_t size);
        callback :eet_descriptor_mem_alloc_callback, [ :ulong ], :void
        # typedef void (*Eet_Descriptor_Mem_Free_Callback) (void *mem);
        callback :eet_descriptor_mem_free_callback, [ :void_p ], :void
        # typedef char *(*Eet_Descriptor_Str_Alloc_Callback) (const char *str);
        callback :eet_descriptor_str_alloc_callback, [ :string ], :char
        # typedef void (*Eet_Descriptor_Str_Free_Callback) (const char *str);
        callback :eet_descriptor_str_free_callback, [ :string ], :void
        # typedef void *(*Eet_Descriptor_List_Next_Callback) (void *l);
        callback :eet_descriptor_list_next_callback, [ :void_p ], :void
        # typedef void *(*Eet_Descriptor_List_Append_Callback) (void *l, void *d);
        callback :eet_descriptor_list_append_callback, [ :void_p, :void_p ], :void
        # typedef void *(*Eet_Descriptor_List_Data_Callback) (void *l);
        callback :eet_descriptor_list_data_callback, [ :void_p ], :void
        # typedef void *(*Eet_Descriptor_List_Free_Callback) (void *l);
        callback :eet_descriptor_list_free_callback, [ :void_p ], :void
        # typedef void (*Eet_Descriptor_Hash_Foreach_Callback) (void *h, Eet_Descriptor_Hash_Foreach_Callback_Callback func, void *fdt);
        callback :eet_descriptor_hash_foreach_callback, [ :void_p, :eet_descriptor_hash_foreach_callback_callback, :void_p ], :void
        # typedef void *(*Eet_Descriptor_Hash_Add_Callback) (void *h, const char *k, void *d);
        callback :eet_descriptor_hash_add_callback, [ :void_p, :string, :void_p ], :void
        # typedef void (*Eet_Descriptor_Hash_Free_Callback) (void *h);
        callback :eet_descriptor_hash_free_callback, [ :void_p ], :void
        # typedef char *(*Eet_Descriptor_Str_Direct_Alloc_Callback) (const char *str);
        callback :eet_descriptor_str_direct_alloc_callback, [ :string ], :char
        # typedef void (*Eet_Descriptor_Str_Direct_Free_Callback) (const char *str);
        callback :eet_descriptor_str_direct_free_callback, [ :string ], :void
        # typedef const char *(*Eet_Descriptor_Type_Get_Callback) (const void *data, Eina_Bool *unknow);
        callback :eet_descriptor_type_get_callback, [ :void_p, :uchar_p ], :char
        # typedef Eina_Bool (*Eet_Descriptor_Type_Set_Callback) (const char *type, void *data, Eina_Bool unknow);
        callback :eet_descriptor_type_set_callback, [ :string, :void_p, :uchar ], :uchar
        # typedef void *(*Eet_Descriptor_Array_Alloc_Callback) (size_t size);
        callback :eet_descriptor_array_alloc_callback, [ :ulong ], :void
        # typedef void (*Eet_Descriptor_Array_Free_Callback) (void *mem);
        callback :eet_descriptor_array_free_callback, [ :void_p ], :void
        # typedef void (*Eet_Dump_Callback) (void *data, const char *str);
        callback :eet_dump_callback, [ :void_p, :string ], :void
        # typedef void *(*Eet_Node_Walk_Struct_Alloc_Callback) (const char *type, void *user_data);
        callback :eet_node_walk_struct_alloc_callback, [ :string, :void_p ], :void
        # typedef void (*Eet_Node_Walk_Struct_Add_Callback) (void *parent, const char *name, void *child, void *user_data);
        callback :eet_node_walk_struct_add_callback, [ :void_p, :string, :void_p, :void_p ], :void
        # typedef void *(*Eet_Node_Walk_Array_Callback) (Eina_Bool variable, const char *name, int count, void *user_data);
        callback :eet_node_walk_array_callback, [ :uchar, :string, :int, :void_p ], :void
        # typedef void (*Eet_Node_Walk_Insert_Callback) (void *array, int index, void *child, void *user_data);
        callback :eet_node_walk_insert_callback, [ :void_p, :int, :void_p, :void_p ], :void
        # typedef void *(*Eet_Node_Walk_List_Callback) (const char *name, void *user_data);
        callback :eet_node_walk_list_callback, [ :string, :void_p ], :void
        # typedef void (*Eet_Node_Walk_Append_Callback) (void *list, void *child, void *user_data);
        callback :eet_node_walk_append_callback, [ :void_p, :void_p, :void_p ], :void
        # typedef void *(*Eet_Node_Walk_Hash_Callback) (void *parent, const char *name, const char *key, void *value, void *user_data);
        callback :eet_node_walk_hash_callback, [ :void_p, :string, :string, :void_p, :void_p ], :void
        # typedef void *(*Eet_Node_Walk_Simple_Callback) (int type, Eet_Node_Data *data, void *user_data);
        callback :eet_node_walk_simple_callback, [ :int, :eet_node_data_p, :void_p ], :void
        # typedef Eina_Bool Eet_Read_Cb (const void *eet_data, size_t size, void *user_data);
        callback :eet_read_cb, [ :void_p, :ulong, :void_p ], :uchar
        # typedef Eina_Bool Eet_Write_Cb (const void *data, size_t size, void *user_data);
        callback :eet_write_cb, [ :void_p, :ulong, :void_p ], :uchar
    end
end
#
# EOF
