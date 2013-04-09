#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmGen
        #
        FCT_PREFIX = 'elm_gen_' unless const_defined? :FCT_PREFIX
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
        # typedef struct Elm_Gen_Item Elm_Gen_Item;
        typedef :pointer, :elm_gen_item
        # typedef struct _Elm_Gen_Item_Class Elm_Gen_Item_Class;
        typedef :pointer, :elm_gen_item_class
        #
        # CALLBACKS
        # typedef char *(*Elm_Gen_Item_Text_Get_Cb) (void *data, Evas_Object *obj, const char *part);
        callback :elm_gen_item_text_get_cb, [ :pointer, :evas_object, :string ], :string
        # typedef Evas_Object *(*Elm_Gen_Item_Content_Get_Cb) (void *data, Evas_Object *obj, const char *part);
        callback :elm_gen_item_content_get_cb, [ :pointer, :evas_object, :string ], :evas_object
        # typedef Eina_Bool (*Elm_Gen_Item_State_Get_Cb) (void *data, Evas_Object *obj, const char *part);
        callback :elm_gen_item_state_get_cb, [ :pointer, :evas_object, :string ], :bool
        # typedef void (*Elm_Gen_Item_Del_Cb) (void *data, Evas_Object *obj);
        callback :elm_gen_item_del_cb, [ :pointer, :evas_object ], :void
        #
        # FUNCTIONS
        fcts = [
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
