#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi'
#
module Efl
    #
    module Ecorecon
        def self.method_missing m, *args, &block
            return Efl::API.send 'ecore_con_'+m.to_s, *args, &block
        end
    end
    #
    module API
        #
        #
        ffi_lib 'ecore'
        #
        # ENUMS
        # typedef enum _Ecore_Con_Type {...} Ecore_Con_Type;
        enum :ecore_con_type, [ :ecore_con_local_user, 0, :ecore_con_local_system, 1, :ecore_con_local_abstract, 2, :ecore_con_remote_tcp, 3,
            :ecore_con_remote_mcast, 4, :ecore_con_remote_udp, 5, :ecore_con_remote_broadcast, 6, :ecore_con_remote_nodelay, 7, :ecore_con_use_ssl2,
            :ecore_con_use_ssl3, :ecore_con_use_tls, :ecore_con_use_mixed, :ecore_con_load_cert ]
        # typedef enum _Ecore_Con_Url_Time {...} Ecore_Con_Url_Time;
        enum :ecore_con_url_time, [ :ecore_con_url_time_none, 0, :ecore_con_url_time_ifmodsince, :ecore_con_url_time_ifunmodsince ]
        #
        # TYPEDEFS
        # typedef struct _Ecore_Con_Server Ecore_Con_Server;
        typedef :pointer, :ecore_con_server
        typedef :pointer, :ecore_con_server_p
        # typedef struct _Ecore_Con_Client Ecore_Con_Client;
        typedef :pointer, :ecore_con_client
        typedef :pointer, :ecore_con_client_p
        # typedef struct _Ecore_Con_Url Ecore_Con_Url;
        typedef :pointer, :ecore_con_url
        typedef :pointer, :ecore_con_url_p
        # typedef struct _Ecore_Con_Event_Client_Add Ecore_Con_Event_Client_Add;
        typedef :pointer, :ecore_con_event_client_add
        # typedef struct _Ecore_Con_Event_Client_Del Ecore_Con_Event_Client_Del;
        typedef :pointer, :ecore_con_event_client_del
        # typedef struct _Ecore_Con_Event_Client_Error Ecore_Con_Event_Client_Error;
        typedef :pointer, :ecore_con_event_client_error
        # typedef struct _Ecore_Con_Event_Server_Add Ecore_Con_Event_Server_Add;
        typedef :pointer, :ecore_con_event_server_add
        # typedef struct _Ecore_Con_Event_Server_Del Ecore_Con_Event_Server_Del;
        typedef :pointer, :ecore_con_event_server_del
        # typedef struct _Ecore_Con_Event_Server_Error Ecore_Con_Event_Server_Error;
        typedef :pointer, :ecore_con_event_server_error
        # typedef struct _Ecore_Con_Event_Client_Data Ecore_Con_Event_Client_Data;
        typedef :pointer, :ecore_con_event_client_data
        # typedef struct _Ecore_Con_Event_Server_Data Ecore_Con_Event_Server_Data;
        typedef :pointer, :ecore_con_event_server_data
        # typedef struct _Ecore_Con_Event_Url_Data Ecore_Con_Event_Url_Data;
        typedef :pointer, :ecore_con_event_url_data
        # typedef struct _Ecore_Con_Event_Url_Complete Ecore_Con_Event_Url_Complete;
        typedef :pointer, :ecore_con_event_url_complete
        # typedef struct _Ecore_Con_Event_Url_Progress Ecore_Con_Event_Url_Progress;
        typedef :pointer, :ecore_con_event_url_progress
        #
        # CALLBACKS
        # typedef void (*Ecore_Con_Dns_Cb) (const char *canonname, const char *ip, struct sockaddr *addr, int addrlen, void *data);
        callback :ecore_con_dns_cb, [ :string, :string, :pointer, :int, :void_p ], :void
        #
        # FUNCTIONS
        fcts = [
        # EAPI extern int ECORE_CON_EVENT_CLIENT_ADD;
        # FIXME
        # EAPI extern int ECORE_CON_EVENT_CLIENT_DEL;
        # FIXME
        # EAPI extern int ECORE_CON_EVENT_CLIENT_ERROR;
        # FIXME
        # EAPI extern int ECORE_CON_EVENT_SERVER_ADD;
        # FIXME
        # EAPI extern int ECORE_CON_EVENT_SERVER_DEL;
        # FIXME
        # EAPI extern int ECORE_CON_EVENT_SERVER_ERROR;
        # FIXME
        # EAPI extern int ECORE_CON_EVENT_CLIENT_DATA;
        # FIXME
        # EAPI extern int ECORE_CON_EVENT_SERVER_DATA;
        # FIXME
        # EAPI extern int ECORE_CON_EVENT_URL_DATA;
        # FIXME
        # EAPI extern int ECORE_CON_EVENT_URL_COMPLETE;
        # FIXME
        # EAPI extern int ECORE_CON_EVENT_URL_PROGRESS;
        # FIXME
        # EAPI int ecore_con_init(void);
        [ :ecore_con_init, [  ], :int ],
        # EAPI int ecore_con_shutdown(void);
        [ :ecore_con_shutdown, [  ], :int ],
        # EAPI Eina_Bool ecore_con_lookup(const char *name, Ecore_Con_Dns_Cb done_cb, const void *data);
        [ :ecore_con_lookup, [ :string, :ecore_con_dns_cb, :void_p ], :eina_bool ],
        # EAPI int ecore_con_ssl_available_get(void);
        [ :ecore_con_ssl_available_get, [  ], :int ],
        # EAPI Eina_Bool ecore_con_ssl_server_cert_add(Ecore_Con_Server *svr, const char *cert);
        [ :ecore_con_ssl_server_cert_add, [ :ecore_con_server_p, :string ], :eina_bool ],
        # EAPI Eina_Bool ecore_con_ssl_server_privkey_add(Ecore_Con_Server *svr, const char *key_file);
        [ :ecore_con_ssl_server_privkey_add, [ :ecore_con_server_p, :string ], :eina_bool ],
        # EAPI Eina_Bool ecore_con_ssl_server_crl_add(Ecore_Con_Server *svr, const char *crl_file);
        [ :ecore_con_ssl_server_crl_add, [ :ecore_con_server_p, :string ], :eina_bool ],
        # EAPI Eina_Bool ecore_con_ssl_server_cafile_add(Ecore_Con_Server *svr, const char *ca_file);
        [ :ecore_con_ssl_server_cafile_add, [ :ecore_con_server_p, :string ], :eina_bool ],
        # EAPI void ecore_con_ssl_server_verify(Ecore_Con_Server *svr);
        [ :ecore_con_ssl_server_verify, [ :ecore_con_server_p ], :void ],
        # EAPI Ecore_Con_Server *ecore_con_server_add(Ecore_Con_Type type, const char *name, int port, const void *data);
        [ :ecore_con_server_add, [ :ecore_con_type, :string, :int, :void_p ], :ecore_con_server_p ],
        # EAPI Ecore_Con_Server *ecore_con_server_connect(Ecore_Con_Type type, const char *name, int port, const void *data);
        [ :ecore_con_server_connect, [ :ecore_con_type, :string, :int, :void_p ], :ecore_con_server_p ],
        # EAPI void * ecore_con_server_del(Ecore_Con_Server *svr);
        [ :ecore_con_server_del, [ :ecore_con_server_p ], :void_p ],
        # EAPI void * ecore_con_server_data_get(Ecore_Con_Server *svr);
        [ :ecore_con_server_data_get, [ :ecore_con_server_p ], :void_p ],
        # EAPI void * ecore_con_server_data_set(Ecore_Con_Server *svr, void *data);
        [ :ecore_con_server_data_set, [ :ecore_con_server_p, :void_p ], :void_p ],
        # EAPI Eina_Bool ecore_con_server_connected_get(Ecore_Con_Server *svr);
        [ :ecore_con_server_connected_get, [ :ecore_con_server_p ], :eina_bool ],
        # EAPI Eina_List * ecore_con_server_clients_get(Ecore_Con_Server *svr);
        [ :ecore_con_server_clients_get, [ :ecore_con_server_p ], :eina_list_p ],
        # EAPI const char * ecore_con_server_name_get(Ecore_Con_Server *svr);
        [ :ecore_con_server_name_get, [ :ecore_con_server_p ], :string ],
        # EAPI int ecore_con_server_port_get(Ecore_Con_Server *svr);
        [ :ecore_con_server_port_get, [ :ecore_con_server_p ], :int ],
        # EAPI double ecore_con_server_uptime_get(Ecore_Con_Server *svr);
        [ :ecore_con_server_uptime_get, [ :ecore_con_server_p ], :double ],
        # EAPI int ecore_con_server_send(Ecore_Con_Server *svr, const void *data, int size);
        [ :ecore_con_server_send, [ :ecore_con_server_p, :void_p, :int ], :int ],
        # EAPI void ecore_con_server_client_limit_set(Ecore_Con_Server *svr, int client_limit, char reject_excess_clients);
        [ :ecore_con_server_client_limit_set, [ :ecore_con_server_p, :int, :char ], :void ],
        # EAPI const char * ecore_con_server_ip_get(Ecore_Con_Server *svr);
        [ :ecore_con_server_ip_get, [ :ecore_con_server_p ], :string ],
        # EAPI void ecore_con_server_flush(Ecore_Con_Server *svr);
        [ :ecore_con_server_flush, [ :ecore_con_server_p ], :void ],
        # EAPI void ecore_con_server_timeout_set(Ecore_Con_Server *svr, double timeout);
        [ :ecore_con_server_timeout_set, [ :ecore_con_server_p, :double ], :void ],
        # EAPI double ecore_con_server_timeout_get(Ecore_Con_Server *svr);
        [ :ecore_con_server_timeout_get, [ :ecore_con_server_p ], :double ],
        # EAPI int ecore_con_client_send(Ecore_Con_Client *cl, const void *data, int size);
        [ :ecore_con_client_send, [ :ecore_con_client_p, :void_p, :int ], :int ],
        # EAPI Ecore_Con_Server *ecore_con_client_server_get(Ecore_Con_Client *cl);
        [ :ecore_con_client_server_get, [ :ecore_con_client_p ], :ecore_con_server_p ],
        # EAPI void * ecore_con_client_del(Ecore_Con_Client *cl);
        [ :ecore_con_client_del, [ :ecore_con_client_p ], :void_p ],
        # EAPI void ecore_con_client_data_set(Ecore_Con_Client *cl, const void *data);
        [ :ecore_con_client_data_set, [ :ecore_con_client_p, :void_p ], :void ],
        # EAPI void * ecore_con_client_data_get(Ecore_Con_Client *cl);
        [ :ecore_con_client_data_get, [ :ecore_con_client_p ], :void_p ],
        # EAPI const char * ecore_con_client_ip_get(Ecore_Con_Client *cl);
        [ :ecore_con_client_ip_get, [ :ecore_con_client_p ], :string ],
        # EAPI void ecore_con_client_flush(Ecore_Con_Client *cl);
        [ :ecore_con_client_flush, [ :ecore_con_client_p ], :void ],
        # EAPI double ecore_con_client_uptime_get(Ecore_Con_Client *cl);
        [ :ecore_con_client_uptime_get, [ :ecore_con_client_p ], :double ],
        # EAPI double ecore_con_client_timeout_get(Ecore_Con_Client *cl);
        [ :ecore_con_client_timeout_get, [ :ecore_con_client_p ], :double ],
        # EAPI void ecore_con_client_timeout_set(Ecore_Con_Client *cl, double timeout);
        [ :ecore_con_client_timeout_set, [ :ecore_con_client_p, :double ], :void ],
        # EAPI Eina_Bool ecore_con_client_connected_get(Ecore_Con_Client *cl);
        [ :ecore_con_client_connected_get, [ :ecore_con_client_p ], :eina_bool ],
        # EAPI int ecore_con_client_port_get(Ecore_Con_Client *cl);
        [ :ecore_con_client_port_get, [ :ecore_con_client_p ], :int ],
        # EAPI int ecore_con_url_init(void);
        [ :ecore_con_url_init, [  ], :int ],
        # EAPI int ecore_con_url_shutdown(void);
        [ :ecore_con_url_shutdown, [  ], :int ],
        # EAPI void ecore_con_url_pipeline_set(Eina_Bool enable);
        [ :ecore_con_url_pipeline_set, [ :eina_bool ], :void ],
        # EAPI Eina_Bool ecore_con_url_pipeline_get(void);
        [ :ecore_con_url_pipeline_get, [  ], :eina_bool ],
        # EAPI Ecore_Con_Url * ecore_con_url_new(const char *url);
        [ :ecore_con_url_new, [ :string ], :ecore_con_url_p ],
        # EAPI Ecore_Con_Url * ecore_con_url_custom_new(const char *url, const char *custom_request);
        [ :ecore_con_url_custom_new, [ :string, :string ], :ecore_con_url_p ],
        # EAPI void ecore_con_url_free(Ecore_Con_Url *url_con);
        [ :ecore_con_url_free, [ :ecore_con_url_p ], :void ],
        # EAPI Eina_Bool ecore_con_url_url_set(Ecore_Con_Url *url_con, const char *url);
        [ :ecore_con_url_url_set, [ :ecore_con_url_p, :string ], :eina_bool ],
        # EAPI void ecore_con_url_data_set(Ecore_Con_Url *url_con, void *data);
        [ :ecore_con_url_data_set, [ :ecore_con_url_p, :void_p ], :void ],
        # EAPI void * ecore_con_url_data_get(Ecore_Con_Url *url_con);
        [ :ecore_con_url_data_get, [ :ecore_con_url_p ], :void_p ],
        # EAPI void ecore_con_url_additional_header_add(Ecore_Con_Url *url_con, const char *key, const char *value);
        [ :ecore_con_url_additional_header_add, [ :ecore_con_url_p, :string, :string ], :void ],
        # EAPI void ecore_con_url_additional_headers_clear(Ecore_Con_Url *url_con);
        [ :ecore_con_url_additional_headers_clear, [ :ecore_con_url_p ], :void ],
        # EAPI const Eina_List * ecore_con_url_response_headers_get(Ecore_Con_Url *url_con);
        [ :ecore_con_url_response_headers_get, [ :ecore_con_url_p ], :eina_list_p ],
        # EAPI void ecore_con_url_fd_set(Ecore_Con_Url *url_con, int fd);
        [ :ecore_con_url_fd_set, [ :ecore_con_url_p, :int ], :void ],
        # EAPI int ecore_con_url_received_bytes_get(Ecore_Con_Url *url_con);
        [ :ecore_con_url_received_bytes_get, [ :ecore_con_url_p ], :int ],
        # EAPI Eina_Bool ecore_con_url_httpauth_set(Ecore_Con_Url *url_con, const char *username, const char *password, Eina_Bool safe);
        [ :ecore_con_url_httpauth_set, [ :ecore_con_url_p, :string, :string, :eina_bool ], :eina_bool ],
        # EAPI Eina_Bool ecore_con_url_get(Ecore_Con_Url *url_con);
        [ :ecore_con_url_get, [ :ecore_con_url_p ], :eina_bool ],
        # EAPI Eina_Bool ecore_con_url_post(Ecore_Con_Url *url_con, const void *data, long length, const char *content_type);
        [ :ecore_con_url_post, [ :ecore_con_url_p, :void_p, :long, :string ], :eina_bool ],
        # EAPI void ecore_con_url_time(Ecore_Con_Url *url_con, Ecore_Con_Url_Time time_condition, double timestamp);
        [ :ecore_con_url_time, [ :ecore_con_url_p, :ecore_con_url_time, :double ], :void ],
        # EAPI Eina_Bool ecore_con_url_ftp_upload(Ecore_Con_Url *url_con, const char *filename, const char *user, const char *pass, const char *upload_dir);
        [ :ecore_con_url_ftp_upload, [ :ecore_con_url_p, :string, :string, :string, :string ], :eina_bool ],
        # EAPI void ecore_con_url_verbose_set(Ecore_Con_Url *url_con, Eina_Bool verbose);
        [ :ecore_con_url_verbose_set, [ :ecore_con_url_p, :eina_bool ], :void ],
        # EAPI void ecore_con_url_ftp_use_epsv_set(Ecore_Con_Url *url_con, Eina_Bool use_epsv);
        [ :ecore_con_url_ftp_use_epsv_set, [ :ecore_con_url_p, :eina_bool ], :void ],
        # EAPI void ecore_con_url_cookies_init(Ecore_Con_Url *url_con);
        [ :ecore_con_url_cookies_init, [ :ecore_con_url_p ], :void ],
        # EAPI void ecore_con_url_cookies_ignore_old_session_set(Ecore_Con_Url *url_con, Eina_Bool ignore);
        [ :ecore_con_url_cookies_ignore_old_session_set, [ :ecore_con_url_p, :eina_bool ], :void ],
        # EAPI void ecore_con_url_cookies_clear(Ecore_Con_Url *url_con);
        [ :ecore_con_url_cookies_clear, [ :ecore_con_url_p ], :void ],
        # EAPI void ecore_con_url_cookies_session_clear(Ecore_Con_Url *url_con);
        [ :ecore_con_url_cookies_session_clear, [ :ecore_con_url_p ], :void ],
        # EAPI void ecore_con_url_cookies_file_add(Ecore_Con_Url *url_con, const char * const file_name);
        [ :ecore_con_url_cookies_file_add, [ :ecore_con_url_p, :string ], :void ],
        # EAPI Eina_Bool ecore_con_url_cookies_jar_file_set(Ecore_Con_Url *url_con, const char * const cookiejar_file);
        [ :ecore_con_url_cookies_jar_file_set, [ :ecore_con_url_p, :string ], :eina_bool ],
        # EAPI void ecore_con_url_cookies_jar_write(Ecore_Con_Url *url_con);
        [ :ecore_con_url_cookies_jar_write, [ :ecore_con_url_p ], :void ],
        # EAPI void ecore_con_url_ssl_verify_peer_set(Ecore_Con_Url *url_con, Eina_Bool verify);
        [ :ecore_con_url_ssl_verify_peer_set, [ :ecore_con_url_p, :eina_bool ], :void ],
        # EAPI int ecore_con_url_ssl_ca_set(Ecore_Con_Url *url_con, const char *ca_path);
        [ :ecore_con_url_ssl_ca_set, [ :ecore_con_url_p, :string ], :int ],
        ]
        #
        attach_fcts fcts
    end
end
#
# EOF
