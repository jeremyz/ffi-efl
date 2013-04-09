#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
require 'efl/native/elm/elm_entry'
#
module Efl
    #
    module ElmPopup
        #
        FCT_PREFIX = 'elm_popup_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Popup_Orient;
        enum :elm_popup_orient, [ :elm_popup_orient_top, 0, :elm_popup_orient_center, 1, :elm_popup_orient_bottom, 2, :elm_popup_orient_left, 3,
            :elm_popup_orient_right, 4, :elm_popup_orient_top_left, 5, :elm_popup_orient_top_right, 6, :elm_popup_orient_bottom_left, 7,
            :elm_popup_orient_bottom_right, 8, :elm_popup_orient_last, 9 ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_popup_add(Evas_Object *parent);
        [ :elm_popup_add, [ :evas_object ], :evas_object ],
        # EAPI Elm_Object_Item *elm_popup_item_append(Evas_Object *obj, const char *label, Evas_Object *icon, Evas_Smart_Cb func, const void *data);
        [ :elm_popup_item_append, [ :evas_object, :string, :evas_object, :evas_smart_cb, :pointer ], :elm_object_item ],
        # EAPI void elm_popup_content_text_wrap_type_set(Evas_Object *obj, Elm_Wrap_Type wrap);
        [ :elm_popup_content_text_wrap_type_set, [ :evas_object, :elm_wrap_type ], :void ],
        # EAPI Elm_Wrap_Type elm_popup_content_text_wrap_type_get(const Evas_Object *obj);
        [ :elm_popup_content_text_wrap_type_get, [ :evas_object ], :elm_wrap_type ],
        # EAPI void elm_popup_orient_set(Evas_Object *obj, Elm_Popup_Orient orient);
        [ :elm_popup_orient_set, [ :evas_object, :elm_popup_orient ], :void ],
        # EAPI Elm_Popup_Orient elm_popup_orient_get(const Evas_Object *obj);
        [ :elm_popup_orient_get, [ :evas_object ], :elm_popup_orient ],
        # EAPI void elm_popup_timeout_set(Evas_Object *obj, double timeout);
        [ :elm_popup_timeout_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_popup_timeout_get(const Evas_Object *obj);
        [ :elm_popup_timeout_get, [ :evas_object ], :double ],
        # EAPI void elm_popup_allow_events_set(Evas_Object *obj, Eina_Bool allow);
        [ :elm_popup_allow_events_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_popup_allow_events_get(const Evas_Object *obj);
        [ :elm_popup_allow_events_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
