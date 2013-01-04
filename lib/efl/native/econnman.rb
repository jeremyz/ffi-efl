#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/edbus'
#
module Efl
    #
    module EConnman
        #
        FCT_PREFIX = 'e_connman_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'econnman0_7x'
        #
        # TYPEDEFS
        # typedef struct _E_Connman_Element E_Connman_Element;
        typedef :pointer, :e_connman_element
        #
        # FUNCTIONS
        fcts = [
        # EAPI unsigned int e_connman_system_init(E_DBus_Connection *edbus_conn);
        [ :e_connman_system_init, [ :e_dbus_connection ], :uint ],
        # EAPI unsigned int e_connman_system_shutdown(void);
        [ :e_connman_system_shutdown, [  ], :uint ],
        # EAPI E_Connman_Element * e_connman_manager_get(void);
        [ :e_connman_manager_get, [  ], :e_connman_element ],
        # EAPI Eina_Bool e_connman_manager_agent_register(const char *object_path, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_manager_agent_register, [ :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_manager_agent_unregister(const char *object_path, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_manager_agent_unregister, [ :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_manager_state_get(const char **state);
        [ :e_connman_manager_state_get, [ :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_manager_offline_mode_get(Eina_Bool *offline);
        [ :e_connman_manager_offline_mode_get, [ :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_manager_offline_mode_set(Eina_Bool offline, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_manager_offline_mode_set, [ :bool, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_manager_profiles_get(unsigned int *count, E_Connman_Element ***p_elements);
        [ :e_connman_manager_profiles_get, [ :pointer, :e_connman_element ], :bool ],
        # EAPI Eina_Bool e_connman_manager_services_get(unsigned int *count, E_Connman_Element ***p_elements);
        [ :e_connman_manager_services_get, [ :pointer, :e_connman_element ], :bool ],
        # EAPI Eina_Bool e_connman_manager_technologies_get(unsigned int *count, E_Connman_Element ***p_elements);
        [ :e_connman_manager_technologies_get, [ :pointer, :e_connman_element ], :bool ],
        # EAPI Eina_Bool e_connman_manager_request_scan(const char *type, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_manager_request_scan, [ :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_manager_technology_default_get(const char **type);
        [ :e_connman_manager_technology_default_get, [ :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_manager_technology_enable(const char *type, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_manager_technology_enable, [ :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_manager_technology_disable(const char *type, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_manager_technology_disable, [ :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_manager_technologies_available_get(unsigned int *count, const char ***strings);
        [ :e_connman_manager_technologies_available_get, [ :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_manager_technologies_enabled_get(unsigned int *count, const char ***strings);
        [ :e_connman_manager_technologies_enabled_get, [ :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_manager_technologies_connected_get(unsigned int *count, const char ***strings);
        [ :e_connman_manager_technologies_connected_get, [ :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_manager_profile_remove(const E_Connman_Element *profile, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_manager_profile_remove, [ :e_connman_element, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_manager_profile_active_get(E_Connman_Element **profile);
        [ :e_connman_manager_profile_active_get, [ :e_connman_element ], :bool ],
        # EAPI Eina_Bool e_connman_manager_profile_active_set(const E_Connman_Element *profile, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_manager_profile_active_set, [ :e_connman_element, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI E_Connman_Element * e_connman_profile_get(const char *path);
        [ :e_connman_profile_get, [ :string ], :e_connman_element ],
        # EAPI Eina_Bool e_connman_profile_name_get(const E_Connman_Element *profile, const char **name);
        [ :e_connman_profile_name_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_profile_name_set(E_Connman_Element *profile, const char *name, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_profile_name_set, [ :e_connman_element, :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_profile_offline_mode_get(const E_Connman_Element *profile, Eina_Bool *offline);
        [ :e_connman_profile_offline_mode_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_profile_offline_mode_set(E_Connman_Element *profile, Eina_Bool offline, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_profile_offline_mode_set, [ :e_connman_element, :bool, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_profile_services_get(const E_Connman_Element *profile, unsigned int *count, E_Connman_Element ***p_elements);
        [ :e_connman_profile_services_get, [ :e_connman_element, :pointer, :e_connman_element ], :bool ],
        # EAPI E_Connman_Element * e_connman_service_get(const char *path);
        [ :e_connman_service_get, [ :string ], :e_connman_element ],
        # EAPI Eina_Bool e_connman_service_clear_property(E_Connman_Element *service, const char *property, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_service_clear_property, [ :e_connman_element, :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_remove(E_Connman_Element *service, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_service_remove, [ :e_connman_element, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_connect(E_Connman_Element *service, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_service_connect, [ :e_connman_element, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_disconnect(E_Connman_Element *service, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_service_disconnect, [ :e_connman_element, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_move_before(E_Connman_Element *service, const char *object_path, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_service_move_before, [ :e_connman_element, :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_move_after(E_Connman_Element *service, const char *object_path, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_service_move_after, [ :e_connman_element, :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_state_get(const E_Connman_Element *service, const char **state);
        [ :e_connman_service_state_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_error_get(const E_Connman_Element *service, const char **error);
        [ :e_connman_service_error_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_name_get(const E_Connman_Element *service, const char **name);
        [ :e_connman_service_name_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_type_get(const E_Connman_Element *service, const char **type);
        [ :e_connman_service_type_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_security_get(const E_Connman_Element *service, unsigned int *count, const char ***security);
        [ :e_connman_service_security_get, [ :e_connman_element, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_passphrase_get(const E_Connman_Element *service, const char **passphrase);
        [ :e_connman_service_passphrase_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_passphrase_set(E_Connman_Element *service, const char *passphrase, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_service_passphrase_set, [ :e_connman_element, :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_strength_get(const E_Connman_Element *service, unsigned char *strength);
        [ :e_connman_service_strength_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_favorite_get(const E_Connman_Element *service, Eina_Bool *favorite);
        [ :e_connman_service_favorite_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_immutable_get(const E_Connman_Element *service, Eina_Bool *immutable);
        [ :e_connman_service_immutable_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_auto_connect_get(const E_Connman_Element *service, Eina_Bool *auto_connect);
        [ :e_connman_service_auto_connect_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_auto_connect_set(E_Connman_Element *service, Eina_Bool auto_connect, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_service_auto_connect_set, [ :e_connman_element, :bool, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_passphrase_required_get(const E_Connman_Element *service, Eina_Bool *passphrase_required);
        [ :e_connman_service_passphrase_required_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_login_required_get(const E_Connman_Element *service, Eina_Bool *login_required);
        [ :e_connman_service_login_required_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_roaming_get(const E_Connman_Element *service, Eina_Bool *roaming);
        [ :e_connman_service_roaming_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_nameservers_get(const E_Connman_Element *service, unsigned int *count, const char ***nameserver);
        [ :e_connman_service_nameservers_get, [ :e_connman_element, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_nameservers_configuration_get(const E_Connman_Element *service, unsigned int *count, const char ***nameservers);
        [ :e_connman_service_nameservers_configuration_get, [ :e_connman_element, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_nameservers_configuration_set(E_Connman_Element *service, unsigned int count, const char **nameservers, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_service_nameservers_configuration_set, [ :e_connman_element, :uint, :pointer, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_domains_get(const E_Connman_Element *service, unsigned int *count, const char ***domains);
        [ :e_connman_service_domains_get, [ :e_connman_element, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ipv4_method_get(const E_Connman_Element *service, const char **method);
        [ :e_connman_service_ipv4_method_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ipv4_address_get(const E_Connman_Element *service, const char **address);
        [ :e_connman_service_ipv4_address_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ipv4_gateway_get(const E_Connman_Element *service, const char **gateway);
        [ :e_connman_service_ipv4_gateway_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ipv4_netmask_get(const E_Connman_Element *service, const char **netmask);
        [ :e_connman_service_ipv4_netmask_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ipv4_configuration_method_get(const E_Connman_Element *service, const char **method);
        [ :e_connman_service_ipv4_configuration_method_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ipv4_configuration_address_get(const E_Connman_Element *service, const char **address);
        [ :e_connman_service_ipv4_configuration_address_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ipv4_configuration_gateway_get(const E_Connman_Element *service, const char **gateway);
        [ :e_connman_service_ipv4_configuration_gateway_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ipv4_configuration_netmask_get(const E_Connman_Element *service, const char **netmask);
        [ :e_connman_service_ipv4_configuration_netmask_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_proxy_method_get(const E_Connman_Element *service, const char **method);
        [ :e_connman_service_proxy_method_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_proxy_url_get(const E_Connman_Element *service, const char **url);
        [ :e_connman_service_proxy_url_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_proxy_servers_get(const E_Connman_Element *service, unsigned int *count, const char ***servers);
        [ :e_connman_service_proxy_servers_get, [ :e_connman_element, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_proxy_excludes_get(const E_Connman_Element *service, unsigned int *count, const char ***excludes);
        [ :e_connman_service_proxy_excludes_get, [ :e_connman_element, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_proxy_configuration_method_get(const E_Connman_Element *service, const char **method);
        [ :e_connman_service_proxy_configuration_method_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_proxy_configuration_url_get(const E_Connman_Element *service, const char **url);
        [ :e_connman_service_proxy_configuration_url_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_proxy_configuration_servers_get(const E_Connman_Element *service, unsigned int *count, const char ***servers);
        [ :e_connman_service_proxy_configuration_servers_get, [ :e_connman_element, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_proxy_configuration_excludes_get(const E_Connman_Element *service, unsigned int *count, const char ***excludes);
        [ :e_connman_service_proxy_configuration_excludes_get, [ :e_connman_element, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ethernet_method_get(const E_Connman_Element *service, const char **method);
        [ :e_connman_service_ethernet_method_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ethernet_interface_get(const E_Connman_Element *service, const char **iface);
        [ :e_connman_service_ethernet_interface_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ethernet_address_get(const E_Connman_Element *service, const char **address);
        [ :e_connman_service_ethernet_address_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ethernet_mtu_get(const E_Connman_Element *service, unsigned short *mtu);
        [ :e_connman_service_ethernet_mtu_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ethernet_speed_get(const E_Connman_Element *service, unsigned short *speed);
        [ :e_connman_service_ethernet_speed_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ethernet_duplex_get(const E_Connman_Element *service, const char **duplex);
        [ :e_connman_service_ethernet_duplex_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ipv4_configure_dhcp(E_Connman_Element *service, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_service_ipv4_configure_dhcp, [ :e_connman_element, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_service_ipv4_configure_manual(E_Connman_Element *service, const char *address, const char *netmask, const char *gateway, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_service_ipv4_configure_manual, [ :e_connman_element, :string, :string, :string, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI E_Connman_Element * e_connman_technology_get(const char *path);
        [ :e_connman_technology_get, [ :string ], :e_connman_element ],
        # EAPI Eina_Bool e_connman_technology_state_get(const E_Connman_Element *technology, const char **state);
        [ :e_connman_technology_state_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_technology_name_get(const E_Connman_Element *technology, const char **state);
        [ :e_connman_technology_name_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_technology_type_get(const E_Connman_Element *technology, const char **state);
        [ :e_connman_technology_type_get, [ :e_connman_element, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_manager_sync_elements(void);
        [ :e_connman_manager_sync_elements, [  ], :bool ],
        # EAPI Eina_Bool e_connman_elements_get_all(unsigned int *count, E_Connman_Element ***p_elements);
        [ :e_connman_elements_get_all, [ :pointer, :e_connman_element ], :bool ],
        # EAPI Eina_Bool e_connman_elements_get_all_type(const char *type, unsigned int *count, E_Connman_Element ***p_elements);
        [ :e_connman_elements_get_all_type, [ :string, :pointer, :e_connman_element ], :bool ],
        # EAPI E_Connman_Element * e_connman_element_get(const char *path);
        [ :e_connman_element_get, [ :string ], :e_connman_element ],
        # EAPI void e_connman_element_listener_add(E_Connman_Element *element, void (*cb)(void *data, const E_Connman_Element *element), const void *data, void (*free_data)(void *data));
        [ :e_connman_element_listener_add, [ :e_connman_element, (callback [:pointer, :e_connman_element], :void), :pointer, (callback [:pointer], :void) ], :void ],
        # EAPI void e_connman_element_listener_del(E_Connman_Element *element, void (*cb)(void *data, const E_Connman_Element *element), const void *data);
        [ :e_connman_element_listener_del, [ :e_connman_element, (callback [:pointer, :e_connman_element], :void), :pointer ], :void ],
        # EAPI int e_connman_element_ref(E_Connman_Element *element);
        [ :e_connman_element_ref, [ :e_connman_element ], :int ],
        # EAPI int e_connman_element_unref(E_Connman_Element *element);
        [ :e_connman_element_unref, [ :e_connman_element ], :int ],
        # EAPI void e_connman_element_print(FILE *fp, const E_Connman_Element *element);
        [ :e_connman_element_print, [ :pointer, :e_connman_element ], :void ],
        # EAPI Eina_Bool e_connman_element_properties_sync(E_Connman_Element *element);
        [ :e_connman_element_properties_sync, [ :e_connman_element ], :bool ],
        # EAPI Eina_Bool e_connman_element_properties_sync_full(E_Connman_Element *element, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_element_properties_sync_full, [ :e_connman_element, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI void e_connman_element_properties_list(const E_Connman_Element *element, Eina_Bool (*cb)(void *data, const E_Connman_Element *element, const char *name, int type, const void *value), const void *data);
        [ :e_connman_element_properties_list, [ :e_connman_element, (callback [:pointer, :e_connman_element, :string, :int, :pointer], :bool), :pointer ], :void ],
        # EAPI Eina_Bool e_connman_element_property_set(E_Connman_Element *element, const char *prop, int type, const void *value);
        [ :e_connman_element_property_set, [ :e_connman_element, :string, :int, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_element_property_set_full(E_Connman_Element *element, const char *prop, int type, const void *value, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_element_property_set_full, [ :e_connman_element, :string, :int, :pointer, :e_dbus_method_return_cb, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_element_property_array_set_full(E_Connman_Element *element, const char *prop, int type, unsigned int count, const void * const *values, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_element_property_array_set_full, [ :e_connman_element, :string, :int, :uint, :pointer, :e_dbus_method_return_cb, :pointer ],
            :bool ],
        # EAPI Eina_Bool e_connman_element_property_dict_set_full(E_Connman_Element *element, const char *prop, const char *key, int type, const void *value, E_DBus_Method_Return_Cb cb, const void *data);
        [ :e_connman_element_property_dict_set_full, [ :e_connman_element, :string, :string, :int, :pointer, :e_dbus_method_return_cb, :pointer ],
            :bool ],
        # EAPI Eina_Bool e_connman_element_property_type_get_stringshared(const E_Connman_Element *element, const char *name, int *type);
        [ :e_connman_element_property_type_get_stringshared, [ :e_connman_element, :string, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_element_property_type_get(const E_Connman_Element *element, const char *name, int *type);
        [ :e_connman_element_property_type_get, [ :e_connman_element, :string, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_element_property_dict_get_stringshared(const E_Connman_Element *element, const char *dict_name, const char *key_name, int *type, void *value);
        [ :e_connman_element_property_dict_get_stringshared, [ :e_connman_element, :string, :string, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_element_property_dict_strings_array_get_stringshared(const E_Connman_Element *element, const char *dict_name, const char *key, unsigned int *count, const char ***strings);
        [ :e_connman_element_property_dict_strings_array_get_stringshared, [ :e_connman_element, :string, :string, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_element_property_get_stringshared(const E_Connman_Element *element, const char *name, int *type, void *value);
        [ :e_connman_element_property_get_stringshared, [ :e_connman_element, :string, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_element_property_get(const E_Connman_Element *element, const char *name, int *type, void *value);
        [ :e_connman_element_property_get, [ :e_connman_element, :string, :pointer, :pointer ], :bool ],
        # EAPI Eina_Bool e_connman_element_is_manager(const E_Connman_Element *element);
        [ :e_connman_element_is_manager, [ :e_connman_element ], :bool ],
        # EAPI Eina_Bool e_connman_element_is_profile(const E_Connman_Element *element);
        [ :e_connman_element_is_profile, [ :e_connman_element ], :bool ],
        # EAPI Eina_Bool e_connman_element_is_service(const E_Connman_Element *element);
        [ :e_connman_element_is_service, [ :e_connman_element ], :bool ],
        # EAPI Eina_Bool e_connman_element_is_technology(const E_Connman_Element *element);
        [ :e_connman_element_is_technology, [ :e_connman_element ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
