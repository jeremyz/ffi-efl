#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi'
#
module Efl
    #
    module Ecorefile
        def self.method_missing m, *args, &block
            return Efl::API.send 'ecore_file_'+m.to_s, *args, &block
        end
    end
    #
    module API
        #
        #
        ffi_lib 'ecore'
        #
        # ENUMS
        # typedef enum _Ecore_File_Event {...} Ecore_File_Event;
        enum :ecore_file_event, [ :ecore_file_event_none, :ecore_file_event_created_file, :ecore_file_event_created_directory,
            :ecore_file_event_deleted_file, :ecore_file_event_deleted_directory, :ecore_file_event_deleted_self, :ecore_file_event_modified,
            :ecore_file_event_closed ]
        # typedef enum _Ecore_File_Progress_Return {...} Ecore_File_Progress_Return;
        enum :ecore_file_progress_return, [ :ecore_file_progress_continue, 0, :ecore_file_progress_abort, 1 ]
        #
        # TYPEDEFS
        # typedef struct _Ecore_File_Monitor Ecore_File_Monitor;
        typedef :pointer, :ecore_file_monitor
        typedef :pointer, :ecore_file_monitor_p
        # typedef struct _Ecore_File_Download_Job Ecore_File_Download_Job;
        typedef :pointer, :ecore_file_download_job
        typedef :pointer, :ecore_file_download_job_p
        typedef :pointer, :ecore_file_download_job_pp
        #
        # CALLBACKS
        # typedef void (*Ecore_File_Monitor_Cb) (void *data, Ecore_File_Monitor *em, Ecore_File_Event event, const char *path);
        callback :ecore_file_monitor_cb, [ :void_p, :ecore_file_monitor_p, :ecore_file_event, :string ], :void
        # typedef void (*Ecore_File_Download_Completion_Cb) (void *data, const char *file, int status);
        callback :ecore_file_download_completion_cb, [ :void_p, :string, :int ], :void
        # typedef int (*Ecore_File_Download_Progress_Cb) (void *data, const char *file, long int dltotal, long int dlnow, long int ultotal, long int ulnow);
        callback :ecore_file_download_progress_cb, [ :void_p, :string, :long, :long, :long, :long ], :int
        #
        # FUNCTIONS
        fcts = [
        # EAPI int ecore_file_init (void);
        [ :ecore_file_init, [  ], :int ],
        # EAPI int ecore_file_shutdown (void);
        [ :ecore_file_shutdown, [  ], :int ],
        # EAPI long long ecore_file_mod_time (const char *file);
        [ :ecore_file_mod_time, [ :string ], :long_long ],
        # EAPI long long ecore_file_size (const char *file);
        [ :ecore_file_size, [ :string ], :long_long ],
        # EAPI Eina_Bool ecore_file_exists (const char *file);
        [ :ecore_file_exists, [ :string ], :eina_bool ],
        # EAPI Eina_Bool ecore_file_is_dir (const char *file);
        [ :ecore_file_is_dir, [ :string ], :eina_bool ],
        # EAPI Eina_Bool ecore_file_mkdir (const char *dir);
        [ :ecore_file_mkdir, [ :string ], :eina_bool ],
        # EAPI int ecore_file_mkdirs (const char **dirs);
        [ :ecore_file_mkdirs, [ :string_array ], :int ],
        # EAPI int ecore_file_mksubdirs (const char *base, const char **subdirs);
        [ :ecore_file_mksubdirs, [ :string, :string_array ], :int ],
        # EAPI Eina_Bool ecore_file_rmdir (const char *dir);
        [ :ecore_file_rmdir, [ :string ], :eina_bool ],
        # EAPI Eina_Bool ecore_file_recursive_rm (const char *dir);
        [ :ecore_file_recursive_rm, [ :string ], :eina_bool ],
        # EAPI Eina_Bool ecore_file_mkpath (const char *path);
        [ :ecore_file_mkpath, [ :string ], :eina_bool ],
        # EAPI int ecore_file_mkpaths (const char **paths);
        [ :ecore_file_mkpaths, [ :string_array ], :int ],
        # EAPI Eina_Bool ecore_file_cp (const char *src, const char *dst);
        [ :ecore_file_cp, [ :string, :string ], :eina_bool ],
        # EAPI Eina_Bool ecore_file_mv (const char *src, const char *dst);
        [ :ecore_file_mv, [ :string, :string ], :eina_bool ],
        # EAPI Eina_Bool ecore_file_symlink (const char *src, const char *dest);
        [ :ecore_file_symlink, [ :string, :string ], :eina_bool ],
        # EAPI char *ecore_file_realpath (const char *file);
        [ :ecore_file_realpath, [ :string ], :string ],
        # EAPI Eina_Bool ecore_file_unlink (const char *file);
        [ :ecore_file_unlink, [ :string ], :eina_bool ],
        # EAPI Eina_Bool ecore_file_remove (const char *file);
        [ :ecore_file_remove, [ :string ], :eina_bool ],
        # EAPI const char *ecore_file_file_get (const char *path);
        [ :ecore_file_file_get, [ :string ], :string ],
        # EAPI char *ecore_file_dir_get (const char *path);
        [ :ecore_file_dir_get, [ :string ], :string ],
        # EAPI Eina_Bool ecore_file_can_read (const char *file);
        [ :ecore_file_can_read, [ :string ], :eina_bool ],
        # EAPI Eina_Bool ecore_file_can_write (const char *file);
        [ :ecore_file_can_write, [ :string ], :eina_bool ],
        # EAPI Eina_Bool ecore_file_can_exec (const char *file);
        [ :ecore_file_can_exec, [ :string ], :eina_bool ],
        # EAPI char *ecore_file_readlink (const char *link);
        [ :ecore_file_readlink, [ :string ], :string ],
        # EAPI Eina_List *ecore_file_ls (const char *dir);
        [ :ecore_file_ls, [ :string ], :eina_list_p ],
        # EAPI Eina_Iterator *ecore_file_ls_iterator (const char *dir);
        [ :ecore_file_ls_iterator, [ :string ], :eina_iterator_p ],
        # EAPI char *ecore_file_app_exe_get (const char *app);
        [ :ecore_file_app_exe_get, [ :string ], :string ],
        # EAPI char *ecore_file_escape_name (const char *filename);
        [ :ecore_file_escape_name, [ :string ], :string ],
        # EAPI char *ecore_file_strip_ext (const char *file);
        [ :ecore_file_strip_ext, [ :string ], :string ],
        # EAPI int ecore_file_dir_is_empty (const char *dir);
        [ :ecore_file_dir_is_empty, [ :string ], :int ],
        # EAPI Ecore_File_Monitor *ecore_file_monitor_add(const char *path, Ecore_File_Monitor_Cb func, void *data);
        [ :ecore_file_monitor_add, [ :string, :ecore_file_monitor_cb, :void_p ], :ecore_file_monitor_p ],
        # EAPI void ecore_file_monitor_del(Ecore_File_Monitor *ecore_file_monitor);
        [ :ecore_file_monitor_del, [ :ecore_file_monitor_p ], :void ],
        # EAPI const char *ecore_file_monitor_path_get(Ecore_File_Monitor *ecore_file_monitor);
        [ :ecore_file_monitor_path_get, [ :ecore_file_monitor_p ], :string ],
        # EAPI Eina_Bool ecore_file_path_dir_exists(const char *in_dir);
        [ :ecore_file_path_dir_exists, [ :string ], :eina_bool ],
        # EAPI Eina_Bool ecore_file_app_installed(const char *exe);
        [ :ecore_file_app_installed, [ :string ], :eina_bool ],
        # EAPI Eina_List *ecore_file_app_list(void);
        [ :ecore_file_app_list, [  ], :eina_list_p ],
        # EAPI Eina_Bool ecore_file_download(const char *url, const char *dst, Ecore_File_Download_Completion_Cb completion_cb, Ecore_File_Download_Progress_Cb progress_cb, void *data, Ecore_File_Download_Job **job_ret);
        [ :ecore_file_download, [ :string, :string, :ecore_file_download_completion_cb, :ecore_file_download_progress_cb, :void_p,
            :ecore_file_download_job_pp ], :eina_bool ],
        # EAPI Eina_Bool ecore_file_download_full(const char *url, const char *dst, Ecore_File_Download_Completion_Cb completion_cb, Ecore_File_Download_Progress_Cb progress_cb, void *data, Ecore_File_Download_Job **job_ret, Eina_Hash *headers);
        [ :ecore_file_download_full, [ :string, :string, :ecore_file_download_completion_cb, :ecore_file_download_progress_cb, :void_p,
            :ecore_file_download_job_pp, :eina_hash_p ], :eina_bool ],
        # EAPI void ecore_file_download_abort_all(void);
        [ :ecore_file_download_abort_all, [  ], :void ],
        # EAPI void ecore_file_download_abort(Ecore_File_Download_Job *job);
        [ :ecore_file_download_abort, [ :ecore_file_download_job_p ], :void ],
        # EAPI Eina_Bool ecore_file_download_protocol_available(const char *protocol);
        [ :ecore_file_download_protocol_available, [ :string ], :eina_bool ],
        ]
        #
        attach_fcts fcts
    end
end
#
# EOF
