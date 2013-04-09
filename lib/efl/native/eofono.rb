#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/edbus'
#
module Efl
    #
    module Eofono
        #
        FCT_PREFIX = 'e_ofono_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'eofono.so.1'
        #
        # TYPEDEFS
        # typedef struct _E_Ofono_Element E_Ofono_Element;
        typedef :pointer, :e_ofono_element
        #
        # FUNCTIONS
        fcts = [
        # EAPI unsigned int e_ofono_system_init(E_DBus_Connection *edbus_conn);
        [ :e_ofono_system_init, [ :e_dbus_connection ], :uint ],
        # EAPI unsigned int e_ofono_system_shutdown(void);
        [ :e_ofono_system_shutdown, [  ], :uint ],
        # EAPI E_Ofono_Element * e_ofono_manager_get(void);
        [ :e_ofono_manager_get, [  ], :e_ofono_element ],
        # EAPI Eina_Bool e_ofono_manager_modems_get(Eina_Array **array);
        [ :e_ofono_manager_modems_get, [ :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_modem_powered_get(const E_Ofono_Element *element, Eina_Bool *powered);
        [ :e_ofono_modem_powered_get, [ :e_ofono_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_modem_powered_set(E_Ofono_Element *element, Eina_Bool powered, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_ofono_modem_powered_set, [ :e_ofono_element, :bool, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_modem_name_get(const E_Ofono_Element *element, const char **name);
        [ :e_ofono_modem_name_get, [ :e_ofono_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_netreg_mode_get(const E_Ofono_Element *element, const char **mode);
        [ :e_ofono_netreg_mode_get, [ :e_ofono_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_netreg_status_get(const E_Ofono_Element *element, const char **status);
        [ :e_ofono_netreg_status_get, [ :e_ofono_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_netreg_operator_get(const E_Ofono_Element *element, const char **op);
        [ :e_ofono_netreg_operator_get, [ :e_ofono_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_netreg_strength_get(const E_Ofono_Element *element, uint8_t *strength);
        [ :e_ofono_netreg_strength_get, [ :e_ofono_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_sms_sca_get(const E_Ofono_Element *element, const char **sca);
        [ :e_ofono_sms_sca_get, [ :e_ofono_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_sms_sca_set(E_Ofono_Element *element, const char *sca, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_ofono_sms_sca_set, [ :e_ofono_element, :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_sms_send_message(E_Ofono_Element *element, const char *number, const char *message, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_ofono_sms_send_message, [ :e_ofono_element, :string, :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_manager_sync_elements(void);
        [ :e_ofono_manager_sync_elements, [  ], :bool ],
        # EAPI Eina_Bool e_ofono_elements_get_all(unsigned int *count, E_Ofono_Element ***p_elements);
        [ :e_ofono_elements_get_all, [ :pointer, :e_ofono_element ], :bool ],
        # EAPI Eina_Bool e_ofono_elements_get_all_type(const char *type, unsigned int *count, E_Ofono_Element ***p_elements);
        [ :e_ofono_elements_get_all_type, [ :string, :pointer, :e_ofono_element ], :bool ],
        # EAPI E_Ofono_Element * e_ofono_element_get(const char *path, const char *interface);
        [ :e_ofono_element_get, [ :string, :string ], :e_ofono_element ],
        # EAPI void e_ofono_element_listener_add(E_Ofono_Element *element, void (*cb)(void *data, const E_Ofono_Element *element), const void *data, void (*free_data)(void *data));
        [ :e_ofono_element_listener_add, [ :e_ofono_element, (callback [:pointer, :e_ofono_element], :void), :pointer, (callback [:pointer], :void) ], :void ],
        # EAPI void e_ofono_element_listener_del(E_Ofono_Element *element, void (*cb)(void *data, const E_Ofono_Element *element), const void *data);
        [ :e_ofono_element_listener_del, [ :e_ofono_element, (callback [:pointer, :e_ofono_element], :void), :pointer ], :void ],
        # EAPI int e_ofono_element_ref(E_Ofono_Element *element);
        [ :e_ofono_element_ref, [ :e_ofono_element ], :int ],
        # EAPI int e_ofono_element_unref(E_Ofono_Element *element);
        [ :e_ofono_element_unref, [ :e_ofono_element ], :int ],
        # EAPI void e_ofono_element_print(FILE *fp, const E_Ofono_Element *element);
        [ :e_ofono_element_print, [ :pointer, :e_ofono_element ], :void ],
        # EAPI Eina_Bool e_ofono_element_properties_sync(E_Ofono_Element *element);
        [ :e_ofono_element_properties_sync, [ :e_ofono_element ], :bool ],
        # EAPI Eina_Bool e_ofono_element_properties_sync_full(E_Ofono_Element *element, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_ofono_element_properties_sync_full, [ :e_ofono_element, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_element_property_set(E_Ofono_Element *element, const char *prop, int type, const void *value);
        [ :e_ofono_element_property_set, [ :e_ofono_element, :string, :int, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_element_property_set_full(E_Ofono_Element *element, const char *prop, int type, const void *value, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_ofono_element_property_set_full, [ :e_ofono_element, :string, :int, :pointer, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_element_property_dict_set_full(E_Ofono_Element *element, const char *prop, const char *key, int type, const void *value, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_ofono_element_property_dict_set_full, [ :e_ofono_element, :string, :string, :int, :pointer, :e_dbus_method_return_cb, :pointer ], :bool
            ],
        # EAPI void e_ofono_element_properties_list(const E_Ofono_Element *element, Eina_Bool (*cb)(void *data, const E_Ofono_Element *element, const char *name, int type, const void *value), const void *data);
        [ :e_ofono_element_properties_list, [ :e_ofono_element, (callback [:pointer, :e_ofono_element, :string, :int, :pointer], :bool), :pointer ], :void ],
        # EAPI Eina_Bool e_ofono_element_property_type_get_stringshared(const E_Ofono_Element *element, const char *name, int *type);
        [ :e_ofono_element_property_type_get_stringshared, [ :e_ofono_element, :string, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_element_property_type_get(const E_Ofono_Element *element, const char *name, int *type);
        [ :e_ofono_element_property_type_get, [ :e_ofono_element, :string, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_element_property_dict_get_stringshared(const E_Ofono_Element *element, const char *dict_name, const char *key_name, int *type, void *value);
        [ :e_ofono_element_property_dict_get_stringshared, [ :e_ofono_element, :string, :string, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_element_property_get_stringshared(const E_Ofono_Element *element, const char *name, int *type, void *value);
        [ :e_ofono_element_property_get_stringshared, [ :e_ofono_element, :string, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_element_property_get(const E_Ofono_Element *element, const char *name, int *type, void *value);
        [ :e_ofono_element_property_get, [ :e_ofono_element, :string, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_ofono_element_is_manager(const E_Ofono_Element *element);
        [ :e_ofono_element_is_manager, [ :e_ofono_element ], :bool ],
        # EAPI Eina_Bool e_ofono_element_is_modem(const E_Ofono_Element *element);
        [ :e_ofono_element_is_modem, [ :e_ofono_element ], :bool ],
        # EAPI Eina_Bool e_ofono_element_is_netreg(const E_Ofono_Element *element);
        [ :e_ofono_element_is_netreg, [ :e_ofono_element ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
