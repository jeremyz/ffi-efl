#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmGLView
        #
        FCT_PREFIX = 'elm_glview_' unless const_defined? :FCT_PREFIX
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
        # ENUMS
        # typedef enum _Elm_GLView_Mode {...} Elm_GLView_Mode;
        enum :elm_glview_mode, [ :elm_glview_none, 0, :elm_glview_alpha, (1<<1), :elm_glview_depth, (1<<2), :elm_glview_stencil, (1<<3),
            :elm_glview_direct, (1<<4) ]
        # typedef enum {...} Elm_GLView_Resize_Policy;
        enum :elm_glview_resize_policy, [ :elm_glview_resize_policy_recreate, 1, :elm_glview_resize_policy_scale, 2 ]
        # typedef enum {...} Elm_GLView_Render_Policy;
        enum :elm_glview_render_policy, [ :elm_glview_render_policy_on_demand, 1, :elm_glview_render_policy_always, 2 ]
        #
        # CALLBACKS
        # typedef void (*Elm_GLView_Func_Cb) (Evas_Object *obj);
        callback :elm_glview_func_cb, [ :evas_object ], :void
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_glview_add(Evas_Object *parent);
        [ :elm_glview_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_glview_size_set(Evas_Object *obj, Evas_Coord w, Evas_Coord h);
        [ :elm_glview_size_set, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_glview_size_get(const Evas_Object *obj, Evas_Coord *w, Evas_Coord *h);
        [ :elm_glview_size_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI Evas_GL_API *elm_glview_gl_api_get(const Evas_Object *obj);
        [ :elm_glview_gl_api_get, [ :evas_object ], :pointer ],
        # EAPI Eina_Bool elm_glview_mode_set(Evas_Object *obj, Elm_GLView_Mode mode);
        [ :elm_glview_mode_set, [ :evas_object, :elm_glview_mode ], :bool ],
        # EAPI Eina_Bool elm_glview_resize_policy_set(Evas_Object *obj, Elm_GLView_Resize_Policy policy);
        [ :elm_glview_resize_policy_set, [ :evas_object, :elm_glview_resize_policy ], :bool ],
        # EAPI Eina_Bool elm_glview_render_policy_set(Evas_Object *obj, Elm_GLView_Render_Policy policy);
        [ :elm_glview_render_policy_set, [ :evas_object, :elm_glview_render_policy ], :bool ],
        # EAPI void elm_glview_init_func_set(Evas_Object *obj, Elm_GLView_Func_Cb func);
        [ :elm_glview_init_func_set, [ :evas_object, :elm_glview_func_cb ], :void ],
        # EAPI void elm_glview_del_func_set(Evas_Object *obj, Elm_GLView_Func_Cb func);
        [ :elm_glview_del_func_set, [ :evas_object, :elm_glview_func_cb ], :void ],
        # EAPI void elm_glview_resize_func_set(Evas_Object *obj, Elm_GLView_Func_Cb func);
        [ :elm_glview_resize_func_set, [ :evas_object, :elm_glview_func_cb ], :void ],
        # EAPI void elm_glview_render_func_set(Evas_Object *obj, Elm_GLView_Func_Cb func);
        [ :elm_glview_render_func_set, [ :evas_object, :elm_glview_func_cb ], :void ],
        # EAPI void elm_glview_changed_set(Evas_Object *obj);
        [ :elm_glview_changed_set, [ :evas_object ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
