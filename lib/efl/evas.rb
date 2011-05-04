#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native/evas'
#
module Efl
    #
    module Native
        #
        callback :new_update_region_cb, [:int, :int, :int, :int, :int_p], :pointer
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
        class REvas
            #
            include Efl::ClassHelper
            search_prefixes 'evas_'
            #
            def initialize o=nil
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
                yield self if block_given?
            end
            def self.release p
                Native.evas_free p unless p.nil?
            end
            def free
                @ptr.autorelease=false if @ptr.is_a? FFI::AutoPointer
                REvas.release @ptr
                @ptr=nil
            end
            def object_add t
                r = Evas::REvasObject.new Native.send "evas_object_#{t.to_s}_add", @ptr
                yield r if block_given?
                r
            end
            def output_size_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                Native.evas_output_size_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
            alias :size :output_size_get
            def output_viewport_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                Native.evas_output_viewport_get @ptr, x, y, w, h
                [ x.read_int, y.read_int, w.read_int, h.read_int ]
            end
            def pointer_output_xy_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                Native.evas_pointer_output_xy_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
            def pointer_canvas_xy_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                Native.evas_pointer_canvas_xy_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
        end
        #
        class REvasObject
            #
            include Efl::ClassHelper
            search_prefixes 'evas_object_', 'evas_'
            #
            def initialize o=nil
                @ptr = (
                    case o
                    when NilClass
                        FFI::AutoPointer.new Native.evas_new, REvasObject.method(:release)
                    when FFI::Pointer
                        o
                    else
                        raise ArgumentError.new "wrong argument #{o.class.name}"
                    end
                )
                yield self if block_given?
            end
            def self.release p
                Native.evas_object_del p unless p.nil?
            end
            def free
                @ptr.autopointer=false if @ptr.is_a? FFI::AutoPointer
                REvasObject.release @ptr
                @ptr=nil
            end
            def geometry_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                Native.evas_object_geometry_get @ptr, x, y, w, h
                [ x.read_int, y.read_int, w.read_int, h.read_int ]
            end
            alias :geometry :geometry_get
            def size
                geometry_get[2..-1]
            end
            def size= wh
                Native.evas_object_resize @ptr, *wh
            end
            def color_get
                r = FFI::MemoryPointer.new :int
                g = FFI::MemoryPointer.new :int
                b = FFI::MemoryPointer.new :int
                a = FFI::MemoryPointer.new :int
                Native.evas_object_color_get @ptr, r, g, b, a
                [ r.read_int, g.read_int, b.read_int, a.read_int ]
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
        end
    end
end
#
# EOF
