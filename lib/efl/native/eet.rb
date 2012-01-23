#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/eina_xattr'
#
module Efl
    #
    module Eet
        #
        FCT_PREFIX = 'eet_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'eet'
        #
        # ENUMS
        # typedef enum _Eet_Error {...} Eet_Error;
        enum :eet_error, [ :eet_error_none, :eet_error_bad_object, :eet_error_empty, :eet_error_not_writable, :eet_error_out_of_memory,
            :eet_error_write_error, :eet_error_write_error_file_too_big, :eet_error_write_error_io_error, :eet_error_write_error_out_of_space,
            :eet_error_write_error_file_closed, :eet_error_mmap_failed, :eet_error_x509_encoding_failed, :eet_error_signature_failed,
            :eet_error_invalid_signature, :eet_error_not_signed, :eet_error_not_implemented, :eet_error_prng_not_seeded, :eet_error_encrypt_failed,
            :eet_error_decrypt_failed ]
        # typedef enum _Eet_File_Mode {...} Eet_File_Mode;
        enum :eet_file_mode, [ :eet_file_mode_invalid, -1, :eet_file_mode_read, 0, :eet_file_mode_write, 1, :eet_file_mode_read_write, 2 ]
        #
        # TYPEDEFS
        # typedef struct _Eet_Version Eet_Version;
        typedef :pointer, :eet_version
        # typedef struct _Eet_File Eet_File;
        typedef :pointer, :eet_file
        # typedef struct _Eet_Dictionary Eet_Dictionary;
        typedef :pointer, :eet_dictionary
        # typedef struct _Eet_Key Eet_Key;
        typedef :pointer, :eet_key
        # typedef struct _Eet_Data_Descriptor Eet_Data_Descriptor;
        typedef :pointer, :eet_data_descriptor
        # typedef struct _Eet_Data_Descriptor_Class Eet_Data_Descriptor_Class;
        typedef :pointer, :eet_data_descriptor_class
        # typedef struct _Eet_Node Eet_Node;
        typedef :pointer, :eet_node
        # typedef struct _Eet_Node_Data Eet_Node_Data;
        typedef :pointer, :eet_node_data
        # typedef struct _Eet_Node_Walk Eet_Node_Walk;
        typedef :pointer, :eet_node_walk
        # typedef struct _Eet_Connection Eet_Connection;
        typedef :pointer, :eet_connection
        #
        # CALLBACKS
        # typedef int (*Eet_Key_Password_Callback) (char *buffer, int size, int rwflag, void *data);
        callback :eet_key_password_callback_cb, [ :string, :int, :int, :pointer ], :int
        # typedef int (*Eet_Descriptor_Hash_Foreach_Callback_Callback) (void *h, const char *k, void *dt, void *fdt);
        callback :eet_descriptor_hash_foreach_callback_callback_cb, [ :pointer, :string, :pointer, :pointer ], :int
        # typedef void * (*Eet_Descriptor_Mem_Alloc_Callback) (size_t size);
        callback :eet_descriptor_mem_alloc_callback_cb, [ :ulong ], :pointer
        # typedef void (*Eet_Descriptor_Mem_Free_Callback) (void *mem);
        callback :eet_descriptor_mem_free_callback_cb, [ :pointer ], :void
        # typedef char * (*Eet_Descriptor_Str_Alloc_Callback) (const char *str);
        callback :eet_descriptor_str_alloc_callback_cb, [ :string ], :string
        # typedef void (*Eet_Descriptor_Str_Free_Callback) (const char *str);
        callback :eet_descriptor_str_free_callback_cb, [ :string ], :void
        # typedef void * (*Eet_Descriptor_List_Next_Callback) (void *l);
        callback :eet_descriptor_list_next_callback_cb, [ :pointer ], :pointer
        # typedef void * (*Eet_Descriptor_List_Append_Callback) (void *l, void *d);
        callback :eet_descriptor_list_append_callback_cb, [ :pointer, :pointer ], :pointer
        # typedef void * (*Eet_Descriptor_List_Data_Callback) (void *l);
        callback :eet_descriptor_list_data_callback_cb, [ :pointer ], :pointer
        # typedef void * (*Eet_Descriptor_List_Free_Callback) (void *l);
        callback :eet_descriptor_list_free_callback_cb, [ :pointer ], :pointer
        # typedef void (*Eet_Descriptor_Hash_Foreach_Callback) (void *h, Eet_Descriptor_Hash_Foreach_Callback_Callback func, void *fdt);
        callback :eet_descriptor_hash_foreach_callback_cb, [ :pointer, :eet_descriptor_hash_foreach_callback_callback_cb, :pointer ], :void
        # typedef void * (*Eet_Descriptor_Hash_Add_Callback) (void *h, const char *k, void *d);
        callback :eet_descriptor_hash_add_callback_cb, [ :pointer, :string, :pointer ], :pointer
        # typedef void (*Eet_Descriptor_Hash_Free_Callback) (void *h);
        callback :eet_descriptor_hash_free_callback_cb, [ :pointer ], :void
        # typedef char * (*Eet_Descriptor_Str_Direct_Alloc_Callback) (const char *str);
        callback :eet_descriptor_str_direct_alloc_callback_cb, [ :string ], :string
        # typedef void (*Eet_Descriptor_Str_Direct_Free_Callback) (const char *str);
        callback :eet_descriptor_str_direct_free_callback_cb, [ :string ], :void
        # typedef const char * (*Eet_Descriptor_Type_Get_Callback) (const void *data, Eina_Bool *unknow);
        callback :eet_descriptor_type_get_callback_cb, [ :pointer, :pointer ], :string
        # typedef Eina_Bool (*Eet_Descriptor_Type_Set_Callback) (const char *type, void *data, Eina_Bool unknow);
        callback :eet_descriptor_type_set_callback_cb, [ :string, :pointer, :eina_bool ], :eina_bool
        # typedef void * (*Eet_Descriptor_Array_Alloc_Callback) (size_t size);
        callback :eet_descriptor_array_alloc_callback_cb, [ :ulong ], :pointer
        # typedef void (*Eet_Descriptor_Array_Free_Callback) (void *mem);
        callback :eet_descriptor_array_free_callback_cb, [ :pointer ], :void
        # typedef void (*Eet_Dump_Callback) (void *data, const char *str);
        callback :eet_dump_callback_cb, [ :pointer, :string ], :void
        # typedef void * (*Eet_Node_Walk_Struct_Alloc_Callback) (const char *type, void *user_data);
        callback :eet_node_walk_struct_alloc_callback_cb, [ :string, :pointer ], :pointer
        # typedef void (*Eet_Node_Walk_Struct_Add_Callback) (void *parent, const char *name, void *child, void *user_data);
        callback :eet_node_walk_struct_add_callback_cb, [ :pointer, :string, :pointer, :pointer ], :void
        # typedef void * (*Eet_Node_Walk_Array_Callback) (Eina_Bool variable, const char *name, int count, void *user_data);
        callback :eet_node_walk_array_callback_cb, [ :eina_bool, :string, :int, :pointer ], :pointer
        # typedef void (*Eet_Node_Walk_Insert_Callback) (void *array, int index, void *child, void *user_data);
        callback :eet_node_walk_insert_callback_cb, [ :pointer, :int, :pointer, :pointer ], :void
        # typedef void * (*Eet_Node_Walk_List_Callback) (const char *name, void *user_data);
        callback :eet_node_walk_list_callback_cb, [ :string, :pointer ], :pointer
        # typedef void (*Eet_Node_Walk_Append_Callback) (void *list, void *child, void *user_data);
        callback :eet_node_walk_append_callback_cb, [ :pointer, :pointer, :pointer ], :void
        # typedef void * (*Eet_Node_Walk_Hash_Callback) (void *parent, const char *name, const char *key, void *value, void *user_data);
        callback :eet_node_walk_hash_callback_cb, [ :pointer, :string, :string, :pointer, :pointer ], :pointer
        # typedef void * (*Eet_Node_Walk_Simple_Callback) (int type, Eet_Node_Data *data, void *user_data);
        callback :eet_node_walk_simple_callback_cb, [ :int, :pointer, :pointer ], :pointer
        # typedef Eina_Bool Eet_Read_Cb (const void *eet_data, size_t size, void *user_data);
        callback :eet_read_cb, [ :pointer, :ulong, :pointer ], :eina_bool
        # typedef Eina_Bool Eet_Write_Cb (const void *data, size_t size, void *user_data);
        callback :eet_write_cb, [ :pointer, :ulong, :pointer ], :eina_bool
        #
        # VARIABLES
        # EAPI extern Eet_Version *eet_version;
        attach_variable :eet_version, :pointer
        #
        # FUNCTIONS
        fcts = [
        # EAPI int eet_init(void);
        [ :eet_init, [  ], :int ],
        # EAPI int eet_shutdown(void);
        [ :eet_shutdown, [  ], :int ],
        # EAPI void eet_clearcache(void);
        [ :eet_clearcache, [  ], :void ],
        # EAPI Eet_File * eet_open(const char *file, Eet_File_Mode mode);
        [ :eet_open, [ :string, :eet_file_mode ], :pointer ],
        # EAPI Eet_File * eet_memopen_read(const void *data, size_t size);
        [ :eet_memopen_read, [ :pointer, :ulong ], :pointer ],
        # EAPI Eet_File_Mode eet_mode_get(Eet_File *ef);
        [ :eet_mode_get, [ :pointer ], :eet_file_mode ],
        # EAPI Eet_Error eet_close(Eet_File *ef);
        [ :eet_close, [ :pointer ], :eet_error ],
        # EAPI Eet_Error eet_sync(Eet_File *ef);
        [ :eet_sync, [ :pointer ], :eet_error ],
        # EAPI Eet_Dictionary * eet_dictionary_get(Eet_File *ef);
        [ :eet_dictionary_get, [ :pointer ], :pointer ],
        # EAPI int eet_dictionary_string_check(Eet_Dictionary *ed, const char *string);
        [ :eet_dictionary_string_check, [ :pointer, :string ], :int ],
        # EAPI void * eet_read(Eet_File *ef, const char *name, int *size_ret);
        [ :eet_read, [ :pointer, :string, :pointer ], :pointer ],
        # EAPI const void * eet_read_direct(Eet_File *ef, const char *name, int *size_ret);
        [ :eet_read_direct, [ :pointer, :string, :pointer ], :pointer ],
        # EAPI int eet_write(Eet_File *ef, const char *name, const void *data, int size, int compress);
        [ :eet_write, [ :pointer, :string, :pointer, :int, :int ], :int ],
        # EAPI int eet_delete(Eet_File *ef, const char *name);
        [ :eet_delete, [ :pointer, :string ], :int ],
        # EAPI Eina_Bool eet_alias(Eet_File *ef, const char *name, const char *destination, int compress);
        [ :eet_alias, [ :pointer, :string, :string, :int ], :eina_bool ],
        # EAPI const char * eet_file_get(Eet_File *ef);
        [ :eet_file_get, [ :pointer ], :string ],
        # EAPI const char * eet_alias_get(Eet_File *ef, const char *name);
        [ :eet_alias_get, [ :pointer, :string ], :string ],
        # EAPI char ** eet_list(Eet_File *ef, const char *glob, int *count_ret);
        [ :eet_list, [ :pointer, :string, :pointer ], :pointer ],
        # EAPI int eet_num_entries(Eet_File *ef);
        [ :eet_num_entries, [ :pointer ], :int ],
        # EAPI void * eet_read_cipher(Eet_File *ef, const char *name, int *size_ret, const char *cipher_key);
        [ :eet_read_cipher, [ :pointer, :string, :pointer, :string ], :pointer ],
        # EAPI int eet_write_cipher(Eet_File *ef, const char *name, const void *data, int size, int compress, const char *cipher_key);
        [ :eet_write_cipher, [ :pointer, :string, :pointer, :int, :int, :string ], :int ],
        # EAPI int eet_data_image_header_read(Eet_File *ef, const char *name, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_header_read, [ :pointer, :string, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer ], :int ],
        # EAPI void * eet_data_image_read(Eet_File *ef, const char *name, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_read, [ :pointer, :string, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer ], :pointer ],
        # EAPI int eet_data_image_read_to_surface(Eet_File *ef, const char *name, unsigned int src_x, unsigned int src_y, unsigned int *d, unsigned int w, unsigned int h, unsigned int row_stride, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_read_to_surface, [ :pointer, :string, :uint, :uint, :pointer, :uint, :uint, :uint, :pointer, :pointer, :pointer, :pointer ],
            :int ],
        # EAPI int eet_data_image_write(Eet_File *ef, const char *name, const void *data, unsigned int w, unsigned int h, int alpha, int compress, int quality, int lossy);
        [ :eet_data_image_write, [ :pointer, :string, :pointer, :uint, :uint, :int, :int, :int, :int ], :int ],
        # EAPI int eet_data_image_header_decode(const void *data, int size, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_header_decode, [ :pointer, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer ], :int ],
        # EAPI void * eet_data_image_decode(const void *data, int size, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_decode, [ :pointer, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer ], :pointer ],
        # EAPI int eet_data_image_decode_to_surface(const void *data, int size, unsigned int src_x, unsigned int src_y, unsigned int *d, unsigned int w, unsigned int h, unsigned int row_stride, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_decode_to_surface, [ :pointer, :int, :uint, :uint, :pointer, :uint, :uint, :uint, :pointer, :pointer, :pointer, :pointer ],
            :int ],
        # EAPI void * eet_data_image_encode(const void *data, int *size_ret, unsigned int w, unsigned int h, int alpha, int compress, int quality, int lossy);
        [ :eet_data_image_encode, [ :pointer, :pointer, :uint, :uint, :int, :int, :int, :int ], :pointer ],
        # EAPI int eet_data_image_header_read_cipher(Eet_File *ef, const char *name, const char *cipher_key, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_header_read_cipher, [ :pointer, :string, :string, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer ], :int ],
        # EAPI void * eet_data_image_read_cipher(Eet_File *ef, const char *name, const char *cipher_key, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_read_cipher, [ :pointer, :string, :string, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer ], :pointer ],
        # EAPI int eet_data_image_read_to_surface_cipher(Eet_File *ef, const char *name, const char *cipher_key, unsigned int src_x, unsigned int src_y, unsigned int *d, unsigned int w, unsigned int h, unsigned int row_stride, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_read_to_surface_cipher, [ :pointer, :string, :string, :uint, :uint, :pointer, :uint, :uint, :uint, :pointer, :pointer,
            :pointer, :pointer ], :int ],
        # EAPI int eet_data_image_write_cipher(Eet_File *ef, const char *name, const char *cipher_key, const void *data, unsigned int w, unsigned int h, int alpha, int compress, int quality, int lossy);
        [ :eet_data_image_write_cipher, [ :pointer, :string, :string, :pointer, :uint, :uint, :int, :int, :int, :int ], :int ],
        # EAPI int eet_data_image_header_decode_cipher(const void *data, const char *cipher_key, int size, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_header_decode_cipher, [ :pointer, :string, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer ], :int ],
        # EAPI void * eet_data_image_decode_cipher(const void *data, const char *cipher_key, int size, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_decode_cipher, [ :pointer, :string, :int, :pointer, :pointer, :pointer, :pointer, :pointer, :pointer ], :pointer ],
        # EAPI int eet_data_image_decode_to_surface_cipher(const void *data, const char *cipher_key, int size, unsigned int src_x, unsigned int src_y, unsigned int *d, unsigned int w, unsigned int h, unsigned int row_stride, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_decode_to_surface_cipher, [ :pointer, :string, :int, :uint, :uint, :pointer, :uint, :uint, :uint, :pointer, :pointer,
            :pointer, :pointer ], :int ],
        # EAPI void * eet_data_image_encode_cipher(const void *data, const char *cipher_key, unsigned int w, unsigned int h, int alpha, int compress, int quality, int lossy, int *size_ret);
        [ :eet_data_image_encode_cipher, [ :pointer, :string, :uint, :uint, :int, :int, :int, :int, :pointer ], :pointer ],
        # EAPI Eet_Key * eet_identity_open(const char *certificate_file, const char *private_key_file, Eet_Key_Password_Callback cb);
        [ :eet_identity_open, [ :string, :string, :eet_key_password_callback_cb ], :pointer ],
        # EAPI void eet_identity_close(Eet_Key *key);
        [ :eet_identity_close, [ :pointer ], :void ],
        # EAPI Eet_Error eet_identity_set(Eet_File *ef, Eet_Key *key);
        [ :eet_identity_set, [ :pointer, :pointer ], :eet_error ],
        # EAPI void eet_identity_print(Eet_Key *key, FILE *out);
        [ :eet_identity_print, [ :pointer, :pointer ], :void ],
        # EAPI const void * eet_identity_x509(Eet_File *ef, int *der_length);
        [ :eet_identity_x509, [ :pointer, :pointer ], :pointer ],
        # EAPI const void * eet_identity_signature(Eet_File *ef, int *signature_length);
        [ :eet_identity_signature, [ :pointer, :pointer ], :pointer ],
        # EAPI const void * eet_identity_sha1(Eet_File *ef, int *sha1_length);
        [ :eet_identity_sha1, [ :pointer, :pointer ], :pointer ],
        # EAPI void eet_identity_certificate_print(const unsigned char *certificate, int der_length, FILE *out);
        [ :eet_identity_certificate_print, [ :pointer, :int, :pointer ], :void ],
        # EAPI Eet_Data_Descriptor * eet_data_descriptor_stream_new(const Eet_Data_Descriptor_Class *eddc);
        [ :eet_data_descriptor_stream_new, [ :pointer ], :pointer ],
        # EAPI Eet_Data_Descriptor * eet_data_descriptor_file_new(const Eet_Data_Descriptor_Class *eddc);
        [ :eet_data_descriptor_file_new, [ :pointer ], :pointer ],
        # EAPI Eina_Bool eet_eina_stream_data_descriptor_class_set(Eet_Data_Descriptor_Class *eddc, unsigned int eddc_size, const char *name, int size);
        [ :eet_eina_stream_data_descriptor_class_set, [ :pointer, :uint, :string, :int ], :eina_bool ],
        # EAPI Eina_Bool eet_eina_file_data_descriptor_class_set(Eet_Data_Descriptor_Class *eddc, unsigned int eddc_size, const char *name, int size);
        [ :eet_eina_file_data_descriptor_class_set, [ :pointer, :uint, :string, :int ], :eina_bool ],
        # EAPI void eet_data_descriptor_free(Eet_Data_Descriptor *edd);
        [ :eet_data_descriptor_free, [ :pointer ], :void ],
        # EAPI void eet_data_descriptor_element_add(Eet_Data_Descriptor *edd, const char *name, int type, int group_type, int offset, /* int count_offset, */
        # FIXME
        # EAPI void * eet_data_read(Eet_File *ef, Eet_Data_Descriptor *edd, const char *name);
        [ :eet_data_read, [ :pointer, :pointer, :string ], :pointer ],
        # EAPI int eet_data_write(Eet_File *ef, Eet_Data_Descriptor *edd, const char *name, const void *data, int compress);
        [ :eet_data_write, [ :pointer, :pointer, :string, :pointer, :int ], :int ],
        # EAPI int eet_data_text_dump(const void *data_in, int size_in, Eet_Dump_Callback dumpfunc, void *dumpdata);
        [ :eet_data_text_dump, [ :pointer, :int, :eet_dump_callback_cb, :pointer ], :int ],
        # EAPI void * eet_data_text_undump(const char *text, int textlen, int *size_ret);
        [ :eet_data_text_undump, [ :string, :int, :pointer ], :pointer ],
        # EAPI int eet_data_dump(Eet_File *ef, const char *name, Eet_Dump_Callback dumpfunc, void *dumpdata);
        [ :eet_data_dump, [ :pointer, :string, :eet_dump_callback_cb, :pointer ], :int ],
        # EAPI int eet_data_undump(Eet_File *ef, const char *name, const char *text, int textlen, int compress);
        [ :eet_data_undump, [ :pointer, :string, :string, :int, :int ], :int ],
        # EAPI void * eet_data_descriptor_decode(Eet_Data_Descriptor *edd, const void *data_in, int size_in);
        [ :eet_data_descriptor_decode, [ :pointer, :pointer, :int ], :pointer ],
        # EAPI void * eet_data_descriptor_encode(Eet_Data_Descriptor *edd, const void *data_in, int *size_ret);
        [ :eet_data_descriptor_encode, [ :pointer, :pointer, :pointer ], :pointer ],
        # EAPI void * eet_data_read_cipher(Eet_File *ef, Eet_Data_Descriptor *edd, const char *name, const char *cipher_key);
        [ :eet_data_read_cipher, [ :pointer, :pointer, :string, :string ], :pointer ],
        # EAPI void * eet_data_xattr_cipher_get(const char *filename, const char *attribute, Eet_Data_Descriptor *edd, const char *cipher_key);
        [ :eet_data_xattr_cipher_get, [ :string, :string, :pointer, :string ], :pointer ],
        # EAPI int eet_data_write_cipher(Eet_File *ef, Eet_Data_Descriptor *edd, const char *name, const char *cipher_key, const void *data, int compress);
        [ :eet_data_write_cipher, [ :pointer, :pointer, :string, :string, :pointer, :int ], :int ],
        # EAPI Eina_Bool eet_data_xattr_cipher_set(const char *filename, const char *attribute, Eet_Data_Descriptor *edd, const char *cipher_key, const void *data, Eina_Xattr_Flags flags);
        [ :eet_data_xattr_cipher_set, [ :string, :string, :pointer, :string, :pointer, :eina_xattr_flags ], :eina_bool ],
        # EAPI int eet_data_text_dump_cipher(const void *data_in, const char *cipher_key, int size_in, Eet_Dump_Callback dumpfunc, void *dumpdata);
        [ :eet_data_text_dump_cipher, [ :pointer, :string, :int, :eet_dump_callback_cb, :pointer ], :int ],
        # EAPI void * eet_data_text_undump_cipher(const char *text, const char *cipher_key, int textlen, int *size_ret);
        [ :eet_data_text_undump_cipher, [ :string, :string, :int, :pointer ], :pointer ],
        # EAPI int eet_data_dump_cipher(Eet_File *ef, const char *name, const char *cipher_key, Eet_Dump_Callback dumpfunc, void *dumpdata);
        [ :eet_data_dump_cipher, [ :pointer, :string, :string, :eet_dump_callback_cb, :pointer ], :int ],
        # EAPI int eet_data_undump_cipher(Eet_File *ef, const char *name, const char *cipher_key, const char *text, int textlen, int compress);
        [ :eet_data_undump_cipher, [ :pointer, :string, :string, :string, :int, :int ], :int ],
        # EAPI void * eet_data_descriptor_decode_cipher(Eet_Data_Descriptor *edd, const void *data_in, const char *cipher_key, int size_in);
        [ :eet_data_descriptor_decode_cipher, [ :pointer, :pointer, :string, :int ], :pointer ],
        # EAPI void * eet_data_descriptor_encode_cipher(Eet_Data_Descriptor *edd, const void *data_in, const char *cipher_key, int *size_ret);
        [ :eet_data_descriptor_encode_cipher, [ :pointer, :pointer, :string, :pointer ], :pointer ],
        # EAPI Eet_Node * eet_node_char_new(const char *name, char c);
        [ :eet_node_char_new, [ :string, :char ], :pointer ],
        # EAPI Eet_Node * eet_node_short_new(const char *name, short s);
        [ :eet_node_short_new, [ :string, :short ], :pointer ],
        # EAPI Eet_Node * eet_node_int_new(const char *name, int i);
        [ :eet_node_int_new, [ :string, :int ], :pointer ],
        # EAPI Eet_Node * eet_node_long_long_new(const char *name, long long l);
        [ :eet_node_long_long_new, [ :string, :long_long ], :pointer ],
        # EAPI Eet_Node * eet_node_float_new(const char *name, float f);
        [ :eet_node_float_new, [ :string, :float ], :pointer ],
        # EAPI Eet_Node * eet_node_double_new(const char *name, double d);
        [ :eet_node_double_new, [ :string, :double ], :pointer ],
        # EAPI Eet_Node * eet_node_unsigned_char_new(const char *name, unsigned char uc);
        [ :eet_node_unsigned_char_new, [ :string, :uchar ], :pointer ],
        # EAPI Eet_Node * eet_node_unsigned_short_new(const char *name, unsigned short us);
        [ :eet_node_unsigned_short_new, [ :string, :ushort ], :pointer ],
        # EAPI Eet_Node * eet_node_unsigned_int_new(const char *name, unsigned int ui);
        [ :eet_node_unsigned_int_new, [ :string, :uint ], :pointer ],
        # EAPI Eet_Node * eet_node_unsigned_long_long_new(const char *name, unsigned long long l);
        [ :eet_node_unsigned_long_long_new, [ :string, :ulong_long ], :pointer ],
        # EAPI Eet_Node * eet_node_string_new(const char *name, const char *str);
        [ :eet_node_string_new, [ :string, :string ], :pointer ],
        # EAPI Eet_Node * eet_node_inlined_string_new(const char *name, const char *str);
        [ :eet_node_inlined_string_new, [ :string, :string ], :pointer ],
        # EAPI Eet_Node * eet_node_null_new(const char *name);
        [ :eet_node_null_new, [ :string ], :pointer ],
        # EAPI Eet_Node * eet_node_list_new(const char *name, Eina_List *nodes);
        [ :eet_node_list_new, [ :string, :pointer ], :pointer ],
        # EAPI Eet_Node * eet_node_array_new(const char *name, int count, Eina_List *nodes);
        [ :eet_node_array_new, [ :string, :int, :pointer ], :pointer ],
        # EAPI Eet_Node * eet_node_var_array_new(const char *name, Eina_List *nodes);
        [ :eet_node_var_array_new, [ :string, :pointer ], :pointer ],
        # EAPI Eet_Node * eet_node_hash_new(const char *name, const char *key, Eet_Node *node);
        [ :eet_node_hash_new, [ :string, :string, :pointer ], :pointer ],
        # EAPI Eet_Node * eet_node_struct_new(const char *name, Eina_List *nodes);
        [ :eet_node_struct_new, [ :string, :pointer ], :pointer ],
        # EAPI Eet_Node * eet_node_struct_child_new(const char *parent, Eet_Node *child);
        [ :eet_node_struct_child_new, [ :string, :pointer ], :pointer ],
        # EAPI Eet_Node * eet_node_children_get(Eet_Node *node);
        [ :eet_node_children_get, [ :pointer ], :pointer ],
        # EAPI Eet_Node * eet_node_next_get(Eet_Node *node);
        [ :eet_node_next_get, [ :pointer ], :pointer ],
        # EAPI Eet_Node * eet_node_parent_get(Eet_Node *node);
        [ :eet_node_parent_get, [ :pointer ], :pointer ],
        # EAPI void eet_node_list_append(Eet_Node *parent, const char *name, Eet_Node *child);
        [ :eet_node_list_append, [ :pointer, :string, :pointer ], :void ],
        # EAPI void eet_node_struct_append(Eet_Node *parent, const char *name, Eet_Node *child);
        [ :eet_node_struct_append, [ :pointer, :string, :pointer ], :void ],
        # EAPI void eet_node_hash_add(Eet_Node *parent, const char *name, const char *key, Eet_Node *child);
        [ :eet_node_hash_add, [ :pointer, :string, :string, :pointer ], :void ],
        # EAPI void eet_node_dump(Eet_Node *n, int dumplevel, Eet_Dump_Callback dumpfunc, void *dumpdata);
        [ :eet_node_dump, [ :pointer, :int, :eet_dump_callback_cb, :pointer ], :void ],
        # EAPI int eet_node_type_get(Eet_Node *node);
        [ :eet_node_type_get, [ :pointer ], :int ],
        # EAPI Eet_Node_Data * eet_node_value_get(Eet_Node *node);
        [ :eet_node_value_get, [ :pointer ], :pointer ],
        # EAPI void eet_node_del(Eet_Node *n);
        [ :eet_node_del, [ :pointer ], :void ],
        # EAPI void * eet_data_node_encode_cipher(Eet_Node *node, const char *cipher_key, int *size_ret);
        [ :eet_data_node_encode_cipher, [ :pointer, :string, :pointer ], :pointer ],
        # EAPI Eet_Node * eet_data_node_decode_cipher(const void *data_in, const char *cipher_key, int size_in);
        [ :eet_data_node_decode_cipher, [ :pointer, :string, :int ], :pointer ],
        # EAPI Eet_Node * eet_data_node_read_cipher(Eet_File *ef, const char *name, const char *cipher_key);
        [ :eet_data_node_read_cipher, [ :pointer, :string, :string ], :pointer ],
        # EAPI int eet_data_node_write_cipher(Eet_File *ef, const char *name, const char *cipher_key, Eet_Node *node, int compress);
        [ :eet_data_node_write_cipher, [ :pointer, :string, :string, :pointer, :int ], :int ],
        # EAPI void * eet_node_walk(void *parent, const char *name, Eet_Node *root, Eet_Node_Walk *cb, void *user_data);
        [ :eet_node_walk, [ :pointer, :string, :pointer, :pointer, :pointer ], :pointer ],
        # EAPI Eet_Connection * eet_connection_new(Eet_Read_Cb *eet_read_cb, Eet_Write_Cb *eet_write_cb, const void *user_data);
        [ :eet_connection_new, [ :pointer, :pointer, :pointer ], :pointer ],
        # EAPI int eet_connection_received(Eet_Connection *conn, const void *data, size_t size);
        [ :eet_connection_received, [ :pointer, :pointer, :ulong ], :int ],
        # EAPI Eina_Bool eet_connection_send(Eet_Connection *conn, Eet_Data_Descriptor *edd, const void *data_in, const char *cipher_key);
        [ :eet_connection_send, [ :pointer, :pointer, :pointer, :string ], :eina_bool ],
        # EAPI Eina_Bool eet_connection_node_send(Eet_Connection *conn, Eet_Node *node, const char *cipher_key);
        [ :eet_connection_node_send, [ :pointer, :pointer, :string ], :eina_bool ],
        # EAPI void * eet_connection_close(Eet_Connection *conn, Eina_Bool *on_going);
        [ :eet_connection_close, [ :pointer, :pointer ], :pointer ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
