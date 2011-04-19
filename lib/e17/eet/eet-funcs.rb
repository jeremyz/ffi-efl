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
        ffi_lib 'eet'
        #
        # FUNCTIONS
        fcts = [
        # EAPI extern Eet_Version *eet_version;
        # FIXME
        # EAPI int eet_init(void);
        [ :eet_init, [  ], :int ],
        # EAPI int eet_shutdown(void);
        [ :eet_shutdown, [  ], :int ],
        # EAPI void eet_clearcache(void);
        [ :eet_clearcache, [  ], :void ],
        # EAPI Eet_File * eet_open(const char *file, Eet_File_Mode mode);
        [ :eet_open, [ :string, :eet_file_mode ], :eet_file_p ],
        # EAPI Eet_File * eet_memopen_read(const void *data, size_t size);
        [ :eet_memopen_read, [ :void_p, :ulong ], :eet_file_p ],
        # EAPI Eet_File_Mode eet_mode_get(Eet_File *ef);
        [ :eet_mode_get, [ :eet_file_p ], :eet_file_mode ],
        # EAPI Eet_Error eet_close(Eet_File *ef);
        [ :eet_close, [ :eet_file_p ], :eet_error ],
        # EAPI Eet_Error eet_sync(Eet_File *ef);
        [ :eet_sync, [ :eet_file_p ], :eet_error ],
        # EAPI Eet_Dictionary * eet_dictionary_get(Eet_File *ef);
        [ :eet_dictionary_get, [ :eet_file_p ], :eet_dictionary_p ],
        # EAPI int eet_dictionary_string_check(Eet_Dictionary *ed, const char *string);
        [ :eet_dictionary_string_check, [ :eet_dictionary_p, :string ], :int ],
        # EAPI void * eet_read(Eet_File *ef, const char *name, int *size_ret);
        [ :eet_read, [ :eet_file_p, :string, :int_p ], :void_p ],
        # EAPI const void * eet_read_direct(Eet_File *ef, const char *name, int *size_ret);
        [ :eet_read_direct, [ :eet_file_p, :string, :int_p ], :void_p ],
        # EAPI int eet_write(Eet_File *ef, const char *name, const void *data, int size, int compress);
        [ :eet_write, [ :eet_file_p, :string, :void_p, :int, :int ], :int ],
        # EAPI int eet_delete(Eet_File *ef, const char *name);
        [ :eet_delete, [ :eet_file_p, :string ], :int ],
        # EAPI Eina_Bool eet_alias(Eet_File *ef, const char *name, const char *destination, int compress);
        [ :eet_alias, [ :eet_file_p, :string, :string, :int ], :uchar ],
        # EAPI char ** eet_list(Eet_File *ef, const char *glob, int *count_ret);
        [ :eet_list, [ :eet_file_p, :string, :int_p ], :string_array ],
        # EAPI int eet_num_entries(Eet_File *ef);
        [ :eet_num_entries, [ :eet_file_p ], :int ],
        # EAPI void * eet_read_cipher(Eet_File *ef, const char *name, int *size_ret, const char *cipher_key);
        [ :eet_read_cipher, [ :eet_file_p, :string, :int_p, :string ], :void_p ],
        # EAPI int eet_write_cipher(Eet_File *ef, const char *name, const void *data, int size, int compress, const char *cipher_key);
        [ :eet_write_cipher, [ :eet_file_p, :string, :void_p, :int, :int, :string ], :int ],
        # EAPI int eet_data_image_header_read(Eet_File *ef, const char *name, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_header_read, [ :eet_file_p, :string, :uint_p, :uint_p, :int_p, :int_p, :int_p, :int_p ], :int ],
        # EAPI void * eet_data_image_read(Eet_File *ef, const char *name, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_read, [ :eet_file_p, :string, :uint_p, :uint_p, :int_p, :int_p, :int_p, :int_p ], :void_p ],
        # EAPI int eet_data_image_read_to_surface(Eet_File *ef, const char *name, unsigned int src_x, unsigned int src_y, unsigned int *d, unsigned int w, unsigned int h, unsigned int row_stride, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_read_to_surface, [ :eet_file_p, :string, :uint, :uint, :uint_p, :uint, :uint, :uint, :int_p, :int_p, :int_p, :int_p ], :int
            ],
        # EAPI int eet_data_image_write(Eet_File *ef, const char *name, const void *data, unsigned int w, unsigned int h, int alpha, int compress, int quality, int lossy);
        [ :eet_data_image_write, [ :eet_file_p, :string, :void_p, :uint, :uint, :int, :int, :int, :int ], :int ],
        # EAPI int eet_data_image_header_decode(const void *data, int size, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_header_decode, [ :void_p, :int, :uint_p, :uint_p, :int_p, :int_p, :int_p, :int_p ], :int ],
        # EAPI void * eet_data_image_decode(const void *data, int size, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_decode, [ :void_p, :int, :uint_p, :uint_p, :int_p, :int_p, :int_p, :int_p ], :void_p ],
        # EAPI int eet_data_image_decode_to_surface(const void *data, int size, unsigned int src_x, unsigned int src_y, unsigned int *d, unsigned int w, unsigned int h, unsigned int row_stride, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_decode_to_surface, [ :void_p, :int, :uint, :uint, :uint_p, :uint, :uint, :uint, :int_p, :int_p, :int_p, :int_p ], :int ],
        # EAPI void * eet_data_image_encode(const void *data, int *size_ret, unsigned int w, unsigned int h, int alpha, int compress, int quality, int lossy);
        [ :eet_data_image_encode, [ :void_p, :int_p, :uint, :uint, :int, :int, :int, :int ], :void_p ],
        # EAPI int eet_data_image_header_read_cipher(Eet_File *ef, const char *name, const char *cipher_key, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_header_read_cipher, [ :eet_file_p, :string, :string, :uint_p, :uint_p, :int_p, :int_p, :int_p, :int_p ], :int ],
        # EAPI void * eet_data_image_read_cipher(Eet_File *ef, const char *name, const char *cipher_key, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_read_cipher, [ :eet_file_p, :string, :string, :uint_p, :uint_p, :int_p, :int_p, :int_p, :int_p ], :void_p ],
        # EAPI int eet_data_image_read_to_surface_cipher(Eet_File *ef, const char *name, const char *cipher_key, unsigned int src_x, unsigned int src_y, unsigned int *d, unsigned int w, unsigned int h, unsigned int row_stride, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_read_to_surface_cipher, [ :eet_file_p, :string, :string, :uint, :uint, :uint_p, :uint, :uint, :uint, :int_p, :int_p, :int_p,
            :int_p ], :int ],
        # EAPI int eet_data_image_write_cipher(Eet_File *ef, const char *name, const char *cipher_key, const void *data, unsigned int w, unsigned int h, int alpha, int compress, int quality, int lossy);
        [ :eet_data_image_write_cipher, [ :eet_file_p, :string, :string, :void_p, :uint, :uint, :int, :int, :int, :int ], :int ],
        # EAPI int eet_data_image_header_decode_cipher(const void *data, const char *cipher_key, int size, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_header_decode_cipher, [ :void_p, :string, :int, :uint_p, :uint_p, :int_p, :int_p, :int_p, :int_p ], :int ],
        # EAPI void * eet_data_image_decode_cipher(const void *data, const char *cipher_key, int size, unsigned int *w, unsigned int *h, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_decode_cipher, [ :void_p, :string, :int, :uint_p, :uint_p, :int_p, :int_p, :int_p, :int_p ], :void_p ],
        # EAPI int eet_data_image_decode_to_surface_cipher(const void *data, const char *cipher_key, int size, unsigned int src_x, unsigned int src_y, unsigned int *d, unsigned int w, unsigned int h, unsigned int row_stride, int *alpha, int *compress, int *quality, int *lossy);
        [ :eet_data_image_decode_to_surface_cipher, [ :void_p, :string, :int, :uint, :uint, :uint_p, :uint, :uint, :uint, :int_p, :int_p, :int_p,
            :int_p ], :int ],
        # EAPI void * eet_data_image_encode_cipher(const void *data, const char *cipher_key, unsigned int w, unsigned int h, int alpha, int compress, int quality, int lossy, int *size_ret);
        [ :eet_data_image_encode_cipher, [ :void_p, :string, :uint, :uint, :int, :int, :int, :int, :int_p ], :void_p ],
        # EAPI Eet_Key * eet_identity_open(const char *certificate_file, const char *private_key_file, Eet_Key_Password_Callback cb);
        [ :eet_identity_open, [ :string, :string, :eet_key_password_callback ], :eet_key_p ],
        # EAPI void eet_identity_close(Eet_Key *key);
        [ :eet_identity_close, [ :eet_key_p ], :void ],
        # EAPI Eet_Error eet_identity_set(Eet_File *ef, Eet_Key *key);
        [ :eet_identity_set, [ :eet_file_p, :eet_key_p ], :eet_error ],
        # EAPI void eet_identity_print(Eet_Key *key, FILE *out);
        [ :eet_identity_print, [ :eet_key_p, :pointer ], :void ],
        # EAPI const void * eet_identity_x509(Eet_File *ef, int *der_length);
        [ :eet_identity_x509, [ :eet_file_p, :int_p ], :void_p ],
        # EAPI const void * eet_identity_signature(Eet_File *ef, int *signature_length);
        [ :eet_identity_signature, [ :eet_file_p, :int_p ], :void_p ],
        # EAPI const void * eet_identity_sha1(Eet_File *ef, int *sha1_length);
        [ :eet_identity_sha1, [ :eet_file_p, :int_p ], :void_p ],
        # EAPI void eet_identity_certificate_print(const unsigned char *certificate, int der_length, FILE *out);
        [ :eet_identity_certificate_print, [ :uchar_p, :int, :pointer ], :void ],
        # EAPI Eet_Data_Descriptor * eet_data_descriptor_stream_new(const Eet_Data_Descriptor_Class *eddc);
        [ :eet_data_descriptor_stream_new, [ :eet_data_descriptor_class_p ], :eet_data_descriptor_p ],
        # EAPI Eet_Data_Descriptor * eet_data_descriptor_file_new(const Eet_Data_Descriptor_Class *eddc);
        [ :eet_data_descriptor_file_new, [ :eet_data_descriptor_class_p ], :eet_data_descriptor_p ],
        # EAPI Eina_Bool eet_eina_stream_data_descriptor_class_set(Eet_Data_Descriptor_Class *eddc, unsigned int		 eddc_size, const char *name, int size);
        # FIXME
        # EAPI Eina_Bool eet_eina_file_data_descriptor_class_set(Eet_Data_Descriptor_Class *eddc, unsigned int eddc_size, const char *name, int size);
        [ :eet_eina_file_data_descriptor_class_set, [ :eet_data_descriptor_class_p, :uint, :string, :int ], :uchar ],
        # EAPI void eet_data_descriptor_free(Eet_Data_Descriptor *edd);
        [ :eet_data_descriptor_free, [ :eet_data_descriptor_p ], :void ],
        # EAPI void eet_data_descriptor_element_add(Eet_Data_Descriptor *edd, const char *name, int type, int group_type, int offset, /* int count_offset, */
        # FIXME
        # EAPI void * eet_data_read(Eet_File *ef, Eet_Data_Descriptor *edd, const char *name);
        [ :eet_data_read, [ :eet_file_p, :eet_data_descriptor_p, :string ], :void_p ],
        # EAPI int eet_data_write(Eet_File *ef, Eet_Data_Descriptor *edd, const char *name, const void *data, int compress);
        [ :eet_data_write, [ :eet_file_p, :eet_data_descriptor_p, :string, :void_p, :int ], :int ],
        # EAPI int eet_data_text_dump(const void *data_in, int size_in, Eet_Dump_Callback dumpfunc, void *dumpdata);
        [ :eet_data_text_dump, [ :void_p, :int, :eet_dump_callback, :void_p ], :int ],
        # EAPI void * eet_data_text_undump(const char *text, int textlen, int *size_ret);
        [ :eet_data_text_undump, [ :string, :int, :int_p ], :void_p ],
        # EAPI int eet_data_dump(Eet_File *ef, const char *name, Eet_Dump_Callback dumpfunc, void *dumpdata);
        [ :eet_data_dump, [ :eet_file_p, :string, :eet_dump_callback, :void_p ], :int ],
        # EAPI int eet_data_undump(Eet_File *ef, const char *name, const char *text, int textlen, int compress);
        [ :eet_data_undump, [ :eet_file_p, :string, :string, :int, :int ], :int ],
        # EAPI void * eet_data_descriptor_decode(Eet_Data_Descriptor *edd, const void *data_in, int size_in);
        [ :eet_data_descriptor_decode, [ :eet_data_descriptor_p, :void_p, :int ], :void_p ],
        # EAPI void * eet_data_descriptor_encode(Eet_Data_Descriptor *edd, const void *data_in, int *size_ret);
        [ :eet_data_descriptor_encode, [ :eet_data_descriptor_p, :void_p, :int_p ], :void_p ],
        # EAPI void * eet_data_read_cipher(Eet_File *ef, Eet_Data_Descriptor *edd, const char *name, const char *cipher_key);
        [ :eet_data_read_cipher, [ :eet_file_p, :eet_data_descriptor_p, :string, :string ], :void_p ],
        # EAPI int eet_data_write_cipher(Eet_File *ef, Eet_Data_Descriptor *edd, const char *name, const char *cipher_key, const void *data, int compress);
        [ :eet_data_write_cipher, [ :eet_file_p, :eet_data_descriptor_p, :string, :string, :void_p, :int ], :int ],
        # EAPI int eet_data_text_dump_cipher(const void *data_in, const char *cipher_key, int size_in, Eet_Dump_Callback dumpfunc, void *dumpdata);
        [ :eet_data_text_dump_cipher, [ :void_p, :string, :int, :eet_dump_callback, :void_p ], :int ],
        # EAPI void * eet_data_text_undump_cipher(const char *text, const char *cipher_key, int textlen, int *size_ret);
        [ :eet_data_text_undump_cipher, [ :string, :string, :int, :int_p ], :void_p ],
        # EAPI int eet_data_dump_cipher(Eet_File *ef, const char *name, const char *cipher_key, Eet_Dump_Callback dumpfunc, void *dumpdata);
        [ :eet_data_dump_cipher, [ :eet_file_p, :string, :string, :eet_dump_callback, :void_p ], :int ],
        # EAPI int eet_data_undump_cipher(Eet_File *ef, const char *name, const char *cipher_key, const char *text, int textlen, int compress);
        [ :eet_data_undump_cipher, [ :eet_file_p, :string, :string, :string, :int, :int ], :int ],
        # EAPI void * eet_data_descriptor_decode_cipher(Eet_Data_Descriptor *edd, const void *data_in, const char *cipher_key, int size_in);
        [ :eet_data_descriptor_decode_cipher, [ :eet_data_descriptor_p, :void_p, :string, :int ], :void_p ],
        # EAPI void * eet_data_descriptor_encode_cipher(Eet_Data_Descriptor *edd, const void *data_in, const char *cipher_key, int *size_ret);
        [ :eet_data_descriptor_encode_cipher, [ :eet_data_descriptor_p, :void_p, :string, :int_p ], :void_p ],
        # EAPI Eet_Node * eet_node_char_new(const char *name, char c);
        [ :eet_node_char_new, [ :string, :char ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_short_new(const char *name, short s);
        [ :eet_node_short_new, [ :string, :short ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_int_new(const char *name, int i);
        [ :eet_node_int_new, [ :string, :int ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_long_long_new(const char *name, long long l);
        [ :eet_node_long_long_new, [ :string, :long_long ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_float_new(const char *name, float f);
        [ :eet_node_float_new, [ :string, :float ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_double_new(const char *name, double d);
        [ :eet_node_double_new, [ :string, :double ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_unsigned_char_new(const char *name, unsigned char uc);
        [ :eet_node_unsigned_char_new, [ :string, :uchar ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_unsigned_short_new(const char *name, unsigned short us);
        [ :eet_node_unsigned_short_new, [ :string, :ushort ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_unsigned_int_new(const char *name, unsigned int ui);
        [ :eet_node_unsigned_int_new, [ :string, :uint ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_unsigned_long_long_new(const char *name, unsigned long long l);
        [ :eet_node_unsigned_long_long_new, [ :string, :ulong_long ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_string_new(const char *name, const char *str);
        [ :eet_node_string_new, [ :string, :string ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_inlined_string_new(const char *name, const char *str);
        [ :eet_node_inlined_string_new, [ :string, :string ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_null_new(const char *name);
        [ :eet_node_null_new, [ :string ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_list_new(const char *name, Eina_List *nodes);
        [ :eet_node_list_new, [ :string, :eina_list_p ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_array_new(const char *name, int count, Eina_List *nodes);
        [ :eet_node_array_new, [ :string, :int, :eina_list_p ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_var_array_new(const char *name, Eina_List *nodes);
        [ :eet_node_var_array_new, [ :string, :eina_list_p ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_hash_new(const char *name, const char *key, Eet_Node *node);
        [ :eet_node_hash_new, [ :string, :string, :eet_node_p ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_struct_new(const char *name, Eina_List *nodes);
        [ :eet_node_struct_new, [ :string, :eina_list_p ], :eet_node_p ],
        # EAPI Eet_Node * eet_node_struct_child_new(const char *parent, Eet_Node *child);
        [ :eet_node_struct_child_new, [ :string, :eet_node_p ], :eet_node_p ],
        # EAPI void eet_node_list_append(Eet_Node *parent, const char *name, Eet_Node *child);
        [ :eet_node_list_append, [ :eet_node_p, :string, :eet_node_p ], :void ],
        # EAPI void eet_node_struct_append(Eet_Node *parent, const char *name, Eet_Node *child);
        [ :eet_node_struct_append, [ :eet_node_p, :string, :eet_node_p ], :void ],
        # EAPI void eet_node_hash_add(Eet_Node *parent, const char *name, const char *key, Eet_Node *child);
        [ :eet_node_hash_add, [ :eet_node_p, :string, :string, :eet_node_p ], :void ],
        # EAPI void eet_node_dump(Eet_Node *n, int dumplevel, Eet_Dump_Callback dumpfunc, void *dumpdata);
        [ :eet_node_dump, [ :eet_node_p, :int, :eet_dump_callback, :void_p ], :void ],
        # EAPI void eet_node_del(Eet_Node *n);
        [ :eet_node_del, [ :eet_node_p ], :void ],
        # EAPI void * eet_data_node_encode_cipher(Eet_Node *node, const char *cipher_key, int *size_ret);
        [ :eet_data_node_encode_cipher, [ :eet_node_p, :string, :int_p ], :void_p ],
        # EAPI Eet_Node * eet_data_node_decode_cipher(const void *data_in, const char *cipher_key, int size_in);
        [ :eet_data_node_decode_cipher, [ :void_p, :string, :int ], :eet_node_p ],
        # EAPI Eet_Node * eet_data_node_read_cipher(Eet_File *ef, const char *name, const char *cipher_key);
        [ :eet_data_node_read_cipher, [ :eet_file_p, :string, :string ], :eet_node_p ],
        # EAPI int eet_data_node_write_cipher(Eet_File *ef, const char *name, const char *cipher_key, Eet_Node *node, int compress);
        [ :eet_data_node_write_cipher, [ :eet_file_p, :string, :string, :eet_node_p, :int ], :int ],
        # EAPI void * eet_node_walk(void *parent, const char *name, Eet_Node *root, Eet_Node_Walk *cb, void *user_data);
        [ :eet_node_walk, [ :void_p, :string, :eet_node_p, :eet_node_walk_p, :void_p ], :void_p ],
        # EAPI Eet_Connection * eet_connection_new(Eet_Read_Cb *eet_read_cb, Eet_Write_Cb *eet_write_cb, const void *user_data);
        [ :eet_connection_new, [ :eet_read_cb, :eet_write_cb, :void_p ], :eet_connection_p ],
        # EAPI int eet_connection_received(Eet_Connection *conn, const void *data, size_t size);
        [ :eet_connection_received, [ :eet_connection_p, :void_p, :ulong ], :int ],
        # EAPI Eina_Bool eet_connection_send(Eet_Connection *conn, Eet_Data_Descriptor *edd, const void *data_in, const char *cipher_key);
        [ :eet_connection_send, [ :eet_connection_p, :eet_data_descriptor_p, :void_p, :string ], :uchar ],
        # EAPI Eina_Bool eet_connection_node_send(Eet_Connection *conn, Eet_Node *node, const char *cipher_key);
        [ :eet_connection_node_send, [ :eet_connection_p, :eet_node_p, :string ], :uchar ],
        # EAPI void * eet_connection_close(Eet_Connection *conn, Eina_Bool *on_going);
        [ :eet_connection_close, [ :eet_connection_p, :uchar_p ], :void_p ],
        ]
        #
        attach_fcts fcts
        #
        create_aliases 'eet_'.length, fcts
        #
    end
end
#
# EOF
