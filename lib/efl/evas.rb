#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl'
require 'efl/native/evas'
#
module Efl
    #
    module Native
        #
        callback :new_update_region_cb, [:int, :int, :int, :int, :pointer], :pointer
        callback :free_update_region_cb, [:int, :int, :int, :int, :pointer], :void
        #
        class EngineInfoStruct < FFI::Struct
            layout  :magic,                 :int
        end
        class EngineInfoBufferFuncStruct < FFI::Struct
            layout  :new_update_region,     :new_update_region_cb,
                    :free_update_region,    :free_update_region_cb
        end
        class EngineInfoBufferInfoStruct < FFI::Struct
            layout  :depth_type,            :int,
                    :dest_buffer,           :pointer,
                    :dest_buffer_row_bytes, :int,
                    :use_color_key,         :char,
                    :alpha_threshold,       :int,
                    :color_key_r,           :int,
                    :color_key_g,           :int,
                    :color_key_b,           :int,
                    :func,                  EngineInfoBufferFuncStruct
        end
        class EngineInfoBufferStruct < FFI::Struct
            layout  :magic,                 EngineInfoStruct,
                    :info,                  EngineInfoBufferInfoStruct,
#                    :func,                  EvasEngineInfoBufferFunc,
                    :mode,                  :evas_engine_render_mode
        end
        #
    end
    #
    module Evas
        #
        EVAS_ENGINE_BUFFER_DEPTH_ARGB32 = 0
        EVAS_ENGINE_BUFFER_DEPTH_BGRA32 = 1
        EVAS_ENGINE_BUFFER_DEPTH_RGB24  = 2
        EVAS_ENGINE_BUFFER_DEPTH_BGR24  = 3
        EVAS_ENGINE_BUFFER_DEPTH_RGB32  = 4
        #
        EVAS_HINT_FILL = -1.0
        EVAS_HINT_EXPAND = 1.0
        #
        def self.version
            Native::VersionStruct.new(Native.evas_version)
        end
        #
        class REvas
            #
            include Efl::ClassHelper
            search_prefixes 'evas_'
            #
            def initialize o=nil, &block
                @ptr = (
                    case o
                    when NilClass
                        FFI::AutoPointer.new Native.evas_new, REvas.method(:release)
                    when FFI::Pointer
                        o
                    else
                        raise ArgumentError.new "wrong argument #{o.class.name}"
                    end
                )
                instance_eval &block if block
            end
            def self.release p
                Native.evas_free p
            end
            def free
                @ptr.autorelease=false if @ptr.is_a? FFI::AutoPointer
                REvas.release @ptr
                @ptr=nil
            end
            def object_rectangle_add &block
                 REvasRectangle.new Native.method(:evas_object_rectangle_add), @ptr, &block
            end
            def object_line_add &block
                Evas::REvasLine.new Native.method(:evas_object_line_add), @ptr, &block
            end
            def object_polygon_add &block
                Evas::REvasPolygon.new Native.method(:evas_object_polygon_add), @ptr, &block
            end
            def object_text_add &block
                Evas::REvasText.new Native.method(:evas_object_text_add), @ptr, &block
            end
            def object_box_add &block
                Evas::REvasBox.new Native.method(:evas_object_box_add), @ptr, &block
            end
            def output_size_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                Native.evas_output_size_get @ptr, @ri0, @ri1
                [ @ri0.read_int, @ri1.read_int ]
            end
            alias :output_size :output_size_get
            alias :size :output_size_get
            def output_viewport_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                @ri2 ||= FFI::MemoryPointer.new :int
                @ri3 ||= FFI::MemoryPointer.new :int
                Native.evas_output_viewport_get @ptr, @ri0, @ri1, @ri2, @ri3
                [ @ri0.read_int, @ri1.read_int, @ri2.read_int, @ri3.read_int ]
            end
            alias :output_viewport :output_viewport_get
            alias :viewport :output_viewport_get
            def pointer_output_xy_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                Native.evas_pointer_output_xy_get @ptr, @ri0, @ri1
                [ @ri0.read_int, @ri1.read_int ]
            end
            alias :pointer_output :pointer_output_xy_get
            def pointer_canvas_xy_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                Native.evas_pointer_canvas_xy_get @ptr, @ri0, @ri1
                [ @ri0.read_int, @ri1.read_int ]
            end
            alias :pointer_canvas :pointer_canvas_xy_get
        end
        #
        class REvasObject
            #
            include Efl::ClassHelper
            search_prefixes 'evas_object_', 'evas_'
            #
            def initialize a, *args, &block
                @ptr = (
                    case a
                    when FFI::Pointer
                        a
                    when Method
                        a.call(*args)
                    else
                        raise ArgumentError.new "wrong argument #{a.class.name}"
                    end
                )
                instance_eval &block if block
            end
            def self.release p
                Native.evas_object_del p unless p.nil?
                @ri0.free if @ri0
                @ri1.free if @ri1
                @ri2.free if @ri2
                @ri3.free if @ri3
                @rd0.free if @rd0
                @rd1.free if @rd1
                @rs0.free if @rs0
            end
            def free
                @ptr.autorelease=false if @ptr.is_a? FFI::AutoPointer
                REvasObject.release @ptr
                @ptr=nil
            end
            def object_box_add &block
                o = Evas::REvasBox.new FFI::AutoPointer.new Native.evas_object_box_add_to(@ptr), REvasObject.method(:release)
                o.instance_eval &block if block
                o
            end
            def evas_name
                Native.evas_object_name_get @ptr
            end
            def evas_type
                Native.evas_object_type_get @ptr
            end
            def geometry_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                @ri2 ||= FFI::MemoryPointer.new :int
                @ri3 ||= FFI::MemoryPointer.new :int
                Native.evas_object_geometry_get @ptr, @ri0, @ri1, @ri2, @ri3
                [ @ri0.read_int, @ri1.read_int, @ri2.read_int, @ri3.read_int ]
            end
            alias :geometry :geometry_get
            def center_get
                g = geometry_get
                [ g[0]+(g[2]/2.0), g[1]+(g[3]/2.0) ]
            end
            alias :center :center_get
            def center_set x, y
                g = geometry_get
                move (x-(g[2]/2.0)).to_i, (y-(g[3]/2.0)).to_i
            end
            alias :center= :center_set
            def size
                geometry_get[2..-1]
            end
            def size= wh
                Native.evas_object_resize @ptr, *wh
            end
            def color_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                @ri2 ||= FFI::MemoryPointer.new :int
                @ri3 ||= FFI::MemoryPointer.new :int
                Native.evas_object_color_get @ptr, @ri0, @ri1, @ri2, @ri3
                [ @ri0.read_int, @ri1.read_int, @ri2.read_int, @ri3.read_int ]
            end
            alias :color :color_get
            def evas_get
                REvas.new Native.evas_object_evas_get @ptr
            end
            alias :evas :evas_get
            def above_get
                REvasObject.new Native.evas_object_above_get @ptr
            end
            alias :above :above_get
            def below_get
                REvasObject.new Native.evas_object_below_get @ptr
            end
            alias :below :below_get
            def size_hint_min_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                Native.evas_object_size_hint_min_get @ptr, @ri0, @ri1
                [ @ri0.read_int, @ri1.read_int ]
            end
            alias :size_hint_min :size_hint_min_get
            def size_hint_max_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                Native.evas_object_size_hint_max_get @ptr, @ri0, @ri1
                [ @ri0.read_int, @ri1.read_int ]
            end
            alias :size_hint_max :size_hint_max_get
            def size_hint_request_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                Native.evas_object_size_hint_request_get @ptr, @ri0, @ri1
                [ @ri0.read_int, @ri1.read_int ]
            end
            alias :size_hint_request :size_hint_request_get
            def size_hint_aspect_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                @ri2 ||= FFI::MemoryPointer.new :int
                Native.evas_object_size_hint_aspect_get @ptr, @ri0, @ri1, @ri2
                [ Native.enum_type(:evas_aspect_control)[@ri0.read_int], @ri1.read_int, @ri2.read_int ]
            end
            alias :size_hint_aspect :size_hint_aspect_get
            def size_hint_align_set_fill
                Native.evas_object_size_hint_align_set @ptr, EVAS_HINT_FILL, EVAS_HINT_FILL
            end
            alias :size_hint_align_fill :size_hint_align_set_fill
            def size_hint_align_get
                @rd0 ||= FFI::MemoryPointer.new :double
                @rd1 ||= FFI::MemoryPointer.new :double
                Native.evas_object_size_hint_align_get @ptr, @rd0, @rd1
                [ @rd0.read_double, @rd1.read_double ]
            end
            alias :size_hint_align :size_hint_align_get
            def size_hint_weight_set_expand
                Native.evas_object_size_hint_weight_set @ptr, EVAS_HINT_EXPAND, EVAS_HINT_EXPAND
            end
            alias :size_hint_weight_expand :size_hint_weight_set_expand
            def size_hint_weight_set_expand_fill
                Native.evas_object_size_hint_weight_set @ptr, EVAS_HINT_EXPAND, EVAS_HINT_FILL
            end
            alias :size_hint_weight_expand_fill :size_hint_weight_set_expand_fill
            def size_hint_weight_get
                @rd0 ||= FFI::MemoryPointer.new :double
                @rd1 ||= FFI::MemoryPointer.new :double
                Native.evas_object_size_hint_weight_get @ptr, @rd0, @rd1
                [ @rd0.read_double, @rd1.read_double ]
            end
            alias :size_hint_weight :size_hint_weight_get
            def size_hint_padding_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                @ri2 ||= FFI::MemoryPointer.new :int
                @ri3 ||= FFI::MemoryPointer.new :int
                Native.evas_object_size_hint_padding_get @ptr, @ri0, @ri1, @ri2, @ri3
                [ @ri0.read_int, @ri1.read_int, @ri2.read_int, @ri3.read_int ]
            end
            alias :size_hint_padding :size_hint_padding_get
            def data_get k
                r = Native.evas_object_data_get @ptr, k
                return nil if r==FFI::Pointer::NULL
                r.read_string
            end
            alias :data :data_get
        end
        #
        class REvasRectangle < REvasObject
            #
        end
        #
        class REvasLine < REvasObject
            #
            search_prefixes 'evas_object_line_'
            #
            def line_xy_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                @ri2 ||= FFI::MemoryPointer.new :int
                @ri3 ||= FFI::MemoryPointer.new :int
                Native.evas_object_line_xy_get @ptr, @ri0, @ri1, @ri2, @ri3
                [ @ri0.read_int, @ri1.read_int, @ri2.read_int, @ri3.read_int ]
            end
        end
        #
        class REvasPolygon < REvasObject
            #
            search_prefixes 'evas_object_polygon_'
            #
            def point_add *args
                Native.evas_object_polygon_point_add @ptr, *args
            end
            alias :<< :point_add
        end
        #
        class REvasText < REvasObject
            #
            search_prefixes 'evas_object_text_'
            #
            def font_get
                @rs0 ||= FFI::MemoryPointer.new :string
                @ri0 ||= FFI::MemoryPointer.new :int
                Native.evas_object_text_font_get @ptr, @rs0, @ri0
                [ @rs0.read_pointer.read_string, @ri0.read_int ]
            end
            alias :font :font_get
            def char_pos_get pos
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                @ri2 ||= FFI::MemoryPointer.new :int
                @ri3 ||= FFI::MemoryPointer.new :int
                Native.evas_object_text_char_pos_get @ptr, pos, @ri0, @ri1, @ri2, @ri3
                return [ @ri0.read_int, @ri1.read_int, @ri2.read_int, @ri3.read_int ]
            end
            alias :char_pos :char_pos_get
            def char_coords_get x, y
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                @ri2 ||= FFI::MemoryPointer.new :int
                @ri3 ||= FFI::MemoryPointer.new :int
                r = Native.evas_object_text_char_coords_get @ptr, x, y, @ri0, @ri1, @ri2, @ri3
                return [ r, @ri0.read_int, @ri1.read_int, @ri2.read_int, @ri3.read_int ]
            end
            alias :char_coords :char_coords_get
            def style_pad_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                @ri2 ||= FFI::MemoryPointer.new :int
                @ri3 ||= FFI::MemoryPointer.new :int
                Native.evas_object_text_shadow_color_get @ptr, @ri0, @ri1, @ri2, @ri3
                return [ @ri0.read_int, @ri1.read_int, @ri2.read_int, @ri3.read_int ]
            end
            alias :style_pad :style_pad_get
            def shadow_color_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                @ri2 ||= FFI::MemoryPointer.new :int
                @ri3 ||= FFI::MemoryPointer.new :int
                Native.evas_object_text_shadow_color_get @ptr, @ri0, @ri1, @ri2, @ri3
                return [ @ri0.read_int, @ri1.read_int, @ri2.read_int, @ri3.read_int ]
            end
            alias :shadow_color :shadow_color_get
            def glow_color_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                @ri2 ||= FFI::MemoryPointer.new :int
                @ri3 ||= FFI::MemoryPointer.new :int
                Native.evas_object_text_glow_color_get @ptr, @ri0, @ri1, @ri2, @ri3
                return [ @ri0.read_int, @ri1.read_int, @ri2.read_int, @ri3.read_int ]
            end
            alias :glow_color :glow_color_get
            def glow2_color_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                @ri2 ||= FFI::MemoryPointer.new :int
                @ri3 ||= FFI::MemoryPointer.new :int
                Native.evas_object_text_glow2_color_get @ptr, @ri0, @ri1, @ri2, @ri3
                return [ @ri0.read_int, @ri1.read_int, @ri2.read_int, @ri3.read_int ]
            end
            alias :glow2_color :glow2_color_get
            def outline_color_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                @ri2 ||= FFI::MemoryPointer.new :int
                @ri3 ||= FFI::MemoryPointer.new :int
                Native.evas_object_text_outline_color_get @ptr, @ri0, @ri1, @ri2, @ri3
                return [ @ri0.read_int, @ri1.read_int, @ri2.read_int, @ri3.read_int ]
            end
            alias :outline_color :outline_color_get
        end
        #
        class REvasBox < REvasObject
            #
            search_prefixes 'evas_object_box_'
            #
            def children_get
                EinaList::REinaList.new Native.evas_object_box_children_get @ptr
            end
            alias :children :children_get
            def align_get
                @rd0 ||= FFI::MemoryPointer.new :double
                @rd1 ||= FFI::MemoryPointer.new :double
                Native.evas_object_box_align_get @ptr, @rd0, @rd1
                [ @rd0.read_double, @rd1.read_double ]
            end
            alias :align :align_get
            def padding_get
                @ri0 ||= FFI::MemoryPointer.new :int
                @ri1 ||= FFI::MemoryPointer.new :int
                Native.evas_object_box_padding_get @ptr, @ri0, @ri1
                [ @ri0.read_int, @ri1.read_int ]
            end
            alias :padding :padding_get
        end
    end
end
#
# EOF
