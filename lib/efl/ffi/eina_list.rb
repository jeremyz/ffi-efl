#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi'
#
module Efl
    #
    module EinaList
        #
        extend Efl::FFIHelper
        #
        def self.method_missing m, *args, &block
            sym = 'eina_list_'+m.to_s
            raise NameError.new "#{self.name}.#{sym} (#{m})" if not self.respond_to? sym
            self.module_eval "def self.#{m} *args, &block; r=self.#{sym}(*args); yield r if block_given?; r; end"
            self.send sym, *args, &block
        end
        #
        ffi_lib 'eina'
        #
        # ENUMS
        #
        # TYPEDEFS
        # typedef struct _Eina_List Eina_List;
        typedef :pointer, :eina_list
        typedef :pointer, :eina_list_p
        typedef :pointer, :eina_list_pp
        # typedef struct _Eina_List_Accounting Eina_List_Accounting;
        typedef :pointer, :eina_list_accounting
        #
        # CALLBACKS
        #
        # FUNCTIONS
        fcts = [
        # EAPI Eina_List *eina_list_append(Eina_List *list, const void *data);
        [ :eina_list_append, [ :eina_list_p, :void_p ], :eina_list_p ],
        # EAPI Eina_List *eina_list_prepend(Eina_List *list, const void *data);
        [ :eina_list_prepend, [ :eina_list_p, :void_p ], :eina_list_p ],
        # EAPI Eina_List *eina_list_append_relative(Eina_List *list, const void *data, const void *relative);
        [ :eina_list_append_relative, [ :eina_list_p, :void_p, :void_p ], :eina_list_p ],
        # EAPI Eina_List *eina_list_append_relative_list(Eina_List *list, const void *data, Eina_List *relative);
        [ :eina_list_append_relative_list, [ :eina_list_p, :void_p, :eina_list_p ], :eina_list_p ],
        # EAPI Eina_List *eina_list_prepend_relative(Eina_List *list, const void *data, const void *relative);
        [ :eina_list_prepend_relative, [ :eina_list_p, :void_p, :void_p ], :eina_list_p ],
        # EAPI Eina_List *eina_list_prepend_relative_list(Eina_List *list, const void *data, Eina_List *relative);
        [ :eina_list_prepend_relative_list, [ :eina_list_p, :void_p, :eina_list_p ], :eina_list_p ],
        # EAPI Eina_List *eina_list_sorted_insert(Eina_List *list, Eina_Compare_Cb func, const void *data);
        [ :eina_list_sorted_insert, [ :eina_list_p, :eina_compare_cb, :void_p ], :eina_list_p ],
        # EAPI Eina_List *eina_list_remove(Eina_List *list, const void *data);
        [ :eina_list_remove, [ :eina_list_p, :void_p ], :eina_list_p ],
        # EAPI Eina_List *eina_list_remove_list(Eina_List *list, Eina_List *remove_list);
        [ :eina_list_remove_list, [ :eina_list_p, :eina_list_p ], :eina_list_p ],
        # EAPI Eina_List *eina_list_promote_list(Eina_List *list, Eina_List *move_list);
        [ :eina_list_promote_list, [ :eina_list_p, :eina_list_p ], :eina_list_p ],
        # EAPI Eina_List *eina_list_demote_list(Eina_List *list, Eina_List *move_list);
        [ :eina_list_demote_list, [ :eina_list_p, :eina_list_p ], :eina_list_p ],
        # EAPI void *eina_list_data_find(const Eina_List *list, const void *data);
        [ :eina_list_data_find, [ :eina_list_p, :void_p ], :void_p ],
        # EAPI Eina_List *eina_list_data_find_list(const Eina_List *list, const void *data);
        [ :eina_list_data_find_list, [ :eina_list_p, :void_p ], :eina_list_p ],
        # EAPI Eina_Bool eina_list_move(Eina_List **to, Eina_List **from, void *data);
        [ :eina_list_move, [ :eina_list_pp, :eina_list_pp, :void_p ], :eina_bool ],
        # EAPI Eina_Bool eina_list_move_list(Eina_List **to, Eina_List **from, Eina_List *data);
        [ :eina_list_move_list, [ :eina_list_pp, :eina_list_pp, :eina_list_p ], :eina_bool ],
        # EAPI Eina_List *eina_list_free(Eina_List *list);
        [ :eina_list_free, [ :eina_list_p ], :eina_list_p ],
        # EAPI void *eina_list_nth(const Eina_List *list, unsigned int n);
        [ :eina_list_nth, [ :eina_list_p, :uint ], :void_p ],
        # EAPI Eina_List *eina_list_nth_list(const Eina_List *list, unsigned int n);
        [ :eina_list_nth_list, [ :eina_list_p, :uint ], :eina_list_p ],
        # EAPI Eina_List *eina_list_reverse(Eina_List *list);
        [ :eina_list_reverse, [ :eina_list_p ], :eina_list_p ],
        # EAPI Eina_List *eina_list_reverse_clone(const Eina_List *list);
        [ :eina_list_reverse_clone, [ :eina_list_p ], :eina_list_p ],
        # EAPI Eina_List *eina_list_clone(const Eina_List *list);
        [ :eina_list_clone, [ :eina_list_p ], :eina_list_p ],
        # EAPI Eina_List *eina_list_sort(Eina_List *list, unsigned int size, Eina_Compare_Cb func);
        [ :eina_list_sort, [ :eina_list_p, :uint, :eina_compare_cb ], :eina_list_p ],
        # EAPI Eina_List *eina_list_merge(Eina_List *left, Eina_List *right);
        [ :eina_list_merge, [ :eina_list_p, :eina_list_p ], :eina_list_p ],
        # EAPI Eina_List *eina_list_sorted_merge(Eina_List *left, Eina_List *right, Eina_Compare_Cb func);
        [ :eina_list_sorted_merge, [ :eina_list_p, :eina_list_p, :eina_compare_cb ], :eina_list_p ],
        # EAPI Eina_List *eina_list_split_list(Eina_List *list, Eina_List *relative, Eina_List **right);
        [ :eina_list_split_list, [ :eina_list_p, :eina_list_p, :eina_list_pp ], :eina_list_p ],
        # EAPI Eina_List *eina_list_search_sorted_near_list(const Eina_List *list, Eina_Compare_Cb func, const void *data, int *result_cmp);
        [ :eina_list_search_sorted_near_list, [ :eina_list_p, :eina_compare_cb, :void_p, :int_p ], :eina_list_p ],
        # EAPI Eina_List *eina_list_search_sorted_list(const Eina_List *list, Eina_Compare_Cb func, const void *data);
        [ :eina_list_search_sorted_list, [ :eina_list_p, :eina_compare_cb, :void_p ], :eina_list_p ],
        # EAPI void *eina_list_search_sorted(const Eina_List *list, Eina_Compare_Cb func, const void *data);
        [ :eina_list_search_sorted, [ :eina_list_p, :eina_compare_cb, :void_p ], :void_p ],
        # EAPI Eina_List *eina_list_search_unsorted_list(const Eina_List *list, Eina_Compare_Cb func, const void *data);
        [ :eina_list_search_unsorted_list, [ :eina_list_p, :eina_compare_cb, :void_p ], :eina_list_p ],
        # EAPI void *eina_list_search_unsorted(const Eina_List *list, Eina_Compare_Cb func, const void *data);
        [ :eina_list_search_unsorted, [ :eina_list_p, :eina_compare_cb, :void_p ], :void_p ],
        # EAPI Eina_Iterator *eina_list_iterator_new(const Eina_List *list);
        [ :eina_list_iterator_new, [ :eina_list_p ], :eina_iterator_p ],
        # EAPI Eina_Iterator *eina_list_iterator_reversed_new(const Eina_List *list);
        [ :eina_list_iterator_reversed_new, [ :eina_list_p ], :eina_iterator_p ],
        # EAPI Eina_Accessor *eina_list_accessor_new(const Eina_List *list);
        [ :eina_list_accessor_new, [ :eina_list_p ], :eina_accessor_p ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
