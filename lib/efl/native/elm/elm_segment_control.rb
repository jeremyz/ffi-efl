#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmSegmentControl
        #
        FCT_PREFIX = 'elm_segment_control_' unless const_defined? :FCT_PREFIX
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
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_segment_control_add(Evas_Object *parent);
        [ :elm_segment_control_add, [ :evas_object ], :evas_object ],
        # EAPI Elm_Object_Item *elm_segment_control_item_add(Evas_Object *obj, Evas_Object *icon, const char *label);
        [ :elm_segment_control_item_add, [ :evas_object, :evas_object, :string ], :elm_object_item ],
        # EAPI Elm_Object_Item *elm_segment_control_item_insert_at(Evas_Object *obj, Evas_Object *icon, const char *label, int index);
        [ :elm_segment_control_item_insert_at, [ :evas_object, :evas_object, :string, :int ], :elm_object_item ],
        # EAPI void elm_segment_control_item_del_at(Evas_Object *obj, int index);
        [ :elm_segment_control_item_del_at, [ :evas_object, :int ], :void ],
        # EAPI int elm_segment_control_item_count_get(const Evas_Object *obj);
        [ :elm_segment_control_item_count_get, [ :evas_object ], :int ],
        # EAPI Elm_Object_Item *elm_segment_control_item_get(const Evas_Object *obj, int index);
        [ :elm_segment_control_item_get, [ :evas_object, :int ], :elm_object_item ],
        # EAPI const char *elm_segment_control_item_label_get(const Evas_Object *obj, int index);
        [ :elm_segment_control_item_label_get, [ :evas_object, :int ], :string ],
        # EAPI Evas_Object *elm_segment_control_item_icon_get(const Evas_Object *obj, int index);
        [ :elm_segment_control_item_icon_get, [ :evas_object, :int ], :evas_object ],
        # EAPI int elm_segment_control_item_index_get(const Elm_Object_Item *it);
        [ :elm_segment_control_item_index_get, [ :elm_object_item ], :int ],
        # EAPI Evas_Object *elm_segment_control_item_object_get(const Elm_Object_Item *it);
        [ :elm_segment_control_item_object_get, [ :elm_object_item ], :evas_object ],
        # EAPI Elm_Object_Item *elm_segment_control_item_selected_get(const Evas_Object *obj);
        [ :elm_segment_control_item_selected_get, [ :evas_object ], :elm_object_item ],
        # EAPI void elm_segment_control_item_selected_set(Elm_Object_Item *it, Eina_Bool select);
        [ :elm_segment_control_item_selected_set, [ :elm_object_item, :bool ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
