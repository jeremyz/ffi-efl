#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/evas'
require 'efl/native/edbus'
#
module Efl
    #
    module Enotify
        #
        FCT_PREFIX = 'e_notification_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'enotify'
        #
        # ENUMS
        # typedef enum E_Notification_Urgency {...} E_Notification_Urgency;
        enum :e_notification_urgency, [ :e_notification_urgency_low, 0, :e_notification_urgency_normal, 1, :e_notification_urgency_critical, 2 ]
        # typedef enum E_Closed_Action {...} E_Closed_Action;
        enum :e_notification_closed_action, [ :e_notification_closed_expired, 0, :e_notification_closed_dismissed, 1, :e_notification_closed_requested, 2,
            :e_notification_closed_undefined, 3 ]

        # typedef enum E_Notification_Hint_Type {...} E_Notification_Hint_Type;
        enum :e_notification_hint_type, [ :e_notification_hint_urgency, (1 << 0), :e_notification_hint_category, (1 << 1), :e_notification_hint_desktop, (1 << 2),
            :e_notification_hint_sound_file, (1 << 3), :e_notification_hint_transient, (1 << 4), :e_notification_hint_resident, (1 << 5),
            :e_notification_hint_action_icons, (1 << 6), :e_notification_hint_suppress_sound, 0x10, :e_notification_hint_xy, 0x20, :e_notification_hint_image_data, 0x40 ]
        # TYPEDEFS
        # typedef struct E_Notification_Image E_Notification_Image;
        typedef :pointer, :e_notification_image
        # typedef struct E_Notification E_Notification;
        typedef :pointer, :e_notification
        # typedef struct E_Notification_Action E_Notification_Action;
        typedef :pointer, :e_notification_action
        # typedef struct E_Notification_Return_Notify E_Notification_Return_Notify;
        typedef :pointer, :e_notification_return_notify
        # typedef struct E_Notification_Return_Get_Capabilities E_Notification_Return_Get_Capabilities;
        typedef :pointer, :e_notification_return_get_capabilities
        # typedef struct E_Notification_Return_Get_Server_Information E_Notification_Return_Get_Server_Information;
        typedef :pointer, :e_notification_return_get_server_information
        # typedef struct E_Notification_Event_Action_Invoked E_Notification_Event_Action_Invoked;
        typedef :pointer, :e_notification_event_action_invoked
        # typedef struct E_Notification_Event_Notification_Closed E_Notification_Event_Notification_Closed;
        typedef :pointer, :e_notification_event_notification_closed
        #
        # FUNCTIONS
        fcts = [
        # EAPI int e_notification_init(void);
        [ :e_notification_init, [  ], :int ],
        # EAPI int e_notification_shutdown(void);
        [ :e_notification_shutdown, [  ], :int ],
        # EAPI void e_notification_send(E_Notification *n, E_DBus_Callback_Func func, void *data);
        [ :e_notification_send, [ :e_notification, :e_dbus_callback_func_cb, :pointer ], :void ],
        # EAPI void e_notification_get_capabilities(E_DBus_Callback_Func func, void *data);
        [ :e_notification_get_capabilities, [ :e_dbus_callback_func_cb, :pointer ], :void ],
        # EAPI void e_notification_get_server_information(E_DBus_Callback_Func func, void *data);
        [ :e_notification_get_server_information, [ :e_dbus_callback_func_cb, :pointer ], :void ],
        # EAPI E_Notification *e_notification_new(void);
        [ :e_notification_new, [  ], :e_notification ],
        # EAPI void e_notification_ref(E_Notification *n);
        [ :e_notification_ref, [ :e_notification ], :void ],
        # EAPI void e_notification_unref(E_Notification *n);
        [ :e_notification_unref, [ :e_notification ], :void ],
        # EAPI void e_notification_free(E_Notification *n);
        [ :e_notification_free, [ :e_notification ], :void ],
        # EAPI E_Notification *e_notification_full_new(const char *app_name, unsigned int replaces_id, const char *app_icon, const char *summary, const char *body, int expire_timeout);
        [ :e_notification_full_new, [ :string, :uint, :string, :string, :string, :int ], :e_notification ],
        # EAPI void e_notification_id_set(E_Notification *note, unsigned int id);
        [ :e_notification_id_set, [ :e_notification, :uint ], :void ],
        # EAPI void e_notification_app_name_set(E_Notification *n, const char *app_name);
        [ :e_notification_app_name_set, [ :e_notification, :string ], :void ],
        # EAPI void e_notification_app_icon_set(E_Notification *n, const char *app_icon);
        [ :e_notification_app_icon_set, [ :e_notification, :string ], :void ],
        # EAPI void e_notification_summary_set(E_Notification *n, const char *summary);
        [ :e_notification_summary_set, [ :e_notification, :string ], :void ],
        # EAPI void e_notification_body_set(E_Notification *n, const char *body);
        [ :e_notification_body_set, [ :e_notification, :string ], :void ],
        # EAPI void e_notification_replaces_id_set(E_Notification *n, int replaces_id);
        [ :e_notification_replaces_id_set, [ :e_notification, :int ], :void ],
        # EAPI void e_notification_timeout_set(E_Notification *n, int timeout);
        [ :e_notification_timeout_set, [ :e_notification, :int ], :void ],
        # EAPI void e_notification_closed_set(E_Notification *note, unsigned char closed);
        [ :e_notification_closed_set, [ :e_notification, :uchar ], :void ],
        # EAPI unsigned int e_notification_id_get(E_Notification *note);
        [ :e_notification_id_get, [ :e_notification ], :uint ],
        # EAPI const char *e_notification_app_name_get(E_Notification *n);
        [ :e_notification_app_name_get, [ :e_notification ], :string ],
        # EAPI const char *e_notification_app_icon_get(E_Notification *n);
        [ :e_notification_app_icon_get, [ :e_notification ], :string ],
        # EAPI const char *e_notification_summary_get(E_Notification *n);
        [ :e_notification_summary_get, [ :e_notification ], :string ],
        # EAPI const char *e_notification_body_get(E_Notification *n);
        [ :e_notification_body_get, [ :e_notification ], :string ],
        # EAPI int e_notification_replaces_id_get(E_Notification *note);
        [ :e_notification_replaces_id_get, [ :e_notification ], :int ],
        # EAPI int e_notification_timeout_get(E_Notification *note);
        [ :e_notification_timeout_get, [ :e_notification ], :int ],
        # EAPI unsigned char e_notification_closed_get(E_Notification *note);
        [ :e_notification_closed_get, [ :e_notification ], :uchar ],
        # EAPI void e_notification_action_add(E_Notification *n, const char *action_id, const char *action_name);
        [ :e_notification_action_add, [ :e_notification, :string, :string ], :void ],
        # EAPI Eina_List *e_notification_actions_get(E_Notification *n);
        [ :e_notification_actions_get, [ :e_notification ], :eina_list ],
        # EAPI const char *e_notification_action_id_get(E_Notification_Action *a);
        [ :e_notification_action_id_get, [ :e_notification_action ], :string ],
        # EAPI const char *e_notification_action_name_get(E_Notification_Action *a);
        [ :e_notification_action_name_get, [ :e_notification_action ], :string ],
        # EAPI void e_notification_hint_transient_set(E_Notification *n, Eina_Bool transient);
        [ :e_notification_hint_transient_set, [ :e_notification, :bool ], :void ],
        # EAPI void e_notification_hint_resident_set(E_Notification *n, Eina_Bool resident);
        [ :e_notification_hint_resident_set, [ :e_notification, :bool ], :void ],
        # EAPI void e_notification_hint_action_icons_set(E_Notification *n, Eina_Bool action_icons);
        [ :e_notification_hint_action_icons_set, [ :e_notification, :bool ], :void ],
        # EAPI void e_notification_hint_image_path_set(E_Notification *n, const char *path);
        [ :e_notification_hint_image_path_set, [ :e_notification, :string ], :void ],
        # EAPI void e_notification_hint_urgency_set(E_Notification *n, char urgency);
        [ :e_notification_hint_urgency_set, [ :e_notification, :char ], :void ],
        # EAPI void e_notification_hint_category_set(E_Notification *n, const char *category);
        [ :e_notification_hint_category_set, [ :e_notification, :string ], :void ],
        # EAPI void e_notification_hint_desktop_set(E_Notification *n, const char *desktop);
        [ :e_notification_hint_desktop_set, [ :e_notification, :string ], :void ],
        # EAPI void e_notification_hint_sound_file_set(E_Notification *n, const char *sound_file);
        [ :e_notification_hint_sound_file_set, [ :e_notification, :string ], :void ],
        # EAPI void e_notification_hint_suppress_sound_set(E_Notification *n, char suppress_sound);
        [ :e_notification_hint_suppress_sound_set, [ :e_notification, :char ], :void ],
        # EAPI void e_notification_hint_xy_set(E_Notification *n, int x, int y);
        [ :e_notification_hint_xy_set, [ :e_notification, :int, :int ], :void ],
        # EAPI void e_notification_hint_image_data_set(E_Notification *n, E_Notification_Image *image);
        [ :e_notification_hint_image_data_set, [ :e_notification, :e_notification_image ], :void ],
        # EAPI char e_notification_hint_urgency_get(E_Notification *n);
        [ :e_notification_hint_urgency_get, [ :e_notification ], :char ],
        # EAPI const char *e_notification_hint_category_get(E_Notification *n);
        [ :e_notification_hint_category_get, [ :e_notification ], :string ],
        # EAPI const char *e_notification_hint_desktop_get(E_Notification *n);
        [ :e_notification_hint_desktop_get, [ :e_notification ], :string ],
        # EAPI const char *e_notification_hint_sound_file_get(E_Notification *n);
        [ :e_notification_hint_sound_file_get, [ :e_notification ], :string ],
        # EAPI const char *e_notification_hint_image_path_get(E_Notification *n);
        [ :e_notification_hint_image_path_get, [ :e_notification ], :string ],
        # EAPI char e_notification_hint_suppress_sound_get(E_Notification *n);
        [ :e_notification_hint_suppress_sound_get, [ :e_notification ], :char ],
        # EAPI int e_notification_hint_xy_get(E_Notification *n, int *x, int *y);
        [ :e_notification_hint_xy_get, [ :e_notification, :pointer, :pointer ], :int ],
        # EAPI E_Notification_Image *e_notification_hint_image_data_get(E_Notification *n);
        [ :e_notification_hint_image_data_get, [ :e_notification ], :e_notification_image ],
        # EAPI E_Notification_Image *e_notification_hint_icon_data_get(E_Notification *n);
        [ :e_notification_hint_icon_data_get, [ :e_notification ], :e_notification_image ],
        # EAPI E_Notification_Image *e_notification_image_new(void);
        [ :e_notification_image_new, [  ], :e_notification_image ],
        # EAPI void e_notification_image_free(E_Notification_Image *img);
        [ :e_notification_image_free, [ :e_notification_image ], :void ],
        # EAPI Eina_Bool e_notification_image_init(E_Notification_Image *img, Evas_Object *obj);
        [ :e_notification_image_init, [ :e_notification_image, :evas_object ], :bool ],
        # EAPI Evas_Object *e_notification_image_evas_object_add(Evas *evas, E_Notification_Image *img);
        [ :e_notification_image_evas_object_add, [ :evas, :e_notification_image ], :evas_object ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
