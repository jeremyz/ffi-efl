#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/ecore'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmBox
        #
        FCT_PREFIX = 'elm_box_' unless const_defined? :FCT_PREFIX
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
        # typedef struct _Elm_Box_Transition Elm_Box_Transition;
        typedef :pointer, :elm_box_transition
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_box_add(Evas_Object *parent);
        [ :elm_box_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_box_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_box_horizontal_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_box_horizontal_get(const Evas_Object *obj);
        [ :elm_box_horizontal_get, [ :evas_object ], :bool ],
        # EAPI void elm_box_homogeneous_set(Evas_Object *obj, Eina_Bool homogeneous);
        [ :elm_box_homogeneous_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_box_homogeneous_get(const Evas_Object *obj);
        [ :elm_box_homogeneous_get, [ :evas_object ], :bool ],
        # EAPI void elm_box_pack_start(Evas_Object *obj, Evas_Object *subobj);
        [ :elm_box_pack_start, [ :evas_object, :evas_object ], :void ],
        # EAPI void elm_box_pack_end(Evas_Object *obj, Evas_Object *subobj);
        [ :elm_box_pack_end, [ :evas_object, :evas_object ], :void ],
        # EAPI void elm_box_pack_before(Evas_Object *obj, Evas_Object *subobj, Evas_Object *before);
        [ :elm_box_pack_before, [ :evas_object, :evas_object, :evas_object ], :void ],
        # EAPI void elm_box_pack_after(Evas_Object *obj, Evas_Object *subobj, Evas_Object *after);
        [ :elm_box_pack_after, [ :evas_object, :evas_object, :evas_object ], :void ],
        # EAPI void elm_box_clear(Evas_Object *obj);
        [ :elm_box_clear, [ :evas_object ], :void ],
        # EAPI void elm_box_unpack(Evas_Object *obj, Evas_Object *subobj);
        [ :elm_box_unpack, [ :evas_object, :evas_object ], :void ],
        # EAPI void elm_box_unpack_all(Evas_Object *obj);
        [ :elm_box_unpack_all, [ :evas_object ], :void ],
        # EAPI Eina_List *elm_box_children_get(const Evas_Object *obj);
        [ :elm_box_children_get, [ :evas_object ], :eina_list ],
        # EAPI void elm_box_padding_set(Evas_Object *obj, Evas_Coord horizontal, Evas_Coord vertical);
        [ :elm_box_padding_set, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_box_padding_get(const Evas_Object *obj, Evas_Coord *horizontal, Evas_Coord *vertical);
        [ :elm_box_padding_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_box_align_set(Evas_Object *obj, double horizontal, double vertical);
        [ :elm_box_align_set, [ :evas_object, :double, :double ], :void ],
        # EAPI void elm_box_align_get(const Evas_Object *obj, double *horizontal, double *vertical);
        [ :elm_box_align_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_box_recalculate(Evas_Object *obj);
        [ :elm_box_recalculate, [ :evas_object ], :void ],
        # EAPI void elm_box_layout_set(Evas_Object *obj, Evas_Object_Box_Layout cb, const void *data, Ecore_Cb free_data);
        [ :elm_box_layout_set, [ :evas_object, :evas_object_box_layout_cb, :pointer, :ecore_cb ], :void ],
        # EAPI void elm_box_layout_transition(Evas_Object *obj, Evas_Object_Box_Data *priv, void *data);
        [ :elm_box_layout_transition, [ :evas_object, :evas_object_box_data, :pointer ], :void ],
        # EAPI Elm_Box_Transition *elm_box_transition_new(const double duration, Evas_Object_Box_Layout start_layout, void *start_layout_data, Ecore_Cb start_layout_free_data, Evas_Object_Box_Layout end_layout, void *end_layout_data, Ecore_Cb end_layout_free_data, Ecore_Cb transition_end_cb, void *transition_end_data);
        [ :elm_box_transition_new, [ :double, :evas_object_box_layout_cb, :pointer, :ecore_cb, :evas_object_box_layout_cb, :pointer, :ecore_cb,
            :ecore_cb, :pointer ], :elm_box_transition ],
        # EAPI void elm_box_transition_free(void *data);
        [ :elm_box_transition_free, [ :pointer ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
