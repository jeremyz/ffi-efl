#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module Ecore
        #
        FCT_PREFIX = 'ecore_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'ecore.so.1'
        #
        # ENUMS
        # enum _Ecore_Exe_Flags {...} Ecore_Exe_Flags;
        enum :ecore_exe_flags, [ :ecore_exe_none, 0, :ecore_exe_pipe_read, 1, :ecore_exe_pipe_write, 2, :ecore_exe_pipe_error, 4,
            :ecore_exe_pipe_read_line_buffered, 8, :ecore_exe_pipe_error_line_buffered, 16, :ecore_exe_pipe_auto, 32, :ecore_exe_respawn, 64, :ecore_exe_use_sh,
            128, :ecore_exe_not_leader, 256, :ecore_exe_term_with_parent, 512 ]
        # enum _Ecore_Exe_Win32_Priority {...} Ecore_Exe_Win32_Priority;
        enum :ecore_exe_win32_priority, [ :ecore_exe_win32_priority_idle, :ecore_exe_win32_priority_below_normal, :ecore_exe_win32_priority_normal,
            :ecore_exe_win32_priority_above_normal, :ecore_exe_win32_priority_high, :ecore_exe_win32_priority_realtime ]
        # enum _Ecore_Fd_Handler_Flags {...} Ecore_Fd_Handler_Flags;
        enum :ecore_fd_handler_flags, [ :ecore_fd_read, 1, :ecore_fd_write, 2, :ecore_fd_error, 4 ]
        # enum _Ecore_Poller_Type {...} Ecore_Poller_Type;
        enum :ecore_poller_type, [ :ecore_poller_core, 0 ]
        # enum _Ecore_Pos_Map {...} Ecore_Pos_Map;
        enum :ecore_pos_map, [ :ecore_pos_map_linear, :ecore_pos_map_accelerate, :ecore_pos_map_decelerate, :ecore_pos_map_sinusoidal,
            :ecore_pos_map_accelerate_factor, :ecore_pos_map_decelerate_factor, :ecore_pos_map_sinusoidal_factor, :ecore_pos_map_divisor_interp,
            :ecore_pos_map_bounce, :ecore_pos_map_spring ]
        # enum _Ecore_Animator_Source {...} Ecore_Animator_Source;
        enum :ecore_animator_source, [ :ecore_animator_source_timer, :ecore_animator_source_custom ]
        #
        # TYPEDEFS
        # typedef struct _Ecore_Version Ecore_Version;
        typedef :pointer, :ecore_version
        # typedef struct _Ecore_Win32_Handler Ecore_Win32_Handler;
        typedef :pointer, :ecore_win32_handler
        # typedef struct _Ecore_Event_Handler Ecore_Event_Handler;
        typedef :pointer, :ecore_event_handler
        # typedef struct _Ecore_Event_Filter Ecore_Event_Filter;
        typedef :pointer, :ecore_event_filter
        # typedef struct _Ecore_Event Ecore_Event;
        typedef :pointer, :ecore_event
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
        # typedef struct _Ecore_Exe Ecore_Exe;
        typedef :pointer, :ecore_exe
        # typedef struct _Ecore_Exe_Event_Add Ecore_Exe_Event_Add;
        typedef :pointer, :ecore_exe_event_add
        # typedef struct _Ecore_Exe_Event_Del Ecore_Exe_Event_Del;
        typedef :pointer, :ecore_exe_event_del
        # typedef struct _Ecore_Exe_Event_Data_Line Ecore_Exe_Event_Data_Line;
        typedef :pointer, :ecore_exe_event_data_line
        # typedef struct _Ecore_Exe_Event_Data Ecore_Exe_Event_Data;
        typedef :pointer, :ecore_exe_event_data
        # typedef struct _Ecore_Fd_Handler Ecore_Fd_Handler;
        typedef :pointer, :ecore_fd_handler
        # typedef struct _Ecore_Poller Ecore_Poller;
        typedef :pointer, :ecore_poller
        # typedef struct _Ecore_Animator Ecore_Animator;
        typedef :pointer, :ecore_animator
        # typedef struct _Ecore_Timer Ecore_Timer;
        typedef :pointer, :ecore_timer
        # typedef struct _Ecore_Idler Ecore_Idler;
        typedef :pointer, :ecore_idler
        # typedef struct _Ecore_Idle_Enterer Ecore_Idle_Enterer;
        typedef :pointer, :ecore_idle_enterer
        # typedef struct _Ecore_Idle_Exiter Ecore_Idle_Exiter;
        typedef :pointer, :ecore_idle_exiter
        # typedef struct _Ecore_Thread Ecore_Thread;
        typedef :pointer, :ecore_thread
        # typedef struct _Ecore_Pipe Ecore_Pipe;
        typedef :pointer, :ecore_pipe
        # typedef struct _Ecore_Job Ecore_Job;
        typedef :pointer, :ecore_job
        #
        # CALLBACKS
        # typedef Eina_Bool (*Ecore_Task_Cb) (void *data);
        callback :ecore_task_cb, [ :pointer ], :bool
        # typedef int (*Ecore_Select_Function) (int nfds, fd_set *readfds, fd_set *writefds, fd_set *exceptfds, struct timeval *timeout);
        callback :ecore_select_function_cb, [ :int, :pointer, :pointer, :pointer, :pointer ], :int
        # typedef void (*Ecore_Cb) (void *data);
        callback :ecore_cb, [ :pointer ], :void
        # typedef void *(*Ecore_Data_Cb) (void *data);
        callback :ecore_data_cb, [ :pointer ], :pointer
        # typedef Eina_Bool (*Ecore_Filter_Cb) (void *data, void *loop_data, int type, void *event);
        callback :ecore_filter_cb, [ :pointer, :pointer, :int, :pointer ], :bool
        # typedef void (*Ecore_End_Cb) (void *user_data, void *func_data);
        callback :ecore_end_cb, [ :pointer, :pointer ], :void
        # typedef Eina_Bool (*Ecore_Event_Handler_Cb) (void *data, int type, void *event);
        callback :ecore_event_handler_cb, [ :pointer, :int, :pointer ], :bool
        # typedef void (*Ecore_Exe_Cb) (void *data, const Ecore_Exe *exe);
        callback :ecore_exe_cb, [ :pointer, :ecore_exe ], :void
        # typedef Eina_Bool (*Ecore_Fd_Cb) (void *data, Ecore_Fd_Handler *fd_handler);
        callback :ecore_fd_cb, [ :pointer, :ecore_fd_handler ], :bool
        # typedef void (*Ecore_Fd_Prep_Cb) (void *data, Ecore_Fd_Handler *fd_handler);
        callback :ecore_fd_prep_cb, [ :pointer, :ecore_fd_handler ], :void
        # typedef Eina_Bool (*Ecore_Win32_Handle_Cb) (void *data, Ecore_Win32_Handler *wh);
        callback :ecore_win32_handle_cb, [ :pointer, :ecore_win32_handler ], :bool
        # typedef Eina_Bool (*Ecore_Timeline_Cb) (void *data, double pos);
        callback :ecore_timeline_cb, [ :pointer, :double ], :bool
        # typedef void (*Ecore_Thread_Cb) (void *data, Ecore_Thread *thread);
        callback :ecore_thread_cb, [ :pointer, :ecore_thread ], :void
        # typedef void (*Ecore_Thread_Notify_Cb) (void *data, Ecore_Thread *thread, void *msg_data);
        callback :ecore_thread_notify_cb, [ :pointer, :ecore_thread, :pointer ], :void
        # typedef void (*Ecore_Pipe_Cb) (void *data, void *buffer, unsigned int nbyte);
        callback :ecore_pipe_cb, [ :pointer, :pointer, :uint ], :void
        #
        # VARIABLES
        # EAPI extern Ecore_Version *ecore_version;
        attach_variable :ecore_version, :ecore_version
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
        # EAPI void ecore_main_loop_iterate(void);
        [ :ecore_main_loop_iterate, [  ], :void ],
        # EAPI void ecore_main_loop_select_func_set(Ecore_Select_Function func);
        [ :ecore_main_loop_select_func_set, [ :ecore_select_function_cb ], :void ],
        # EAPI Ecore_Select_Function ecore_main_loop_select_func_get(void);
        [ :ecore_main_loop_select_func_get, [  ], :ecore_select_function_cb ],
        # EAPI Eina_Bool ecore_main_loop_glib_integrate(void);
        [ :ecore_main_loop_glib_integrate, [  ], :bool ],
        # EAPI void ecore_main_loop_glib_always_integrate_disable(void);
        [ :ecore_main_loop_glib_always_integrate_disable, [  ], :void ],
        # EAPI void ecore_main_loop_begin(void);
        [ :ecore_main_loop_begin, [  ], :void ],
        # EAPI void ecore_main_loop_quit(void);
        [ :ecore_main_loop_quit, [  ], :void ],
        # EAPI Eina_Bool ecore_fork_reset_callback_add(Ecore_Cb func, const void *data);
        [ :ecore_fork_reset_callback_add, [ :ecore_cb, :pointer ], :bool ],
        # EAPI Eina_Bool ecore_fork_reset_callback_del(Ecore_Cb func, const void *data);
        [ :ecore_fork_reset_callback_del, [ :ecore_cb, :pointer ], :bool ],
        # EAPI void ecore_fork_reset(void);
        [ :ecore_fork_reset, [  ], :void ],
        # EAPI void ecore_main_loop_thread_safe_call_async(Ecore_Cb callback, void *data);
        [ :ecore_main_loop_thread_safe_call_async, [ :ecore_cb, :pointer ], :void ],
        # EAPI void *ecore_main_loop_thread_safe_call_sync(Ecore_Data_Cb callback, void *data);
        [ :ecore_main_loop_thread_safe_call_sync, [ :ecore_data_cb, :pointer ], :pointer ],
        # EAPI int ecore_thread_main_loop_begin(void);
        [ :ecore_thread_main_loop_begin, [  ], :int ],
        # EAPI int ecore_thread_main_loop_end(void);
        [ :ecore_thread_main_loop_end, [  ], :int ],
        # EAPI Ecore_Event_Handler *ecore_event_handler_add(int type, Ecore_Event_Handler_Cb func, const void *data);
        [ :ecore_event_handler_add, [ :int, :ecore_event_handler_cb, :pointer ], :ecore_event_handler ],
        # EAPI void *ecore_event_handler_del(Ecore_Event_Handler *event_handler);
        [ :ecore_event_handler_del, [ :ecore_event_handler ], :pointer ],
        # EAPI Ecore_Event *ecore_event_add(int type, void *ev, Ecore_End_Cb func_free, void *data);
        [ :ecore_event_add, [ :int, :pointer, :ecore_end_cb, :pointer ], :ecore_event ],
        # EAPI void *ecore_event_del(Ecore_Event *event);
        [ :ecore_event_del, [ :ecore_event ], :pointer ],
        # EAPI void *ecore_event_handler_data_get(Ecore_Event_Handler *eh);
        [ :ecore_event_handler_data_get, [ :ecore_event_handler ], :pointer ],
        # EAPI void *ecore_event_handler_data_set(Ecore_Event_Handler *eh, const void *data);
        [ :ecore_event_handler_data_set, [ :ecore_event_handler, :pointer ], :pointer ],
        # EAPI int ecore_event_type_new(void);
        [ :ecore_event_type_new, [  ], :int ],
        # EAPI Ecore_Event_Filter *ecore_event_filter_add(Ecore_Data_Cb func_start, Ecore_Filter_Cb func_filter, Ecore_End_Cb func_end, const void *data);
        [ :ecore_event_filter_add, [ :ecore_data_cb, :ecore_filter_cb, :ecore_end_cb, :pointer ], :ecore_event_filter ],
        # EAPI void *ecore_event_filter_del(Ecore_Event_Filter *ef);
        [ :ecore_event_filter_del, [ :ecore_event_filter ], :pointer ],
        # EAPI int ecore_event_current_type_get(void);
        [ :ecore_event_current_type_get, [  ], :int ],
        # EAPI void *ecore_event_current_event_get(void);
        [ :ecore_event_current_event_get, [  ], :pointer ],
        # EAPI void ecore_exe_run_priority_set(int pri);
        [ :ecore_exe_run_priority_set, [ :int ], :void ],
        # EAPI int ecore_exe_run_priority_get(void);
        [ :ecore_exe_run_priority_get, [  ], :int ],
        # EAPI Ecore_Exe *ecore_exe_run(const char *exe_cmd, const void *data);
        [ :ecore_exe_run, [ :string, :pointer ], :ecore_exe ],
        # EAPI Ecore_Exe *ecore_exe_pipe_run(const char *exe_cmd, Ecore_Exe_Flags flags, const void *data);
        [ :ecore_exe_pipe_run, [ :string, :ecore_exe_flags, :pointer ], :ecore_exe ],
        # EAPI void ecore_exe_callback_pre_free_set(Ecore_Exe *exe, Ecore_Exe_Cb func);
        [ :ecore_exe_callback_pre_free_set, [ :ecore_exe, :ecore_exe_cb ], :void ],
        # EAPI Eina_Bool ecore_exe_send(Ecore_Exe *exe, const void *data, int size);
        [ :ecore_exe_send, [ :ecore_exe, :pointer, :int ], :bool ],
        # EAPI void ecore_exe_close_stdin(Ecore_Exe *exe);
        [ :ecore_exe_close_stdin, [ :ecore_exe ], :void ],
        # EAPI void ecore_exe_auto_limits_set(Ecore_Exe *exe, int start_bytes, int end_bytes, int start_lines, int end_lines);
        [ :ecore_exe_auto_limits_set, [ :ecore_exe, :int, :int, :int, :int ], :void ],
        # EAPI Ecore_Exe_Event_Data *ecore_exe_event_data_get(Ecore_Exe *exe, Ecore_Exe_Flags flags);
        [ :ecore_exe_event_data_get, [ :ecore_exe, :ecore_exe_flags ], :ecore_exe_event_data ],
        # EAPI void ecore_exe_event_data_free(Ecore_Exe_Event_Data *data);
        [ :ecore_exe_event_data_free, [ :ecore_exe_event_data ], :void ],
        # EAPI void *ecore_exe_free(Ecore_Exe *exe);
        [ :ecore_exe_free, [ :ecore_exe ], :pointer ],
        # EAPI pid_t ecore_exe_pid_get(const Ecore_Exe *exe);
        [ :ecore_exe_pid_get, [ :ecore_exe ], :ulong ],
        # EAPI void ecore_exe_tag_set(Ecore_Exe *exe, const char *tag);
        [ :ecore_exe_tag_set, [ :ecore_exe, :string ], :void ],
        # EAPI const char *ecore_exe_tag_get(const Ecore_Exe *exe);
        [ :ecore_exe_tag_get, [ :ecore_exe ], :string ],
        # EAPI const char *ecore_exe_cmd_get(const Ecore_Exe *exe);
        [ :ecore_exe_cmd_get, [ :ecore_exe ], :string ],
        # EAPI void *ecore_exe_data_get(const Ecore_Exe *exe);
        [ :ecore_exe_data_get, [ :ecore_exe ], :pointer ],
        # EAPI void *ecore_exe_data_set(Ecore_Exe *exe, void *data);
        [ :ecore_exe_data_set, [ :ecore_exe, :pointer ], :pointer ],
        # EAPI Ecore_Exe_Flags ecore_exe_flags_get(const Ecore_Exe *exe);
        [ :ecore_exe_flags_get, [ :ecore_exe ], :ecore_exe_flags ],
        # EAPI void ecore_exe_pause(Ecore_Exe *exe);
        [ :ecore_exe_pause, [ :ecore_exe ], :void ],
        # EAPI void ecore_exe_continue(Ecore_Exe *exe);
        [ :ecore_exe_continue, [ :ecore_exe ], :void ],
        # EAPI void ecore_exe_interrupt(Ecore_Exe *exe);
        [ :ecore_exe_interrupt, [ :ecore_exe ], :void ],
        # EAPI void ecore_exe_quit(Ecore_Exe *exe);
        [ :ecore_exe_quit, [ :ecore_exe ], :void ],
        # EAPI void ecore_exe_terminate(Ecore_Exe *exe);
        [ :ecore_exe_terminate, [ :ecore_exe ], :void ],
        # EAPI void ecore_exe_kill(Ecore_Exe *exe);
        [ :ecore_exe_kill, [ :ecore_exe ], :void ],
        # EAPI void ecore_exe_signal(Ecore_Exe *exe, int num);
        [ :ecore_exe_signal, [ :ecore_exe, :int ], :void ],
        # EAPI void ecore_exe_hup(Ecore_Exe *exe);
        [ :ecore_exe_hup, [ :ecore_exe ], :void ],
        # EAPI Ecore_Fd_Handler *ecore_main_fd_handler_add(int fd, Ecore_Fd_Handler_Flags flags, Ecore_Fd_Cb func, const void *data, Ecore_Fd_Cb buf_func, const void *buf_data);
        [ :ecore_main_fd_handler_add, [ :int, :ecore_fd_handler_flags, :ecore_fd_cb, :pointer, :ecore_fd_cb, :pointer ], :ecore_fd_handler ],
        # EAPI Ecore_Fd_Handler *ecore_main_fd_handler_file_add(int fd, Ecore_Fd_Handler_Flags flags, Ecore_Fd_Cb func, const void *data, Ecore_Fd_Cb buf_func, const void *buf_data);
        [ :ecore_main_fd_handler_file_add, [ :int, :ecore_fd_handler_flags, :ecore_fd_cb, :pointer, :ecore_fd_cb, :pointer ], :ecore_fd_handler ],
        # EAPI void ecore_main_fd_handler_prepare_callback_set(Ecore_Fd_Handler *fd_handler, Ecore_Fd_Prep_Cb func, const void *data);
        [ :ecore_main_fd_handler_prepare_callback_set, [ :ecore_fd_handler, :ecore_fd_prep_cb, :pointer ], :void ],
        # EAPI void *ecore_main_fd_handler_del(Ecore_Fd_Handler *fd_handler);
        [ :ecore_main_fd_handler_del, [ :ecore_fd_handler ], :pointer ],
        # EAPI int ecore_main_fd_handler_fd_get(Ecore_Fd_Handler *fd_handler);
        [ :ecore_main_fd_handler_fd_get, [ :ecore_fd_handler ], :int ],
        # EAPI Eina_Bool ecore_main_fd_handler_active_get(Ecore_Fd_Handler *fd_handler, Ecore_Fd_Handler_Flags flags);
        [ :ecore_main_fd_handler_active_get, [ :ecore_fd_handler, :ecore_fd_handler_flags ], :bool ],
        # EAPI void ecore_main_fd_handler_active_set(Ecore_Fd_Handler *fd_handler, Ecore_Fd_Handler_Flags flags);
        [ :ecore_main_fd_handler_active_set, [ :ecore_fd_handler, :ecore_fd_handler_flags ], :void ],
        # EAPI Ecore_Win32_Handler *ecore_main_win32_handler_add(void *h, Ecore_Win32_Handle_Cb func, const void *data);
        [ :ecore_main_win32_handler_add, [ :pointer, :ecore_win32_handle_cb, :pointer ], :ecore_win32_handler ],
        # EAPI void *ecore_main_win32_handler_del(Ecore_Win32_Handler *win32_handler);
        [ :ecore_main_win32_handler_del, [ :ecore_win32_handler ], :pointer ],
        # EAPI void ecore_poller_poll_interval_set(Ecore_Poller_Type type, double poll_time);
        [ :ecore_poller_poll_interval_set, [ :ecore_poller_type, :double ], :void ],
        # EAPI double ecore_poller_poll_interval_get(Ecore_Poller_Type type);
        [ :ecore_poller_poll_interval_get, [ :ecore_poller_type ], :double ],
        # EAPI Eina_Bool ecore_poller_poller_interval_set(Ecore_Poller *poller, int interval);
        [ :ecore_poller_poller_interval_set, [ :ecore_poller, :int ], :bool ],
        # EAPI int ecore_poller_poller_interval_get(Ecore_Poller *poller);
        [ :ecore_poller_poller_interval_get, [ :ecore_poller ], :int ],
        # EAPI Ecore_Poller *ecore_poller_add(Ecore_Poller_Type type, int interval, Ecore_Task_Cb func, const void *data);
        [ :ecore_poller_add, [ :ecore_poller_type, :int, :ecore_task_cb, :pointer ], :ecore_poller ],
        # EAPI void *ecore_poller_del(Ecore_Poller *poller);
        [ :ecore_poller_del, [ :ecore_poller ], :pointer ],
        # EAPI Ecore_Animator *ecore_animator_add(Ecore_Task_Cb func, const void *data);
        [ :ecore_animator_add, [ :ecore_task_cb, :pointer ], :ecore_animator ],
        # EAPI Ecore_Animator *ecore_animator_timeline_add(double runtime, Ecore_Timeline_Cb func, const void *data);
        [ :ecore_animator_timeline_add, [ :double, :ecore_timeline_cb, :pointer ], :ecore_animator ],
        # EAPI void *ecore_animator_del(Ecore_Animator *animator);
        [ :ecore_animator_del, [ :ecore_animator ], :pointer ],
        # EAPI void ecore_animator_freeze(Ecore_Animator *animator);
        [ :ecore_animator_freeze, [ :ecore_animator ], :void ],
        # EAPI void ecore_animator_thaw(Ecore_Animator *animator);
        [ :ecore_animator_thaw, [ :ecore_animator ], :void ],
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
        [ :ecore_animator_custom_source_tick_begin_callback_set, [ :ecore_cb, :pointer ], :void ],
        # EAPI void ecore_animator_custom_source_tick_end_callback_set(Ecore_Cb func, const void *data);
        [ :ecore_animator_custom_source_tick_end_callback_set, [ :ecore_cb, :pointer ], :void ],
        # EAPI void ecore_animator_custom_tick(void);
        [ :ecore_animator_custom_tick, [  ], :void ],
        # EAPI double ecore_time_get(void);
        [ :ecore_time_get, [  ], :double ],
        # EAPI double ecore_time_unix_get(void);
        [ :ecore_time_unix_get, [  ], :double ],
        # EAPI double ecore_loop_time_get(void);
        [ :ecore_loop_time_get, [  ], :double ],
        # EAPI Ecore_Timer *ecore_timer_add(double in, Ecore_Task_Cb func, const void *data);
        [ :ecore_timer_add, [ :double, :ecore_task_cb, :pointer ], :ecore_timer ],
        # EAPI Ecore_Timer *ecore_timer_loop_add(double in, Ecore_Task_Cb func, const void *data);
        [ :ecore_timer_loop_add, [ :double, :ecore_task_cb, :pointer ], :ecore_timer ],
        # EAPI void *ecore_timer_del(Ecore_Timer *timer);
        [ :ecore_timer_del, [ :ecore_timer ], :pointer ],
        # EAPI void ecore_timer_interval_set(Ecore_Timer *timer, double in);
        [ :ecore_timer_interval_set, [ :ecore_timer, :double ], :void ],
        # EAPI double ecore_timer_interval_get(Ecore_Timer *timer);
        [ :ecore_timer_interval_get, [ :ecore_timer ], :double ],
        # EAPI void ecore_timer_freeze(Ecore_Timer *timer);
        [ :ecore_timer_freeze, [ :ecore_timer ], :void ],
        # EAPI void ecore_timer_thaw(Ecore_Timer *timer);
        [ :ecore_timer_thaw, [ :ecore_timer ], :void ],
        # EAPI void ecore_timer_delay(Ecore_Timer *timer, double add);
        [ :ecore_timer_delay, [ :ecore_timer, :double ], :void ],
        # EAPI void ecore_timer_reset(Ecore_Timer *timer);
        [ :ecore_timer_reset, [ :ecore_timer ], :void ],
        # EAPI double ecore_timer_pending_get(Ecore_Timer *timer);
        [ :ecore_timer_pending_get, [ :ecore_timer ], :double ],
        # EAPI double ecore_timer_precision_get(void);
        [ :ecore_timer_precision_get, [  ], :double ],
        # EAPI void ecore_timer_precision_set(double precision);
        [ :ecore_timer_precision_set, [ :double ], :void ],
        # EAPI char *ecore_timer_dump(void);
        [ :ecore_timer_dump, [  ], :string ],
        # EAPI Ecore_Idler *ecore_idler_add(Ecore_Task_Cb func, const void *data);
        [ :ecore_idler_add, [ :ecore_task_cb, :pointer ], :ecore_idler ],
        # EAPI void *ecore_idler_del(Ecore_Idler *idler);
        [ :ecore_idler_del, [ :ecore_idler ], :pointer ],
        # EAPI Ecore_Idle_Enterer *ecore_idle_enterer_add(Ecore_Task_Cb func, const void *data);
        [ :ecore_idle_enterer_add, [ :ecore_task_cb, :pointer ], :ecore_idle_enterer ],
        # EAPI Ecore_Idle_Enterer *ecore_idle_enterer_before_add(Ecore_Task_Cb func, const void *data);
        [ :ecore_idle_enterer_before_add, [ :ecore_task_cb, :pointer ], :ecore_idle_enterer ],
        # EAPI void *ecore_idle_enterer_del(Ecore_Idle_Enterer *idle_enterer);
        [ :ecore_idle_enterer_del, [ :ecore_idle_enterer ], :pointer ],
        # EAPI Ecore_Idle_Exiter *ecore_idle_exiter_add(Ecore_Task_Cb func, const void *data);
        [ :ecore_idle_exiter_add, [ :ecore_task_cb, :pointer ], :ecore_idle_exiter ],
        # EAPI void *ecore_idle_exiter_del(Ecore_Idle_Exiter *idle_exiter);
        [ :ecore_idle_exiter_del, [ :ecore_idle_exiter ], :pointer ],
        # EAPI Ecore_Thread *ecore_thread_run(Ecore_Thread_Cb func_blocking, Ecore_Thread_Cb func_end, Ecore_Thread_Cb func_cancel, const void *data);
        [ :ecore_thread_run, [ :ecore_thread_cb, :ecore_thread_cb, :ecore_thread_cb, :pointer ], :ecore_thread ],
        # EAPI Ecore_Thread *ecore_thread_feedback_run(Ecore_Thread_Cb func_heavy, Ecore_Thread_Notify_Cb func_notify, Ecore_Thread_Cb func_end, Ecore_Thread_Cb func_cancel, const void *data, Eina_Bool try_no_queue);
        [ :ecore_thread_feedback_run, [ :ecore_thread_cb, :ecore_thread_notify_cb, :ecore_thread_cb, :ecore_thread_cb, :pointer, :bool ],
            :ecore_thread ],
        # EAPI Eina_Bool ecore_thread_cancel(Ecore_Thread *thread);
        [ :ecore_thread_cancel, [ :ecore_thread ], :bool ],
        # EAPI Eina_Bool ecore_thread_check(Ecore_Thread *thread);
        [ :ecore_thread_check, [ :ecore_thread ], :bool ],
        # EAPI Eina_Bool ecore_thread_feedback(Ecore_Thread *thread, const void *msg_data);
        [ :ecore_thread_feedback, [ :ecore_thread, :pointer ], :bool ],
        # EAPI Eina_Bool ecore_thread_reschedule(Ecore_Thread *thread);
        [ :ecore_thread_reschedule, [ :ecore_thread ], :bool ],
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
        [ :ecore_thread_local_data_add, [ :ecore_thread, :string, :pointer, :eina_free_cb, :bool ], :bool ],
        # EAPI void *ecore_thread_local_data_set(Ecore_Thread *thread, const char *key, void *value, Eina_Free_Cb cb);
        [ :ecore_thread_local_data_set, [ :ecore_thread, :string, :pointer, :eina_free_cb ], :pointer ],
        # EAPI void *ecore_thread_local_data_find(Ecore_Thread *thread, const char *key);
        [ :ecore_thread_local_data_find, [ :ecore_thread, :string ], :pointer ],
        # EAPI Eina_Bool ecore_thread_local_data_del(Ecore_Thread *thread, const char *key);
        [ :ecore_thread_local_data_del, [ :ecore_thread, :string ], :bool ],
        # EAPI Eina_Bool ecore_thread_global_data_add(const char *key, void *value, Eina_Free_Cb cb, Eina_Bool direct);
        [ :ecore_thread_global_data_add, [ :string, :pointer, :eina_free_cb, :bool ], :bool ],
        # EAPI void *ecore_thread_global_data_set(const char *key, void *value, Eina_Free_Cb cb);
        [ :ecore_thread_global_data_set, [ :string, :pointer, :eina_free_cb ], :pointer ],
        # EAPI void *ecore_thread_global_data_find(const char *key);
        [ :ecore_thread_global_data_find, [ :string ], :pointer ],
        # EAPI Eina_Bool ecore_thread_global_data_del(const char *key);
        [ :ecore_thread_global_data_del, [ :string ], :bool ],
        # EAPI void *ecore_thread_global_data_wait(const char *key, double seconds);
        [ :ecore_thread_global_data_wait, [ :string, :double ], :pointer ],
        # EAPI Ecore_Pipe *ecore_pipe_add(Ecore_Pipe_Cb handler, const void *data);
        [ :ecore_pipe_add, [ :ecore_pipe_cb, :pointer ], :ecore_pipe ],
        # EAPI void *ecore_pipe_del(Ecore_Pipe *p);
        [ :ecore_pipe_del, [ :ecore_pipe ], :pointer ],
        # EAPI Eina_Bool ecore_pipe_write(Ecore_Pipe *p, const void *buffer, unsigned int nbytes);
        [ :ecore_pipe_write, [ :ecore_pipe, :pointer, :uint ], :bool ],
        # EAPI void ecore_pipe_write_close(Ecore_Pipe *p);
        [ :ecore_pipe_write_close, [ :ecore_pipe ], :void ],
        # EAPI void ecore_pipe_read_close(Ecore_Pipe *p);
        [ :ecore_pipe_read_close, [ :ecore_pipe ], :void ],
        # EAPI void ecore_pipe_thaw(Ecore_Pipe *p);
        [ :ecore_pipe_thaw, [ :ecore_pipe ], :void ],
        # EAPI void ecore_pipe_freeze(Ecore_Pipe *p);
        [ :ecore_pipe_freeze, [ :ecore_pipe ], :void ],
        # EAPI int ecore_pipe_wait(Ecore_Pipe *p, int message_count, double wait);
        [ :ecore_pipe_wait, [ :ecore_pipe, :int, :double ], :int ],
        # EAPI Ecore_Job *ecore_job_add(Ecore_Cb func, const void *data);
        [ :ecore_job_add, [ :ecore_cb, :pointer ], :ecore_job ],
        # EAPI void *ecore_job_del(Ecore_Job *job);
        [ :ecore_job_del, [ :ecore_job ], :pointer ],
        # EAPI void ecore_app_args_set(int argc, const char **argv);
        [ :ecore_app_args_set, [ :int, :pointer ], :void ],
        # EAPI void ecore_app_args_get(int *argc, char ***argv);
        [ :ecore_app_args_get, [ :pointer, :pointer ], :void ],
        # EAPI void ecore_app_restart(void);
        [ :ecore_app_restart, [  ], :void ],
        # EAPI void ecore_throttle_adjust(double amount);
        [ :ecore_throttle_adjust, [ :double ], :void ],
        # EAPI double ecore_throttle_get(void);
        [ :ecore_throttle_get, [  ], :double ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
