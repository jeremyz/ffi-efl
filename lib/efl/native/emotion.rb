#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/evas'
#
module Efl
    #
    module Emotion
        #
        FCT_PREFIX = 'emotion_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'emotion.so.1'
        #
        # ENUMS
        # typedef enum _Emotion_Module {...} Emotion_Module;
        enum :emotion_module, [ :emotion_module_xine, :emotion_module_gstreamer ]
        # enum _Emotion_Event {...} Emotion_Event;
        enum :emotion_event, [ :emotion_event_menu1, :emotion_event_menu2, :emotion_event_menu3, :emotion_event_menu4, :emotion_event_menu5,
            :emotion_event_menu6, :emotion_event_menu7, :emotion_event_up, :emotion_event_down, :emotion_event_left, :emotion_event_right, :emotion_event_select,
            :emotion_event_next, :emotion_event_prev, :emotion_event_angle_next, :emotion_event_angle_prev, :emotion_event_force, :emotion_event_0,
            :emotion_event_1, :emotion_event_2, :emotion_event_3, :emotion_event_4, :emotion_event_5, :emotion_event_6, :emotion_event_7, :emotion_event_8,
            :emotion_event_9, :emotion_event_10 ]
        # enum _Emotion_Meta_Info {...} Emotion_Meta_Info;
        enum :emotion_meta_info, [ :emotion_meta_info_track_title, :emotion_meta_info_track_artist, :emotion_meta_info_track_album,
            :emotion_meta_info_track_year, :emotion_meta_info_track_genre, :emotion_meta_info_track_comment, :emotion_meta_info_track_disc_id,
            :emotion_meta_info_track_count ]
        # enum _Emotion_Vis {...} Emotion_Vis;
        enum :emotion_vis, [ :emotion_vis_none, :emotion_vis_goom, :emotion_vis_libvisual_bumpscope, :emotion_vis_libvisual_corona,
            :emotion_vis_libvisual_dancing_particles, :emotion_vis_libvisual_gdkpixbuf, :emotion_vis_libvisual_g_force, :emotion_vis_libvisual_goom,
            :emotion_vis_libvisual_infinite, :emotion_vis_libvisual_jakdaw, :emotion_vis_libvisual_jess, :emotion_vis_libvisual_lv_analyser,
            :emotion_vis_libvisual_lv_flower, :emotion_vis_libvisual_lv_gltest, :emotion_vis_libvisual_lv_scope, :emotion_vis_libvisual_madspin,
            :emotion_vis_libvisual_nebulus, :emotion_vis_libvisual_oinksie, :emotion_vis_libvisual_plasma, :emotion_vis_last ]
        # typedef enum _Emotion_Suspend {...} Emotion_Suspend;
        enum :emotion_suspend, [ :emotion_wakeup, :emotion_sleep, :emotion_deep_sleep, :emotion_hibernate ]
        # enum _Emotion_Aspect {...} Emotion_Aspect;
        enum :emotion_aspect, [ :emotion_aspect_keep_none, :emotion_aspect_keep_width, :emotion_aspect_keep_height, :emotion_aspect_keep_both,
            :emotion_aspect_crop, :emotion_aspect_custom ]
        #
        # TYPEDEFS
        # typedef struct _Emotion_Version Emotion_Version;
        typedef :pointer, :emotion_version
        # typedef struct _Emotion_Webcam Emotion_Webcam;
        typedef :pointer, :emotion_webcam
        #
        # VARIABLES
        # EAPI extern Emotion_Version *emotion_version;
        attach_variable :emotion_version, :emotion_version
        # EAPI extern int EMOTION_WEBCAM_UPDATE;
        attach_variable :EMOTION_WEBCAM_UPDATE, :int
        #
        # FUNCTIONS
        fcts = [
        # EAPI Eina_Bool emotion_init(void);
        [ :emotion_init, [  ], :bool ],
        # EAPI Eina_Bool emotion_shutdown(void);
        [ :emotion_shutdown, [  ], :bool ],
        # EAPI Evas_Object *emotion_object_add (Evas *evas);
        [ :emotion_object_add, [ :evas ], :evas_object ],
        # EAPI void emotion_object_module_option_set (Evas_Object *obj, const char *opt, const char *val);
        [ :emotion_object_module_option_set, [ :evas_object, :string, :string ], :void ],
        # EAPI Eina_Bool emotion_object_init (Evas_Object *obj, const char *module_filename);
        [ :emotion_object_init, [ :evas_object, :string ], :bool ],
        # EAPI void emotion_object_border_set(Evas_Object *obj, int l, int r, int t, int b);
        [ :emotion_object_border_set, [ :evas_object, :int, :int, :int, :int ], :void ],
        # EAPI void emotion_object_border_get(const Evas_Object *obj, int *l, int *r, int *t, int *b);
        [ :emotion_object_border_get, [ :evas_object, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void emotion_object_bg_color_set(Evas_Object *obj, int r, int g, int b, int a);
        [ :emotion_object_bg_color_set, [ :evas_object, :int, :int, :int, :int ], :void ],
        # EAPI void emotion_object_bg_color_get(const Evas_Object *obj, int *r, int *g, int *b, int *a);
        [ :emotion_object_bg_color_get, [ :evas_object, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void emotion_object_keep_aspect_set(Evas_Object *obj, Emotion_Aspect a);
        [ :emotion_object_keep_aspect_set, [ :evas_object, :emotion_aspect ], :void ],
        # EAPI Emotion_Aspect emotion_object_keep_aspect_get(const Evas_Object *obj);
        [ :emotion_object_keep_aspect_get, [ :evas_object ], :emotion_aspect ],
        # EAPI Eina_Bool emotion_object_file_set (Evas_Object *obj, const char *filename);
        [ :emotion_object_file_set, [ :evas_object, :string ], :bool ],
        # EAPI const char *emotion_object_file_get (const Evas_Object *obj);
        [ :emotion_object_file_get, [ :evas_object ], :string ],
        # EAPI void emotion_object_play_set (Evas_Object *obj, Eina_Bool play);
        [ :emotion_object_play_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool emotion_object_play_get (const Evas_Object *obj);
        [ :emotion_object_play_get, [ :evas_object ], :bool ],
        # EAPI void emotion_object_position_set (Evas_Object *obj, double sec);
        [ :emotion_object_position_set, [ :evas_object, :double ], :void ],
        # EAPI double emotion_object_position_get (const Evas_Object *obj);
        [ :emotion_object_position_get, [ :evas_object ], :double ],
        # EAPI double emotion_object_buffer_size_get (const Evas_Object *obj);
        [ :emotion_object_buffer_size_get, [ :evas_object ], :double ],
        # EAPI Eina_Bool emotion_object_seekable_get (const Evas_Object *obj);
        [ :emotion_object_seekable_get, [ :evas_object ], :bool ],
        # EAPI double emotion_object_play_length_get (const Evas_Object *obj);
        [ :emotion_object_play_length_get, [ :evas_object ], :double ],
        # EAPI void emotion_object_play_speed_set (Evas_Object *obj, double speed);
        [ :emotion_object_play_speed_set, [ :evas_object, :double ], :void ],
        # EAPI double emotion_object_play_speed_get (const Evas_Object *obj);
        [ :emotion_object_play_speed_get, [ :evas_object ], :double ],
        # EAPI const char *emotion_object_progress_info_get (const Evas_Object *obj);
        [ :emotion_object_progress_info_get, [ :evas_object ], :string ],
        # EAPI double emotion_object_progress_status_get (const Evas_Object *obj);
        [ :emotion_object_progress_status_get, [ :evas_object ], :double ],
        # EAPI Eina_Bool emotion_object_video_handled_get (const Evas_Object *obj);
        [ :emotion_object_video_handled_get, [ :evas_object ], :bool ],
        # EAPI Eina_Bool emotion_object_audio_handled_get (const Evas_Object *obj);
        [ :emotion_object_audio_handled_get, [ :evas_object ], :bool ],
        # EAPI double emotion_object_ratio_get (const Evas_Object *obj);
        [ :emotion_object_ratio_get, [ :evas_object ], :double ],
        # EAPI void emotion_object_size_get (const Evas_Object *obj, int *iw, int *ih);
        [ :emotion_object_size_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void emotion_object_smooth_scale_set (Evas_Object *obj, Eina_Bool smooth);
        [ :emotion_object_smooth_scale_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool emotion_object_smooth_scale_get (const Evas_Object *obj);
        [ :emotion_object_smooth_scale_get, [ :evas_object ], :bool ],
        # EAPI void emotion_object_event_simple_send (Evas_Object *obj, Emotion_Event ev);
        [ :emotion_object_event_simple_send, [ :evas_object, :emotion_event ], :void ],
        # EAPI void emotion_object_audio_volume_set (Evas_Object *obj, double vol);
        [ :emotion_object_audio_volume_set, [ :evas_object, :double ], :void ],
        # EAPI double emotion_object_audio_volume_get (const Evas_Object *obj);
        [ :emotion_object_audio_volume_get, [ :evas_object ], :double ],
        # EAPI void emotion_object_audio_mute_set (Evas_Object *obj, Eina_Bool mute);
        [ :emotion_object_audio_mute_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool emotion_object_audio_mute_get (const Evas_Object *obj);
        [ :emotion_object_audio_mute_get, [ :evas_object ], :bool ],
        # EAPI int emotion_object_audio_channel_count (const Evas_Object *obj);
        [ :emotion_object_audio_channel_count, [ :evas_object ], :int ],
        # EAPI const char *emotion_object_audio_channel_name_get(const Evas_Object *obj, int channel);
        [ :emotion_object_audio_channel_name_get, [ :evas_object, :int ], :string ],
        # EAPI void emotion_object_audio_channel_set (Evas_Object *obj, int channel);
        [ :emotion_object_audio_channel_set, [ :evas_object, :int ], :void ],
        # EAPI int emotion_object_audio_channel_get (const Evas_Object *obj);
        [ :emotion_object_audio_channel_get, [ :evas_object ], :int ],
        # EAPI void emotion_object_video_mute_set (Evas_Object *obj, Eina_Bool mute);
        [ :emotion_object_video_mute_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool emotion_object_video_mute_get (const Evas_Object *obj);
        [ :emotion_object_video_mute_get, [ :evas_object ], :bool ],
        # EAPI int emotion_object_video_channel_count (const Evas_Object *obj);
        [ :emotion_object_video_channel_count, [ :evas_object ], :int ],
        # EAPI const char *emotion_object_video_channel_name_get(const Evas_Object *obj, int channel);
        [ :emotion_object_video_channel_name_get, [ :evas_object, :int ], :string ],
        # EAPI void emotion_object_video_channel_set (Evas_Object *obj, int channel);
        [ :emotion_object_video_channel_set, [ :evas_object, :int ], :void ],
        # EAPI int emotion_object_video_channel_get (const Evas_Object *obj);
        [ :emotion_object_video_channel_get, [ :evas_object ], :int ],
        # EAPI void emotion_object_spu_mute_set (Evas_Object *obj, Eina_Bool mute);
        [ :emotion_object_spu_mute_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool emotion_object_spu_mute_get (const Evas_Object *obj);
        [ :emotion_object_spu_mute_get, [ :evas_object ], :bool ],
        # EAPI int emotion_object_spu_channel_count (const Evas_Object *obj);
        [ :emotion_object_spu_channel_count, [ :evas_object ], :int ],
        # EAPI const char *emotion_object_spu_channel_name_get (const Evas_Object *obj, int channel);
        [ :emotion_object_spu_channel_name_get, [ :evas_object, :int ], :string ],
        # EAPI void emotion_object_spu_channel_set (Evas_Object *obj, int channel);
        [ :emotion_object_spu_channel_set, [ :evas_object, :int ], :void ],
        # EAPI int emotion_object_spu_channel_get (const Evas_Object *obj);
        [ :emotion_object_spu_channel_get, [ :evas_object ], :int ],
        # EAPI int emotion_object_chapter_count (const Evas_Object *obj);
        [ :emotion_object_chapter_count, [ :evas_object ], :int ],
        # EAPI void emotion_object_chapter_set (Evas_Object *obj, int chapter);
        [ :emotion_object_chapter_set, [ :evas_object, :int ], :void ],
        # EAPI int emotion_object_chapter_get (const Evas_Object *obj);
        [ :emotion_object_chapter_get, [ :evas_object ], :int ],
        # EAPI const char *emotion_object_chapter_name_get (const Evas_Object *obj, int chapter);
        [ :emotion_object_chapter_name_get, [ :evas_object, :int ], :string ],
        # EAPI void emotion_object_eject (Evas_Object *obj);
        [ :emotion_object_eject, [ :evas_object ], :void ],
        # EAPI const char *emotion_object_title_get (const Evas_Object *obj);
        [ :emotion_object_title_get, [ :evas_object ], :string ],
        # EAPI const char *emotion_object_ref_file_get (const Evas_Object *obj);
        [ :emotion_object_ref_file_get, [ :evas_object ], :string ],
        # EAPI int emotion_object_ref_num_get (const Evas_Object *obj);
        [ :emotion_object_ref_num_get, [ :evas_object ], :int ],
        # EAPI int emotion_object_spu_button_count_get (const Evas_Object *obj);
        [ :emotion_object_spu_button_count_get, [ :evas_object ], :int ],
        # EAPI int emotion_object_spu_button_get (const Evas_Object *obj);
        [ :emotion_object_spu_button_get, [ :evas_object ], :int ],
        # EAPI const char *emotion_object_meta_info_get (const Evas_Object *obj, Emotion_Meta_Info meta);
        [ :emotion_object_meta_info_get, [ :evas_object, :emotion_meta_info ], :string ],
        # EAPI void emotion_object_vis_set (Evas_Object *obj, Emotion_Vis visualization);
        [ :emotion_object_vis_set, [ :evas_object, :emotion_vis ], :void ],
        # EAPI Emotion_Vis emotion_object_vis_get (const Evas_Object *obj);
        [ :emotion_object_vis_get, [ :evas_object ], :emotion_vis ],
        # EAPI Eina_Bool emotion_object_vis_supported (const Evas_Object *obj, Emotion_Vis visualization);
        [ :emotion_object_vis_supported, [ :evas_object, :emotion_vis ], :bool ],
        # EAPI void emotion_object_priority_set(Evas_Object *obj, Eina_Bool priority);
        [ :emotion_object_priority_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool emotion_object_priority_get(const Evas_Object *obj);
        [ :emotion_object_priority_get, [ :evas_object ], :bool ],
        # EAPI void emotion_object_suspend_set(Evas_Object *obj, Emotion_Suspend state);
        [ :emotion_object_suspend_set, [ :evas_object, :emotion_suspend ], :void ],
        # EAPI Emotion_Suspend emotion_object_suspend_get(Evas_Object *obj);
        [ :emotion_object_suspend_get, [ :evas_object ], :emotion_suspend ],
        # EAPI void emotion_object_last_position_load(Evas_Object *obj);
        [ :emotion_object_last_position_load, [ :evas_object ], :void ],
        # EAPI void emotion_object_last_position_save(Evas_Object *obj);
        [ :emotion_object_last_position_save, [ :evas_object ], :void ],
        # EAPI Eina_Bool emotion_object_extension_may_play_fast_get(const char *file);
        [ :emotion_object_extension_may_play_fast_get, [ :string ], :bool ],
        # EAPI Eina_Bool emotion_object_extension_may_play_get(const char *file);
        [ :emotion_object_extension_may_play_get, [ :string ], :bool ],
        # EAPI Evas_Object *emotion_object_image_get(const Evas_Object *obj);
        [ :emotion_object_image_get, [ :evas_object ], :evas_object ],
        # EAPI const Eina_List *emotion_webcams_get(void);
        [ :emotion_webcams_get, [  ], :eina_list ],
        # EAPI const char *emotion_webcam_name_get(const Emotion_Webcam *ew);
        [ :emotion_webcam_name_get, [ :emotion_webcam ], :string ],
        # EAPI const char *emotion_webcam_device_get(const Emotion_Webcam *ew);
        [ :emotion_webcam_device_get, [ :emotion_webcam ], :string ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
