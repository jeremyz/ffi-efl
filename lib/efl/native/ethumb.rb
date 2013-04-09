#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module Ethumb
        #
        FCT_PREFIX = 'ethumb_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'ethumb.so.1'
        #
        # ENUMS
        # typedef enum _Ethumb_Thumb_FDO_Size {...} Ethumb_Thumb_FDO_Size;
        enum :ethumb_thumb_fdo_size, [ :ethumb_thumb_normal, :ethumb_thumb_large ]
        # typedef enum _Ethumb_Thumb_Format {...} Ethumb_Thumb_Format;
        enum :ethumb_thumb_format, [ :ethumb_thumb_fdo, :ethumb_thumb_jpeg, :ethumb_thumb_eet ]
        # typedef enum _Ethumb_Thumb_Aspect {...} Ethumb_Thumb_Aspect;
        enum :ethumb_thumb_aspect, [ :ethumb_thumb_keep_aspect, :ethumb_thumb_ignore_aspect, :ethumb_thumb_crop ]
        # typedef enum _Ethumb_Thumb_Orientation {...} Ethumb_Thumb_Orientation;
        enum :ethumb_thumb_orientation, [ :ethumb_thumb_orient_none, :ethumb_thumb_rotate_90_cw, :ethumb_thumb_rotate_180,
            :ethumb_thumb_rotate_90_ccw, :ethumb_thumb_flip_horizontal, :ethumb_thumb_flip_vertical, :ethumb_thumb_flip_transpose, :ethumb_thumb_flip_transverse,
            :ethumb_thumb_orient_original ]
        #
        # TYPEDEFS
        # typedef struct _Ethumb_Version Ethumb_Version;
        typedef :pointer, :ethumb_version
        # typedef struct _Ethumb Ethumb;
        typedef :pointer, :ethumb
        #
        # CALLBACKS
        # typedef void (*Ethumb_Generate_Cb) (void *data, Ethumb *e, Eina_Bool success);
        callback :ethumb_generate_cb, [ :pointer, :ethumb, :bool ], :void
        #
        # VARIABLES
        # EAPI extern Ethumb_Version *ethumb_version;
        attach_variable :ethumb_version, :ethumb_version
        #
        # FUNCTIONS
        fcts = [
        # EAPI int ethumb_init(void);
        [ :ethumb_init, [  ], :int ],
        # EAPI int ethumb_shutdown(void);
        [ :ethumb_shutdown, [  ], :int ],
        # EAPI Ethumb * ethumb_new(void);
        [ :ethumb_new, [  ], :ethumb ],
        # EAPI void ethumb_free(Ethumb *e);
        [ :ethumb_free, [ :ethumb ], :void ],
        # EAPI Eina_Bool ethumb_frame_set(Ethumb *e, const char *theme_file, const char *group, const char *swallow);
        [ :ethumb_frame_set, [ :ethumb, :string, :string, :string ], :bool ],
        # EAPI void ethumb_frame_get(const Ethumb *e, const char **theme_file, const char **group, const char **swallow);
        [ :ethumb_frame_get, [ :ethumb, :pointer, :pointer, :pointer ], :void ],
        # EAPI void ethumb_thumb_dir_path_set(Ethumb *e, const char *path);
        [ :ethumb_thumb_dir_path_set, [ :ethumb, :string ], :void ],
        # EAPI const char *ethumb_thumb_dir_path_get(const Ethumb *e);
        [ :ethumb_thumb_dir_path_get, [ :ethumb ], :string ],
        # EAPI void ethumb_thumb_category_set(Ethumb *e, const char *category);
        [ :ethumb_thumb_category_set, [ :ethumb, :string ], :void ],
        # EAPI const char *ethumb_thumb_category_get(const Ethumb *e);
        [ :ethumb_thumb_category_get, [ :ethumb ], :string ],
        # EAPI void ethumb_thumb_path_set(Ethumb *e, const char *path, const char *key);
        [ :ethumb_thumb_path_set, [ :ethumb, :string, :string ], :void ],
        # EAPI void ethumb_thumb_path_get(Ethumb *e, const char **path, const char **key);
        [ :ethumb_thumb_path_get, [ :ethumb, :pointer, :pointer ], :void ],
        # EAPI void ethumb_thumb_hash(Ethumb *e);
        [ :ethumb_thumb_hash, [ :ethumb ], :void ],
        # EAPI void ethumb_thumb_hash_copy(Ethumb *dst, const Ethumb *src);
        [ :ethumb_thumb_hash_copy, [ :ethumb, :ethumb ], :void ],
        # EAPI void ethumb_thumb_fdo_set(Ethumb *e, Ethumb_Thumb_FDO_Size s);
        [ :ethumb_thumb_fdo_set, [ :ethumb, :ethumb_thumb_fdo_size ], :void ],
        # EAPI void ethumb_thumb_size_set(Ethumb *e, int tw, int th);
        [ :ethumb_thumb_size_set, [ :ethumb, :int, :int ], :void ],
        # EAPI void ethumb_thumb_size_get(const Ethumb *e, int *tw, int *th);
        [ :ethumb_thumb_size_get, [ :ethumb, :pointer, :pointer ], :void ],
        # EAPI void ethumb_thumb_format_set(Ethumb *e, Ethumb_Thumb_Format f);
        [ :ethumb_thumb_format_set, [ :ethumb, :ethumb_thumb_format ], :void ],
        # EAPI Ethumb_Thumb_Format ethumb_thumb_format_get(const Ethumb *e);
        [ :ethumb_thumb_format_get, [ :ethumb ], :ethumb_thumb_format ],
        # EAPI void ethumb_thumb_aspect_set(Ethumb *e, Ethumb_Thumb_Aspect a);
        [ :ethumb_thumb_aspect_set, [ :ethumb, :ethumb_thumb_aspect ], :void ],
        # EAPI Ethumb_Thumb_Aspect ethumb_thumb_aspect_get(const Ethumb *e);
        [ :ethumb_thumb_aspect_get, [ :ethumb ], :ethumb_thumb_aspect ],
        # EAPI void ethumb_thumb_orientation_set(Ethumb *e, Ethumb_Thumb_Orientation o);
        [ :ethumb_thumb_orientation_set, [ :ethumb, :ethumb_thumb_orientation ], :void ],
        # EAPI Ethumb_Thumb_Orientation ethumb_thumb_orientation_get(const Ethumb *e);
        [ :ethumb_thumb_orientation_get, [ :ethumb ], :ethumb_thumb_orientation ],
        # EAPI void ethumb_thumb_crop_align_set(Ethumb *e, float x, float y);
        [ :ethumb_thumb_crop_align_set, [ :ethumb, :float, :float ], :void ],
        # EAPI void ethumb_thumb_crop_align_get(const Ethumb *e, float *x, float *y);
        [ :ethumb_thumb_crop_align_get, [ :ethumb, :pointer, :pointer ], :void ],
        # EAPI void ethumb_thumb_quality_set(Ethumb *e, int quality);
        [ :ethumb_thumb_quality_set, [ :ethumb, :int ], :void ],
        # EAPI int ethumb_thumb_quality_get(const Ethumb *e);
        [ :ethumb_thumb_quality_get, [ :ethumb ], :int ],
        # EAPI void ethumb_thumb_compress_set(Ethumb *e, int compress);
        [ :ethumb_thumb_compress_set, [ :ethumb, :int ], :void ],
        # EAPI int ethumb_thumb_compress_get(const Ethumb *e);
        [ :ethumb_thumb_compress_get, [ :ethumb ], :int ],
        # EAPI void ethumb_video_start_set(Ethumb *e, float start);
        [ :ethumb_video_start_set, [ :ethumb, :float ], :void ],
        # EAPI float ethumb_video_start_get(const Ethumb *e);
        [ :ethumb_video_start_get, [ :ethumb ], :float ],
        # EAPI void ethumb_video_time_set(Ethumb *e, float time);
        [ :ethumb_video_time_set, [ :ethumb, :float ], :void ],
        # EAPI float ethumb_video_time_get(const Ethumb *e);
        [ :ethumb_video_time_get, [ :ethumb ], :float ],
        # EAPI void ethumb_video_interval_set(Ethumb *e, float interval);
        [ :ethumb_video_interval_set, [ :ethumb, :float ], :void ],
        # EAPI float ethumb_video_interval_get(const Ethumb *e);
        [ :ethumb_video_interval_get, [ :ethumb ], :float ],
        # EAPI void ethumb_video_ntimes_set(Ethumb *e, unsigned int ntimes);
        [ :ethumb_video_ntimes_set, [ :ethumb, :uint ], :void ],
        # EAPI unsigned int ethumb_video_ntimes_get(const Ethumb *e);
        [ :ethumb_video_ntimes_get, [ :ethumb ], :uint ],
        # EAPI void ethumb_video_fps_set(Ethumb *e, unsigned int fps);
        [ :ethumb_video_fps_set, [ :ethumb, :uint ], :void ],
        # EAPI unsigned int ethumb_video_fps_get(const Ethumb *e);
        [ :ethumb_video_fps_get, [ :ethumb ], :uint ],
        # EAPI void ethumb_document_page_set(Ethumb *e, unsigned int page);
        [ :ethumb_document_page_set, [ :ethumb, :uint ], :void ],
        # EAPI unsigned int ethumb_document_page_get(const Ethumb *e);
        [ :ethumb_document_page_get, [ :ethumb ], :uint ],
        # EAPI Eina_Bool ethumb_file_set(Ethumb *e, const char *path, const char *key);
        [ :ethumb_file_set, [ :ethumb, :string, :string ], :bool ],
        # EAPI void ethumb_file_get(const Ethumb *e, const char **path, const char **key);
        [ :ethumb_file_get, [ :ethumb, :pointer, :pointer ], :void ],
        # EAPI void ethumb_file_free(Ethumb *e);
        [ :ethumb_file_free, [ :ethumb ], :void ],
        # EAPI Eina_Bool ethumb_generate(Ethumb *e, Ethumb_Generate_Cb finished_cb, const void *data, Eina_Free_Cb free_data);
        [ :ethumb_generate, [ :ethumb, :ethumb_generate_cb, :pointer, :eina_free_cb ], :bool ],
        # EAPI Eina_Bool ethumb_exists(Ethumb *e);
        [ :ethumb_exists, [ :ethumb ], :bool ],
        # EAPI Ethumb *ethumb_dup(const Ethumb *e);
        [ :ethumb_dup, [ :ethumb ], :ethumb ],
        # EAPI Eina_Bool ethumb_cmp(const Ethumb *e1, const Ethumb *e2);
        [ :ethumb_cmp, [ :ethumb, :ethumb ], :bool ],
        # EAPI int ethumb_hash(const void *key, int key_length);
        [ :ethumb_hash, [ :pointer, :int ], :int ],
        # EAPI int ethumb_key_cmp(const void *key1, int key1_length, const void *key2, int key2_length);
        [ :ethumb_key_cmp, [ :pointer, :int, :pointer, :int ], :int ],
        # EAPI unsigned int ethumb_length(const void *key);
        [ :ethumb_length, [ :pointer ], :uint ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
