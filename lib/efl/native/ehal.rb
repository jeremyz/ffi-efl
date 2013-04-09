#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/edbus'
#
module Efl
    #
    module Ehal
        #
        FCT_PREFIX = 'e_hal_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'ehal.so.1'
        #
        # ENUMS
        # typedef enum {...} E_Hal_Property_Type;
        enum :e_hal_property_type, [ :e_hal_property_type_string, :e_hal_property_type_int, :e_hal_property_type_uint64, :e_hal_property_type_bool,
            :e_hal_property_type_double, :e_hal_property_type_strlist ]
        #
        # TYPEDEFS
        # typedef struct E_Hal_Property E_Hal_Property;
        typedef :pointer, :e_hal_property
        # typedef struct E_Hal_Properties E_Hal_Properties;
        typedef :pointer, :e_hal_properties
        # typedef struct E_Hal_Properties E_Hal_Device_Get_All_Properties_Return;
        typedef :pointer, :e_hal_device_get_all_properties_return
        # typedef struct E_Hal_Property E_Hal_Device_Get_Property_Return;
        typedef :pointer, :e_hal_device_get_property_return
        # typedef struct E_Hal_Bool_Return E_Hal_Device_Query_Capability_Return;
        typedef :pointer, :e_hal_device_query_capability_return
        # typedef struct E_Hal_String_List_Return E_Hal_String_List_Return;
        typedef :pointer, :e_hal_string_list_return
        # typedef struct E_Hal_String_List_Return E_Hal_Manager_Get_All_Devices_Return;
        typedef :pointer, :e_hal_manager_get_all_devices_return
        # typedef struct E_Hal_Bool_Return E_Hal_Manager_Device_Exists_Return;
        typedef :pointer, :e_hal_manager_device_exists_return
        # typedef struct E_Hal_String_List_Return E_Hal_Manager_Find_Device_String_Match_Return;
        typedef :pointer, :e_hal_manager_find_device_string_match_return
        # typedef struct E_Hal_String_List_Return E_Hal_Manager_Find_Device_By_Capability_Return;
        typedef :pointer, :e_hal_manager_find_device_by_capability_return
        # typedef struct E_Hal_UDI_Return E_Hal_Manager_Device_Added;
        typedef :pointer, :e_hal_manager_device_added
        # typedef struct E_Hal_UDI_Return E_Hal_Manager_Device_Removed;
        typedef :pointer, :e_hal_manager_device_removed
        # typedef struct E_Hal_Capability E_Hal_Manager_New_Capability;
        typedef :pointer, :e_hal_manager_new_capability
        #
        # FUNCTIONS
        fcts = [
        # EAPI int e_hal_init(void);
        [ :e_hal_init, [  ], :int ],
        # EAPI int e_hal_shutdown(void);
        [ :e_hal_shutdown, [  ], :int ],
        # EAPI DBusPendingCall *e_hal_device_get_property(E_DBus_Connection *conn, const char *udi, const char *property, E_DBus_Callback_Func cb_func, void *data);
        [ :e_hal_device_get_property, [ :e_dbus_connection, :string, :string, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_hal_device_get_all_properties(E_DBus_Connection *conn, const char *udi, E_DBus_Callback_Func cb_func, void *data);
        [ :e_hal_device_get_all_properties, [ :e_dbus_connection, :string, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_hal_device_query_capability(E_DBus_Connection *conn, const char *udi, const char *capability, E_DBus_Callback_Func cb_func, void *data);
        [ :e_hal_device_query_capability, [ :e_dbus_connection, :string, :string, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_hal_manager_get_all_devices(E_DBus_Connection *conn, E_DBus_Callback_Func cb_func, void *data);
        [ :e_hal_manager_get_all_devices, [ :e_dbus_connection, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_hal_manager_device_exists(E_DBus_Connection *conn, const char *udi, E_DBus_Callback_Func cb_func, void *data);
        [ :e_hal_manager_device_exists, [ :e_dbus_connection, :string, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_hal_manager_find_device_string_match(E_DBus_Connection *conn, const char *key, const char *value, E_DBus_Callback_Func cb_func, void *data);
        [ :e_hal_manager_find_device_string_match, [ :e_dbus_connection, :string, :string, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_hal_manager_find_device_by_capability(E_DBus_Connection *conn, const char *capability, E_DBus_Callback_Func cb_func, void *data);
        [ :e_hal_manager_find_device_by_capability, [ :e_dbus_connection, :string, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI void e_hal_property_free(E_Hal_Property *prop);
        [ :e_hal_property_free, [ :e_hal_property ], :void ],
        # EAPI const char *e_hal_property_string_get(E_Hal_Properties *properties, const char *key, int *err);
        [ :e_hal_property_string_get, [ :e_hal_properties, :string, :pointer ], :string ],
        # EAPI Eina_Bool e_hal_property_bool_get(E_Hal_Properties *properties, const char *key, int *err);
        [ :e_hal_property_bool_get, [ :e_hal_properties, :string, :pointer ], :bool ],
        # EAPI int e_hal_property_int_get(E_Hal_Properties *properties, const char *key, int *err);
        [ :e_hal_property_int_get, [ :e_hal_properties, :string, :pointer ], :int ],
        # EAPI uint64_t e_hal_property_uint64_get(E_Hal_Properties *properties, const char *key, int *err);
        [ :e_hal_property_uint64_get, [ :e_hal_properties, :string, :pointer ], :ulong_long ],
        # EAPI double e_hal_property_double_get(E_Hal_Properties *properties, const char *key, int *err);
        [ :e_hal_property_double_get, [ :e_hal_properties, :string, :pointer ], :double ],
        # EAPI const Eina_List *e_hal_property_strlist_get(E_Hal_Properties *properties, const char *key, int *err);
        [ :e_hal_property_strlist_get, [ :e_hal_properties, :string, :pointer ], :eina_list ],
        # EAPI DBusPendingCall *e_hal_device_volume_mount(E_DBus_Connection *conn, const char *udi, const char *mount_point, const char *fstype, Eina_List *options, E_DBus_Callback_Func cb_func, void *data);
        [ :e_hal_device_volume_mount, [ :e_dbus_connection, :string, :string, :string, :eina_list, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_hal_device_volume_unmount(E_DBus_Connection *conn, const char *udi, Eina_List *options, E_DBus_Callback_Func cb_func, void *data);
        [ :e_hal_device_volume_unmount, [ :e_dbus_connection, :string, :eina_list, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_hal_device_volume_eject(E_DBus_Connection *conn, const char *udi, Eina_List *options, E_DBus_Callback_Func cb_func, void *data);
        [ :e_hal_device_volume_eject, [ :e_dbus_connection, :string, :eina_list, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
