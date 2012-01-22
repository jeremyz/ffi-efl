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
        ffi_lib 'eina'
        #
        # ENUMS
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
        callback :eina_hash_foreach_cb, [ :pointer, :pointer, :pointer, :pointer ], :eina_bool
        #
        # VARIABLES
        #
        # FUNCTIONS
        fcts = [
        # EAPI Eina_Hash *eina_hash_new(Eina_Key_Length key_length_cb, Eina_Key_Cmp key_cmp_cb, Eina_Key_Hash key_hash_cb, Eina_Free_Cb data_free_cb, int buckets_power_size);
        [ :eina_hash_new, [ :eina_key_length_cb, :eina_key_cmp_cb, :eina_key_hash_cb, :eina_free_cb, :int ], :pointer ],
        # EAPI void eina_hash_free_cb_set(Eina_Hash *hash, Eina_Free_Cb data_free_cb);
        [ :eina_hash_free_cb_set, [ :pointer, :eina_free_cb ], :void ],
        # EAPI Eina_Hash *eina_hash_string_djb2_new(Eina_Free_Cb data_free_cb);
        [ :eina_hash_string_djb2_new, [ :eina_free_cb ], :pointer ],
        # EAPI Eina_Hash *eina_hash_string_superfast_new(Eina_Free_Cb data_free_cb);
        [ :eina_hash_string_superfast_new, [ :eina_free_cb ], :pointer ],
        # EAPI Eina_Hash *eina_hash_string_small_new(Eina_Free_Cb data_free_cb);
        [ :eina_hash_string_small_new, [ :eina_free_cb ], :pointer ],
        # EAPI Eina_Hash *eina_hash_int32_new(Eina_Free_Cb data_free_cb);
        [ :eina_hash_int32_new, [ :eina_free_cb ], :pointer ],
        # EAPI Eina_Hash *eina_hash_int64_new(Eina_Free_Cb data_free_cb);
        [ :eina_hash_int64_new, [ :eina_free_cb ], :pointer ],
        # EAPI Eina_Hash *eina_hash_pointer_new(Eina_Free_Cb data_free_cb);
        [ :eina_hash_pointer_new, [ :eina_free_cb ], :pointer ],
        # EAPI Eina_Hash *eina_hash_stringshared_new(Eina_Free_Cb data_free_cb);
        [ :eina_hash_stringshared_new, [ :eina_free_cb ], :pointer ],
        # EAPI Eina_Bool eina_hash_add(Eina_Hash *hash, const void *key, const void *data);
        [ :eina_hash_add, [ :pointer, :pointer, :pointer ], :eina_bool ],
        # EAPI Eina_Bool eina_hash_direct_add(Eina_Hash *hash, const void *key, const void *data);
        [ :eina_hash_direct_add, [ :pointer, :pointer, :pointer ], :eina_bool ],
        # EAPI Eina_Bool eina_hash_del(Eina_Hash *hash, const void *key, const void *data);
        [ :eina_hash_del, [ :pointer, :pointer, :pointer ], :eina_bool ],
        # EAPI void *eina_hash_find(const Eina_Hash *hash, const void *key);
        [ :eina_hash_find, [ :pointer, :pointer ], :pointer ],
        # EAPI void *eina_hash_modify(Eina_Hash *hash, const void *key, const void *data);
        [ :eina_hash_modify, [ :pointer, :pointer, :pointer ], :pointer ],
        # EAPI void *eina_hash_set(Eina_Hash *hash, const void *key, const void *data);
        [ :eina_hash_set, [ :pointer, :pointer, :pointer ], :pointer ],
        # EAPI Eina_Bool eina_hash_move(Eina_Hash *hash, const void *old_key, const void *new_key);
        [ :eina_hash_move, [ :pointer, :pointer, :pointer ], :eina_bool ],
        # EAPI void eina_hash_free(Eina_Hash *hash);
        [ :eina_hash_free, [ :pointer ], :void ],
        # EAPI void eina_hash_free_buckets(Eina_Hash *hash);
        [ :eina_hash_free_buckets, [ :pointer ], :void ],
        # EAPI int eina_hash_population(const Eina_Hash *hash);
        [ :eina_hash_population, [ :pointer ], :int ],
        # EAPI Eina_Bool eina_hash_add_by_hash(Eina_Hash *hash, const void *key, int key_length, int key_hash, const void *data);
        [ :eina_hash_add_by_hash, [ :pointer, :pointer, :int, :int, :pointer ], :eina_bool ],
        # EAPI Eina_Bool eina_hash_direct_add_by_hash(Eina_Hash *hash, const void *key, int key_length, int key_hash, const void *data);
        [ :eina_hash_direct_add_by_hash, [ :pointer, :pointer, :int, :int, :pointer ], :eina_bool ],
        # EAPI Eina_Bool eina_hash_del_by_key_hash(Eina_Hash *hash, const void *key, int key_length, int key_hash);
        [ :eina_hash_del_by_key_hash, [ :pointer, :pointer, :int, :int ], :eina_bool ],
        # EAPI Eina_Bool eina_hash_del_by_key(Eina_Hash *hash, const void *key);
        [ :eina_hash_del_by_key, [ :pointer, :pointer ], :eina_bool ],
        # EAPI Eina_Bool eina_hash_del_by_data(Eina_Hash *hash, const void *data);
        [ :eina_hash_del_by_data, [ :pointer, :pointer ], :eina_bool ],
        # EAPI Eina_Bool eina_hash_del_by_hash(Eina_Hash *hash, const void *key, int key_length, int key_hash, const void *data);
        [ :eina_hash_del_by_hash, [ :pointer, :pointer, :int, :int, :pointer ], :eina_bool ],
        # EAPI void *eina_hash_find_by_hash(const Eina_Hash *hash, const void *key, int key_length, int key_hash);
        [ :eina_hash_find_by_hash, [ :pointer, :pointer, :int, :int ], :pointer ],
        # EAPI void *eina_hash_modify_by_hash(Eina_Hash *hash, const void *key, int key_length, int key_hash, const void *data);
        [ :eina_hash_modify_by_hash, [ :pointer, :pointer, :int, :int, :pointer ], :pointer ],
        # EAPI Eina_Iterator *eina_hash_iterator_key_new(const Eina_Hash *hash);
        [ :eina_hash_iterator_key_new, [ :pointer ], :pointer ],
        # EAPI Eina_Iterator *eina_hash_iterator_data_new(const Eina_Hash *hash);
        [ :eina_hash_iterator_data_new, [ :pointer ], :pointer ],
        # EAPI Eina_Iterator *eina_hash_iterator_tuple_new(const Eina_Hash *hash);
        [ :eina_hash_iterator_tuple_new, [ :pointer ], :pointer ],
        # EAPI void eina_hash_foreach(const Eina_Hash *hash, Eina_Hash_Foreach func, const void *fdata);
        [ :eina_hash_foreach, [ :pointer, :eina_hash_foreach_cb, :pointer ], :void ],
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
