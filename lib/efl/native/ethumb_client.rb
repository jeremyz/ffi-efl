#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/ethumb'
#
module Efl
    #
    module EthumbClient
        #
        FCT_PREFIX = 'ethumb_client_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'ethumb_client.so.1'
        #
        # TYPEDEFS
        # typedef struct _Ethumb_Client Ethumb_Client;
        typedef :pointer, :ethumb_client
        # typedef struct _Ethumb_Exists Ethumb_Exists;
        typedef :pointer, :ethumb_exists
        # typedef struct _Ethumb_Client_Async Ethumb_Client_Async;
        typedef :pointer, :ethumb_client_async
        #
        # CALLBACKS
        # typedef void (*Ethumb_Client_Connect_Cb) (void *data, Ethumb_Client *client, Eina_Bool success);
        callback :ethumb_client_connect_cb, [ :pointer, :ethumb_client, :bool ], :void
        # typedef void (*Ethumb_Client_Die_Cb) (void *data, Ethumb_Client *client);
        callback :ethumb_client_die_cb, [ :pointer, :ethumb_client ], :void
        # typedef void (*Ethumb_Client_Generate_Cb) (void *data, Ethumb_Client *client, int id, const char *file, const char *key, const char *thumb_path, const char *thumb_key, Eina_Bool success);
        callback :ethumb_client_generate_cb, [ :pointer, :ethumb_client, :int, :string, :string, :string, :string, :bool ], :void
        # typedef void (*Ethumb_Client_Thumb_Exists_Cb) (void *data, Ethumb_Client *client, Ethumb_Exists *thread, Eina_Bool exists);
        callback :ethumb_client_thumb_exists_cb, [ :pointer, :ethumb_client, :ethumb_exists, :bool ], :void
        # typedef void (*Ethumb_Client_Generate_Cancel_Cb) (void *data, Eina_Bool success);
        callback :ethumb_client_generate_cancel_cb, [ :pointer, :bool ], :void
        # typedef void (*Ethumb_Client_Async_Done_Cb) (Ethumb_Client *ethumbd, const char *thumb_path, const char *thumb_key, void *data);
        callback :ethumb_client_async_done_cb, [ :ethumb_client, :string, :string, :pointer ], :void
        # typedef void (*Ethumb_Client_Async_Error_Cb) (Ethumb_Client *ethumbd, void *data);
        callback :ethumb_client_async_error_cb, [ :ethumb_client, :pointer ], :void
        #
        # FUNCTIONS
        fcts = [
        # EAPI int ethumb_client_init(void);
        [ :ethumb_client_init, [  ], :int ],
        # EAPI int ethumb_client_shutdown(void);
        [ :ethumb_client_shutdown, [  ], :int ],
        # EAPI Ethumb_Client * ethumb_client_connect(Ethumb_Client_Connect_Cb connect_cb, const void *data, Eina_Free_Cb free_data);
        [ :ethumb_client_connect, [ :ethumb_client_connect_cb, :pointer, :eina_free_cb ], :ethumb_client ],
        # EAPI void ethumb_client_disconnect(Ethumb_Client *client);
        [ :ethumb_client_disconnect, [ :ethumb_client ], :void ],
        # EAPI void ethumb_client_on_server_die_callback_set(Ethumb_Client *client, Ethumb_Client_Die_Cb server_die_cb, const void *data, Eina_Free_Cb free_data);
        [ :ethumb_client_on_server_die_callback_set, [ :ethumb_client, :ethumb_client_die_cb, :pointer, :eina_free_cb ], :void ],
        # EAPI void ethumb_client_fdo_set(Ethumb_Client *client, Ethumb_Thumb_FDO_Size s);
        [ :ethumb_client_fdo_set, [ :ethumb_client, :ethumb_thumb_fdo_size ], :void ],
        # EAPI void ethumb_client_size_set(Ethumb_Client *client, int tw, int th);
        [ :ethumb_client_size_set, [ :ethumb_client, :int, :int ], :void ],
        # EAPI void ethumb_client_size_get(const Ethumb_Client *client, int *tw, int *th);
        [ :ethumb_client_size_get, [ :ethumb_client, :pointer, :pointer ], :void ],
        # EAPI void ethumb_client_format_set(Ethumb_Client *client, Ethumb_Thumb_Format f);
        [ :ethumb_client_format_set, [ :ethumb_client, :ethumb_thumb_format ], :void ],
        # EAPI Ethumb_Thumb_Format ethumb_client_format_get(const Ethumb_Client *client);
        [ :ethumb_client_format_get, [ :ethumb_client ], :ethumb_thumb_format ],
        # EAPI void ethumb_client_aspect_set(Ethumb_Client *client, Ethumb_Thumb_Aspect a);
        [ :ethumb_client_aspect_set, [ :ethumb_client, :ethumb_thumb_aspect ], :void ],
        # EAPI Ethumb_Thumb_Aspect ethumb_client_aspect_get(const Ethumb_Client *client);
        [ :ethumb_client_aspect_get, [ :ethumb_client ], :ethumb_thumb_aspect ],
        # EAPI void ethumb_client_orientation_set(Ethumb_Client *client, Ethumb_Thumb_Orientation o);
        [ :ethumb_client_orientation_set, [ :ethumb_client, :ethumb_thumb_orientation ], :void ],
        # EAPI Ethumb_Thumb_Orientation ethumb_client_orientation_get(const Ethumb_Client *client);
        [ :ethumb_client_orientation_get, [ :ethumb_client ], :ethumb_thumb_orientation ],
        # EAPI void ethumb_client_crop_align_set(Ethumb_Client *client, float x, float y);
        [ :ethumb_client_crop_align_set, [ :ethumb_client, :float, :float ], :void ],
        # EAPI void ethumb_client_crop_align_get(const Ethumb_Client *client, float *x, float *y);
        [ :ethumb_client_crop_align_get, [ :ethumb_client, :pointer, :pointer ], :void ],
        # EAPI void ethumb_client_quality_set(Ethumb_Client *client, int quality);
        [ :ethumb_client_quality_set, [ :ethumb_client, :int ], :void ],
        # EAPI int ethumb_client_quality_get(const Ethumb_Client *client);
        [ :ethumb_client_quality_get, [ :ethumb_client ], :int ],
        # EAPI void ethumb_client_compress_set(Ethumb_Client *client, int compress);
        [ :ethumb_client_compress_set, [ :ethumb_client, :int ], :void ],
        # EAPI int ethumb_client_compress_get(const Ethumb_Client *client);
        [ :ethumb_client_compress_get, [ :ethumb_client ], :int ],
        # EAPI Eina_Bool ethumb_client_frame_set(Ethumb_Client *client, const char *file, const char *group, const char *swallow);
        [ :ethumb_client_frame_set, [ :ethumb_client, :string, :string, :string ], :bool ],
        # EAPI void ethumb_client_dir_path_set(Ethumb_Client *client, const char *path);
        [ :ethumb_client_dir_path_set, [ :ethumb_client, :string ], :void ],
        # EAPI const char * ethumb_client_dir_path_get(const Ethumb_Client *client);
        [ :ethumb_client_dir_path_get, [ :ethumb_client ], :string ],
        # EAPI void ethumb_client_category_set(Ethumb_Client *client, const char *category);
        [ :ethumb_client_category_set, [ :ethumb_client, :string ], :void ],
        # EAPI const char * ethumb_client_category_get(const Ethumb_Client *client);
        [ :ethumb_client_category_get, [ :ethumb_client ], :string ],
        # EAPI void ethumb_client_video_time_set(Ethumb_Client *client, float time);
        [ :ethumb_client_video_time_set, [ :ethumb_client, :float ], :void ],
        # EAPI void ethumb_client_video_start_set(Ethumb_Client *client, float start);
        [ :ethumb_client_video_start_set, [ :ethumb_client, :float ], :void ],
        # EAPI void ethumb_client_video_interval_set(Ethumb_Client *client, float interval);
        [ :ethumb_client_video_interval_set, [ :ethumb_client, :float ], :void ],
        # EAPI void ethumb_client_video_ntimes_set(Ethumb_Client *client, unsigned int ntimes);
        [ :ethumb_client_video_ntimes_set, [ :ethumb_client, :uint ], :void ],
        # EAPI void ethumb_client_video_fps_set(Ethumb_Client *client, unsigned int fps);
        [ :ethumb_client_video_fps_set, [ :ethumb_client, :uint ], :void ],
        # EAPI void ethumb_client_document_page_set(Ethumb_Client *client, unsigned int page);
        [ :ethumb_client_document_page_set, [ :ethumb_client, :uint ], :void ],
        # EAPI void ethumb_client_ethumb_setup(Ethumb_Client *client);
        [ :ethumb_client_ethumb_setup, [ :ethumb_client ], :void ],
        # EAPI void ethumb_client_thumb_path_set(Ethumb_Client *client, const char *path, const char *key);
        [ :ethumb_client_thumb_path_set, [ :ethumb_client, :string, :string ], :void ],
        # EAPI void ethumb_client_thumb_path_get(Ethumb_Client *client, const char **path, const char **key);
        [ :ethumb_client_thumb_path_get, [ :ethumb_client, :pointer, :pointer ], :void ],
        # EAPI Eina_Bool ethumb_client_file_set(Ethumb_Client *client, const char *path, const char *key);
        [ :ethumb_client_file_set, [ :ethumb_client, :string, :string ], :bool ],
        # EAPI void ethumb_client_file_get(Ethumb_Client *client, const char **path, const char **key);
        [ :ethumb_client_file_get, [ :ethumb_client, :pointer, :pointer ], :void ],
        # EAPI void ethumb_client_file_free(Ethumb_Client *client);
        [ :ethumb_client_file_free, [ :ethumb_client ], :void ],
        # EAPI Ethumb_Exists *ethumb_client_thumb_exists(Ethumb_Client *client, Ethumb_Client_Thumb_Exists_Cb exists_cb, const void *data);
        [ :ethumb_client_thumb_exists, [ :ethumb_client, :ethumb_client_thumb_exists_cb, :pointer ], :ethumb_exists ],
        # EAPI void ethumb_client_thumb_exists_cancel(Ethumb_Exists *exists);
        [ :ethumb_client_thumb_exists_cancel, [ :ethumb_exists ], :void ],
        # EAPI Eina_Bool ethumb_client_thumb_exists_check(Ethumb_Exists *exists);
        [ :ethumb_client_thumb_exists_check, [ :ethumb_exists ], :bool ],
        # EAPI int ethumb_client_generate(Ethumb_Client *client, Ethumb_Client_Generate_Cb generated_cb, const void *data, Eina_Free_Cb free_data);
        [ :ethumb_client_generate, [ :ethumb_client, :ethumb_client_generate_cb, :pointer, :eina_free_cb ], :int ],
        # EAPI void ethumb_client_generate_cancel(Ethumb_Client *client, int id, Ethumb_Client_Generate_Cancel_Cb cancel_cb, const void *data, Eina_Free_Cb free_data);
        [ :ethumb_client_generate_cancel, [ :ethumb_client, :int, :ethumb_client_generate_cancel_cb, :pointer, :eina_free_cb ], :void ],
        # EAPI void ethumb_client_generate_cancel_all(Ethumb_Client *client);
        [ :ethumb_client_generate_cancel_all, [ :ethumb_client ], :void ],
        # EAPI Ethumb_Client_Async *ethumb_client_thumb_async_get(Ethumb_Client *client, Ethumb_Client_Async_Done_Cb done, Ethumb_Client_Async_Error_Cb error, const void *data);
        [ :ethumb_client_thumb_async_get, [ :ethumb_client, :ethumb_client_async_done_cb, :ethumb_client_async_error_cb, :pointer ],
            :ethumb_client_async ],
        # EAPI void ethumb_client_thumb_async_cancel(Ethumb_Client *client, Ethumb_Client_Async *request);
        [ :ethumb_client_thumb_async_cancel, [ :ethumb_client, :ethumb_client_async ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
