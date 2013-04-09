#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/edbus'
#
module Efl
    #
    module Eukit
        #
        FCT_PREFIX = 'e_ukit_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'eukit.so.1'
        #
        # ENUMS
        # typedef enum {...} E_Ukit_Property_Type;
        enum :e_ukit_property_type, [ :e_ukit_property_type_string, :e_ukit_property_type_int, :e_ukit_property_type_uint32,
            :e_ukit_property_type_uint64, :e_ukit_property_type_int64, :e_ukit_property_type_bool, :e_ukit_property_type_double, :e_ukit_property_type_strlist ]
        # typedef enum {...} E_UPower_Battery_Type;
        enum :e_upower_battery_type, [ :e_upower_battery_unknown, :e_upower_battery_lion, :e_upower_battery_lpolymer, :e_upower_battery_lironphos,
            :e_upower_battery_lead, :e_upower_battery_nicad, :e_upower_battery_metalhydryde ]
        # typedef enum {...} E_Upower_State;
        enum :e_upower_state, [ :e_upower_state_unknown, :e_upower_state_charging, :e_upower_state_discharging, :e_upower_state_empty,
            :e_upower_state_full, :e_upower_state_pendingcharge, :e_upower_state_pendingdischarge ]
        # typedef enum {...} E_Upower_Source;
        enum :e_upower_source, [ :e_upower_source_unknown, :e_upower_source_ac, :e_upower_source_battery, :e_upower_source_ups,
            :e_upower_source_monitor, :e_upower_source_mouse, :e_upower_source_keyboard, :e_upower_source_pda, :e_upower_source_phone ]
        #
        # TYPEDEFS
        # typedef struct E_Ukit_Property E_Ukit_Property;
        typedef :pointer, :e_ukit_property
        # typedef struct E_Ukit_Properties E_Ukit_Properties;
        typedef :pointer, :e_ukit_properties
        # typedef struct E_Ukit_Properties E_Ukit_Get_All_Properties_Return;
        typedef :pointer, :e_ukit_get_all_properties_return
        # typedef struct E_Ukit_Property E_Ukit_Get_Property_Return;
        typedef :pointer, :e_ukit_get_property_return
        # typedef struct E_Ukit_String_List_Return E_Ukit_String_List_Return;
        typedef :pointer, :e_ukit_string_list_return
        # typedef struct E_Ukit_String_List_Return E_Ukit_Get_All_Devices_Return;
        typedef :pointer, :e_ukit_get_all_devices_return
        # typedef struct E_Ukit_UDI_Return E_Ukit_Device_Added;
        typedef :pointer, :e_ukit_device_added
        # typedef struct E_Ukit_UDI_Return E_Ukit_Device_Removed;
        typedef :pointer, :e_ukit_device_removed
        # typedef struct E_Ukit_Capability E_Ukit_New_Capability;
        typedef :pointer, :e_ukit_new_capability
        #
        # FUNCTIONS
        fcts = [
        # EAPI int e_ukit_init(void);
        [ :e_ukit_init, [  ], :int ],
        # EAPI int e_ukit_shutdown(void);
        [ :e_ukit_shutdown, [  ], :int ],
        # EAPI DBusPendingCall *e_udisks_get_property(E_DBus_Connection *conn, const char *udi, const char *property, E_DBus_Callback_Func cb_func, void *data);
        [ :e_udisks_get_property, [ :e_dbus_connection, :string, :string, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_udisks_get_all_properties(E_DBus_Connection *conn, const char *udi, E_DBus_Callback_Func cb_func, void *data);
        [ :e_udisks_get_all_properties, [ :e_dbus_connection, :string, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_udisks_get_all_devices(E_DBus_Connection *conn, E_DBus_Callback_Func cb_func, void *data);
        [ :e_udisks_get_all_devices, [ :e_dbus_connection, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_upower_get_property(E_DBus_Connection *conn, const char *udi, const char *property, E_DBus_Callback_Func cb_func, void *data);
        [ :e_upower_get_property, [ :e_dbus_connection, :string, :string, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_upower_get_all_properties(E_DBus_Connection *conn, const char *udi, E_DBus_Callback_Func cb_func, void *data);
        [ :e_upower_get_all_properties, [ :e_dbus_connection, :string, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_upower_get_all_devices(E_DBus_Connection *conn, E_DBus_Callback_Func cb_func, void *data);
        [ :e_upower_get_all_devices, [ :e_dbus_connection, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall * e_upower_suspend_allowed(E_DBus_Connection *conn, E_DBus_Callback_Func cb_func, void *data);
        [ :e_upower_suspend_allowed, [ :e_dbus_connection, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall * e_upower_suspend(E_DBus_Connection *conn, E_DBus_Callback_Func cb_func, void *data);
        [ :e_upower_suspend, [ :e_dbus_connection, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall * e_upower_hibernate(E_DBus_Connection *conn, E_DBus_Callback_Func cb_func, void *data);
        [ :e_upower_hibernate, [ :e_dbus_connection, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall * e_upower_hibernate_allowed(E_DBus_Connection *conn, E_DBus_Callback_Func cb_func, void *data);
        [ :e_upower_hibernate_allowed, [ :e_dbus_connection, :e_dbus_callback_func_cb, :pointer ], :pointer ],
        # EAPI void e_ukit_property_free(E_Ukit_Property *prop);
        [ :e_ukit_property_free, [ :e_ukit_property ], :void ],
        # EAPI const char *e_ukit_property_string_get(E_Ukit_Properties *properties, const char *key, int *err);
        [ :e_ukit_property_string_get, [ :e_ukit_properties, :string, :pointer ], :string ],
        # EAPI Eina_Bool e_ukit_property_bool_get(E_Ukit_Properties *properties, const char *key, int *err);
        [ :e_ukit_property_bool_get, [ :e_ukit_properties, :string, :pointer ], :bool ],
        # EAPI int e_ukit_property_int_get(E_Ukit_Properties *properties, const char *key, int *err);
        [ :e_ukit_property_int_get, [ :e_ukit_properties, :string, :pointer ], :int ],
        # EAPI uint32_t e_ukit_property_uint32_get(E_Ukit_Properties *properties, const char *key, int *err);
        [ :e_ukit_property_uint32_get, [ :e_ukit_properties, :string, :pointer ], :uint ],
        # EAPI uint64_t e_ukit_property_uint64_get(E_Ukit_Properties *properties, const char *key, int *err);
        [ :e_ukit_property_uint64_get, [ :e_ukit_properties, :string, :pointer ], :ulong_long ],
        # EAPI int64_t e_ukit_property_int64_get(E_Ukit_Properties *properties, const char *key, int *err);
        [ :e_ukit_property_int64_get, [ :e_ukit_properties, :string, :pointer ], :long_long ],
        # EAPI double e_ukit_property_double_get(E_Ukit_Properties *properties, const char *key, int *err);
        [ :e_ukit_property_double_get, [ :e_ukit_properties, :string, :pointer ], :double ],
        # EAPI const Eina_List *e_ukit_property_strlist_get(E_Ukit_Properties *properties, const char *key, int *err);
        [ :e_ukit_property_strlist_get, [ :e_ukit_properties, :string, :pointer ], :eina_list ],
        # EAPI DBusPendingCall *e_udisks_volume_mount(E_DBus_Connection *conn, const char *udi, const char *fstype, Eina_List *options);
        [ :e_udisks_volume_mount, [ :e_dbus_connection, :string, :string, :eina_list ], :pointer ],
        # EAPI DBusPendingCall *e_udisks_volume_unmount(E_DBus_Connection *conn, const char *udi, Eina_List *options);
        [ :e_udisks_volume_unmount, [ :e_dbus_connection, :string, :eina_list ], :pointer ],
        # EAPI DBusPendingCall *e_udisks_volume_eject(E_DBus_Connection *conn, const char *udi, Eina_List *options);
        [ :e_udisks_volume_eject, [ :e_dbus_connection, :string, :eina_list ], :pointer ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
