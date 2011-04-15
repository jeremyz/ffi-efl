#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/ffi_helper'
#
module E17
    module EVAS
        #
        extend FFIHelper
        extend FFI::Library
        #
        ffi_lib 'evas'
        #
        typedef :pointer, :eina_list #TODO
        typedef :pointer, :data
        typedef :pointer, :evas
        typedef :pointer, :evas_map
        typedef :pointer, :evas_object
        typedef :pointer, :evas_engine_info
        typedef :pointer, :event_info
        typedef :uint, :timestamp
        #
        enum :evas_alloc_error, [:none,:fatal,:recovered]
        enum :evas_font_hinting_flags, [:none,:auto,:bytecode]
        enum :evas_aspect_control, [:none,:neither,:horizontal,:vertical,:both]
        enum :evas_callback_type, [
            :mouse_in, :mouse_out, :mouse_down, :mouse_up, :mouse_move, :mouse_wheel,
            :multi_down, :multi_up, :multi_move, :free,
            :key_down, :key_up, :focus_in, :focus_out,
            :show, :hide, :move, :resize, :restack, :del, :hold, :change_size_hints, :image_preload,
            :canvas_focus_in, :canvas_focus_out, :render_flush_pre, :render_flush_post, :canvas_object_focus_is, :canvas_object_focus_out,
            :image_unloaded
        ]
        enum :evas_object_pointer_mode, [:autograb,:nograb ]
        enum :evas_render_op, [:blend,:blend_rel,:copy,:copy_rel,:add,:add_rel,:sub,:sub_rel,:tint,:tint_rel,:mask,:mul]
        #
        callback :evas_smart_cb, [:data, :evas_object, :event_info], :void
        callback :evas_event_cb, [:data, :evas, :event_info], :void
        callback :evas_object_event_post_cb, [:data, :evas], :bool
        callback :evas_object_event_cb, [:data, :evas, :evas_object, :event_info], :void
        callback :evas_async_events_put_cb, [:pointer, :evas_callback_type, :pointer], :void
        #
        fcts = [
            # http://docs.enlightenment.org/auto/evas/group__Evas__Group.html
            [ :evas_init, [], :int],
            [ :evas_shutdown, [], :int],
            [ :evas_alloc_error, [], :evas_alloc_error],
            [ :evas_async_events_fd_get, [], :int],
            [ :evas_async_events_process, [], :int],
            [ :evas_async_events_put, [:pointer, :evas_callback_type, :event_info, :evas_async_events_put_cb], :bool],
            # http://docs.enlightenment.org/auto/evas/group__Evas__Canvas.html
            [ :evas_new, [], :evas ],
            [ :evas_free, [:evas], :void ],
            [ :evas_focus_in, [:evas], :void ],
            [ :evas_focus_out, [:evas], :void ],
            [ :evas_focus_state_get, [:evas], :bool ],
            [ :evas_nochange_push, [:evas], :void ],
            [ :evas_nochange_pop, [:evas], :void ],
            [ :evas_data_attach_set, [:evas, :data], :void ],
            [ :evas_data_attach_get, [:evas], :data],
            [ :evas_damage_rectangle_add, [:evas, :int, :int, :int, :int], :void ],
            [ :evas_obscured_rectangle_add, [:evas, :int, :int, :int, :int], :void ],
            [ :evas_obscured_clear, [:evas], :void ],
            [ :evas_render_updates, [:evas], :eina_list ],
            [ :evas_render_updates_free , [:eina_list], :void ],
            [ :evas_render, [:evas], :void ],
            [ :evas_norender, [:evas], :void ],
            [ :evas_render_idle_flush, [:evas], :void ],
            [ :evas_render_dump, [:evas], :void ],
            # http://docs.enlightenment.org/auto/evas/group__Evas__Output__Method.html
            [ :evas_render_method_lookup, [:string], :int],
            [ :evas_render_method_list, [], :eina_list],
            [ :evas_render_method_list_free, [:eina_list], :void],
            [ :evas_output_method_set, [:evas, :int], :void],
            [ :evas_output_method_get, [:evas], :int],
            [ :evas_engine_info_get, [:evas], :evas_engine_info],
            [ :evas_engine_info_set, [:evas, :evas_engine_info], :bool],
            # http://docs.enlightenment.org/auto/evas/group__Evas__Output__Size.html
            [ :evas_output_size_set, [:evas, :int, :int], :void],
            [ :evas_output_size_get, [:evas, :pointer, :pointer], :void],
            [ :evas_output_viewport_set, [:evas, :int, :int, :int, :int], :void],
            [ :evas_output_viewport_get, [:evas, :pointer, :pointer, :pointer, :pointer], :void],
            # http://docs.enlightenment.org/auto/evas/group__Evas__Coord__Mapping__Group.html
            [ :evas_coord_screen_x_to_world, [:evas, :int], :int],
            [ :evas_coord_screen_y_to_world, [:evas, :int], :int],
            [ :evas_coord_world_x_to_screen, [:evas, :int], :int],
            [ :evas_coord_world_y_to_screen, [:evas, :int], :int],
            # http://docs.enlightenment.org/auto/evas/group__Evas__Pointer__Group.html
            [ :evas_pointer_output_xy_get, [:evas, :pointer, :pointer], :void],
            [ :evas_pointer_canvas_xy_get, [:evas, :int, :int], :void],
            [ :evas_pointer_button_down_mask_get, [:evas], :int],
            [ :evas_pointer_inside_get, [:evas], :bool],
            #
            [ :evas_event_freeze, [:evas], :void],
            [ :evas_event_thaw, [:evas], :void],
            [ :evas_event_freeze_get, [:evas], :int],
            [ :evas_event_feed_mouse_down, [:evas, :int, :timestamp, :data], :void],
            [ :evas_event_feed_mouse_up, [:evas, :int, :timestamp, :data], :void],
            [ :evas_event_feed_mouse_move, [:evas, :int, :int, :timestamp, :data], :void],
            [ :evas_event_feed_mouse_in, [:evas, :timestamp, :data], :void],
            [ :evas_event_feed_mouse_out, [:evas, :timestamp, :data], :void],
            [ :evas_event_feed_multi_down, [:evas, :int, :int, :int, :double, :double, :double, :double, :double, :double, :double, :int, :timestamp, :data], :void],
            [ :evas_event_feed_multi_up, [:evas, :int, :int, :int, :double, :double, :double, :double, :double, :double, :double, :int, :timestamp, :data], :void],
            [ :evas_event_feed_multi_move, [:evas, :int, :int, :int, :double, :double, :double, :double, :double, :double, :double, :timestamp, :data], :void],
            [ :evas_event_feed_mouse_cancel, [:evas, :timestamp, :data], :void],
            [ :evas_event_feed_mouse_wheel, [:evas, :int, :int, :timestamp, :data], :void],
            [ :evas_event_feed_key_down, [:evas, :string, :string, :string, :string, :timestamp, :data], :void],
            [ :evas_event_feed_key_up, [:evas, :string, :string, :string, :string, :timestamp, :data], :void],
            [ :evas_event_feed_hold, [:evas, :int, :timestamp, :data], :void],
            # http://docs.enlightenment.org/auto/evas/group__Evas__Canvas__Events.html
            [ :evas_event_callback_add, [:evas, :evas_callback_type, :evas_event_cb, :data], :void],
            [ :evas_event_callback_del, [:evas, :evas_callback_type, :evas_event_cb], :data],
            [ :evas_event_callback_del_full, [:evas, :evas_callback_type, :evas_event_cb, :data], :data],
            [ :evas_post_event_callback_push, [:evas, :evas_object_event_post_cb, :data], :void],
            [ :evas_post_event_callback_remove, [:evas, :evas_object_event_post_cb], :void],
            [ :evas_post_event_callback_remove_full, [:evas, :evas_object_event_post_cb, :data], :void],
            [ :evas_image_cache_flush, [:evas], :void],
            [ :evas_image_cache_reload, [:evas], :void],
            [ :evas_image_cache_set, [:evas, :int], :void],
            [ :evas_image_cache_get, [:evas], :int],
            # http://docs.enlightenment.org/auto/evas/group__Evas__Font__Group.html
            [ :evas_font_hinting_set, [:evas, :evas_font_hinting_flags], :void],
            [ :evas_font_hinting_get, [:evas], :evas_font_hinting_flags],
            [ :evas_font_hinting_can_hint, [:evas, :evas_font_hinting_flags], :bool],
            [ :evas_font_cache_flush, [:evas], :void],
            [ :evas_font_cache_set, [:evas, :int], :void],
            [ :evas_font_cache_get, [:evas], :int],
            [ :evas_font_available_list, [:evas], :eina_list],
            [ :evas_font_available_list_free, [:eina_list], :void],
            [ :evas_font_path_clear, [:evas], :void],
            [ :evas_font_path_append, [:evas, :string], :void],
            [ :evas_font_path_prepend, [:evas, :string], :void],
            [ :evas_font_path_list, [:evas], :eina_list],
            # EVAS OBJECT
            [ :evas_object_clip_set, [:evas_object, :evas_object], :void],
            [ :evas_object_clip_get, [:evas_object], :evas_object],
            [ :evas_object_clip_unset, [:evas_object], :void],
            [ :evas_object_clipees_get, [:evas_object], :eina_list],
            [ :evas_object_focus_set, [:evas_object, :bool], :void],
            [ :evas_object_focus_get, [:evas_object], :bool],
            [ :evas_object_layer_set, [:evas_object, :short], :void],
            [ :evas_object_layer_get, [:evas_object], :short],
            [ :evas_object_name_set, [:evas_object, :string], :void],
            [ :evas_object_name_get, [:evas_object], :string],
            [ :evas_object_ref, [:evas_object], :void],
            [ :evas_object_unref, [:evas_object], :void],
            [ :evas_object_del, [:evas_object], :void],
            [ :evas_object_move, [:evas_object, :int, :int], :void],
            [ :evas_object_resize, [:evas_object, :int, :int], :void],
            [ :evas_object_geometry_get, [:evas_object, :pointer, :pointer, :pointer, :pointer], :void],
            [ :evas_object_show, [:evas_object], :void],
            [ :evas_object_hide, [:evas_object], :void],
            [ :evas_object_visible_get, [:evas_object], :bool],
            [ :evas_object_color_set, [:evas_object, :int, :int, :int, :int], :void],
            [ :evas_object_color_get, [:evas_object, :pointer, :pointer, :pointer, :pointer], :void],
            [ :evas_object_evas_get, [:evas_object], :evas],
            [ :evas_object_type_get, [:evas_object], :string ],
            [ :evas_object_raise, [:evas_object], :void],
            [ :evas_object_lower, [:evas_object], :void],
            [ :evas_object_stack_above, [:evas_object, :evas_object], :void],
            [ :evas_object_stack_below, [:evas_object, :evas_object], :void],
            [ :evas_object_above_get, [:evas_object], :evas_object],
            [ :evas_object_below_get, [:evas_object], :evas_object],
            [ :evas_object_event_callback_add, [:evas_object, :evas_callback_type, :evas_object_event_cb, :data], :void],
            [ :evas_object_event_callback_del, [:evas_object, :evas_callback_type, :evas_object_event_cb], :data],
            [ :evas_object_event_callback_del_full, [:evas_object, :evas_callback_type, :evas_object_event_cb, :data], :data],
            [ :evas_object_pass_events_set, [:evas_object, :bool], :void],
            [ :evas_object_pass_events_get, [:evas_object], :bool],
            [ :evas_object_repeat_events_set, [:evas_object, :bool], :void],
            [ :evas_object_repeat_events_get, [:evas_object], :bool],
            [ :evas_object_propagate_events_set, [:evas_object, :bool], :void],
            [ :evas_object_propagate_events_get, [:evas_object], :bool],
            [ :evas_object_map_enable_set, [:evas_object, :bool], :void],
            [ :evas_object_map_enable_get, [:evas_object], :bool],
            [ :evas_object_map_source_set, [:evas_object, :evas_object], :void],
            [ :evas_object_map_source_get, [:evas_object], :evas_object],
            #
            [ :evas_object_map_set, [:evas_object, :evas_map], :void],
            [ :evas_object_map_get, [:evas_object], :evas_map],
            [ :evas_map_util_points_populate_from_object_full, [:evas_map, :evas_object, :int], :void],
            [ :evas_map_util_points_populate_from_object, [:evas_map, :evas_object], :void],
            [ :evas_map_util_points_populate_from_geometry, [:evas_map, :int, :int, :int, :int, :int], :void],
            [ :evas_map_util_points_color_set, [:evas_map, :int, :int, :int, :int], :void],
            [ :evas_map_util_rotate, [:evas_map, :double, :int, :int], :void],
            [ :evas_map_util_zoom, [:evas_map, :double, :double, :int, :int], :void],
            [ :evas_map_util_3d_rotate, [:evas_map, :double, :double, :double, :int, :int, :int], :void],
            [ :evas_map_util_3d_lighting, [:evas_map, :int, :int, :int, :int, :int, :int, :int, :int, :int], :void],
            [ :evas_map_util_3d_perspective, [:evas_map, :int, :int, :int, :int], :void],
            [ :evas_map_util_clockwise_get, [:evas_map], :bool],
            [ :evas_map_new, [:int], :evas_map],
            [ :evas_map_smooth_set, [:evas_map, :bool], :void],
            [ :evas_map_smooth_get, [:evas_map], :bool],
            [ :evas_map_alpha_set, [:evas_map, :bool], :void],
            [ :evas_map_alpha_get, [:evas_map], :bool],
            [ :evas_map_dup, [:evas_map], :evas_map],
            [ :evas_map_free, [:evas_map], :void],
            [ :evas_map_count_get, [:evas_map], :int],
            [ :evas_map_point_coord_set, [:evas_map, :int, :int, :int, :int], :void],
            [ :evas_map_point_coord_get, [:evas_map, :int, :pointer, :pointer, :pointer], :void],
            [ :evas_map_point_image_uv_set, [:evas_map, :int, :double, :double], :void],
            [ :evas_map_point_image_uv_get, [:evas_map, :int, :pointer, :pointer], :void],
            [ :evas_map_point_color_set, [:evas_map, :int, :int, :int, :int, :int], :void],
            [ :evas_map_point_color_get, [:evas_map, :int, :pointer, :pointer, :pointer, :pointer], :void],
            #
            [ :evas_object_size_hint_min_get, [:evas_object, :pointer, :pointer], :void],
            [ :evas_object_size_hint_min_set, [:evas_object, :int, :int], :void],
            [ :evas_object_size_hint_max_get, [:evas_object, :pointer, :pointer], :void],
            [ :evas_object_size_hint_max_set, [:evas_object, :int, :int], :void],
            [ :evas_object_size_hint_request_get, [:evas_object, :pointer, :pointer], :void],
            [ :evas_object_size_hint_request_set, [:evas_object, :int, :int], :void],
            [ :evas_object_size_hint_aspect_get, [:evas_object, :evas_aspect_control, :pointer, :pointer], :void],
            [ :evas_object_size_hint_aspect_set, [:evas_object, :evas_aspect_control, :int, :int], :void],
            [ :evas_object_size_hint_align_get, [:evas_object, :pointer, :pointer], :void],
            [ :evas_object_size_hint_align_set, [:evas_object, :double, :double], :void],
            [ :evas_object_size_hint_weight_get, [:evas_object, :pointer, :pointer], :void],
            [ :evas_object_size_hint_weight_set, [:evas_object, :double, :double], :void],
            [ :evas_object_size_hint_padding_get, [:evas_object, :pointer, :pointer, :pointer, :pointer], :void],
            [ :evas_object_size_hint_padding_set, [:evas_object, :int, :int, :int, :int], :void],
            [ :evas_object_data_set, [:evas_object, :string, :data], :void],
            [ :evas_object_data_get, [:evas_object, :string], :data],
            [ :evas_object_data_del, [:evas_object, :string], :data],
            [ :evas_object_pointer_mode_set, [:evas_object, :evas_object_pointer_mode], :void],
            [ :evas_object_pointer_mode_get, [:evas_object], :evas_object_pointer_mode],
            [ :evas_object_anti_alias_set, [:evas_object, :bool], :void],
            [ :evas_object_anti_alias_get, [:evas_object], :bool],
            [ :evas_object_scale_set, [:evas_object, :double], :void],
            [ :evas_object_scale_get, [:evas_object], :double],
            [ :evas_object_render_op_set, [:evas_object, :evas_render_op], :void],
            [ :evas_object_render_op_get, [:evas_object], :evas_render_op],
            [ :evas_object_precise_is_inside_set, [:evas_object, :bool], :void],
            [ :evas_object_precise_is_inside_get, [:evas_object], :bool],
            [ :evas_object_static_clip_set, [:evas_object, :bool], :void],
            [ :evas_object_static_clip_get, [:evas_object], :bool],
            #
            [ :evas_focus_get, [:evas], :evas_object],
            [ :evas_object_name_find, [:evas, :string], :evas_object],
            [ :evas_object_top_at_xy_get, [:evas, :int, :int, :bool, :bool], :evas_object],
            [ :evas_object_top_at_pointer_get, [:evas], :evas_object],
            [ :evas_object_top_in_rectangle_get, [:evas, :int, :int, :int, :int, :bool, :bool], :evas_object],
            [ :evas_objects_at_xy_get, [:evas, :int, :int, :bool, :bool], :eina_list],
            [ :evas_objects_in_rectangle_get, [:evas, :int, :int, :int, :int, :bool, :bool], :eina_list],
            [ :evas_object_bottom_get, [:evas], :evas_object],
            [ :evas_object_top_get, [:evas], :evas_object],
            # TODO
            # /opt/e17/include/evas-1/Evas.h 4283
            # http://docs.enlightenment.org/auto/evas/group__Evas__GL.html
        ]
        #
        attach_fcts fcts
        #
        create_aliases 'evas_'.length, fcts
        #
        class Evas
            def initialize; @ptr = EVAS.evas_new; end
            def free; EVAS.evas_free @ptr; @ptr=nil; end
            def focus_in; EVAS.evas_focus_in @ptr; end
            def focus_out; EVAS.evas_focus_out @ptr; end
            def focus_state_get; EVAS.evas_focus_state_get @ptr; end
            def nochange_push; EVAS.evas_nochange_push @ptr; end
            def nochange_pop; EVAS.evas_nochange_pop @ptr; end
            def data_attach_set data; EVAS.evas_data_attach_set @ptr, data; end
            def data_attach_get; EVAS.evas_data_attach_get @ptr; end
            def damage_rectangle_add x, y, w, h; EVAS.evas_damage_rectangle_add @ptr, x, y, w, h; end
            def obscured_rectangle_add x, y, w, h; EVAS.evas_obscured_rectangle_add @ptr, x, y, w, h; end
            def obscured_clear; EVAS.evas_obscured_clear @ptr; end
            def render_updates; EVAS.evas_render_updates @ptr; end
#            def rendre_updates_free updates; EVAS.evas_render_updates_free updates; end
            def render; EVAS.evas_render @ptr; end
            def norender; EVAS.evas_norender @ptr; end
            def render_idle_flush; EVAS.evas_render_idle_flush @ptr; end
            def render_dump; EVAS.evas_render_dump @ptr; end
            #
            def output_method_set method; EVAS.evas_output_method_set @ptr, method; end
            def output_method_get; EVAS.evas_output_method_get @ptr; end
            def engine_info_get; EVAS.evas_engine_info_get @ptr; end
            def engine_info_set info; EVAS.evas_engine_info_set @ptr, info; end
            #
            def output_size_set w, h; EVAS.evas_output_size_set @ptr, w, h; end
            def output_size_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                EVAS.evas_output_size_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
            def output_viewport_set x, y, w, h; EVAS.evas_output_viewport_set @ptr, x, y, w, h; end
            def output_viewport_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                EVAS.evas_output_viewport_get @ptr, x, y, w, h
                [ x.read_int, y.read_int, w.read_int, h.read_int ]
            end
            #
            def coord_screen_x_to_world x; EVAS.evas_coord_screen_x_to_world @ptr, x; end
            def coord_screen_y_to_world y; EVAS.evas_coord_screen_y_to_world @ptr, y; end
            def coord_world_x_to_screen x; EVAS.evas_coord_world_x_to_screen @ptr, x; end
            def coord_world_y_to_screen y; EVAS.evas_coord_world_y_to_screen @ptr, y; end
            #
            def pointer_output_xy_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                EVAS.evas_pointer_output_xy_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
            def pointer_canvas_xy_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                EVAS.evas_pointer_canvas_xy_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
            def pointer_button_down_mask_get; EVAS.evas_pointer_button_down_mask_get @ptr; end
            def pointer_inside_get; EVAS.evas_pointer_inside_get @ptr; end
            #
        end
        #
        class EvasObject
            def type_get
                EVAS.evas_object_type_get @evas
            end
            def ref
                EVAS.evas_object_type_ref @evas
            end
            def unref
                EVAS.evas_object_type_unref @evas
            end
            def del
                EVAS.evas_object_type_del @evas; @evas = nil
            end
            def move x, y
                EVAS.evas_object_move @evas, x, y
            end
            def resize w, h
                EVAS.evas_object_resize @evas, w, h
            end
            def geometry_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                EVAS.evas_object_geometry_get @evas, x, y, w, h
                [ x.read_int, y.read_int, w.read_int, h.read_int ]
            end
            def show
                EVAS.evas_object_show @evas
            end
            def hide
                EVAS.evas_object_hide @evas
            end
            def visible?
                EVAS.evas_object_visible_get @evas
            end
            def color_set r, g, b, a
                EVAS.EVAS.evas_object_color_set @evas, r, g, b, a
            end
            def color_get
                r = FFI::MemoryPointer.new :int
                g = FFI::MemoryPointer.new :int
                b = FFI::MemoryPointer.new :int
                a = FFI::MemoryPointer.new :int
                EVAS.evas_object_color_get @evas, r, g, b, a
                [ r.read_int, g.read_int, b.read_int, a.read_int ]
            end
            def EVAS.evas_get
                evas_object_evas_get @evas
            end
        end
    end
end
#
# EOF
