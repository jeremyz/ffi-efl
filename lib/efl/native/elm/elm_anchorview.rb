#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmAnchorView
        #
        FCT_PREFIX = 'elm_anchorview_' unless const_defined? :FCT_PREFIX
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
        # TYPEDEFS
        # typedef struct _Elm_Entry_Anchorview_Info Elm_Entry_Anchorview_Info;
        typedef :pointer, :elm_entry_anchorview_info
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_anchorview_add(Evas_Object *parent);
        [ :elm_anchorview_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_anchorview_hover_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_anchorview_hover_parent_set, [ :evas_object, :evas_object ], :void ],
        # EAPI Evas_Object *elm_anchorview_hover_parent_get(const Evas_Object *obj);
        [ :elm_anchorview_hover_parent_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_anchorview_hover_style_set(Evas_Object *obj, const char *style);
        [ :elm_anchorview_hover_style_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_anchorview_hover_style_get(const Evas_Object *obj);
        [ :elm_anchorview_hover_style_get, [ :evas_object ], :string ],
        # EAPI void elm_anchorview_hover_end(Evas_Object *obj);
        [ :elm_anchorview_hover_end, [ :evas_object ], :void ],
        # EAPI void elm_anchorview_bounce_set(Evas_Object *obj, Eina_Bool h_bounce, Eina_Bool v_bounce);
        [ :elm_anchorview_bounce_set, [ :evas_object, :bool, :bool ], :void ],
        # EAPI void elm_anchorview_bounce_get(const Evas_Object *obj, Eina_Bool *h_bounce, Eina_Bool *v_bounce);
        [ :elm_anchorview_bounce_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_anchorview_item_provider_append(Evas_Object *obj, Evas_Object * (*func)(void *data, Evas_Object * anchorview, const char *item), void *data);
        # FIXME
        # EAPI void elm_anchorview_item_provider_prepend(Evas_Object *obj, Evas_Object * (*func)(void *data, Evas_Object * anchorview, const char *item), void *data);
        # FIXME
        # EAPI void elm_anchorview_item_provider_remove(Evas_Object *obj, Evas_Object * (*func)(void *data, Evas_Object * anchorview, const char *item), void *data);
        # FIXME
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
