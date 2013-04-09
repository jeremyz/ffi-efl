#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmStore
        #
        FCT_PREFIX = 'elm_store_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'elementary.so.1'
        #
        # ENUMS
        # typedef enum {...} Elm_Store_Item_Mapping_Type;
        enum :elm_store_item_mapping_type, [ :elm_store_item_mapping_none, 0, :elm_store_item_mapping_label, 1, :elm_store_item_mapping_state, 2,
            :elm_store_item_mapping_icon, 3, :elm_store_item_mapping_photo, 4, :elm_store_item_mapping_custom, 5, :elm_store_item_mapping_last, 6 ]
        #
        # TYPEDEFS
        # typedef struct _Elm_Store Elm_Store;
        typedef :pointer, :elm_store
        # typedef struct _Elm_Store_Item Elm_Store_Item;
        typedef :pointer, :elm_store_item
        # typedef struct _Elm_Store_Item_Info Elm_Store_Item_Info;
        typedef :pointer, :elm_store_item_info
        # typedef struct _Elm_Store_Item_Info_Filesystem Elm_Store_Item_Info_Filesystem;
        typedef :pointer, :elm_store_item_info_filesystem
        # typedef struct _Elm_Store_Item_Mapping Elm_Store_Item_Mapping;
        typedef :pointer, :elm_store_item_mapping
        # typedef struct _Elm_Store_Item_Mapping_Empty Elm_Store_Item_Mapping_Empty;
        typedef :pointer, :elm_store_item_mapping_empty
        # typedef struct _Elm_Store_Item_Mapping_Icon Elm_Store_Item_Mapping_Icon;
        typedef :pointer, :elm_store_item_mapping_icon
        # typedef struct _Elm_Store_Item_Mapping_Photo Elm_Store_Item_Mapping_Photo;
        typedef :pointer, :elm_store_item_mapping_photo
        # typedef struct _Elm_Store_Item_Mapping_Custom Elm_Store_Item_Mapping_Custom;
        typedef :pointer, :elm_store_item_mapping_custom
        #
        # CALLBACKS
        # typedef Eina_Bool (*Elm_Store_Item_List_Cb) (void *data, Elm_Store_Item_Info *info);
        callback :elm_store_item_list_cb, [ :pointer, :elm_store_item_info ], :bool
        # typedef void (*Elm_Store_Item_Fetch_Cb) (void *data, Elm_Store_Item *sti);
        callback :elm_store_item_fetch_cb, [ :pointer, :elm_store_item ], :void
        # typedef void (*Elm_Store_Item_Unfetch_Cb) (void *data, Elm_Store_Item *sti);
        callback :elm_store_item_unfetch_cb, [ :pointer, :elm_store_item ], :void
        # typedef void *(*Elm_Store_Item_Mapping_Cb) (void *data, Elm_Store_Item *sti, const char *part);
        callback :elm_store_item_mapping_cb, [ :pointer, :elm_store_item, :string ], :pointer
        #
        # FUNCTIONS
        fcts = [
        # EAPI Elm_Store *elm_store_filesystem_new(void);
        [ :elm_store_filesystem_new, [  ], :elm_store ],
        # EAPI void elm_store_free(Elm_Store *st);
        [ :elm_store_free, [ :elm_store ], :void ],
        # EAPI void elm_store_filesystem_directory_set(Elm_Store *st, const char *dir);
        [ :elm_store_filesystem_directory_set, [ :elm_store, :string ], :void ],
        # EAPI const char *elm_store_filesystem_directory_get(const Elm_Store *st);
        [ :elm_store_filesystem_directory_get, [ :elm_store ], :string ],
        # EAPI const char *elm_store_item_filesystem_path_get(const Elm_Store_Item *sti);
        [ :elm_store_item_filesystem_path_get, [ :elm_store_item ], :string ],
        # EAPI void elm_store_target_genlist_set(Elm_Store *st, Evas_Object *obj);
        [ :elm_store_target_genlist_set, [ :elm_store, :evas_object ], :void ],
        # EAPI void elm_store_cache_set(Elm_Store *st, int max);
        [ :elm_store_cache_set, [ :elm_store, :int ], :void ],
        # EAPI int elm_store_cache_get(const Elm_Store *st);
        [ :elm_store_cache_get, [ :elm_store ], :int ],
        # EAPI void elm_store_list_func_set(Elm_Store *st, Elm_Store_Item_List_Cb func, const void *data);
        [ :elm_store_list_func_set, [ :elm_store, :elm_store_item_list_cb, :pointer ], :void ],
        # EAPI void elm_store_fetch_func_set(Elm_Store *st, Elm_Store_Item_Fetch_Cb func, const void *data);
        [ :elm_store_fetch_func_set, [ :elm_store, :elm_store_item_fetch_cb, :pointer ], :void ],
        # EAPI void elm_store_unfetch_func_set(Elm_Store *st, Elm_Store_Item_Unfetch_Cb func, const void *data);
        [ :elm_store_unfetch_func_set, [ :elm_store, :elm_store_item_unfetch_cb, :pointer ], :void ],
        # EAPI void elm_store_fetch_thread_set(Elm_Store *st, Eina_Bool use_thread);
        [ :elm_store_fetch_thread_set, [ :elm_store, :bool ], :void ],
        # EAPI Eina_Bool elm_store_fetch_thread_get(const Elm_Store *st);
        [ :elm_store_fetch_thread_get, [ :elm_store ], :bool ],
        # EAPI void elm_store_sorted_set(Elm_Store *st, Eina_Bool sorted);
        [ :elm_store_sorted_set, [ :elm_store, :bool ], :void ],
        # EAPI Eina_Bool elm_store_sorted_get(const Elm_Store *st);
        [ :elm_store_sorted_get, [ :elm_store ], :bool ],
        # EAPI void elm_store_item_data_set(Elm_Store_Item *sti, void *data);
        [ :elm_store_item_data_set, [ :elm_store_item, :pointer ], :void ],
        # EAPI void *elm_store_item_data_get(Elm_Store_Item *sti);
        [ :elm_store_item_data_get, [ :elm_store_item ], :pointer ],
        # EAPI const Elm_Store *elm_store_item_store_get(const Elm_Store_Item *sti);
        [ :elm_store_item_store_get, [ :elm_store_item ], :elm_store ],
        # EAPI const Elm_Object_Item *elm_store_item_genlist_item_get(const Elm_Store_Item *sti);
        [ :elm_store_item_genlist_item_get, [ :elm_store_item ], :elm_object_item ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
