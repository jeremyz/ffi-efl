#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmCtxPopup
        #
        FCT_PREFIX = 'elm_ctxpopup_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Ctxpopup_Direction;
        enum :elm_ctxpopup_direction, [ :elm_ctxpopup_direction_down, :elm_ctxpopup_direction_right, :elm_ctxpopup_direction_left,
            :elm_ctxpopup_direction_up, :elm_ctxpopup_direction_unknown ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_ctxpopup_add(Evas_Object *parent);
        [ :elm_ctxpopup_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_ctxpopup_hover_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_ctxpopup_hover_parent_set, [ :evas_object, :evas_object ], :void ],
        # EAPI Evas_Object *elm_ctxpopup_hover_parent_get(const Evas_Object *obj);
        [ :elm_ctxpopup_hover_parent_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_ctxpopup_clear(Evas_Object *obj);
        [ :elm_ctxpopup_clear, [ :evas_object ], :void ],
        # EAPI void elm_ctxpopup_horizontal_set(Evas_Object *obj, Eina_Bool horizontal);
        [ :elm_ctxpopup_horizontal_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_ctxpopup_horizontal_get(const Evas_Object *obj);
        [ :elm_ctxpopup_horizontal_get, [ :evas_object ], :bool ],
        # EAPI Elm_Object_Item *elm_ctxpopup_item_append(Evas_Object *obj, const char *label, Evas_Object *icon, Evas_Smart_Cb func, const void *data);
        [ :elm_ctxpopup_item_append, [ :evas_object, :string, :evas_object, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI void elm_ctxpopup_direction_priority_set(Evas_Object *obj, Elm_Ctxpopup_Direction first, Elm_Ctxpopup_Direction second, Elm_Ctxpopup_Direction third, Elm_Ctxpopup_Direction fourth);
        [ :elm_ctxpopup_direction_priority_set, [ :evas_object, :elm_ctxpopup_direction, :elm_ctxpopup_direction, :elm_ctxpopup_direction,
            :elm_ctxpopup_direction ], :void ],
        # EAPI void elm_ctxpopup_direction_priority_get(Evas_Object *obj, Elm_Ctxpopup_Direction *first, Elm_Ctxpopup_Direction *second, Elm_Ctxpopup_Direction *third, Elm_Ctxpopup_Direction *fourth);
        [ :elm_ctxpopup_direction_priority_get, [ :evas_object, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI Elm_Ctxpopup_Direction elm_ctxpopup_direction_get(const Evas_Object *obj);
        [ :elm_ctxpopup_direction_get, [ :evas_object ], :elm_ctxpopup_direction ],
        # EAPI void elm_ctxpopup_dismiss(Evas_Object *obj);
        [ :elm_ctxpopup_dismiss, [ :evas_object ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
