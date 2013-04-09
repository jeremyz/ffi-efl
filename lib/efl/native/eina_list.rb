#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module EinaList
        #
        FCT_PREFIX = 'eina_list_' unless const_defined? :FCT_PREFIX
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
        # typedef struct _Eina_List Eina_List;
        typedef :pointer, :eina_list
        # typedef struct _Eina_List_Accounting Eina_List_Accounting;
        typedef :pointer, :eina_list_accounting
        #
        # FUNCTIONS
        fcts = [
        # EAPI Eina_List *eina_list_append(Eina_List *list, const void *data);
        [ :eina_list_append, [ :eina_list, :pointer ], :eina_list ],
        # EAPI Eina_List *eina_list_prepend(Eina_List *list, const void *data);
        [ :eina_list_prepend, [ :eina_list, :pointer ], :eina_list ],
        # EAPI Eina_List *eina_list_append_relative(Eina_List *list, const void *data, const void *relative);
        [ :eina_list_append_relative, [ :eina_list, :pointer, :pointer ], :eina_list ],
        # EAPI Eina_List *eina_list_append_relative_list(Eina_List *list, const void *data, Eina_List *relative);
        [ :eina_list_append_relative_list, [ :eina_list, :pointer, :eina_list ], :eina_list ],
        # EAPI Eina_List *eina_list_prepend_relative(Eina_List *list, const void *data, const void *relative);
        [ :eina_list_prepend_relative, [ :eina_list, :pointer, :pointer ], :eina_list ],
        # EAPI Eina_List *eina_list_prepend_relative_list(Eina_List *list, const void *data, Eina_List *relative);
        [ :eina_list_prepend_relative_list, [ :eina_list, :pointer, :eina_list ], :eina_list ],
        # EAPI Eina_List *eina_list_sorted_insert(Eina_List *list, Eina_Compare_Cb func, const void *data);
        [ :eina_list_sorted_insert, [ :eina_list, :eina_compare_cb, :pointer ], :eina_list ],
        # EAPI Eina_List *eina_list_remove(Eina_List *list, const void *data);
        [ :eina_list_remove, [ :eina_list, :pointer ], :eina_list ],
        # EAPI Eina_List *eina_list_remove_list(Eina_List *list, Eina_List *remove_list);
        [ :eina_list_remove_list, [ :eina_list, :eina_list ], :eina_list ],
        # EAPI Eina_List *eina_list_promote_list(Eina_List *list, Eina_List *move_list);
        [ :eina_list_promote_list, [ :eina_list, :eina_list ], :eina_list ],
        # EAPI Eina_List *eina_list_demote_list(Eina_List *list, Eina_List *move_list);
        [ :eina_list_demote_list, [ :eina_list, :eina_list ], :eina_list ],
        # EAPI void *eina_list_data_find(const Eina_List *list, const void *data);
        [ :eina_list_data_find, [ :eina_list, :pointer ], :pointer ],
        # EAPI Eina_List *eina_list_data_find_list(const Eina_List *list, const void *data);
        [ :eina_list_data_find_list, [ :eina_list, :pointer ], :eina_list ],
        # EAPI Eina_Bool eina_list_move(Eina_List **to, Eina_List **from, void *data);
        [ :eina_list_move, [ :eina_list, :eina_list, :pointer ], :bool ],
        # EAPI Eina_Bool eina_list_move_list(Eina_List **to, Eina_List **from, Eina_List *data);
        [ :eina_list_move_list, [ :eina_list, :eina_list, :eina_list ], :bool ],
        # EAPI Eina_List *eina_list_free(Eina_List *list);
        [ :eina_list_free, [ :eina_list ], :eina_list ],
        # EAPI void *eina_list_nth(const Eina_List *list, unsigned int n);
        [ :eina_list_nth, [ :eina_list, :uint ], :pointer ],
        # EAPI Eina_List *eina_list_nth_list(const Eina_List *list, unsigned int n);
        [ :eina_list_nth_list, [ :eina_list, :uint ], :eina_list ],
        # EAPI Eina_List *eina_list_reverse(Eina_List *list);
        [ :eina_list_reverse, [ :eina_list ], :eina_list ],
        # EAPI Eina_List *eina_list_reverse_clone(const Eina_List *list);
        [ :eina_list_reverse_clone, [ :eina_list ], :eina_list ],
        # EAPI Eina_List *eina_list_clone(const Eina_List *list);
        [ :eina_list_clone, [ :eina_list ], :eina_list ],
        # EAPI Eina_List *eina_list_sort(Eina_List *list, unsigned int limit, Eina_Compare_Cb func);
        [ :eina_list_sort, [ :eina_list, :uint, :eina_compare_cb ], :eina_list ],
        # EAPI Eina_List *eina_list_merge(Eina_List *left, Eina_List *right);
        [ :eina_list_merge, [ :eina_list, :eina_list ], :eina_list ],
        # EAPI Eina_List *eina_list_sorted_merge(Eina_List *left, Eina_List *right, Eina_Compare_Cb func);
        [ :eina_list_sorted_merge, [ :eina_list, :eina_list, :eina_compare_cb ], :eina_list ],
        # EAPI Eina_List *eina_list_split_list(Eina_List *list, Eina_List *relative, Eina_List **right);
        [ :eina_list_split_list, [ :eina_list, :eina_list, :eina_list ], :eina_list ],
        # EAPI Eina_List *eina_list_search_sorted_near_list(const Eina_List *list, Eina_Compare_Cb func, const void *data, int *result_cmp);
        [ :eina_list_search_sorted_near_list, [ :eina_list, :eina_compare_cb, :pointer, :pointer ], :eina_list ],
        # EAPI Eina_List *eina_list_search_sorted_list(const Eina_List *list, Eina_Compare_Cb func, const void *data);
        [ :eina_list_search_sorted_list, [ :eina_list, :eina_compare_cb, :pointer ], :eina_list ],
        # EAPI void *eina_list_search_sorted(const Eina_List *list, Eina_Compare_Cb func, const void *data);
        [ :eina_list_search_sorted, [ :eina_list, :eina_compare_cb, :pointer ], :pointer ],
        # EAPI Eina_List *eina_list_search_unsorted_list(const Eina_List *list, Eina_Compare_Cb func, const void *data);
        [ :eina_list_search_unsorted_list, [ :eina_list, :eina_compare_cb, :pointer ], :eina_list ],
        # EAPI void *eina_list_search_unsorted(const Eina_List *list, Eina_Compare_Cb func, const void *data);
        [ :eina_list_search_unsorted, [ :eina_list, :eina_compare_cb, :pointer ], :pointer ],
        # EAPI Eina_Iterator *eina_list_iterator_new(const Eina_List *list);
        [ :eina_list_iterator_new, [ :eina_list ], :pointer ],
        # EAPI Eina_Iterator *eina_list_iterator_reversed_new(const Eina_List *list);
        [ :eina_list_iterator_reversed_new, [ :eina_list ], :pointer ],
        # EAPI Eina_Accessor *eina_list_accessor_new(const Eina_List *list);
        [ :eina_list_accessor_new, [ :eina_list ], :pointer ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
