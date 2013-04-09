#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/eina_list'
#
module Efl
    #
    module Edbus
        #
        FCT_PREFIX = 'e_dbus_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'edbus.so.1'
        #
        # TYPEDEFS
        # typedef struct _E_DBus_Version E_DBus_Version;
        typedef :pointer, :e_dbus_version
        # typedef struct E_DBus_Connection E_DBus_Connection;
        typedef :pointer, :e_dbus_connection
        # typedef struct E_DBus_Object E_DBus_Object;
        typedef :pointer, :e_dbus_object
        # typedef struct E_DBus_Interface E_DBus_Interface;
        typedef :pointer, :e_dbus_interface
        # typedef struct E_DBus_Signal_Handler E_DBus_Signal_Handler;
        typedef :pointer, :e_dbus_signal_handler
        # typedef struct E_DBus_Callback E_DBus_Callback;
        typedef :pointer, :e_dbus_callback
        #
        # CALLBACKS
        # typedef DBusMessage *(* E_DBus_Method_Cb) (E_DBus_Object *obj, DBusMessage *message);
        callback :e_dbus_method_cb, [ :e_dbus_object, :pointer ], :pointer
        # typedef void (*E_DBus_Method_Return_Cb) (void *data, DBusMessage *msg, DBusError *error);
        callback :e_dbus_method_return_cb, [ :pointer, :pointer, :pointer ], :void
        # typedef void (*E_DBus_Signal_Cb) (void *data, DBusMessage *msg);
        callback :e_dbus_signal_cb, [ :pointer, :pointer ], :void
        # typedef void (*E_DBus_Object_Property_Get_Cb) (E_DBus_Object *obj, const char *property, int *type, void **value);
        callback :e_dbus_object_property_get_cb, [ :e_dbus_object, :string, :pointer, :pointer ], :void
        # typedef int (*E_DBus_Object_Property_Set_Cb) (E_DBus_Object *obj, const char *property, int type, void *value);
        callback :e_dbus_object_property_set_cb, [ :e_dbus_object, :string, :int, :pointer ], :int
        # typedef void (*E_DBus_Callback_Func) (void *user_data, void *method_return, DBusError *error);
        callback :e_dbus_callback_func_cb, [ :pointer, :pointer, :pointer ], :void
        # typedef void *(*E_DBus_Unmarshal_Func) (DBusMessage *msg, DBusError *err);
        callback :e_dbus_unmarshal_func_cb, [ :pointer, :pointer ], :pointer
        # typedef void (*E_DBus_Free_Func) (void *data);
        callback :e_dbus_free_func_cb, [ :pointer ], :void
        #
        # VARIABLES
        # EAPI extern E_DBus_Version *e_dbus_version;
        attach_variable :e_dbus_version, :e_dbus_version
        # EAPI extern int E_DBUS_DOMAIN_GLOBAL;
        attach_variable :E_DBUS_DOMAIN_GLOBAL, :int
        # EAPI extern int E_DBUS_EVENT_SIGNAL;
        attach_variable :E_DBUS_EVENT_SIGNAL, :int
        #
        # FUNCTIONS
        fcts = [
        # EAPI int e_dbus_init(void);
        [ :e_dbus_init, [  ], :int ],
        # EAPI int e_dbus_shutdown(void);
        [ :e_dbus_shutdown, [  ], :int ],
        # EAPI E_DBus_Connection *e_dbus_bus_get(DBusBusType type);
        [ :e_dbus_bus_get, [ :int ], :e_dbus_connection ],
        # EAPI void e_dbus_connection_ref(E_DBus_Connection *conn);
        [ :e_dbus_connection_ref, [ :e_dbus_connection ], :void ],
        # EAPI E_DBus_Connection *e_dbus_connection_setup(DBusConnection *conn);
        [ :e_dbus_connection_setup, [ :pointer ], :e_dbus_connection ],
        # EAPI void e_dbus_connection_close(E_DBus_Connection *conn);
        [ :e_dbus_connection_close, [ :e_dbus_connection ], :void ],
        # EAPI E_DBus_Interface *e_dbus_interface_new(const char *interface);
        [ :e_dbus_interface_new, [ :string ], :e_dbus_interface ],
        # EAPI void e_dbus_interface_ref(E_DBus_Interface *iface);
        [ :e_dbus_interface_ref, [ :e_dbus_interface ], :void ],
        # EAPI void e_dbus_interface_unref(E_DBus_Interface *iface);
        [ :e_dbus_interface_unref, [ :e_dbus_interface ], :void ],
        # EAPI void e_dbus_object_interface_attach(E_DBus_Object *obj, E_DBus_Interface *iface);
        [ :e_dbus_object_interface_attach, [ :e_dbus_object, :e_dbus_interface ], :void ],
        # EAPI void e_dbus_object_interface_detach(E_DBus_Object *obj, E_DBus_Interface *iface);
        [ :e_dbus_object_interface_detach, [ :e_dbus_object, :e_dbus_interface ], :void ],
        # EAPI int e_dbus_interface_method_add(E_DBus_Interface *iface, const char *member, const char *signature, const char *reply_signature, E_DBus_Method_Cb func);
        [ :e_dbus_interface_method_add, [ :e_dbus_interface, :string, :string, :string, :e_dbus_method_cb ], :int ],
        # EAPI int e_dbus_interface_signal_add(E_DBus_Interface *iface, const char *name, const char *signature);
        [ :e_dbus_interface_signal_add, [ :e_dbus_interface, :string, :string ], :int ],
        # EAPI E_DBus_Object *e_dbus_object_add(E_DBus_Connection *conn, const char *object_path, void *data);
        [ :e_dbus_object_add, [ :e_dbus_connection, :string, :pointer ], :e_dbus_object ],
        # EAPI void e_dbus_object_free(E_DBus_Object *obj);
        [ :e_dbus_object_free, [ :e_dbus_object ], :void ],
        # EAPI void *e_dbus_object_data_get(E_DBus_Object *obj);
        [ :e_dbus_object_data_get, [ :e_dbus_object ], :pointer ],
        # EAPI E_DBus_Connection *e_dbus_object_conn_get(E_DBus_Object *obj);
        [ :e_dbus_object_conn_get, [ :e_dbus_object ], :e_dbus_connection ],
        # EAPI const char *e_dbus_object_path_get(E_DBus_Object *obj);
        [ :e_dbus_object_path_get, [ :e_dbus_object ], :string ],
        # EAPI const Eina_List *e_dbus_object_interfaces_get(E_DBus_Object *obj);
        [ :e_dbus_object_interfaces_get, [ :e_dbus_object ], :eina_list ],
        # EAPI void e_dbus_object_property_get_cb_set(E_DBus_Object *obj, E_DBus_Object_Property_Get_Cb func);
        [ :e_dbus_object_property_get_cb_set, [ :e_dbus_object, :e_dbus_object_property_get_cb ], :void ],
        # EAPI void e_dbus_object_property_set_cb_set(E_DBus_Object *obj, E_DBus_Object_Property_Set_Cb func);
        [ :e_dbus_object_property_set_cb_set, [ :e_dbus_object, :e_dbus_object_property_set_cb ], :void ],
        # EAPI DBusPendingCall *e_dbus_message_send(E_DBus_Connection *conn, DBusMessage *msg, E_DBus_Method_Return_Cb cb_return, int timeout, void *data);
        [ :e_dbus_message_send, [ :e_dbus_connection, :pointer, :e_dbus_method_return_cb, :int, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_dbus_method_call_send(E_DBus_Connection *conn, DBusMessage *msg, E_DBus_Unmarshal_Func unmarshal_func, E_DBus_Callback_Func cb_func, E_DBus_Free_Func free_func, int timeout, void *data);
        [ :e_dbus_method_call_send, [ :e_dbus_connection, :pointer, :e_dbus_unmarshal_func_cb, :e_dbus_callback_func_cb, :e_dbus_free_func_cb, :int,
            :pointer ], :pointer ],
        # EAPI E_DBus_Signal_Handler *e_dbus_signal_handler_add(E_DBus_Connection *conn, const char *sender, const char *path, const char *interface, const char *member, E_DBus_Signal_Cb cb_signal, void *data);
        [ :e_dbus_signal_handler_add, [ :e_dbus_connection, :string, :string, :string, :string, :e_dbus_signal_cb, :pointer ], :e_dbus_signal_handler
            ],
        # EAPI void e_dbus_signal_handler_del(E_DBus_Connection *conn, E_DBus_Signal_Handler *sh);
        [ :e_dbus_signal_handler_del, [ :e_dbus_connection, :e_dbus_signal_handler ], :void ],
        # EAPI DBusPendingCall *e_dbus_request_name(E_DBus_Connection *conn, const char *name, unsigned int flags, E_DBus_Method_Return_Cb cb_return, const void *data);
        [ :e_dbus_request_name, [ :e_dbus_connection, :string, :uint, :e_dbus_method_return_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_dbus_release_name(E_DBus_Connection *conn, const char *name, E_DBus_Method_Return_Cb cb_return, const void *data);
        [ :e_dbus_release_name, [ :e_dbus_connection, :string, :e_dbus_method_return_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_dbus_get_name_owner(E_DBus_Connection *conn, const char *name, E_DBus_Method_Return_Cb cb_return, const void *data);
        [ :e_dbus_get_name_owner, [ :e_dbus_connection, :string, :e_dbus_method_return_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_dbus_list_names(E_DBus_Connection *conn, E_DBus_Method_Return_Cb cb_return, const void *data);
        [ :e_dbus_list_names, [ :e_dbus_connection, :e_dbus_method_return_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_dbus_list_activatable_names(E_DBus_Connection *conn, E_DBus_Method_Return_Cb cb_return, const void *data);
        [ :e_dbus_list_activatable_names, [ :e_dbus_connection, :e_dbus_method_return_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_dbus_name_has_owner(E_DBus_Connection *conn, const char *name, E_DBus_Method_Return_Cb cb_return, const void *data);
        [ :e_dbus_name_has_owner, [ :e_dbus_connection, :string, :e_dbus_method_return_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_dbus_start_service_by_name(E_DBus_Connection *conn, const char *name, unsigned int flags, E_DBus_Method_Return_Cb cb_return, const void *data);
        [ :e_dbus_start_service_by_name, [ :e_dbus_connection, :string, :uint, :e_dbus_method_return_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_dbus_introspect(E_DBus_Connection *conn, const char *bus, const char *object_path, E_DBus_Method_Return_Cb cb_return, const void *data);
        [ :e_dbus_introspect, [ :e_dbus_connection, :string, :string, :e_dbus_method_return_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_dbus_peer_ping(E_DBus_Connection *conn, const char *destination, const char *path, E_DBus_Method_Return_Cb cb_return, const void *data);
        [ :e_dbus_peer_ping, [ :e_dbus_connection, :string, :string, :e_dbus_method_return_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_dbus_peer_get_machine_id(E_DBus_Connection *conn, const char *destination, const char *path, E_DBus_Method_Return_Cb cb_return, const void *data);
        [ :e_dbus_peer_get_machine_id, [ :e_dbus_connection, :string, :string, :e_dbus_method_return_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_dbus_properties_get_all(E_DBus_Connection *conn, const char *destination, const char *path, const char *interface, E_DBus_Method_Return_Cb cb_return, const void *data);
        [ :e_dbus_properties_get_all, [ :e_dbus_connection, :string, :string, :string, :e_dbus_method_return_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_dbus_properties_get(E_DBus_Connection *conn, const char *destination, const char *path, const char *interface, const char *property, E_DBus_Method_Return_Cb cb_return, const void *data);
        [ :e_dbus_properties_get, [ :e_dbus_connection, :string, :string, :string, :string, :e_dbus_method_return_cb, :pointer ], :pointer ],
        # EAPI DBusPendingCall *e_dbus_properties_set(E_DBus_Connection *conn, const char *destination, const char *path, const char *interface, const char *property, int value_type, const void *value, E_DBus_Method_Return_Cb cb_return, const void *data);
        [ :e_dbus_properties_set, [ :e_dbus_connection, :string, :string, :string, :string, :int, :pointer, :e_dbus_method_return_cb, :pointer ],
            :pointer ],
        # EAPI E_DBus_Callback *e_dbus_callback_new(E_DBus_Callback_Func cb_func, E_DBus_Unmarshal_Func unmarshal_func, E_DBus_Free_Func free_func, void *user_data);
        [ :e_dbus_callback_new, [ :e_dbus_callback_func_cb, :e_dbus_unmarshal_func_cb, :e_dbus_free_func_cb, :pointer ], :e_dbus_callback ],
        # EAPI void e_dbus_callback_free(E_DBus_Callback *callback);
        [ :e_dbus_callback_free, [ :e_dbus_callback ], :void ],
        # EAPI void e_dbus_callback_call(E_DBus_Callback *cb, void *data, DBusError *error);
        [ :e_dbus_callback_call, [ :e_dbus_callback, :pointer, :pointer ], :void ],
        # EAPI void *e_dbus_callback_unmarshal(E_DBus_Callback *cb, DBusMessage *msg, DBusError *err);
        [ :e_dbus_callback_unmarshal, [ :e_dbus_callback, :pointer, :pointer ], :pointer ],
        # EAPI void e_dbus_callback_return_free(E_DBus_Callback *callback, void *data);
        [ :e_dbus_callback_return_free, [ :e_dbus_callback, :pointer ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
