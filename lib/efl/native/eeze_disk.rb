#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module EezeDisk
        #
        FCT_PREFIX = 'eeze_disk_' unless const_defined? :FCT_PREFIX
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
        # typedef enum {...} Eeze_Disk_Type;
        enum :eeze_disk_type, [ :eeze_disk_type_unknown, 0, :eeze_disk_type_internal, (1<<0), :eeze_disk_type_cdrom, (1<<1), :eeze_disk_type_usb,
            (1<<2), :eeze_disk_type_flash, (1<<3) ]
        # typedef enum {...} Eeze_Mount_Opts;
        enum :eeze_mount_opts, [ :eeze_disk_mountopt_loop, (1<<1), :eeze_disk_mountopt_utf8, (1<<2), :eeze_disk_mountopt_noexec, (1<<3),
            :eeze_disk_mountopt_nosuid, (1<<4), :eeze_disk_mountopt_remount, (1<<5), :eeze_disk_mountopt_uid, (1<<6), :eeze_disk_mountopt_nodev, (1<<7) ]
        #
        # TYPEDEFS
        # typedef struct _Eeze_Event_Disk Eeze_Event_Disk_Mount;
        typedef :pointer, :eeze_event_disk_mount
        # typedef struct _Eeze_Event_Disk Eeze_Event_Disk_Unmount;
        typedef :pointer, :eeze_event_disk_unmount
        # typedef struct _Eeze_Event_Disk Eeze_Event_Disk_Eject;
        typedef :pointer, :eeze_event_disk_eject
        # typedef struct _Eeze_Disk Eeze_Disk;
        typedef :pointer, :eeze_disk
        # typedef struct _Eeze_Event_Disk_Error Eeze_Event_Disk_Error;
        typedef :pointer, :eeze_event_disk_error
        #
        # VARIABLES
        # EAPI extern int EEZE_EVENT_DISK_MOUNT;
        attach_variable :EEZE_EVENT_DISK_MOUNT, :int
        # EAPI extern int EEZE_EVENT_DISK_UNMOUNT;
        attach_variable :EEZE_EVENT_DISK_UNMOUNT, :int
        # EAPI extern int EEZE_EVENT_DISK_EJECT;
        attach_variable :EEZE_EVENT_DISK_EJECT, :int
        # EAPI extern int EEZE_EVENT_DISK_ERROR;
        attach_variable :EEZE_EVENT_DISK_ERROR, :int
        #
        # FUNCTIONS
        fcts = [
        # EAPI void eeze_disk_function(void);
        [ :eeze_disk_function, [  ], :void ],
        # EAPI Eina_Bool eeze_disk_can_mount(void);
        [ :eeze_disk_can_mount, [  ], :bool ],
        # EAPI Eina_Bool eeze_disk_can_unmount(void);
        [ :eeze_disk_can_unmount, [  ], :bool ],
        # EAPI Eina_Bool eeze_disk_can_eject(void);
        [ :eeze_disk_can_eject, [  ], :bool ],
        # EAPI Eeze_Disk *eeze_disk_new(const char *path);
        [ :eeze_disk_new, [ :string ], :eeze_disk ],
        # EAPI Eeze_Disk *eeze_disk_new_from_mount(const char *mount_point);
        [ :eeze_disk_new_from_mount, [ :string ], :eeze_disk ],
        # EAPI void eeze_disk_free(Eeze_Disk *disk);
        [ :eeze_disk_free, [ :eeze_disk ], :void ],
        # EAPI void eeze_disk_scan(Eeze_Disk *disk);
        [ :eeze_disk_scan, [ :eeze_disk ], :void ],
        # EAPI void eeze_disk_data_set(Eeze_Disk *disk, void *data);
        [ :eeze_disk_data_set, [ :eeze_disk, :pointer ], :void ],
        # EAPI void *eeze_disk_data_get(Eeze_Disk *disk);
        [ :eeze_disk_data_get, [ :eeze_disk ], :pointer ],
        # EAPI const char *eeze_disk_syspath_get(Eeze_Disk *disk);
        [ :eeze_disk_syspath_get, [ :eeze_disk ], :string ],
        # EAPI const char *eeze_disk_devpath_get(Eeze_Disk *disk);
        [ :eeze_disk_devpath_get, [ :eeze_disk ], :string ],
        # EAPI const char *eeze_disk_fstype_get(Eeze_Disk *disk);
        [ :eeze_disk_fstype_get, [ :eeze_disk ], :string ],
        # EAPI const char *eeze_disk_vendor_get(Eeze_Disk *disk);
        [ :eeze_disk_vendor_get, [ :eeze_disk ], :string ],
        # EAPI const char *eeze_disk_model_get(Eeze_Disk *disk);
        [ :eeze_disk_model_get, [ :eeze_disk ], :string ],
        # EAPI const char *eeze_disk_serial_get(Eeze_Disk *disk);
        [ :eeze_disk_serial_get, [ :eeze_disk ], :string ],
        # EAPI const char *eeze_disk_uuid_get(Eeze_Disk *disk);
        [ :eeze_disk_uuid_get, [ :eeze_disk ], :string ],
        # EAPI const char *eeze_disk_label_get(Eeze_Disk *disk);
        [ :eeze_disk_label_get, [ :eeze_disk ], :string ],
        # EAPI Eeze_Disk_Type eeze_disk_type_get(Eeze_Disk *disk);
        [ :eeze_disk_type_get, [ :eeze_disk ], :eeze_disk_type ],
        # EAPI Eina_Bool eeze_disk_removable_get(Eeze_Disk *disk);
        [ :eeze_disk_removable_get, [ :eeze_disk ], :bool ],
        # EAPI Eina_Bool eeze_disk_mounted_get(Eeze_Disk *disk);
        [ :eeze_disk_mounted_get, [ :eeze_disk ], :bool ],
        # EAPI const char *eeze_disk_mount_wrapper_get(Eeze_Disk *disk);
        [ :eeze_disk_mount_wrapper_get, [ :eeze_disk ], :string ],
        # EAPI Eina_Bool eeze_disk_mount_wrapper_set(Eeze_Disk *disk, const char *wrapper);
        [ :eeze_disk_mount_wrapper_set, [ :eeze_disk, :string ], :bool ],
        # EAPI Eina_Bool eeze_disk_mount(Eeze_Disk *disk);
        [ :eeze_disk_mount, [ :eeze_disk ], :bool ],
        # EAPI Eina_Bool eeze_disk_unmount(Eeze_Disk *disk);
        [ :eeze_disk_unmount, [ :eeze_disk ], :bool ],
        # EAPI Eina_Bool eeze_disk_eject(Eeze_Disk *disk);
        [ :eeze_disk_eject, [ :eeze_disk ], :bool ],
        # EAPI void eeze_disk_cancel(Eeze_Disk *disk);
        [ :eeze_disk_cancel, [ :eeze_disk ], :void ],
        # EAPI const char *eeze_disk_mount_point_get(Eeze_Disk *disk);
        [ :eeze_disk_mount_point_get, [ :eeze_disk ], :string ],
        # EAPI Eina_Bool eeze_disk_mount_point_set(Eeze_Disk *disk, const char *mount_point);
        [ :eeze_disk_mount_point_set, [ :eeze_disk, :string ], :bool ],
        # EAPI Eina_Bool eeze_disk_mountopts_set(Eeze_Disk *disk, unsigned long opts);
        [ :eeze_disk_mountopts_set, [ :eeze_disk, :ulong ], :bool ],
        # EAPI unsigned long eeze_disk_mountopts_get(Eeze_Disk *disk);
        [ :eeze_disk_mountopts_get, [ :eeze_disk ], :ulong ],
        # EAPI Eina_Bool eeze_mount_tabs_watch(void);
        [ :eeze_mount_tabs_watch, [  ], :bool ],
        # EAPI void eeze_mount_tabs_unwatch(void);
        [ :eeze_mount_tabs_unwatch, [  ], :void ],
        # EAPI Eina_Bool eeze_mount_mtab_scan(void);
        [ :eeze_mount_mtab_scan, [  ], :bool ],
        # EAPI Eina_Bool eeze_mount_fstab_scan(void);
        [ :eeze_mount_fstab_scan, [  ], :bool ],
        # EAPI const char *eeze_disk_udev_get_property(Eeze_Disk *disk, const char *property);
        [ :eeze_disk_udev_get_property, [ :eeze_disk, :string ], :string ],
        # EAPI const char *eeze_disk_udev_get_sysattr(Eeze_Disk *disk, const char *sysattr);
        [ :eeze_disk_udev_get_sysattr, [ :eeze_disk, :string ], :string ],
        # EAPI const char *eeze_disk_udev_get_parent(Eeze_Disk *disk);
        [ :eeze_disk_udev_get_parent, [ :eeze_disk ], :string ],
        # EAPI Eina_Bool eeze_disk_udev_walk_check_sysattr(Eeze_Disk *disk, const char *sysattr, const char *value);
        [ :eeze_disk_udev_walk_check_sysattr, [ :eeze_disk, :string, :string ], :bool ],
        # EAPI const char *eeze_disk_udev_walk_get_sysattr(Eeze_Disk *disk, const char *sysattr);
        [ :eeze_disk_udev_walk_get_sysattr, [ :eeze_disk, :string ], :string ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
