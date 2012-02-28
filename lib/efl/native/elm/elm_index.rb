#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmIndex
        #
        FCT_PREFIX = 'elm_index_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'elementary-ver-pre-svn-09.so.0'
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_index_add(Evas_Object *parent);
        [ :elm_index_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_index_active_set(Evas_Object *obj, Eina_Bool active);
        [ :elm_index_active_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_index_active_get(const Evas_Object *obj);
        [ :elm_index_active_get, [ :evas_object ], :bool ],
        # EAPI void elm_index_item_level_set(Evas_Object *obj, int level);
        [ :elm_index_item_level_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_index_item_level_get(const Evas_Object *obj);
        [ :elm_index_item_level_get, [ :evas_object ], :int ],
        # EAPI Elm_Object_Item *elm_index_item_selected_get(const Evas_Object *obj, int level);
        [ :elm_index_item_selected_get, [ :evas_object, :int ], :elm_object_item ],
        # EAPI void elm_index_item_append(Evas_Object *obj, const char *letter, const void *item);
        [ :elm_index_item_append, [ :evas_object, :string, :pointer ], :void ],
        # EAPI void elm_index_item_prepend(Evas_Object *obj, const char *letter, const void *item);
        [ :elm_index_item_prepend, [ :evas_object, :string, :pointer ], :void ],
        # EAPI void elm_index_item_append_relative(Evas_Object *obj, const char *letter, const void *item, const Elm_Object_Item *relative);
        [ :elm_index_item_append_relative, [ :evas_object, :string, :pointer, :elm_object_item ], :void ],
        # EAPI void elm_index_item_prepend_relative(Evas_Object *obj, const char *letter, const void *item, const Elm_Object_Item *relative);
        [ :elm_index_item_prepend_relative, [ :evas_object, :string, :pointer, :elm_object_item ], :void ],
        # EAPI void elm_index_item_sorted_insert(Evas_Object *obj, const char *letter, const void *item, Eina_Compare_Cb cmp_func, Eina_Compare_Cb cmp_data_func);
        [ :elm_index_item_sorted_insert, [ :evas_object, :string, :pointer, :eina_compare_cb, :eina_compare_cb ], :void ],
        # EAPI Elm_Object_Item *elm_index_item_find(Evas_Object *obj, const void *item);
        [ :elm_index_item_find, [ :evas_object, :pointer ], :elm_object_item ],
        # EAPI void elm_index_item_clear(Evas_Object *obj);
        [ :elm_index_item_clear, [ :evas_object ], :void ],
        # EAPI void elm_index_item_go(Evas_Object *obj, int level);
        [ :elm_index_item_go, [ :evas_object, :int ], :void ],
        # EAPI const char *elm_index_item_letter_get(const Elm_Object_Item *item);
        [ :elm_index_item_letter_get, [ :elm_object_item ], :string ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
