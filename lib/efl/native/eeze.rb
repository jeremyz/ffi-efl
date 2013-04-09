#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/eina_list'
#
module Efl
    #
    module Eeze
        #
        FCT_PREFIX = 'eeze_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'eeze.so.1'
        #
        # ENUMS
        # typedef enum {...} Eeze_Udev_Event;
        enum :eeze_udev_event, [ :eeze_udev_event_none, 0xf0, :eeze_udev_event_add, (1<<1), :eeze_udev_event_remove, (1<<2), :eeze_udev_event_change,
            (1<<3), :eeze_udev_event_online, (1<<4), :eeze_udev_event_offline, (1<<5) ]
        # typedef enum {...} Eeze_Udev_Type;
        enum :eeze_udev_type, [ :eeze_udev_type_none, :eeze_udev_type_keyboard, :eeze_udev_type_mouse, :eeze_udev_type_touchpad,
            :eeze_udev_type_drive_mountable, :eeze_udev_type_drive_internal, :eeze_udev_type_drive_removable, :eeze_udev_type_drive_cdrom,
            :eeze_udev_type_power_ac, :eeze_udev_type_power_bat, :eeze_udev_type_is_it_hot_or_is_it_cold_sensor, :eeze_udev_type_net, :eeze_udev_type_v4l,
            :eeze_udev_type_bluetooth, :eeze_udev_type_joystick ]
        #
        # TYPEDEFS
        # typedef struct Eeze_Udev_Watch Eeze_Udev_Watch;
        typedef :pointer, :eeze_udev_watch
        # typedef struct _Eeze_Version Eeze_Version;
        typedef :pointer, :eeze_version
        #
        # CALLBACKS
        # typedef void(*Eeze_Udev_Watch_Cb) (const char *, Eeze_Udev_Event, void *, Eeze_Udev_Watch *);
        callback :eeze_udev_watch_cb, [ :string, :eeze_udev_event, :pointer, :eeze_udev_watch ], :void
        #
        # VARIABLES
        # EAPI extern Eeze_Version *eeze_version;
        attach_variable :eeze_version, :eeze_version
        #
        # FUNCTIONS
        fcts = [
        # EAPI int eeze_init(void);
        [ :eeze_init, [  ], :int ],
        # EAPI int eeze_shutdown(void);
        [ :eeze_shutdown, [  ], :int ],
        # EAPI Eina_List *eeze_udev_find_similar_from_syspath(const char *syspath);
        [ :eeze_udev_find_similar_from_syspath, [ :string ], :eina_list ],
        # EAPI Eina_List *eeze_udev_find_unlisted_similar(Eina_List *list);
        [ :eeze_udev_find_unlisted_similar, [ :eina_list ], :eina_list ],
        # EAPI Eina_List *eeze_udev_find_by_sysattr(const char *sysattr, const char *value);
        [ :eeze_udev_find_by_sysattr, [ :string, :string ], :eina_list ],
        # EAPI Eina_List *eeze_udev_find_by_type(Eeze_Udev_Type type, const char *name);
        [ :eeze_udev_find_by_type, [ :eeze_udev_type, :string ], :eina_list ],
        # EAPI Eina_List *eeze_udev_find_by_filter(const char *subsystem, const char *type, const char *name);
        [ :eeze_udev_find_by_filter, [ :string, :string, :string ], :eina_list ],
        # EAPI const char *eeze_udev_devpath_get_syspath(const char *devpath);
        [ :eeze_udev_devpath_get_syspath, [ :string ], :string ],
        # EAPI const char *eeze_udev_syspath_get_parent(const char *syspath);
        [ :eeze_udev_syspath_get_parent, [ :string ], :string ],
        # EAPI Eina_List *eeze_udev_syspath_get_parents(const char *syspath);
        [ :eeze_udev_syspath_get_parents, [ :string ], :eina_list ],
        # EAPI const char *eeze_udev_syspath_get_devpath(const char *syspath);
        [ :eeze_udev_syspath_get_devpath, [ :string ], :string ],
        # EAPI const char *eeze_udev_syspath_get_devname(const char *syspath);
        [ :eeze_udev_syspath_get_devname, [ :string ], :string ],
        # EAPI const char *eeze_udev_syspath_get_subsystem(const char *syspath);
        [ :eeze_udev_syspath_get_subsystem, [ :string ], :string ],
        # EAPI const char *eeze_udev_syspath_get_property(const char *syspath, const char *property);
        [ :eeze_udev_syspath_get_property, [ :string, :string ], :string ],
        # EAPI const char *eeze_udev_syspath_get_sysattr(const char *syspath, const char *sysattr);
        [ :eeze_udev_syspath_get_sysattr, [ :string, :string ], :string ],
        # EAPI Eina_Bool eeze_udev_syspath_is_mouse(const char *syspath);
        [ :eeze_udev_syspath_is_mouse, [ :string ], :bool ],
        # EAPI Eina_Bool eeze_udev_syspath_is_kbd(const char *syspath);
        [ :eeze_udev_syspath_is_kbd, [ :string ], :bool ],
        # EAPI Eina_Bool eeze_udev_syspath_is_touchpad(const char *syspath);
        [ :eeze_udev_syspath_is_touchpad, [ :string ], :bool ],
        # EAPI Eina_Bool eeze_udev_syspath_is_joystick(const char *syspath);
        [ :eeze_udev_syspath_is_joystick, [ :string ], :bool ],
        # EAPI Eina_Bool eeze_udev_walk_check_sysattr(const char *syspath, const char *sysattr, const char *value);
        [ :eeze_udev_walk_check_sysattr, [ :string, :string, :string ], :bool ],
        # EAPI const char *eeze_udev_walk_get_sysattr(const char *syspath, const char *sysattr);
        [ :eeze_udev_walk_get_sysattr, [ :string, :string ], :string ],
        # EAPI Eeze_Udev_Watch *eeze_udev_watch_add(Eeze_Udev_Type type, int event, Eeze_Udev_Watch_Cb cb, void *user_data);
        [ :eeze_udev_watch_add, [ :eeze_udev_type, :int, :eeze_udev_watch_cb, :pointer ], :eeze_udev_watch ],
        # EAPI void *eeze_udev_watch_del(Eeze_Udev_Watch *watch);
        [ :eeze_udev_watch_del, [ :eeze_udev_watch ], :pointer ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
