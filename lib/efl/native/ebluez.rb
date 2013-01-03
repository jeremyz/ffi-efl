#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/edbus'
#
module Efl
    #
    module Ebluez
        #
        FCT_PREFIX = 'e_bluez_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'ebluez'
        #
        # TYPEDEFS
        # typedef struct _E_Bluez_Element E_Bluez_Element;
        typedef :pointer, :e_bluez_element
        # typedef struct _E_Bluez_Array E_Bluez_Array;
        typedef :pointer, :e_bluez_array
        # typedef struct _E_Bluez_Device_Found E_Bluez_Device_Found;
        typedef :pointer, :e_bluez_device_found
        #
        # FUNCTIONS
        fcts = [
        # EAPI unsigned int e_bluez_system_init(E_DBus_Connection *edbus_conn);
        [ :e_bluez_system_init, [ :e_dbus_connection ], :uint ],
        # EAPI unsigned int e_bluez_system_shutdown(void);
        [ :e_bluez_system_shutdown, [  ], :uint ],
        # EAPI E_Bluez_Element * e_bluez_manager_get(void);
        [ :e_bluez_manager_get, [  ], :e_bluez_element ],
        # EAPI Eina_Bool e_bluez_manager_default_adapter(E_DBus_Method_Return_Cb cb, void *data);
        [ :e_bluez_manager_default_adapter, [ :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI E_Bluez_Element * e_bluez_adapter_get(const char *path);
        [ :e_bluez_adapter_get, [ :string ], :e_bluez_element ],
        # EAPI Eina_Bool e_bluez_adapter_agent_register(E_Bluez_Element *element, const char *object_path, const char *capability, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_bluez_adapter_agent_register, [ :e_bluez_element, :string, :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_adapter_agent_unregister(E_Bluez_Element *element, const char *object_path, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_bluez_adapter_agent_unregister, [ :e_bluez_element, :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_adapter_address_get(const E_Bluez_Element *element, const char **address);
        [ :e_bluez_adapter_address_get, [ :e_bluez_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_adapter_name_get(const E_Bluez_Element *element, const char **name);
        [ :e_bluez_adapter_name_get, [ :e_bluez_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_adapter_name_set(E_Bluez_Element *element, const char *name, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_bluez_adapter_name_set, [ :e_bluez_element, :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_adapter_powered_get(const E_Bluez_Element *element, Eina_Bool *powered);
        [ :e_bluez_adapter_powered_get, [ :e_bluez_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_adapter_powered_set(E_Bluez_Element *profile, Eina_Bool powered, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_bluez_adapter_powered_set, [ :e_bluez_element, :bool, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_adapter_discoverable_get(const E_Bluez_Element *element, Eina_Bool *discoverable);
        [ :e_bluez_adapter_discoverable_get, [ :e_bluez_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_adapter_discoverable_set(E_Bluez_Element *profile, Eina_Bool discoverable, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_bluez_adapter_discoverable_set, [ :e_bluez_element, :bool, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_adapter_discoverable_timeout_get(const E_Bluez_Element *element, unsigned int *timeout);
        [ :e_bluez_adapter_discoverable_timeout_get, [ :e_bluez_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_adapter_discoverable_timeout_set(E_Bluez_Element *element, unsigned int timeout, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_bluez_adapter_discoverable_timeout_set, [ :e_bluez_element, :uint, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_adapter_discovering_get(const E_Bluez_Element *element, Eina_Bool *discovering);
        [ :e_bluez_adapter_discovering_get, [ :e_bluez_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_adapter_start_discovery(E_Bluez_Element *element, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_bluez_adapter_start_discovery, [ :e_bluez_element, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_adapter_stop_discovery(E_Bluez_Element *element, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_bluez_adapter_stop_discovery, [ :e_bluez_element, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_adapter_create_paired_device(E_Bluez_Element *element, const char *object_path, const char *capability, const char *device, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_bluez_adapter_create_paired_device, [ :e_bluez_element, :string, :string, :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI void e_bluez_devicefound_free(E_Bluez_Device_Found *device);
        [ :e_bluez_devicefound_free, [ :e_bluez_device_found ], :void ],
        # EAPI const char * e_bluez_devicefound_alias_get(const E_Bluez_Device_Found *device);
        [ :e_bluez_devicefound_alias_get, [ :e_bluez_device_found ], :string ],
        # EAPI E_Bluez_Element * e_bluez_device_get(const char *path);
        [ :e_bluez_device_get, [ :string ], :e_bluez_element ],
        # EAPI Eina_Bool e_bluez_device_name_get(const E_Bluez_Element *element, const char **name);
        [ :e_bluez_device_name_get, [ :e_bluez_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_device_alias_get(const E_Bluez_Element *element, const char **alias);
        [ :e_bluez_device_alias_get, [ :e_bluez_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_device_paired_get(const E_Bluez_Element *element, Eina_Bool *paired);
        [ :e_bluez_device_paired_get, [ :e_bluez_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_manager_sync_elements(void);
        [ :e_bluez_manager_sync_elements, [  ], :bool ],
        # EAPI Eina_Bool e_bluez_elements_get_all(unsigned int *count, E_Bluez_Element ***p_elements);
        [ :e_bluez_elements_get_all, [ :pointer, :e_bluez_element ], :bool ],
        # EAPI Eina_Bool e_bluez_elements_get_all_type(const char *type, unsigned int *count, E_Bluez_Element ***p_elements);
        [ :e_bluez_elements_get_all_type, [ :string, :pointer, :e_bluez_element ], :bool ],
        # EAPI E_Bluez_Element * e_bluez_element_get(const char *path);
        [ :e_bluez_element_get, [ :string ], :e_bluez_element ],
        # EAPI void e_bluez_element_listener_add(E_Bluez_Element *element, void (*cb)(void *data, const E_Bluez_Element *element), const void *data, void (*free_data)(void *data));
        # FIXME
        # EAPI void e_bluez_element_listener_del(E_Bluez_Element *element, void (*cb)(void *data, const E_Bluez_Element *element), const void *data);
        # FIXME
        # EAPI int e_bluez_element_ref(E_Bluez_Element *element);
        [ :e_bluez_element_ref, [ :e_bluez_element ], :int ],
        # EAPI int e_bluez_element_unref(E_Bluez_Element *element);
        [ :e_bluez_element_unref, [ :e_bluez_element ], :int ],
        # EAPI void e_bluez_element_print(FILE *fp, const E_Bluez_Element *element);
        [ :e_bluez_element_print, [ :pointer, :e_bluez_element ], :void ],
        # EAPI void e_bluez_element_array_print(FILE *fp, E_Bluez_Array *array);
        [ :e_bluez_element_array_print, [ :pointer, :e_bluez_array ], :void ],
        # EAPI Eina_Bool e_bluez_element_properties_sync(E_Bluez_Element *element);
        [ :e_bluez_element_properties_sync, [ :e_bluez_element ], :bool ],
        # EAPI Eina_Bool e_bluez_element_properties_sync_full(E_Bluez_Element *element, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_bluez_element_properties_sync_full, [ :e_bluez_element, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_element_property_set(E_Bluez_Element *element, const char *prop, int type, const void *value);
        [ :e_bluez_element_property_set, [ :e_bluez_element, :string, :int, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_element_property_set_full(E_Bluez_Element *element, const char *prop, int type, const void *value, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_bluez_element_property_set_full, [ :e_bluez_element, :string, :int, :pointer, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_element_property_dict_set_full(E_Bluez_Element *element, const char *prop, const char *key, int type, const void *value, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_bluez_element_property_dict_set_full, [ :e_bluez_element, :string, :string, :int, :pointer, :e_dbus_method_return_cb, :pointer ], :bool
            ],
        # EAPI void e_bluez_element_properties_list(const E_Bluez_Element *element, Eina_Bool (*cb)(void *data, const E_Bluez_Element *element, const char *name, int type, const void *value), const void *data);
        # FIXME
        # EAPI Eina_Bool e_bluez_element_property_type_get_stringshared(const E_Bluez_Element *element, const char *name, int *type);
        [ :e_bluez_element_property_type_get_stringshared, [ :e_bluez_element, :string, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_element_property_type_get(const E_Bluez_Element *element, const char *name, int *type);
        [ :e_bluez_element_property_type_get, [ :e_bluez_element, :string, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_element_property_dict_get_stringshared(const E_Bluez_Element *element, const char *dict_name, const char *key_name, int *type, void *value);
        [ :e_bluez_element_property_dict_get_stringshared, [ :e_bluez_element, :string, :string, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_element_property_get_stringshared(const E_Bluez_Element *element, const char *name, int *type, void *value);
        [ :e_bluez_element_property_get_stringshared, [ :e_bluez_element, :string, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_element_property_get(const E_Bluez_Element *element, const char *name, int *type, void *value);
        [ :e_bluez_element_property_get, [ :e_bluez_element, :string, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_bluez_element_is_adapter(const E_Bluez_Element *element);
        [ :e_bluez_element_is_adapter, [ :e_bluez_element ], :bool ],
        # EAPI Eina_Bool e_bluez_element_is_device(const E_Bluez_Element *element);
        [ :e_bluez_element_is_device, [ :e_bluez_element ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
