#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmFileSelectorEntry
        #
        FCT_PREFIX = 'elm_fileselector_entry_' unless const_defined? :FCT_PREFIX
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
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_fileselector_entry_add(Evas_Object *parent);
        [ :elm_fileselector_entry_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_fileselector_entry_window_title_set(Evas_Object *obj, const char *title);
        [ :elm_fileselector_entry_window_title_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_fileselector_entry_window_title_get(const Evas_Object *obj);
        [ :elm_fileselector_entry_window_title_get, [ :evas_object ], :string ],
        # EAPI void elm_fileselector_entry_window_size_set(Evas_Object *obj, Evas_Coord width, Evas_Coord height);
        [ :elm_fileselector_entry_window_size_set, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_fileselector_entry_window_size_get(const Evas_Object *obj, Evas_Coord *width, Evas_Coord *height);
        [ :elm_fileselector_entry_window_size_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_fileselector_entry_path_set(Evas_Object *obj, const char *path);
        [ :elm_fileselector_entry_path_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_fileselector_entry_path_get(const Evas_Object *obj);
        [ :elm_fileselector_entry_path_get, [ :evas_object ], :string ],
        # EAPI void elm_fileselector_entry_expandable_set(Evas_Object *obj, Eina_Bool value);
        [ :elm_fileselector_entry_expandable_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_entry_expandable_get(const Evas_Object *obj);
        [ :elm_fileselector_entry_expandable_get, [ :evas_object ], :bool ],
        # EAPI void elm_fileselector_entry_folder_only_set(Evas_Object *obj, Eina_Bool value);
        [ :elm_fileselector_entry_folder_only_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_entry_folder_only_get(const Evas_Object *obj);
        [ :elm_fileselector_entry_folder_only_get, [ :evas_object ], :bool ],
        # EAPI void elm_fileselector_entry_is_save_set(Evas_Object *obj, Eina_Bool value);
        [ :elm_fileselector_entry_is_save_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_entry_is_save_get(const Evas_Object *obj);
        [ :elm_fileselector_entry_is_save_get, [ :evas_object ], :bool ],
        # EAPI void elm_fileselector_entry_inwin_mode_set(Evas_Object *obj, Eina_Bool value);
        [ :elm_fileselector_entry_inwin_mode_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_fileselector_entry_inwin_mode_get(const Evas_Object *obj);
        [ :elm_fileselector_entry_inwin_mode_get, [ :evas_object ], :bool ],
        # EAPI void elm_fileselector_entry_selected_set(Evas_Object *obj, const char *path);
        [ :elm_fileselector_entry_selected_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_fileselector_entry_selected_get(const Evas_Object *obj);
        [ :elm_fileselector_entry_selected_get, [ :evas_object ], :string ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
