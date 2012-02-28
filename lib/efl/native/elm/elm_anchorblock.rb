#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmAnchorBlock
        #
        FCT_PREFIX = 'elm_anchorblock_' unless const_defined? :FCT_PREFIX
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
        # typedef struct _Elm_Entry_Anchorblock_Info Elm_Entry_Anchorblock_Info;
        typedef :pointer, :elm_entry_anchorblock_info
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_anchorblock_add(Evas_Object *parent);
        [ :elm_anchorblock_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_anchorblock_hover_parent_set(Evas_Object *obj, Evas_Object *parent);
        [ :elm_anchorblock_hover_parent_set, [ :evas_object, :evas_object ], :void ],
        # EAPI Evas_Object *elm_anchorblock_hover_parent_get(const Evas_Object *obj);
        [ :elm_anchorblock_hover_parent_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_anchorblock_hover_style_set(Evas_Object *obj, const char *style);
        [ :elm_anchorblock_hover_style_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_anchorblock_hover_style_get(const Evas_Object *obj);
        [ :elm_anchorblock_hover_style_get, [ :evas_object ], :string ],
        # EAPI void elm_anchorblock_hover_end(Evas_Object *obj);
        [ :elm_anchorblock_hover_end, [ :evas_object ], :void ],
        # EAPI void elm_anchorblock_item_provider_append(Evas_Object *obj, Evas_Object * (*func)(void *data, Evas_Object * anchorblock, const char *item), void *data);
        # FIXME
        # EAPI void elm_anchorblock_item_provider_prepend(Evas_Object *obj, Evas_Object * (*func)(void *data, Evas_Object * anchorblock, const char *item), void *data);
        # FIXME
        # EAPI void elm_anchorblock_item_provider_remove(Evas_Object *obj, Evas_Object * (*func)(void *data, Evas_Object * anchorblock, const char *item), void *data);
        # FIXME
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
