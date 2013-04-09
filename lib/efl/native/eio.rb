#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/eina_file'
require 'efl/native/eet'
#
module Efl
    #
    module Eio
        #
        FCT_PREFIX = 'eio_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'eio.so.1'
        #
        # ENUMS
        # enum _Eio_File_Op {...} Eio_File_Op;
        enum :eio_file_op, [ :eio_file_copy, :eio_file_move, :eio_dir_copy, :eio_dir_move, :eio_unlink, :eio_file_getpwnam, :eio_file_getgrnam ]
        #
        # TYPEDEFS
        # typedef struct _Eio_Version Eio_Version;
        typedef :pointer, :eio_version
        # typedef struct _Eio_File Eio_File;
        typedef :pointer, :eio_file
        # typedef struct _Eio_Progress Eio_Progress;
        typedef :pointer, :eio_progress
        # typedef struct _Eio_Monitor Eio_Monitor;
        typedef :pointer, :eio_monitor
        # typedef struct _Eio_Monitor_Error Eio_Monitor_Error;
        typedef :pointer, :eio_monitor_error
        # typedef struct _Eio_Monitor_Event Eio_Monitor_Event;
        typedef :pointer, :eio_monitor_event
        #
        # CALLBACKS
        # typedef Eina_Bool (*Eio_Filter_Cb) (void *data, Eio_File *handler, const char *file);
        callback :eio_filter_cb, [ :pointer, :eio_file, :string ], :bool
        # typedef void (*Eio_Main_Cb) (void *data, Eio_File *handler, const char *file);
        callback :eio_main_cb, [ :pointer, :eio_file, :string ], :void
        # typedef Eina_Bool (*Eio_Filter_Direct_Cb) (void *data, Eio_File *handler, const Eina_File_Direct_Info *info);
        callback :eio_filter_direct_cb, [ :pointer, :eio_file, :eina_file_direct_info ], :bool
        # typedef Eina_Bool (*Eio_Filter_Dir_Cb) (void *data, Eio_File *handler, Eina_File_Direct_Info *info);
        callback :eio_filter_dir_cb, [ :pointer, :eio_file, :eina_file_direct_info ], :bool
        # typedef void (*Eio_Main_Direct_Cb) (void *data, Eio_File *handler, const Eina_File_Direct_Info *info);
        callback :eio_main_direct_cb, [ :pointer, :eio_file, :eina_file_direct_info ], :void
        # typedef void (*Eio_Stat_Cb) (void *data, Eio_File *handler, const Eina_Stat *stat);
        callback :eio_stat_cb, [ :pointer, :eio_file, :eina_stat ], :void
        # typedef void (*Eio_Progress_Cb) (void *data, Eio_File *handler, const Eio_Progress *info);
        callback :eio_progress_cb, [ :pointer, :eio_file, :eio_progress ], :void
        # typedef void (*Eio_Eet_Open_Cb) (void *data, Eio_File *handler, Eet_File *file);
        callback :eio_eet_open_cb, [ :pointer, :eio_file, :eet_file ], :void
        # typedef void (*Eio_Open_Cb) (void *data, Eio_File *handler, Eina_File *file);
        callback :eio_open_cb, [ :pointer, :eio_file, :eina_file ], :void
        # typedef Eina_Bool (*Eio_Filter_Map_Cb) (void *data, Eio_File *handler, void *map, size_t length);
        callback :eio_filter_map_cb, [ :pointer, :eio_file, :pointer, :ulong ], :bool
        # typedef void (*Eio_Map_Cb) (void *data, Eio_File *handler, void *map, size_t length);
        callback :eio_map_cb, [ :pointer, :eio_file, :pointer, :ulong ], :void
        # typedef void (*Eio_Done_Data_Cb) (void *data, Eio_File *handler, const char *read_data, unsigned int size);
        callback :eio_done_data_cb, [ :pointer, :eio_file, :string, :uint ], :void
        # typedef void (*Eio_Done_String_Cb) (void *data, Eio_File *handler, const char *xattr_string);
        callback :eio_done_string_cb, [ :pointer, :eio_file, :string ], :void
        # typedef void (*Eio_Done_Double_Cb) (void *data, Eio_File *handler, double xattr_double);
        callback :eio_done_double_cb, [ :pointer, :eio_file, :double ], :void
        # typedef void (*Eio_Done_Int_Cb) (void *data, Eio_File *handler, int i);
        callback :eio_done_int_cb, [ :pointer, :eio_file, :int ], :void
        # typedef void (*Eio_Done_ERead_Cb) (void *data, Eio_File *handler, void *decoded);
        callback :eio_done_eread_cb, [ :pointer, :eio_file, :pointer ], :void
        # typedef void (*Eio_Done_Read_Cb) (void *data, Eio_File *handler, void *read_data, unsigned int size);
        callback :eio_done_read_cb, [ :pointer, :eio_file, :pointer, :uint ], :void
        # typedef void (*Eio_Done_Cb) (void *data, Eio_File *handler);
        callback :eio_done_cb, [ :pointer, :eio_file ], :void
        # typedef void (*Eio_Error_Cb) (void *data, Eio_File *handler, int error);
        callback :eio_error_cb, [ :pointer, :eio_file, :int ], :void
        # typedef void (*Eio_Eet_Error_Cb) (void *data, Eio_File *handler, Eet_Error err);
        callback :eio_eet_error_cb, [ :pointer, :eio_file, :eet_error ], :void
        #
        # VARIABLES
        # EAPI extern Eio_Version *eio_version;
        attach_variable :eio_version, :eio_version
        # EAPI extern int EIO_MONITOR_FILE_CREATED;
        attach_variable :EIO_MONITOR_FILE_CREATED, :int
        # EAPI extern int EIO_MONITOR_FILE_DELETED;
        attach_variable :EIO_MONITOR_FILE_DELETED, :int
        # EAPI extern int EIO_MONITOR_FILE_MODIFIED;
        attach_variable :EIO_MONITOR_FILE_MODIFIED, :int
        # EAPI extern int EIO_MONITOR_FILE_CLOSED;
        attach_variable :EIO_MONITOR_FILE_CLOSED, :int
        # EAPI extern int EIO_MONITOR_DIRECTORY_CREATED;
        attach_variable :EIO_MONITOR_DIRECTORY_CREATED, :int
        # EAPI extern int EIO_MONITOR_DIRECTORY_DELETED;
        attach_variable :EIO_MONITOR_DIRECTORY_DELETED, :int
        # EAPI extern int EIO_MONITOR_DIRECTORY_MODIFIED;
        attach_variable :EIO_MONITOR_DIRECTORY_MODIFIED, :int
        # EAPI extern int EIO_MONITOR_DIRECTORY_CLOSED;
        attach_variable :EIO_MONITOR_DIRECTORY_CLOSED, :int
        # EAPI extern int EIO_MONITOR_SELF_RENAME;
        attach_variable :EIO_MONITOR_SELF_RENAME, :int
        # EAPI extern int EIO_MONITOR_SELF_DELETED;
        attach_variable :EIO_MONITOR_SELF_DELETED, :int
        # EAPI extern int EIO_MONITOR_ERROR;
        attach_variable :EIO_MONITOR_ERROR, :int
        #
        # FUNCTIONS
        fcts = [
        # EAPI Eio_File *eio_file_ls(const char *dir, Eio_Filter_Cb filter_cb, Eio_Main_Cb main_cb, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_ls, [ :string, :eio_filter_cb, :eio_main_cb, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_direct_ls(const char *dir, Eio_Filter_Direct_Cb filter_cb, Eio_Main_Direct_Cb main_cb, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_direct_ls, [ :string, :eio_filter_direct_cb, :eio_main_direct_cb, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_stat_ls(const char *dir, Eio_Filter_Direct_Cb filter_cb, Eio_Main_Direct_Cb main_cb, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_stat_ls, [ :string, :eio_filter_direct_cb, :eio_main_direct_cb, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_dir_stat_ls(const char *dir, Eio_Filter_Direct_Cb filter_cb, Eio_Main_Direct_Cb main_cb, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_dir_stat_ls, [ :string, :eio_filter_direct_cb, :eio_main_direct_cb, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_dir_direct_ls(const char *dir, Eio_Filter_Dir_Cb filter_cb, Eio_Main_Direct_Cb main_cb, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_dir_direct_ls, [ :string, :eio_filter_dir_cb, :eio_main_direct_cb, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_direct_stat(const char *path, Eio_Stat_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_direct_stat, [ :string, :eio_stat_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_chmod(const char *path, mode_t mode, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_chmod, [ :string, :int, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_chown(const char *path, const char *user, const char *group, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_chown, [ :string, :string, :string, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_unlink(const char *path, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_unlink, [ :string, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_mkdir(const char *path, mode_t mode, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_mkdir, [ :string, :int, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_move(const char *source, const char *dest, Eio_Progress_Cb progress_cb, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_move, [ :string, :string, :eio_progress_cb, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_copy(const char *source, const char *dest, Eio_Progress_Cb progress_cb, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_copy, [ :string, :string, :eio_progress_cb, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_dir_move(const char *source, const char *dest, Eio_Filter_Direct_Cb filter_cb, Eio_Progress_Cb progress_cb, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_dir_move, [ :string, :string, :eio_filter_direct_cb, :eio_progress_cb, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_dir_copy(const char *source, const char *dest, Eio_Filter_Direct_Cb filter_cb, Eio_Progress_Cb progress_cb, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_dir_copy, [ :string, :string, :eio_filter_direct_cb, :eio_progress_cb, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_dir_unlink(const char *path, Eio_Filter_Direct_Cb filter_cb, Eio_Progress_Cb progress_cb, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_dir_unlink, [ :string, :eio_filter_direct_cb, :eio_progress_cb, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_xattr(const char *path, Eio_Filter_Cb filter_cb, Eio_Main_Cb main_cb, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_xattr, [ :string, :eio_filter_cb, :eio_main_cb, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_xattr_int_set(const char *path, const char *attribute, int xattr_int, Eina_Xattr_Flags flags, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_xattr_int_set, [ :string, :string, :int, :eina_xattr_flags, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_xattr_double_set(const char *path, const char *attribute, double xattr_double, Eina_Xattr_Flags flags, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_xattr_double_set, [ :string, :string, :double, :eina_xattr_flags, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_xattr_string_set(const char *path, const char *attribute, const char *xattr_string, Eina_Xattr_Flags flags, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_xattr_string_set, [ :string, :string, :string, :eina_xattr_flags, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_xattr_set(const char *path, const char *attribute, const char *xattr_data, unsigned int xattr_size, Eina_Xattr_Flags flags, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_xattr_set, [ :string, :string, :string, :uint, :eina_xattr_flags, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_xattr_get(const char *path, const char *attribute, Eio_Done_Data_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_xattr_get, [ :string, :string, :eio_done_data_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_xattr_int_get(const char *path, const char *attribute, Eio_Done_Int_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_xattr_int_get, [ :string, :string, :eio_done_int_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_xattr_double_get(const char *path, const char *attribute, Eio_Done_Double_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_xattr_double_get, [ :string, :string, :eio_done_double_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_xattr_string_get(const char *path, const char *attribute, Eio_Done_String_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_xattr_string_get, [ :string, :string, :eio_done_string_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI int eio_init(void);
        [ :eio_init, [  ], :int ],
        # EAPI int eio_shutdown(void);
        [ :eio_shutdown, [  ], :int ],
        # EAPI void *eio_file_container_get(Eio_File *ls);
        [ :eio_file_container_get, [ :eio_file ], :pointer ],
        # EAPI Eina_Bool eio_file_cancel(Eio_File *ls);
        [ :eio_file_cancel, [ :eio_file ], :bool ],
        # EAPI Eina_Bool eio_file_check(Eio_File *ls);
        [ :eio_file_check, [ :eio_file ], :bool ],
        # EAPI Eina_Bool eio_file_associate_add(Eio_File *ls, const char *key, const void *data, Eina_Free_Cb free_cb);
        [ :eio_file_associate_add, [ :eio_file, :string, :pointer, :eina_free_cb ], :bool ],
        # EAPI Eina_Bool eio_file_associate_direct_add(Eio_File *ls, const char *key, const void *data, Eina_Free_Cb free_cb);
        [ :eio_file_associate_direct_add, [ :eio_file, :string, :pointer, :eina_free_cb ], :bool ],
        # EAPI void *eio_file_associate_find(Eio_File *ls, const char *key);
        [ :eio_file_associate_find, [ :eio_file, :string ], :pointer ],
        # EAPI Eio_File *eio_file_open(const char *name, Eina_Bool shared, Eio_Open_Cb open_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_open, [ :string, :bool, :eio_open_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_close(Eina_File *f, Eio_Done_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_close, [ :eina_file, :eio_done_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_map_all(Eina_File *f, Eina_File_Populate rule, Eio_Filter_Map_Cb filter_cb, Eio_Map_Cb map_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_map_all, [ :eina_file, :eina_file_populate, :eio_filter_map_cb, :eio_map_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_file_map_new(Eina_File *f, Eina_File_Populate rule, unsigned long int offset, unsigned long int length, Eio_Filter_Map_Cb filter_cb, Eio_Map_Cb map_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_file_map_new, [ :eina_file, :eina_file_populate, :ulong, :ulong, :eio_filter_map_cb, :eio_map_cb, :eio_error_cb, :pointer ], :eio_file
            ],
        # EAPI Eio_File *eio_eet_open(const char *filename, Eet_File_Mode mode, Eio_Eet_Open_Cb eet_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_eet_open, [ :string, :eet_file_mode, :eio_eet_open_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_eet_close(Eet_File *ef, Eio_Done_Cb done_cb, Eio_Eet_Error_Cb error_cb, const void *data);
        [ :eio_eet_close, [ :eet_file, :eio_done_cb, :eio_eet_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_eet_sync(Eet_File *ef, Eio_Done_Cb done_cb, Eio_Eet_Error_Cb error_cb, const void *data);
        [ :eio_eet_sync, [ :eet_file, :eio_done_cb, :eio_eet_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_eet_data_write_cipher(Eet_File *ef, Eet_Data_Descriptor *edd, const char *name, const char *cipher_key, void *write_data, int compress, Eio_Done_Int_Cb done_cb, Eio_Error_Cb error_cb, const void *user_data);
        [ :eio_eet_data_write_cipher, [ :eet_file, :eet_data_descriptor, :string, :string, :pointer, :int, :eio_done_int_cb, :eio_error_cb, :pointer
            ], :eio_file ],
        # EAPI Eio_File *eio_eet_data_read_cipher(Eet_File *ef, Eet_Data_Descriptor *edd, const char *name, const char *cipher_key, Eio_Done_ERead_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_eet_data_read_cipher, [ :eet_file, :eet_data_descriptor, :string, :string, :eio_done_eread_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_eet_data_image_write_cipher(Eet_File *ef, const char *name, const char *cipher_key, void *write_data, unsigned int w, unsigned int h, int alpha, int compress, int quality, int lossy, Eio_Done_Int_Cb done_cb, Eio_Error_Cb error_cb, const void *user_data);
        [ :eio_eet_data_image_write_cipher, [ :eet_file, :string, :string, :pointer, :uint, :uint, :int, :int, :int, :int, :eio_done_int_cb,
            :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_eet_read_direct(Eet_File *ef, const char *name, Eio_Done_Data_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_eet_read_direct, [ :eet_file, :string, :eio_done_data_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_eet_read_cipher(Eet_File *ef, const char *name, const char *cipher_key, Eio_Done_Read_Cb done_cb, Eio_Error_Cb error_cb, const void *data);
        [ :eio_eet_read_cipher, [ :eet_file, :string, :string, :eio_done_read_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_File *eio_eet_write_cipher(Eet_File *ef, const char *name, void *write_data, int size, int compress, const char *cipher_key, Eio_Done_Int_Cb done_cb, Eio_Error_Cb error_cb, const void *user_data);
        [ :eio_eet_write_cipher, [ :eet_file, :string, :pointer, :int, :int, :string, :eio_done_int_cb, :eio_error_cb, :pointer ], :eio_file ],
        # EAPI Eio_Monitor *eio_monitor_add(const char *path);
        [ :eio_monitor_add, [ :string ], :eio_monitor ],
        # EAPI Eio_Monitor *eio_monitor_stringshared_add(const char *path);
        [ :eio_monitor_stringshared_add, [ :string ], :eio_monitor ],
        # EAPI void eio_monitor_del(Eio_Monitor *monitor);
        [ :eio_monitor_del, [ :eio_monitor ], :void ],
        # EAPI const char *eio_monitor_path_get(Eio_Monitor *monitor);
        [ :eio_monitor_path_get, [ :eio_monitor ], :string ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
