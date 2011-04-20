#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/evas/evas-ffi'
#
module Efl
    module Evas
        #
        class Evas
            def initialize; @ptr = Efl::API.evas_new; end
            def free; Efl::API.evas_free @ptr; @ptr=nil; end
            def focus_in; Efl::API.evas_focus_in @ptr; end
            def focus_out; Efl::API.evas_focus_out @ptr; end
            def focus_state_get; Efl::API.evas_focus_state_get @ptr; end
            def nochange_push; Efl::API.evas_nochange_push @ptr; end
            def nochange_pop; Efl::API.evas_nochange_pop @ptr; end
            def data_attach_set data; Efl::API.evas_data_attach_set @ptr, data; end
            def data_attach_get; Efl::API.evas_data_attach_get @ptr; end
            def damage_rectangle_add x, y, w, h; Efl::API.evas_damage_rectangle_add @ptr, x, y, w, h; end
            def obscured_rectangle_add x, y, w, h; Efl::API.evas_obscured_rectangle_add @ptr, x, y, w, h; end
            def obscured_clear; Efl::API.evas_obscured_clear @ptr; end
            def render_updates; Efl::API.evas_render_updates @ptr; end
#            def rendre_updates_free updates; Efl::API.evas_render_updates_free updates; end
            def render; Efl::API.evas_render @ptr; end
            def norender; Efl::API.evas_norender @ptr; end
            def render_idle_flush; Efl::API.evas_render_idle_flush @ptr; end
            def render_dump; Efl::API.evas_render_dump @ptr; end
            #
            def output_method_set method; Efl::API.evas_output_method_set @ptr, method; end
            def output_method_get; Efl::API.evas_output_method_get @ptr; end
            def engine_info_get; Efl::API.evas_engine_info_get @ptr; end
            def engine_info_set info; Efl::API.evas_engine_info_set @ptr, info; end
            #
            def output_size_set w, h; Efl::API.evas_output_size_set @ptr, w, h; end
            def output_size_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                Efl::API.evas_output_size_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
            def output_viewport_set x, y, w, h; Efl::API.evas_output_viewport_set @ptr, x, y, w, h; end
            def output_viewport_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                Efl::API.evas_output_viewport_get @ptr, x, y, w, h
                [ x.read_int, y.read_int, w.read_int, h.read_int ]
            end
            #
            def coord_screen_x_to_world x; Efl::API.evas_coord_screen_x_to_world @ptr, x; end
            def coord_screen_y_to_world y; Efl::API.evas_coord_screen_y_to_world @ptr, y; end
            def coord_world_x_to_screen x; Efl::API.evas_coord_world_x_to_screen @ptr, x; end
            def coord_world_y_to_screen y; Efl::API.evas_coord_world_y_to_screen @ptr, y; end
            #
            def pointer_output_xy_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                Efl::API.evas_pointer_output_xy_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
            def pointer_canvas_xy_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                Efl::API.evas_pointer_canvas_xy_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
            def pointer_button_down_mask_get; Efl::API.evas_pointer_button_down_mask_get @ptr; end
            def pointer_inside_get; Efl::API.evas_pointer_inside_get @ptr; end
            #
        end
        #
        class Efl::APIObject
            def type_get
                Efl::API.evas_object_type_get @evas
            end
            def ref
                Efl::API.evas_object_type_ref @evas
            end
            def unref
                Efl::API.evas_object_type_unref @evas
            end
            def del
                Efl::API.evas_object_type_del @evas; @evas = nil
            end
            def move x, y
                Efl::API.evas_object_move @evas, x, y
            end
            def resize w, h
                Efl::API.evas_object_resize @evas, w, h
            end
            def geometry_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                Efl::API.evas_object_geometry_get @evas, x, y, w, h
                [ x.read_int, y.read_int, w.read_int, h.read_int ]
            end
            def show
                Efl::API.evas_object_show @evas
            end
            def hide
                Efl::API.evas_object_hide @evas
            end
            def visible?
                Efl::API.evas_object_visible_get @evas
            end
            def color_set r, g, b, a
                Efl::API.evas_object_color_set @evas, r, g, b, a
            end
            def color_get
                r = FFI::MemoryPointer.new :int
                g = FFI::MemoryPointer.new :int
                b = FFI::MemoryPointer.new :int
                a = FFI::MemoryPointer.new :int
                Efl::API.evas_object_color_get @evas, r, g, b, a
                [ r.read_int, g.read_int, b.read_int, a.read_int ]
            end
            def evas_get
                Efl::API.evas_object_evas_get @evas
            end
        end
    end
end
#
# EOF
