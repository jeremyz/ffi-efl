#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmFonts
        #
        FCT_PREFIX = 'elm_fonts_' unless const_defined? :FCT_PREFIX
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
        # typedef struct _Elm_Text_Class Elm_Text_Class;
        typedef :pointer, :elm_text_class
        # typedef struct _Elm_Font_Overlay Elm_Font_Overlay;
        typedef :pointer, :elm_font_overlay
        # typedef struct _Elm_Font_Properties Elm_Font_Properties;
        typedef :pointer, :elm_font_properties
        #
        # FUNCTIONS
        fcts = [
        # EAPI Eina_List *elm_text_classes_list_get(void);
        [ :elm_text_classes_list_get, [  ], :eina_list ],
        # EAPI void elm_text_classes_list_free(Eina_List *list);
        [ :elm_text_classes_list_free, [ :eina_list ], :void ],
        # EAPI const Eina_List *elm_font_overlay_list_get(void);
        [ :elm_font_overlay_list_get, [  ], :eina_list ],
        # EAPI void elm_font_overlay_set(const char *text_class, const char *font, Evas_Font_Size size);
        [ :elm_font_overlay_set, [ :string, :string, :int ], :void ],
        # EAPI void elm_font_overlay_unset(const char *text_class);
        [ :elm_font_overlay_unset, [ :string ], :void ],
        # EAPI void elm_font_overlay_apply(void);
        [ :elm_font_overlay_apply, [  ], :void ],
        # EAPI Elm_Font_Properties *elm_font_properties_get(const char *font);
        [ :elm_font_properties_get, [ :string ], :elm_font_properties ],
        # EAPI void elm_font_properties_free(Elm_Font_Properties *efp);
        [ :elm_font_properties_free, [ :elm_font_properties ], :void ],
        # EAPI char *elm_font_fontconfig_name_get(const char *name, const char *style);
        [ :elm_font_fontconfig_name_get, [ :string, :string ], :string ],
        # EAPI void elm_font_fontconfig_name_free(char *name);
        [ :elm_font_fontconfig_name_free, [ :string ], :void ],
        # EAPI Eina_Hash *elm_font_available_hash_add(Eina_List *list);
        [ :elm_font_available_hash_add, [ :eina_list ], :eina_hash ],
        # EAPI void elm_font_available_hash_del(Eina_Hash *hash);
        [ :elm_font_available_hash_del, [ :eina_hash ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
