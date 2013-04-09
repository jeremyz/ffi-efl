#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmIcon
        #
        FCT_PREFIX = 'elm_icon_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Icon_Type;
        enum :elm_icon_type, [ :elm_icon_none, :elm_icon_file, :elm_icon_standard ]
        # typedef enum {...} Elm_Icon_Lookup_Order;
        enum :elm_icon_lookup_order, [ :elm_icon_lookup_fdo_theme, :elm_icon_lookup_theme_fdo, :elm_icon_lookup_fdo, :elm_icon_lookup_theme ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_icon_add(Evas_Object *parent);
        [ :elm_icon_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_icon_thumb_set(Evas_Object *obj, const char *file, const char *group);
        [ :elm_icon_thumb_set, [ :evas_object, :string, :string ], :void ],
        # EAPI Eina_Bool elm_icon_standard_set(Evas_Object *obj, const char *name);
        [ :elm_icon_standard_set, [ :evas_object, :string ], :bool ],
        # EAPI const char *elm_icon_standard_get(const Evas_Object *obj);
        [ :elm_icon_standard_get, [ :evas_object ], :string ],
        # EAPI void elm_icon_order_lookup_set(Evas_Object *obj, Elm_Icon_Lookup_Order order);
        [ :elm_icon_order_lookup_set, [ :evas_object, :elm_icon_lookup_order ], :void ],
        # EAPI Elm_Icon_Lookup_Order elm_icon_order_lookup_get(const Evas_Object *obj);
        [ :elm_icon_order_lookup_get, [ :evas_object ], :elm_icon_lookup_order ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
