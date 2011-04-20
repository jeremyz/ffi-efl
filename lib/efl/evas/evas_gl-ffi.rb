#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi'
#
module Efl
    #
    module Evasgl
        def self.method_missing m, *args, &block
            return Efl::API.send 'evas_gl_'+m.to_s, *args, &block
        end
    end
    #
    module API
        #
        #
        ffi_lib 'evas'
        #
        # ENUMS
        # typedef enum _Evas_GL_Color_Format {...} Evas_GL_Color_Format;
        enum :evas_gl_color_format, [ :evas_gl_rgb_8, :evas_gl_rgba_8, :evas_gl_rgb_32, :evas_gl_rgba_32 ]
        # typedef enum _Evas_GL_Depth_Bits {...} Evas_GL_Depth_Bits;
        enum :evas_gl_depth_bits, [ :evas_gl_depth_bit_8, :evas_gl_depth_bit_16, :evas_gl_depth_bit_24, :evas_gl_depth_bit_32, :evas_gl_depth_none ]
        # typedef enum _Evas_GL_Stencil_Bits {...} Evas_GL_Stencil_Bits;
        enum :evas_gl_stencil_bits, [ :evas_gl_stencil_bit_1, :evas_gl_stencil_bit_2, :evas_gl_stencil_bit_4, :evas_gl_stencil_bit_8,
            :evas_gl_stencil_bit_16, :evas_gl_stencil_none ]
        #
        # TYPEDEFS
        # typedef struct _Evas_GL Evas_GL;
        typedef :pointer, :evas_gl
        typedef :pointer, :evas_gl_p
        # typedef struct _Evas_GL_Surface Evas_GL_Surface;
        typedef :pointer, :evas_gl_surface
        typedef :pointer, :evas_gl_surface_p
        # typedef struct _Evas_GL_Context Evas_GL_Context;
        typedef :pointer, :evas_gl_context
        typedef :pointer, :evas_gl_context_p
        # typedef struct _Evas_GL_Config Evas_GL_Config;
        typedef :pointer, :evas_gl_config
        typedef :pointer, :evas_gl_config_p
        # typedef void* Evas_GL_Func;
        typedef :void*, :evas_gl_func
        #
        # CALLBACKS
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_GL *evas_gl_new (Evas *e) EINA_WARN_UNUSED_RESULT;
        [ :evas_gl_new, [ :evas_p ], :evas_gl_p ],
        # EAPI void evas_gl_free (Evas_GL *evas_gl);
        [ :evas_gl_free, [ :evas_gl_p ], :void ],
        # EAPI Evas_GL_Surface *evas_gl_surface_create (Evas_GL *evas_gl, Evas_GL_Config *cfg, int w, int h) EINA_WARN_UNUSED_RESULT;
        [ :evas_gl_surface_create, [ :evas_gl_p, :evas_gl_config_p, :int, :int ], :evas_gl_surface_p ],
        # EAPI void evas_gl_surface_destroy (Evas_GL *evas_gl, Evas_GL_Surface *surf);
        [ :evas_gl_surface_destroy, [ :evas_gl_p, :evas_gl_surface_p ], :void ],
        # EAPI Evas_GL_Context *evas_gl_context_create (Evas_GL *evas_gl, Evas_GL_Context *share_ctx) EINA_WARN_UNUSED_RESULT;
        [ :evas_gl_context_create, [ :evas_gl_p, :evas_gl_context_p ], :evas_gl_context_p ],
        # EAPI void evas_gl_context_destroy (Evas_GL *evas_gl, Evas_GL_Context *ctx);
        [ :evas_gl_context_destroy, [ :evas_gl_p, :evas_gl_context_p ], :void ],
        # EAPI Eina_Bool evas_gl_make_current (Evas_GL *evas_gl, Evas_GL_Surface *surf, Evas_GL_Context *ctx);
        [ :evas_gl_make_current, [ :evas_gl_p, :evas_gl_surface_p, :evas_gl_context_p ], :eina_bool ],
        # EAPI Evas_GL_Func evas_gl_proc_address_get (Evas_GL *evas_gl, const char *name) EINA_WARN_UNUSED_RESULT;
        [ :evas_gl_proc_address_get, [ :evas_gl_p, :string ], :void* ],
        # EAPI Eina_Bool evas_gl_native_surface_get (Evas_GL *evas_gl, Evas_GL_Surface *surf, Evas_Native_Surface *ns);
        [ :evas_gl_native_surface_get, [ :evas_gl_p, :evas_gl_surface_p, :evas_native_surface_p ], :eina_bool ],
        ]
        #
        attach_fcts fcts
    end
end
#
# EOF
