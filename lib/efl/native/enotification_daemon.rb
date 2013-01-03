#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/enotify'
#
module Efl
    #
    module EnotificationDaemon
        #
        FCT_PREFIX = 'e_notification_daemon_' unless const_defined? :FCT_PREFIX
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
        # TYPEDEFS
        # typedef struct E_Notification_Daemon E_Notification_Daemon;
        typedef :pointer, :e_notification_daemon
        # typedef struct E_Notification_View E_Notification_View;
        typedef :pointer, :e_notification_view
        #
        # CALLBACKS
        # typedef int (*E_Notification_Daemon_Callback_Notify) (E_Notification_Daemon *daemon, E_Notification *notification);
        callback :e_notification_daemon_callback_notify_cb, [ :e_notification_daemon, :e_notification ], :int
        # typedef void (*E_Notification_Daemon_Callback_Close_Notification) (E_Notification_Daemon *daemon, unsigned int notification_id);
        callback :e_notification_daemon_callback_close_notification_cb, [ :e_notification_daemon, :uint ], :void
        #
        # FUNCTIONS
        fcts = [
        # EAPI int e_notification_daemon_init(void);
        [ :e_notification_daemon_init, [  ], :int ],
        # EAPI int e_notification_daemon_shutdown(void);
        [ :e_notification_daemon_shutdown, [  ], :int ],
        # EAPI E_Notification_Daemon *e_notification_daemon_add(const char *name, const char *vendor);
        [ :e_notification_daemon_add, [ :string, :string ], :e_notification_daemon ],
        # EAPI void e_notification_daemon_free(E_Notification_Daemon *d);
        [ :e_notification_daemon_free, [ :e_notification_daemon ], :void ],
        # EAPI void e_notification_daemon_data_set(E_Notification_Daemon *daemon, void *data);
        [ :e_notification_daemon_data_set, [ :e_notification_daemon, :pointer ], :void ],
        # EAPI void *e_notification_daemon_data_get(E_Notification_Daemon *daemon);
        [ :e_notification_daemon_data_get, [ :e_notification_daemon ], :pointer ],
        # EAPI void e_notification_daemon_callback_notify_set(E_Notification_Daemon *daemon, E_Notification_Daemon_Callback_Notify func);
        [ :e_notification_daemon_callback_notify_set, [ :e_notification_daemon, :e_notification_daemon_callback_notify_cb ], :void ],
        # EAPI void e_notification_daemon_callback_close_notification_set(E_Notification_Daemon *daemon, E_Notification_Daemon_Callback_Close_Notification func);
        [ :e_notification_daemon_callback_close_notification_set, [ :e_notification_daemon, :e_notification_daemon_callback_close_notification_cb ],
            :void ],
        # EAPI void e_notification_daemon_signal_notification_closed(E_Notification_Daemon *daemon, unsigned int id, E_Notification_Closed_Reason reason);
        [ :e_notification_daemon_signal_notification_closed, [ :e_notification_daemon, :uint, :e_notification_closed_reason ], :void ],
        # EAPI void e_notification_daemon_signal_action_invoked(E_Notification_Daemon *daemon, unsigned int notification_id, const char *action_id);
        [ :e_notification_daemon_signal_action_invoked, [ :e_notification_daemon, :uint, :string ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
