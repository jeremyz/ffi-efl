#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmFileSelector
        #
        FCT_PREFIX = 'elm_fileselector_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Elm_Fileselector_Mode;
        enum :elm_fileselector_mode, [ :elm_fileselector_list, 0, :elm_fileselector_grid, 1, :elm_fileselector_last, 2 ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_fileselector_add(Evas_Object *parent);
        [ :elm_fileselector_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_fileselector_is_save_set(Evas_Object *obj, Eina_Bool is_save);
        [ :elm_fileselector_is_save_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_is_save_get(const Evas_Object *obj);
        [ :elm_fileselector_is_save_get, [ :evas_object ], :bool ],
        # EAPI void elm_fileselector_folder_only_set(Evas_Object *obj, Eina_Bool only);
        [ :elm_fileselector_folder_only_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_folder_only_get(const Evas_Object *obj);
        [ :elm_fileselector_folder_only_get, [ :evas_object ], :bool ],
        # EAPI void elm_fileselector_buttons_ok_cancel_set(Evas_Object *obj, Eina_Bool buttons);
        [ :elm_fileselector_buttons_ok_cancel_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_buttons_ok_cancel_get(const Evas_Object *obj);
        [ :elm_fileselector_buttons_ok_cancel_get, [ :evas_object ], :bool ],
        # EAPI void elm_fileselector_expandable_set(Evas_Object *obj, Eina_Bool expand);
        [ :elm_fileselector_expandable_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_expandable_get(const Evas_Object *obj);
        [ :elm_fileselector_expandable_get, [ :evas_object ], :bool ],
        # EAPI void elm_fileselector_path_set(Evas_Object *obj, const char *path);
        [ :elm_fileselector_path_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_fileselector_path_get(const Evas_Object *obj);
        [ :elm_fileselector_path_get, [ :evas_object ], :string ],
        # EAPI Eina_Bool elm_fileselector_selected_set(Evas_Object *obj, const char *path);
        [ :elm_fileselector_selected_set, [ :evas_object, :string ], :bool ],
        # EAPI const char *elm_fileselector_selected_get(const Evas_Object *obj);
        [ :elm_fileselector_selected_get, [ :evas_object ], :string ],
        # EAPI void elm_fileselector_mode_set(Evas_Object *obj, Elm_Fileselector_Mode mode);
        [ :elm_fileselector_mode_set, [ :evas_object, :elm_fileselector_mode ], :void ],
        # EAPI Elm_Fileselector_Mode elm_fileselector_mode_get(const Evas_Object *obj);
        [ :elm_fileselector_mode_get, [ :evas_object ], :elm_fileselector_mode ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
