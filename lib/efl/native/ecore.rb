#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi'
#
module Efl
    #
    module Ecore
        #
        FCT_PREFIX = 'ecore_'
        #
        def self.method_missing m, *args, &block
            sym, args_s = ModuleHelper.find_function m, FCT_PREFIX
            self.module_eval "def self.#{m} *args, &block; r=Efl::Native.#{sym}(#{args_s}); yield r if block_given?; r; end"
            self.send m, *args, &block
        end
        #
    end
    #
    module Native
        #
        extend Efl::FFIHelper
        #
        ffi_lib 'ecore'
        #
        # ENUMS
        #
        # TYPEDEFS
        # typedef struct _Ecore_Version Ecore_Version;
        typedef :pointer, :ecore_version
        typedef :pointer, :ecore_version_p
        # typedef enum _Ecore_Fd_Handler_Flags Ecore_Fd_Handler_Flags;
        typedef :pointer, :ecore_fd_handler_flags
        # typedef enum _Ecore_Exe_Flags Ecore_Exe_Flags;
        typedef :pointer, :ecore_exe_flags
        # typedef enum _Ecore_Exe_Win32_Priority Ecore_Exe_Win32_Priority;
        typedef :pointer, :ecore_exe_win32_priority
        # typedef enum _Ecore_Poller_Type Ecore_Poller_Type;
        typedef :pointer, :ecore_poller_type
        # typedef enum _Ecore_Pos_Map Ecore_Pos_Map;
        typedef :pointer, :ecore_pos_map
        # typedef enum _Ecore_Animator_Source Ecore_Animator_Source;
        typedef :pointer, :ecore_animator_source
        # typedef struct _Ecore_Exe Ecore_Exe;
        typedef :pointer, :ecore_exe
        typedef :pointer, :ecore_exe_p
        # typedef struct _Ecore_Timer Ecore_Timer;
        typedef :pointer, :ecore_timer
        typedef :pointer, :ecore_timer_p
        # typedef struct _Ecore_Idler Ecore_Idler;
        typedef :pointer, :ecore_idler
        typedef :pointer, :ecore_idler_p
        # typedef struct _Ecore_Idle_Enterer Ecore_Idle_Enterer;
        typedef :pointer, :ecore_idle_enterer
        typedef :pointer, :ecore_idle_enterer_p
        # typedef struct _Ecore_Idle_Exiter Ecore_Idle_Exiter;
        typedef :pointer, :ecore_idle_exiter
        typedef :pointer, :ecore_idle_exiter_p
        # typedef struct _Ecore_Fd_Handler Ecore_Fd_Handler;
        typedef :pointer, :ecore_fd_handler
        typedef :pointer, :ecore_fd_handler_p
        # typedef struct _Ecore_Win32_Handler Ecore_Win32_Handler;
        typedef :pointer, :ecore_win32_handler
        typedef :pointer, :ecore_win32_handler_p
        # typedef struct _Ecore_Event_Handler Ecore_Event_Handler;
        typedef :pointer, :ecore_event_handler
        typedef :pointer, :ecore_event_handler_p
        # typedef struct _Ecore_Event_Filter Ecore_Event_Filter;
        typedef :pointer, :ecore_event_filter
        typedef :pointer, :ecore_event_filter_p
        # typedef struct _Ecore_Event Ecore_Event;
        typedef :pointer, :ecore_event
        typedef :pointer, :ecore_event_p
        # typedef struct _Ecore_Animator Ecore_Animator;
        typedef :pointer, :ecore_animator
        typedef :pointer, :ecore_animator_p
        # typedef struct _Ecore_Pipe Ecore_Pipe;
        typedef :pointer, :ecore_pipe
        typedef :pointer, :ecore_pipe_p
        # typedef struct _Ecore_Poller Ecore_Poller;
        typedef :pointer, :ecore_poller
        typedef :pointer, :ecore_poller_p
        # typedef struct _Ecore_Event_Signal_User Ecore_Event_Signal_User;
        typedef :pointer, :ecore_event_signal_user
        # typedef struct _Ecore_Event_Signal_Hup Ecore_Event_Signal_Hup;
        typedef :pointer, :ecore_event_signal_hup
        # typedef struct _Ecore_Event_Signal_Exit Ecore_Event_Signal_Exit;
        typedef :pointer, :ecore_event_signal_exit
        # typedef struct _Ecore_Event_Signal_Power Ecore_Event_Signal_Power;
        typedef :pointer, :ecore_event_signal_power
        # typedef struct _Ecore_Event_Signal_Realtime Ecore_Event_Signal_Realtime;
        typedef :pointer, :ecore_event_signal_realtime
        # typedef struct _Ecore_Exe_Event_Add Ecore_Exe_Event_Add;
        typedef :pointer, :ecore_exe_event_add
        # typedef struct _Ecore_Exe_Event_Del Ecore_Exe_Event_Del;
        typedef :pointer, :ecore_exe_event_del
        # typedef struct _Ecore_Exe_Event_Data_Line Ecore_Exe_Event_Data_Line;
        typedef :pointer, :ecore_exe_event_data_line
        # typedef struct _Ecore_Exe_Event_Data Ecore_Exe_Event_Data;
        typedef :pointer, :ecore_exe_event_data
        typedef :pointer, :ecore_exe_event_data_p
        # typedef struct _Ecore_Thread Ecore_Thread;
        typedef :pointer, :ecore_thread
        typedef :pointer, :ecore_thread_p
        # typedef struct _Ecore_Job Ecore_Job;
        typedef :pointer, :ecore_job
        typedef :pointer, :ecore_job_p
        #
        # CALLBACKS
        # typedef void *(*Ecore_Data_Cb) (void *data);
        callback :ecore_data_cb, [ :void_p ], :void_p
        # typedef Eina_Bool (*Ecore_Filter_Cb) (void *data, void *loop_data, int type, void *event);
        callback :ecore_filter_cb, [ :void_p, :void_p, :int, :void_p ], :eina_bool
        # typedef int (*Ecore_Select_Function) (int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout);
        callback :ecore_select_function, [ :int, :pointer, :pointer, :pointer, :pointer ], :int
        # typedef void (*Ecore_End_Cb) (void *user_data, void *func_data);
        callback :ecore_end_cb, [ :void_p, :void_p ], :void
        # typedef void (*Ecore_Pipe_Cb) (void *data, void *buffer, unsigned int nbyte);
        callback :ecore_pipe_cb, [ :void_p, :void_p, :uint ], :void
        # typedef void (*Ecore_Exe_Cb) (void *data, const Ecore_Exe *exe);
        callback :ecore_exe_cb, [ :void_p, :ecore_exe_p ], :void
        # typedef Eina_Bool (*Ecore_Event_Handler_Cb) (void *data, int type, void *event);
        callback :ecore_event_handler_cb, [ :void_p, :int, :void_p ], :eina_bool
        # typedef void (*Ecore_Thread_Cb) (void *data, Ecore_Thread *thread);
        callback :ecore_thread_cb, [ :void_p, :ecore_thread_p ], :void
        # typedef void (*Ecore_Thread_Notify_Cb) (void *data, Ecore_Thread *thread, void *msg_data);
        callback :ecore_thread_notify_cb, [ :void_p, :ecore_thread_p, :void_p ], :void
        # typedef Eina_Bool (*Ecore_Task_Cb) (void *data);
        callback :ecore_task_cb, [ :void_p ], :eina_bool
        # typedef Eina_Bool (*Ecore_Timeline_Cb) (void *data, double pos);
        callback :ecore_timeline_cb, [ :void_p, :double ], :eina_bool
        # typedef void (*Ecore_Cb) (void *data);
        callback :ecore_cb, [ :void_p ], :void
        # typedef Eina_Bool (*Ecore_Fd_Cb) (void *data, Ecore_Fd_Handler *fd_handler);
        callback :ecore_fd_cb, [ :void_p, :ecore_fd_handler_p ], :eina_bool
        # typedef void (*Ecore_Fd_Prep_Cb) (void *data, Ecore_Fd_Handler *fd_handler);
        callback :ecore_fd_prep_cb, [ :void_p, :ecore_fd_handler_p ], :void
        # typedef Eina_Bool (*Ecore_Win32_Handle_Cb) (void *data, Ecore_Win32_Handler *wh);
        callback :ecore_win32_handle_cb, [ :void_p, :ecore_win32_handler_p ], :eina_bool
        #
        # VARIABLES
        # EAPI extern Ecore_Version *ecore_version;
        attach_variable :ecore_version, :ecore_version_p
        # EAPI extern int ECORE_EXE_EVENT_ADD;
        attach_variable :ECORE_EXE_EVENT_ADD, :int
        # EAPI extern int ECORE_EXE_EVENT_DEL;
        attach_variable :ECORE_EXE_EVENT_DEL, :int
        # EAPI extern int ECORE_EXE_EVENT_DATA;
        attach_variable :ECORE_EXE_EVENT_DATA, :int
        # EAPI extern int ECORE_EXE_EVENT_ERROR;
        attach_variable :ECORE_EXE_EVENT_ERROR, :int
        #
        # FUNCTIONS
        fcts = [
        # EAPI int ecore_init(void);
        [ :ecore_init, [  ], :int ],
        # EAPI int ecore_shutdown(void);
        [ :ecore_shutdown, [  ], :int ],
        # EAPI void ecore_app_args_set(int argc, const char **argv);
        [ :ecore_app_args_set, [ :int, :string_array ], :void ],
        # EAPI void ecore_app_args_get(int *argc, char ***argv);
        [ :ecore_app_args_get, [ :int_p, :string_array_p ], :void ],
        # EAPI void ecore_app_restart(void);
        [ :ecore_app_restart, [  ], :void ],
        # EAPI Ecore_Event_Handler *ecore_event_handler_add(int type, Ecore_Event_Handler_Cb func, const void *data);
        [ :ecore_event_handler_add, [ :int, :ecore_event_handler_cb, :void_p ], :ecore_event_handler_p ],
        # EAPI void *ecore_event_handler_del(Ecore_Event_Handler *event_handler);
        [ :ecore_event_handler_del, [ :ecore_event_handler_p ], :void_p ],
        # EAPI Ecore_Event *ecore_event_add(int type, void *ev, Ecore_End_Cb func_free, void *data);
        [ :ecore_event_add, [ :int, :void_p, :ecore_end_cb, :void_p ], :ecore_event_p ],
        # EAPI void *ecore_event_del(Ecore_Event *event);
        [ :ecore_event_del, [ :ecore_event_p ], :void_p ],
        # EAPI void *ecore_event_handler_data_get(Ecore_Event_Handler *eh);
        [ :ecore_event_handler_data_get, [ :ecore_event_handler_p ], :void_p ],
        # EAPI void *ecore_event_handler_data_set(Ecore_Event_Handler *eh, void *data);
        [ :ecore_event_handler_data_set, [ :ecore_event_handler_p, :void_p ], :void_p ],
        # EAPI int ecore_event_type_new(void);
        [ :ecore_event_type_new, [  ], :int ],
        # EAPI Ecore_Event_Filter *ecore_event_filter_add(Ecore_Data_Cb func_start, Ecore_Filter_Cb func_filter, Ecore_End_Cb func_end, const void *data);
        [ :ecore_event_filter_add, [ :ecore_data_cb, :ecore_filter_cb, :ecore_end_cb, :void_p ], :ecore_event_filter_p ],
        # EAPI void *ecore_event_filter_del(Ecore_Event_Filter *ef);
        [ :ecore_event_filter_del, [ :ecore_event_filter_p ], :void_p ],
        # EAPI int ecore_event_current_type_get(void);
        [ :ecore_event_current_type_get, [  ], :int ],
        # EAPI void *ecore_event_current_event_get(void);
        [ :ecore_event_current_event_get, [  ], :void_p ],
        # EAPI void ecore_exe_run_priority_set(int pri);
        [ :ecore_exe_run_priority_set, [ :int ], :void ],
        # EAPI int ecore_exe_run_priority_get(void);
        [ :ecore_exe_run_priority_get, [  ], :int ],
        # EAPI Ecore_Exe *ecore_exe_run(const char *exe_cmd, const void *data);
        [ :ecore_exe_run, [ :string, :void_p ], :ecore_exe_p ],
        # EAPI Ecore_Exe *ecore_exe_pipe_run(const char *exe_cmd, Ecore_Exe_Flags flags, const void *data);
        [ :ecore_exe_pipe_run, [ :string, :ecore_exe_flags, :void_p ], :ecore_exe_p ],
        # EAPI void ecore_exe_callback_pre_free_set(Ecore_Exe *exe, Ecore_Exe_Cb func);
        [ :ecore_exe_callback_pre_free_set, [ :ecore_exe_p, :ecore_exe_cb ], :void ],
        # EAPI Eina_Bool ecore_exe_send(Ecore_Exe *exe, const void *data, int size);
        [ :ecore_exe_send, [ :ecore_exe_p, :void_p, :int ], :eina_bool ],
        # EAPI void ecore_exe_close_stdin(Ecore_Exe *exe);
        [ :ecore_exe_close_stdin, [ :ecore_exe_p ], :void ],
        # EAPI void ecore_exe_auto_limits_set(Ecore_Exe *exe, int start_bytes, int end_bytes, int start_lines, int end_lines);
        [ :ecore_exe_auto_limits_set, [ :ecore_exe_p, :int, :int, :int, :int ], :void ],
        # EAPI Ecore_Exe_Event_Data *ecore_exe_event_data_get(Ecore_Exe *exe, Ecore_Exe_Flags flags);
        [ :ecore_exe_event_data_get, [ :ecore_exe_p, :ecore_exe_flags ], :ecore_exe_event_data_p ],
        # EAPI void ecore_exe_event_data_free(Ecore_Exe_Event_Data *data);
        [ :ecore_exe_event_data_free, [ :ecore_exe_event_data_p ], :void ],
        # EAPI void *ecore_exe_free(Ecore_Exe *exe);
        [ :ecore_exe_free, [ :ecore_exe_p ], :void_p ],
        # EAPI pid_t ecore_exe_pid_get(const Ecore_Exe *exe);
        [ :ecore_exe_pid_get, [ :ecore_exe_p ], :ulong ],
        # EAPI void ecore_exe_tag_set(Ecore_Exe *exe, const char *tag);
        [ :ecore_exe_tag_set, [ :ecore_exe_p, :string ], :void ],
        # EAPI const char *ecore_exe_tag_get(const Ecore_Exe *exe);
        [ :ecore_exe_tag_get, [ :ecore_exe_p ], :string ],
        # EAPI const char *ecore_exe_cmd_get(const Ecore_Exe *exe);
        [ :ecore_exe_cmd_get, [ :ecore_exe_p ], :string ],
        # EAPI void *ecore_exe_data_get(const Ecore_Exe *exe);
        [ :ecore_exe_data_get, [ :ecore_exe_p ], :void_p ],
        # EAPI void *ecore_exe_data_set(Ecore_Exe *exe, void *data);
        [ :ecore_exe_data_set, [ :ecore_exe_p, :void_p ], :void_p ],
        # EAPI Ecore_Exe_Flags ecore_exe_flags_get(const Ecore_Exe *exe);
        [ :ecore_exe_flags_get, [ :ecore_exe_p ], :ecore_exe_flags ],
        # EAPI void ecore_exe_pause(Ecore_Exe *exe);
        [ :ecore_exe_pause, [ :ecore_exe_p ], :void ],
        # EAPI void ecore_exe_continue(Ecore_Exe *exe);
        [ :ecore_exe_continue, [ :ecore_exe_p ], :void ],
        # EAPI void ecore_exe_interrupt(Ecore_Exe *exe);
        [ :ecore_exe_interrupt, [ :ecore_exe_p ], :void ],
        # EAPI void ecore_exe_quit(Ecore_Exe *exe);
        [ :ecore_exe_quit, [ :ecore_exe_p ], :void ],
        # EAPI void ecore_exe_terminate(Ecore_Exe *exe);
        [ :ecore_exe_terminate, [ :ecore_exe_p ], :void ],
        # EAPI void ecore_exe_kill(Ecore_Exe *exe);
        [ :ecore_exe_kill, [ :ecore_exe_p ], :void ],
        # EAPI void ecore_exe_signal(Ecore_Exe *exe, int num);
        [ :ecore_exe_signal, [ :ecore_exe_p, :int ], :void ],
        # EAPI void ecore_exe_hup(Ecore_Exe *exe);
        [ :ecore_exe_hup, [ :ecore_exe_p ], :void ],
        # EAPI Ecore_Idler *ecore_idler_add(Ecore_Task_Cb func, const void *data);
        [ :ecore_idler_add, [ :ecore_task_cb, :void_p ], :ecore_idler_p ],
        # EAPI void *ecore_idler_del(Ecore_Idler *idler);
        [ :ecore_idler_del, [ :ecore_idler_p ], :void_p ],
        # EAPI Ecore_Idle_Enterer *ecore_idle_enterer_add(Ecore_Task_Cb func, const void *data);
        [ :ecore_idle_enterer_add, [ :ecore_task_cb, :void_p ], :ecore_idle_enterer_p ],
        # EAPI Ecore_Idle_Enterer *ecore_idle_enterer_before_add(Ecore_Task_Cb func, const void *data);
        [ :ecore_idle_enterer_before_add, [ :ecore_task_cb, :void_p ], :ecore_idle_enterer_p ],
        # EAPI void *ecore_idle_enterer_del(Ecore_Idle_Enterer *idle_enterer);
        [ :ecore_idle_enterer_del, [ :ecore_idle_enterer_p ], :void_p ],
        # EAPI Ecore_Idle_Exiter *ecore_idle_exiter_add(Ecore_Task_Cb func, const void *data);
        [ :ecore_idle_exiter_add, [ :ecore_task_cb, :void_p ], :ecore_idle_exiter_p ],
        # EAPI void *ecore_idle_exiter_del(Ecore_Idle_Exiter *idle_exiter);
        [ :ecore_idle_exiter_del, [ :ecore_idle_exiter_p ], :void_p ],
        # EAPI void ecore_main_loop_iterate(void);
        [ :ecore_main_loop_iterate, [  ], :void ],
        # EAPI void ecore_main_loop_select_func_set(Ecore_Select_Function func);
        [ :ecore_main_loop_select_func_set, [ :ecore_select_function ], :void ],
        # EAPI Ecore_Select_Function ecore_main_loop_select_func_get(void);
        [ :ecore_main_loop_select_func_get, [  ], :ecore_select_function ],
        # EAPI Eina_Bool ecore_main_loop_glib_integrate(void);
        [ :ecore_main_loop_glib_integrate, [  ], :eina_bool ],
        # EAPI void ecore_main_loop_glib_always_integrate_disable(void);
        [ :ecore_main_loop_glib_always_integrate_disable, [  ], :void ],
        # EAPI void ecore_main_loop_begin(void);
        [ :ecore_main_loop_begin, [  ], :void ],
        # EAPI void ecore_main_loop_quit(void);
        [ :ecore_main_loop_quit, [  ], :void ],
        # EAPI Ecore_Fd_Handler *ecore_main_fd_handler_add(int fd, Ecore_Fd_Handler_Flags flags, Ecore_Fd_Cb func, const void *data, Ecore_Fd_Cb buf_func, const void *buf_data);
        [ :ecore_main_fd_handler_add, [ :int, :ecore_fd_handler_flags, :ecore_fd_cb, :void_p, :ecore_fd_cb, :void_p ], :ecore_fd_handler_p ],
        # EAPI void ecore_main_fd_handler_prepare_callback_set(Ecore_Fd_Handler *fd_handler, Ecore_Fd_Prep_Cb func, const void *data);
        [ :ecore_main_fd_handler_prepare_callback_set, [ :ecore_fd_handler_p, :ecore_fd_prep_cb, :void_p ], :void ],
        # EAPI void *ecore_main_fd_handler_del(Ecore_Fd_Handler *fd_handler);
        [ :ecore_main_fd_handler_del, [ :ecore_fd_handler_p ], :void_p ],
        # EAPI int ecore_main_fd_handler_fd_get(Ecore_Fd_Handler *fd_handler);
        [ :ecore_main_fd_handler_fd_get, [ :ecore_fd_handler_p ], :int ],
        # EAPI Eina_Bool ecore_main_fd_handler_active_get(Ecore_Fd_Handler *fd_handler, Ecore_Fd_Handler_Flags flags);
        [ :ecore_main_fd_handler_active_get, [ :ecore_fd_handler_p, :ecore_fd_handler_flags ], :eina_bool ],
        # EAPI void ecore_main_fd_handler_active_set(Ecore_Fd_Handler *fd_handler, Ecore_Fd_Handler_Flags flags);
        [ :ecore_main_fd_handler_active_set, [ :ecore_fd_handler_p, :ecore_fd_handler_flags ], :void ],
        # EAPI Ecore_Win32_Handler *ecore_main_win32_handler_add(void *h, Ecore_Win32_Handle_Cb func, const void *data);
        [ :ecore_main_win32_handler_add, [ :void_p, :ecore_win32_handle_cb, :void_p ], :ecore_win32_handler_p ],
        # EAPI void *ecore_main_win32_handler_del(Ecore_Win32_Handler *win32_handler);
        [ :ecore_main_win32_handler_del, [ :ecore_win32_handler_p ], :void_p ],
        # EAPI Ecore_Pipe *ecore_pipe_add(Ecore_Pipe_Cb handler, const void *data);
        [ :ecore_pipe_add, [ :ecore_pipe_cb, :void_p ], :ecore_pipe_p ],
        # EAPI void *ecore_pipe_del(Ecore_Pipe *p);
        [ :ecore_pipe_del, [ :ecore_pipe_p ], :void_p ],
        # EAPI Eina_Bool ecore_pipe_write(Ecore_Pipe *p, const void *buffer, unsigned int nbytes);
        [ :ecore_pipe_write, [ :ecore_pipe_p, :void_p, :uint ], :eina_bool ],
        # EAPI void ecore_pipe_write_close(Ecore_Pipe *p);
        [ :ecore_pipe_write_close, [ :ecore_pipe_p ], :void ],
        # EAPI void ecore_pipe_read_close(Ecore_Pipe *p);
        [ :ecore_pipe_read_close, [ :ecore_pipe_p ], :void ],
        # EAPI void ecore_pipe_thaw(Ecore_Pipe *p);
        [ :ecore_pipe_thaw, [ :ecore_pipe_p ], :void ],
        # EAPI void ecore_pipe_freeze(Ecore_Pipe *p);
        [ :ecore_pipe_freeze, [ :ecore_pipe_p ], :void ],
        # EAPI int ecore_pipe_wait(Ecore_Pipe *p, int message_count, double wait);
        [ :ecore_pipe_wait, [ :ecore_pipe_p, :int, :double ], :int ],
        # EAPI Ecore_Thread *ecore_thread_run(Ecore_Thread_Cb func_blocking, Ecore_Thread_Cb func_end, Ecore_Thread_Cb func_cancel, const void *data);
        [ :ecore_thread_run, [ :ecore_thread_cb, :ecore_thread_cb, :ecore_thread_cb, :void_p ], :ecore_thread_p ],
        # EAPI Ecore_Thread *ecore_thread_feedback_run(Ecore_Thread_Cb func_heavy, Ecore_Thread_Notify_Cb func_notify, Ecore_Thread_Cb func_end, Ecore_Thread_Cb func_cancel, const void *data, Eina_Bool try_no_queue);
        [ :ecore_thread_feedback_run, [ :ecore_thread_cb, :ecore_thread_notify_cb, :ecore_thread_cb, :ecore_thread_cb, :void_p, :eina_bool ], :ecore_thread_p ],
        # EAPI Eina_Bool ecore_thread_cancel(Ecore_Thread *thread);
        [ :ecore_thread_cancel, [ :ecore_thread_p ], :eina_bool ],
        # EAPI Eina_Bool ecore_thread_check(Ecore_Thread *thread);
        [ :ecore_thread_check, [ :ecore_thread_p ], :eina_bool ],
        # EAPI Eina_Bool ecore_thread_feedback(Ecore_Thread *thread, const void *msg_data);
        [ :ecore_thread_feedback, [ :ecore_thread_p, :void_p ], :eina_bool ],
        # EAPI Eina_Bool ecore_thread_reschedule(Ecore_Thread *thread);
        [ :ecore_thread_reschedule, [ :ecore_thread_p ], :eina_bool ],
        # EAPI int ecore_thread_active_get(void);
        [ :ecore_thread_active_get, [  ], :int ],
        # EAPI int ecore_thread_pending_get(void);
        [ :ecore_thread_pending_get, [  ], :int ],
        # EAPI int ecore_thread_pending_feedback_get(void);
        [ :ecore_thread_pending_feedback_get, [  ], :int ],
        # EAPI int ecore_thread_pending_total_get(void);
        [ :ecore_thread_pending_total_get, [  ], :int ],
        # EAPI int ecore_thread_max_get(void);
        [ :ecore_thread_max_get, [  ], :int ],
        # EAPI void ecore_thread_max_set(int num);
        [ :ecore_thread_max_set, [ :int ], :void ],
        # EAPI void ecore_thread_max_reset(void);
        [ :ecore_thread_max_reset, [  ], :void ],
        # EAPI int ecore_thread_available_get(void);
        [ :ecore_thread_available_get, [  ], :int ],
        # EAPI Eina_Bool ecore_thread_local_data_add(Ecore_Thread *thread, const char *key, void *value, Eina_Free_Cb cb, Eina_Bool direct);
        [ :ecore_thread_local_data_add, [ :ecore_thread_p, :string, :void_p, :eina_free_cb, :eina_bool ], :eina_bool ],
        # EAPI void *ecore_thread_local_data_set(Ecore_Thread *thread, const char *key, void *value, Eina_Free_Cb cb);
        [ :ecore_thread_local_data_set, [ :ecore_thread_p, :string, :void_p, :eina_free_cb ], :void_p ],
        # EAPI void *ecore_thread_local_data_find(Ecore_Thread *thread, const char *key);
        [ :ecore_thread_local_data_find, [ :ecore_thread_p, :string ], :void_p ],
        # EAPI Eina_Bool ecore_thread_local_data_del(Ecore_Thread *thread, const char *key);
        [ :ecore_thread_local_data_del, [ :ecore_thread_p, :string ], :eina_bool ],
        # EAPI Eina_Bool ecore_thread_global_data_add(const char *key, void *value, Eina_Free_Cb cb, Eina_Bool direct);
        [ :ecore_thread_global_data_add, [ :string, :void_p, :eina_free_cb, :eina_bool ], :eina_bool ],
        # EAPI void *ecore_thread_global_data_set(const char *key, void *value, Eina_Free_Cb cb);
        [ :ecore_thread_global_data_set, [ :string, :void_p, :eina_free_cb ], :void_p ],
        # EAPI void *ecore_thread_global_data_find(const char *key);
        [ :ecore_thread_global_data_find, [ :string ], :void_p ],
        # EAPI Eina_Bool ecore_thread_global_data_del(const char *key);
        [ :ecore_thread_global_data_del, [ :string ], :eina_bool ],
        # EAPI void *ecore_thread_global_data_wait(const char *key, double seconds);
        [ :ecore_thread_global_data_wait, [ :string, :double ], :void_p ],
        # EAPI double ecore_time_get(void);
        [ :ecore_time_get, [  ], :double ],
        # EAPI double ecore_time_unix_get(void);
        [ :ecore_time_unix_get, [  ], :double ],
        # EAPI double ecore_loop_time_get(void);
        [ :ecore_loop_time_get, [  ], :double ],
        # EAPI Ecore_Timer *ecore_timer_add(double in, Ecore_Task_Cb func, const void *data);
        [ :ecore_timer_add, [ :double, :ecore_task_cb, :void_p ], :ecore_timer_p ],
        # EAPI Ecore_Timer *ecore_timer_loop_add(double in, Ecore_Task_Cb func, const void *data);
        [ :ecore_timer_loop_add, [ :double, :ecore_task_cb, :void_p ], :ecore_timer_p ],
        # EAPI void *ecore_timer_del(Ecore_Timer *timer);
        [ :ecore_timer_del, [ :ecore_timer_p ], :void_p ],
        # EAPI void ecore_timer_interval_set(Ecore_Timer *timer, double in);
        [ :ecore_timer_interval_set, [ :ecore_timer_p, :double ], :void ],
        # EAPI double ecore_timer_interval_get(Ecore_Timer *timer);
        [ :ecore_timer_interval_get, [ :ecore_timer_p ], :double ],
        # EAPI void ecore_timer_freeze(Ecore_Timer *timer);
        [ :ecore_timer_freeze, [ :ecore_timer_p ], :void ],
        # EAPI void ecore_timer_thaw(Ecore_Timer *timer);
        [ :ecore_timer_thaw, [ :ecore_timer_p ], :void ],
        # EAPI void ecore_timer_delay(Ecore_Timer *timer, double add);
        [ :ecore_timer_delay, [ :ecore_timer_p, :double ], :void ],
        # EAPI double ecore_timer_pending_get(Ecore_Timer *timer);
        [ :ecore_timer_pending_get, [ :ecore_timer_p ], :double ],
        # EAPI double ecore_timer_precision_get(void);
        [ :ecore_timer_precision_get, [  ], :double ],
        # EAPI void ecore_timer_precision_set(double precision);
        [ :ecore_timer_precision_set, [ :double ], :void ],
        # EAPI char *ecore_timer_dump(void);
        [ :ecore_timer_dump, [  ], :string ],
        # EAPI Ecore_Animator *ecore_animator_add(Ecore_Task_Cb func, const void *data);
        [ :ecore_animator_add, [ :ecore_task_cb, :void_p ], :ecore_animator_p ],
        # EAPI Ecore_Animator *ecore_animator_timeline_add(double runtime, Ecore_Timeline_Cb func, const void *data);
        [ :ecore_animator_timeline_add, [ :double, :ecore_timeline_cb, :void_p ], :ecore_animator_p ],
        # EAPI void *ecore_animator_del(Ecore_Animator *animator);
        [ :ecore_animator_del, [ :ecore_animator_p ], :void_p ],
        # EAPI void ecore_animator_freeze(Ecore_Animator *animator);
        [ :ecore_animator_freeze, [ :ecore_animator_p ], :void ],
        # EAPI void ecore_animator_thaw(Ecore_Animator *animator);
        [ :ecore_animator_thaw, [ :ecore_animator_p ], :void ],
        # EAPI void ecore_animator_frametime_set(double frametime);
        [ :ecore_animator_frametime_set, [ :double ], :void ],
        # EAPI double ecore_animator_frametime_get(void);
        [ :ecore_animator_frametime_get, [  ], :double ],
        # EAPI double ecore_animator_pos_map(double pos, Ecore_Pos_Map map, double v1, double v2);
        [ :ecore_animator_pos_map, [ :double, :ecore_pos_map, :double, :double ], :double ],
        # EAPI void ecore_animator_source_set(Ecore_Animator_Source source);
        [ :ecore_animator_source_set, [ :ecore_animator_source ], :void ],
        # EAPI Ecore_Animator_Source ecore_animator_source_get(void);
        [ :ecore_animator_source_get, [  ], :ecore_animator_source ],
        # EAPI void ecore_animator_custom_source_tick_begin_callback_set(Ecore_Cb func, const void *data);
        [ :ecore_animator_custom_source_tick_begin_callback_set, [ :ecore_cb, :void_p ], :void ],
        # EAPI void ecore_animator_custom_source_tick_end_callback_set(Ecore_Cb func, const void *data);
        [ :ecore_animator_custom_source_tick_end_callback_set, [ :ecore_cb, :void_p ], :void ],
        # EAPI void ecore_animator_custom_tick(void);
        [ :ecore_animator_custom_tick, [  ], :void ],
        # EAPI void ecore_poller_poll_interval_set(Ecore_Poller_Type type, double poll_time);
        [ :ecore_poller_poll_interval_set, [ :ecore_poller_type, :double ], :void ],
        # EAPI double ecore_poller_poll_interval_get(Ecore_Poller_Type type);
        [ :ecore_poller_poll_interval_get, [ :ecore_poller_type ], :double ],
        # EAPI Eina_Bool ecore_poller_poller_interval_set(Ecore_Poller *poller, int interval);
        [ :ecore_poller_poller_interval_set, [ :ecore_poller_p, :int ], :eina_bool ],
        # EAPI int ecore_poller_poller_interval_get(Ecore_Poller *poller);
        [ :ecore_poller_poller_interval_get, [ :ecore_poller_p ], :int ],
        # EAPI Ecore_Poller *ecore_poller_add(Ecore_Poller_Type type, int interval, Ecore_Task_Cb func, const void *data);
        [ :ecore_poller_add, [ :ecore_poller_type, :int, :ecore_task_cb, :void_p ], :ecore_poller_p ],
        # EAPI void *ecore_poller_del(Ecore_Poller *poller);
        [ :ecore_poller_del, [ :ecore_poller_p ], :void_p ],
        # EAPI Ecore_Job *ecore_job_add(Ecore_Cb func, const void *data);
        [ :ecore_job_add, [ :ecore_cb, :void_p ], :ecore_job_p ],
        # EAPI void *ecore_job_del(Ecore_Job *job);
        [ :ecore_job_del, [ :ecore_job_p ], :void_p ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
