#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmSlideshow
        #
        FCT_PREFIX = 'elm_slideshow_' unless const_defined? :FCT_PREFIX
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
        # TYPEDEFS
        # typedef struct _Elm_Slideshow_Item_Class Elm_Slideshow_Item_Class;
        typedef :pointer, :elm_slideshow_item_class
        # typedef struct _Elm_Slideshow_Item_Class_Func Elm_Slideshow_Item_Class_Func;
        typedef :pointer, :elm_slideshow_item_class_func
        #
        # CALLBACKS
        # typedef Evas_Object *(*SlideshowItemGetFunc) (void *data, Evas_Object *obj);
        callback :slideshowitemgetfunc_cb, [ :pointer, :evas_object ], :evas_object
        # typedef void (*SlideshowItemDelFunc) (void *data, Evas_Object *obj);
        callback :slideshowitemdelfunc_cb, [ :pointer, :evas_object ], :void
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_slideshow_add(Evas_Object *parent);
        [ :elm_slideshow_add, [ :evas_object ], :evas_object ],
        # EAPI Elm_Object_Item *elm_slideshow_item_add(Evas_Object *obj, const Elm_Slideshow_Item_Class *itc, const void *data);
        [ :elm_slideshow_item_add, [ :evas_object, :elm_slideshow_item_class, :pointer ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_slideshow_item_sorted_insert(Evas_Object *obj, const Elm_Slideshow_Item_Class *itc, const void *data, Eina_Compare_Cb func);
        [ :elm_slideshow_item_sorted_insert, [ :evas_object, :elm_slideshow_item_class, :pointer, :eina_compare_cb ], :elm_object_item ],
        # EAPI void elm_slideshow_item_show(Elm_Object_Item *it);
        [ :elm_slideshow_item_show, [ :elm_object_item ], :void ],
        # EAPI void elm_slideshow_next(Evas_Object *obj);
        [ :elm_slideshow_next, [ :evas_object ], :void ],
        # EAPI void elm_slideshow_previous(Evas_Object *obj);
        [ :elm_slideshow_previous, [ :evas_object ], :void ],
        # EAPI const Eina_List *elm_slideshow_transitions_get(const Evas_Object *obj);
        [ :elm_slideshow_transitions_get, [ :evas_object ], :eina_list ],
        # EAPI void elm_slideshow_transition_set(Evas_Object *obj, const char *transition);
        [ :elm_slideshow_transition_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_slideshow_transition_get(const Evas_Object *obj);
        [ :elm_slideshow_transition_get, [ :evas_object ], :string ],
        # EAPI void elm_slideshow_timeout_set(Evas_Object *obj, double timeout);
        [ :elm_slideshow_timeout_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_slideshow_timeout_get(const Evas_Object *obj);
        [ :elm_slideshow_timeout_get, [ :evas_object ], :double ],
        # EAPI void elm_slideshow_loop_set(Evas_Object *obj, Eina_Bool loop);
        [ :elm_slideshow_loop_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_slideshow_loop_get(const Evas_Object *obj);
        [ :elm_slideshow_loop_get, [ :evas_object ], :bool ],
        # EAPI void elm_slideshow_clear(Evas_Object *obj);
        [ :elm_slideshow_clear, [ :evas_object ], :void ],
        # EAPI const Eina_List *elm_slideshow_items_get(const Evas_Object *obj);
        [ :elm_slideshow_items_get, [ :evas_object ], :eina_list ],
        # EAPI Elm_Object_Item *elm_slideshow_item_current_get(const Evas_Object *obj);
        [ :elm_slideshow_item_current_get, [ :evas_object ], :elm_object_item ],
        # EAPI Evas_Object *elm_slideshow_item_object_get(const Elm_Object_Item *it);
        [ :elm_slideshow_item_object_get, [ :elm_object_item ], :evas_object ],
        # EAPI Elm_Object_Item *elm_slideshow_item_nth_get(const Evas_Object *obj, unsigned int nth);
        [ :elm_slideshow_item_nth_get, [ :evas_object, :uint ], :elm_object_item ],
        # EAPI void elm_slideshow_layout_set(Evas_Object *obj, const char *layout);
        [ :elm_slideshow_layout_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_slideshow_layout_get(const Evas_Object *obj);
        [ :elm_slideshow_layout_get, [ :evas_object ], :string ],
        # EAPI const Eina_List *elm_slideshow_layouts_get(const Evas_Object *obj);
        [ :elm_slideshow_layouts_get, [ :evas_object ], :eina_list ],
        # EAPI void elm_slideshow_cache_before_set(Evas_Object *obj, int count);
        [ :elm_slideshow_cache_before_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_slideshow_cache_before_get(const Evas_Object *obj);
        [ :elm_slideshow_cache_before_get, [ :evas_object ], :int ],
        # EAPI void elm_slideshow_cache_after_set(Evas_Object *obj, int count);
        [ :elm_slideshow_cache_after_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_slideshow_cache_after_get(const Evas_Object *obj);
        [ :elm_slideshow_cache_after_get, [ :evas_object ], :int ],
        # EAPI unsigned int elm_slideshow_count_get(const Evas_Object *obj);
        [ :elm_slideshow_count_get, [ :evas_object ], :uint ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
