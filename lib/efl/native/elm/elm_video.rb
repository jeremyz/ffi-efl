#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmVideo
        #
        FCT_PREFIX = 'elm_video_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'elementary.so.1'
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_player_add(Evas_Object *parent);
        [ :elm_player_add, [ :evas_object ], :evas_object ],
        # EAPI Evas_Object *elm_video_add(Evas_Object *parent);
        [ :elm_video_add, [ :evas_object ], :evas_object ],
        # EAPI Eina_Bool elm_video_file_set(Evas_Object *video, const char *filename);
        [ :elm_video_file_set, [ :evas_object, :string ], :bool ],
        # EAPI Evas_Object *elm_video_emotion_get(const Evas_Object *video);
        [ :elm_video_emotion_get, [ :evas_object ], :evas_object ],
        # EAPI void elm_video_play(Evas_Object *video);
        [ :elm_video_play, [ :evas_object ], :void ],
        # EAPI void elm_video_pause(Evas_Object *video);
        [ :elm_video_pause, [ :evas_object ], :void ],
        # EAPI void elm_video_stop(Evas_Object *video);
        [ :elm_video_stop, [ :evas_object ], :void ],
        # EAPI Eina_Bool elm_video_is_playing_get(const Evas_Object *video);
        [ :elm_video_is_playing_get, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_video_is_seekable_get(const Evas_Object *video);
        [ :elm_video_is_seekable_get, [ :evas_object ], :bool ],
        # EAPI Eina_Bool elm_video_audio_mute_get(const Evas_Object *video);
        [ :elm_video_audio_mute_get, [ :evas_object ], :bool ],
        # EAPI void elm_video_audio_mute_set(Evas_Object *video, Eina_Bool mute);
        [ :elm_video_audio_mute_set, [ :evas_object, :bool ], :void ],
        # EAPI double elm_video_audio_level_get(const Evas_Object *video);
        [ :elm_video_audio_level_get, [ :evas_object ], :double ],
        # EAPI void elm_video_audio_level_set(Evas_Object *video, double volume);
        [ :elm_video_audio_level_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_video_play_position_get(const Evas_Object *video);
        [ :elm_video_play_position_get, [ :evas_object ], :double ],
        # EAPI void elm_video_play_position_set(Evas_Object *video, double position);
        [ :elm_video_play_position_set, [ :evas_object, :double ], :void ],
        # EAPI double elm_video_play_length_get(const Evas_Object *video);
        [ :elm_video_play_length_get, [ :evas_object ], :double ],
        # EAPI void elm_video_remember_position_set(Evas_Object *video, Eina_Bool remember);
        [ :elm_video_remember_position_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_video_remember_position_get(const Evas_Object *video);
        [ :elm_video_remember_position_get, [ :evas_object ], :bool ],
        # EAPI const char *elm_video_title_get(const Evas_Object *video);
        [ :elm_video_title_get, [ :evas_object ], :string ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
