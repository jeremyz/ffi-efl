#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmTheme
        #
        FCT_PREFIX = 'elm_theme_' unless const_defined? :FCT_PREFIX
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
        # typedef struct _Elm_Theme Elm_Theme;
        typedef :pointer, :elm_theme
        #
        # FUNCTIONS
        fcts = [
        # EAPI Elm_Theme *elm_theme_new(void);
        [ :elm_theme_new, [  ], :elm_theme ],
        # EAPI void elm_theme_free(Elm_Theme *th);
        [ :elm_theme_free, [ :elm_theme ], :void ],
        # EAPI void elm_theme_copy(Elm_Theme *th, Elm_Theme *thdst);
        [ :elm_theme_copy, [ :elm_theme, :elm_theme ], :void ],
        # EAPI void elm_theme_ref_set(Elm_Theme *th, Elm_Theme *thref);
        [ :elm_theme_ref_set, [ :elm_theme, :elm_theme ], :void ],
        # EAPI Elm_Theme *elm_theme_ref_get(Elm_Theme *th);
        [ :elm_theme_ref_get, [ :elm_theme ], :elm_theme ],
        # EAPI Elm_Theme *elm_theme_default_get(void);
        [ :elm_theme_default_get, [  ], :elm_theme ],
        # EAPI void elm_theme_overlay_add(Elm_Theme *th, const char *item);
        [ :elm_theme_overlay_add, [ :elm_theme, :string ], :void ],
        # EAPI void elm_theme_overlay_del(Elm_Theme *th, const char *item);
        [ :elm_theme_overlay_del, [ :elm_theme, :string ], :void ],
        # EAPI const Eina_List *elm_theme_overlay_list_get(const Elm_Theme *th);
        [ :elm_theme_overlay_list_get, [ :elm_theme ], :eina_list ],
        # EAPI void elm_theme_extension_add(Elm_Theme *th, const char *item);
        [ :elm_theme_extension_add, [ :elm_theme, :string ], :void ],
        # EAPI void elm_theme_extension_del(Elm_Theme *th, const char *item);
        [ :elm_theme_extension_del, [ :elm_theme, :string ], :void ],
        # EAPI const Eina_List *elm_theme_extension_list_get(const Elm_Theme *th);
        [ :elm_theme_extension_list_get, [ :elm_theme ], :eina_list ],
        # EAPI void elm_theme_set(Elm_Theme *th, const char *theme);
        [ :elm_theme_set, [ :elm_theme, :string ], :void ],
        # EAPI const char *elm_theme_get(Elm_Theme *th);
        [ :elm_theme_get, [ :elm_theme ], :string ],
        # EAPI const Eina_List *elm_theme_list_get(const Elm_Theme *th);
        [ :elm_theme_list_get, [ :elm_theme ], :eina_list ],
        # EAPI char *elm_theme_list_item_path_get(const char *f, Eina_Bool *in_search_path);
        [ :elm_theme_list_item_path_get, [ :string, :pointer ], :string ],
        # EAPI void elm_theme_flush(Elm_Theme *th);
        [ :elm_theme_flush, [ :elm_theme ], :void ],
        # EAPI void elm_theme_full_flush(void);
        [ :elm_theme_full_flush, [  ], :void ],
        # EAPI Eina_List *elm_theme_name_available_list_new(void);
        [ :elm_theme_name_available_list_new, [  ], :eina_list ],
        # EAPI void elm_theme_name_available_list_free(Eina_List *list);
        [ :elm_theme_name_available_list_free, [ :eina_list ], :void ],
        # EAPI void elm_object_theme_set(Evas_Object *obj, Elm_Theme *th);
        [ :elm_object_theme_set, [ :evas_object, :elm_theme ], :void ],
        # EAPI Elm_Theme *elm_object_theme_get(const Evas_Object *obj);
        [ :elm_object_theme_get, [ :evas_object ], :elm_theme ],
        # EAPI const char *elm_theme_data_get(Elm_Theme *th, const char *key);
        [ :elm_theme_data_get, [ :elm_theme, :string ], :string ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
