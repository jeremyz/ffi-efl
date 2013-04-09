#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmCnp
        #
        FCT_PREFIX = 'elm_cnp_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Sel_Type;
        enum :elm_sel_type, [ :elm_sel_type_primary, :elm_sel_type_secondary, :elm_sel_type_xdnd, :elm_sel_type_clipboard ]
        # typedef enum {...} Elm_Sel_Format;
        enum :elm_sel_format, [ :elm_sel_format_targets, -1, :elm_sel_format_none, 0x0, :elm_sel_format_text, 0x01, :elm_sel_format_markup, 0x02,
            :elm_sel_format_image, 0x04, :elm_sel_format_vcard, 0x08, :elm_sel_format_html, 0x10 ]
        #
        # TYPEDEFS
        # typedef struct _Elm_Selection_Data Elm_Selection_Data;
        typedef :pointer, :elm_selection_data
        #
        # CALLBACKS
        # typedef Eina_Bool (*Elm_Drop_Cb) (void *data, Evas_Object *obj, Elm_Selection_Data *ev);
        callback :elm_drop_cb, [ :pointer, :evas_object, :elm_selection_data ], :bool
        # typedef void (*Elm_Selection_Loss_Cb) (void *data, Elm_Sel_Type selection);
        callback :elm_selection_loss_cb, [ :pointer, :elm_sel_type ], :void
        #
        # FUNCTIONS
        fcts = [
        # EAPI Eina_Bool elm_cnp_selection_set(Evas_Object *obj, Elm_Sel_Type selection, Elm_Sel_Format format, const void *buf, size_t buflen);
        [ :elm_cnp_selection_set, [ :evas_object, :elm_sel_type, :elm_sel_format, :pointer, :ulong ], :bool ],
        # EAPI Eina_Bool elm_cnp_selection_get(Evas_Object *obj, Elm_Sel_Type selection, Elm_Sel_Format format, Elm_Drop_Cb datacb, void *udata);
        [ :elm_cnp_selection_get, [ :evas_object, :elm_sel_type, :elm_sel_format, :elm_drop_cb, :pointer ], :bool ],
        # EAPI Eina_Bool elm_object_cnp_selection_clear(Evas_Object *obj, Elm_Sel_Type selection);
        [ :elm_object_cnp_selection_clear, [ :evas_object, :elm_sel_type ], :bool ],
        # EAPI void elm_cnp_selection_loss_callback_set(Evas_Object *obj, Elm_Sel_Type selection, Elm_Selection_Loss_Cb func, const void *data);
        [ :elm_cnp_selection_loss_callback_set, [ :evas_object, :elm_sel_type, :elm_selection_loss_cb, :pointer ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
