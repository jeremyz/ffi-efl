#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module EinaHash
        #
        FCT_PREFIX = 'eina_hash_' unless const_defined? :FCT_PREFIX
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
        # TYPEDEFS
        # typedef struct _Eina_Hash Eina_Hash;
        typedef :pointer, :eina_hash
        # typedef struct _Eina_Hash_Tuple Eina_Hash_Tuple;
        typedef :pointer, :eina_hash_tuple
        #
        # CALLBACKS
        # typedef unsigned int (*Eina_Key_Length) (const void *key);
        callback :eina_key_length_cb, [ :pointer ], :uint
        # typedef int (*Eina_Key_Cmp) (const void *key1, int key1_length, const void *key2, int key2_length);
        callback :eina_key_cmp_cb, [ :pointer, :int, :pointer, :int ], :int
        # typedef int (*Eina_Key_Hash) (const void *key, int key_length);
        callback :eina_key_hash_cb, [ :pointer, :int ], :int
        # typedef Eina_Bool (*Eina_Hash_Foreach) (const Eina_Hash *hash, const void *key, void *data, void *fdata);
        callback :eina_hash_foreach_cb, [ :eina_hash, :pointer, :pointer, :pointer ], :bool
        #
        # FUNCTIONS
        fcts = [
        # EAPI Eina_Hash *eina_hash_new(Eina_Key_Length key_length_cb, Eina_Key_Cmp key_cmp_cb, Eina_Key_Hash key_hash_cb, Eina_Free_Cb data_free_cb, int buckets_power_size);
        [ :eina_hash_new, [ :eina_key_length_cb, :eina_key_cmp_cb, :eina_key_hash_cb, :eina_free_cb, :int ], :eina_hash ],
        # EAPI void eina_hash_free_cb_set(Eina_Hash *hash, Eina_Free_Cb data_free_cb);
        [ :eina_hash_free_cb_set, [ :eina_hash, :eina_free_cb ], :void ],
        # EAPI Eina_Hash *eina_hash_string_djb2_new(Eina_Free_Cb data_free_cb);
        [ :eina_hash_string_djb2_new, [ :eina_free_cb ], :eina_hash ],
        # EAPI Eina_Hash *eina_hash_string_superfast_new(Eina_Free_Cb data_free_cb);
        [ :eina_hash_string_superfast_new, [ :eina_free_cb ], :eina_hash ],
        # EAPI Eina_Hash *eina_hash_string_small_new(Eina_Free_Cb data_free_cb);
        [ :eina_hash_string_small_new, [ :eina_free_cb ], :eina_hash ],
        # EAPI Eina_Hash *eina_hash_int32_new(Eina_Free_Cb data_free_cb);
        [ :eina_hash_int32_new, [ :eina_free_cb ], :eina_hash ],
        # EAPI Eina_Hash *eina_hash_int64_new(Eina_Free_Cb data_free_cb);
        [ :eina_hash_int64_new, [ :eina_free_cb ], :eina_hash ],
        # EAPI Eina_Hash *eina_hash_pointer_new(Eina_Free_Cb data_free_cb);
        [ :eina_hash_pointer_new, [ :eina_free_cb ], :eina_hash ],
        # EAPI Eina_Hash *eina_hash_stringshared_new(Eina_Free_Cb data_free_cb);
        [ :eina_hash_stringshared_new, [ :eina_free_cb ], :eina_hash ],
        # EAPI Eina_Bool eina_hash_add(Eina_Hash *hash, const void *key, const void *data);
        [ :eina_hash_add, [ :eina_hash, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool eina_hash_direct_add(Eina_Hash *hash, const void *key, const void *data);
        [ :eina_hash_direct_add, [ :eina_hash, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool eina_hash_del(Eina_Hash *hash, const void *key, const void *data);
        [ :eina_hash_del, [ :eina_hash, :pointer, :pointer ], :bool ],
        # EAPI void *eina_hash_find(const Eina_Hash *hash, const void *key);
        [ :eina_hash_find, [ :eina_hash, :pointer ], :pointer ],
        # EAPI void *eina_hash_modify(Eina_Hash *hash, const void *key, const void *data);
        [ :eina_hash_modify, [ :eina_hash, :pointer, :pointer ], :pointer ],
        # EAPI void *eina_hash_set(Eina_Hash *hash, const void *key, const void *data);
        [ :eina_hash_set, [ :eina_hash, :pointer, :pointer ], :pointer ],
        # EAPI Eina_Bool eina_hash_move(Eina_Hash *hash, const void *old_key, const void *new_key);
        [ :eina_hash_move, [ :eina_hash, :pointer, :pointer ], :bool ],
        # EAPI void eina_hash_free(Eina_Hash *hash);
        [ :eina_hash_free, [ :eina_hash ], :void ],
        # EAPI void eina_hash_free_buckets(Eina_Hash *hash);
        [ :eina_hash_free_buckets, [ :eina_hash ], :void ],
        # EAPI int eina_hash_population(const Eina_Hash *hash);
        [ :eina_hash_population, [ :eina_hash ], :int ],
        # EAPI Eina_Bool eina_hash_add_by_hash(Eina_Hash *hash, const void *key, int key_length, int key_hash, const void *data);
        [ :eina_hash_add_by_hash, [ :eina_hash, :pointer, :int, :int, :pointer ], :bool ],
        # EAPI Eina_Bool eina_hash_direct_add_by_hash(Eina_Hash *hash, const void *key, int key_length, int key_hash, const void *data);
        [ :eina_hash_direct_add_by_hash, [ :eina_hash, :pointer, :int, :int, :pointer ], :bool ],
        # EAPI Eina_Bool eina_hash_del_by_key_hash(Eina_Hash *hash, const void *key, int key_length, int key_hash);
        [ :eina_hash_del_by_key_hash, [ :eina_hash, :pointer, :int, :int ], :bool ],
        # EAPI Eina_Bool eina_hash_del_by_key(Eina_Hash *hash, const void *key);
        [ :eina_hash_del_by_key, [ :eina_hash, :pointer ], :bool ],
        # EAPI Eina_Bool eina_hash_del_by_data(Eina_Hash *hash, const void *data);
        [ :eina_hash_del_by_data, [ :eina_hash, :pointer ], :bool ],
        # EAPI Eina_Bool eina_hash_del_by_hash(Eina_Hash *hash, const void *key, int key_length, int key_hash, const void *data);
        [ :eina_hash_del_by_hash, [ :eina_hash, :pointer, :int, :int, :pointer ], :bool ],
        # EAPI void *eina_hash_find_by_hash(const Eina_Hash *hash, const void *key, int key_length, int key_hash);
        [ :eina_hash_find_by_hash, [ :eina_hash, :pointer, :int, :int ], :pointer ],
        # EAPI void *eina_hash_modify_by_hash(Eina_Hash *hash, const void *key, int key_length, int key_hash, const void *data);
        [ :eina_hash_modify_by_hash, [ :eina_hash, :pointer, :int, :int, :pointer ], :pointer ],
        # EAPI Eina_Iterator *eina_hash_iterator_key_new(const Eina_Hash *hash);
        [ :eina_hash_iterator_key_new, [ :eina_hash ], :pointer ],
        # EAPI Eina_Iterator *eina_hash_iterator_data_new(const Eina_Hash *hash);
        [ :eina_hash_iterator_data_new, [ :eina_hash ], :pointer ],
        # EAPI Eina_Iterator *eina_hash_iterator_tuple_new(const Eina_Hash *hash);
        [ :eina_hash_iterator_tuple_new, [ :eina_hash ], :pointer ],
        # EAPI void eina_hash_foreach(const Eina_Hash *hash, Eina_Hash_Foreach func, const void *fdata);
        [ :eina_hash_foreach, [ :eina_hash, :eina_hash_foreach_cb, :pointer ], :void ],
        # EAPI int eina_hash_superfast(const char *key, int len);
        [ :eina_hash_superfast, [ :string, :int ], :int ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
