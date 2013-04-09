#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmTooltip
        #
        FCT_PREFIX = 'elm_object_tooltip_' unless const_defined? :FCT_PREFIX
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
        # CALLBACKS
        # typedef Evas_Object *(*Elm_Tooltip_Content_Cb) (void *data, Evas_Object *obj, Evas_Object *tooltip);
        callback :elm_tooltip_content_cb, [ :pointer, :evas_object, :evas_object ], :evas_object
        # typedef Evas_Object *(*Elm_Tooltip_Item_Content_Cb) (void *data, Evas_Object *obj, Evas_Object *tooltip, void *item);
        callback :elm_tooltip_item_content_cb, [ :pointer, :evas_object, :evas_object, :pointer ], :evas_object
        #
        # FUNCTIONS
        fcts = [
        # EAPI void elm_object_tooltip_show(Evas_Object *obj);
        [ :elm_object_tooltip_show, [ :evas_object ], :void ],
        # EAPI void elm_object_tooltip_hide(Evas_Object *obj);
        [ :elm_object_tooltip_hide, [ :evas_object ], :void ],
        # EAPI void elm_object_tooltip_text_set(Evas_Object *obj, const char *text);
        [ :elm_object_tooltip_text_set, [ :evas_object, :string ], :void ],
        # EAPI void elm_object_tooltip_domain_translatable_text_set(Evas_Object *obj, const char *domain, const char *text);
        [ :elm_object_tooltip_domain_translatable_text_set, [ :evas_object, :string, :string ], :void ],
        # EAPI void elm_object_tooltip_content_cb_set(Evas_Object *obj, Elm_Tooltip_Content_Cb func, const void *data, Evas_Smart_Cb del_cb);
        [ :elm_object_tooltip_content_cb_set, [ :evas_object, :elm_tooltip_content_cb, :pointer, :evas_smart_cb ], :void ],
        # EAPI void elm_object_tooltip_unset(Evas_Object *obj);
        [ :elm_object_tooltip_unset, [ :evas_object ], :void ],
        # EAPI void elm_object_tooltip_style_set(Evas_Object *obj, const char *style);
        [ :elm_object_tooltip_style_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_object_tooltip_style_get(const Evas_Object *obj);
        [ :elm_object_tooltip_style_get, [ :evas_object ], :string ],
        # EAPI Eina_Bool elm_object_tooltip_window_mode_set(Evas_Object *obj, Eina_Bool disable);
        [ :elm_object_tooltip_window_mode_set, [ :evas_object, :bool ], :bool ],
        # EAPI Eina_Bool elm_object_tooltip_window_mode_get(const Evas_Object *obj);
        [ :elm_object_tooltip_window_mode_get, [ :evas_object ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
