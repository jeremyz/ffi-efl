#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi/evas'
#
module Efl
    #
    module Evas
        #
        EVAS_ENGINE_BUFFER_DEPTH_ARGB32 = 0
        EVAS_ENGINE_BUFFER_DEPTH_BGRA32 = 1
        EVAS_ENGINE_BUFFER_DEPTH_RGB24  = 2
        EVAS_ENGINE_BUFFER_DEPTH_BGR24  = 3
        EVAS_ENGINE_BUFFER_DEPTH_RGB32  = 4
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
                    :func,                  EngineInfoBufferFuncStruct,
        end
        class EngineInfoBufferStruct < FFI::Struct
            layout  :magic,                 EngineInfoStruct,
                    :info,                  EngineInfoBufferInfoStruct,
#                    :func,                  EvasEngineInfoBufferFunc,
                    :mode,                  :evas_engine_render_mode,
        end
        #
        class REvas
            #
            include Efl::ClassHelper
            proxy_list [Efl::Evas,'evas_'].freeze
            #
            def initialize o=nil
                @ptr = (
                    case o
                    when NilClass
                        FFI::AutoPointer.new Efl::Evas.evas_new, method(:free)
                    when self.class
                        o.to_ptr
                    when FFI::AutoPointer
                        o
                    when FFI::Pointer
                        FFI::AutoPointer.new o, method(:free)
                    else
                        raise ArgumentError.new "wrong argument #{o.class.name}"
                    end
                )
                yield self if block_given?
            end
            def free p=nil
                return Efl::Evas.evas_free p unless p.nil?
                Efl::Evas.evas_free @ptr
                @ptr=nil
            end
            def object_add t
                Efl::Evas::REvasObject.new Efl::Evas.send "evas_object_#{t}_add", @ptr
            end
            def output_size_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                Efl::Evas.evas_output_size_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
            def output_viewport_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                Efl::Evas.evas_output_viewport_get @ptr, x, y, w, h
                [ x.read_int, y.read_int, w.read_int, h.read_int ]
            end
            def pointer_output_xy_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                Efl::Evas.evas_pointer_output_xy_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
            def pointer_canvas_xy_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                Efl::Evas.evas_pointer_canvas_xy_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
        end
        #
        class REvasObject
            #
            include Efl::ClassHelper
            proxy_list [Efl::Evas,'evas_object_'].freeze, [Efl::Evas,'evas_'].freeze
            #
            def initialize o=nil
                @ptr = (
                    case o
                    when NilClass
                        FFI::AutoPointer.new Efl::Evas.evas_new, method(:free)
                    when self.class
                        o.to_ptr
                    when FFI::AutoPointer
                        o
                    when FFI::Pointer
                        FFI::AutoPointer.new o, method(:free)
                    else
                        raise ArgumentError.new "wrong argument #{o.class.name}"
                    end
                )
                yield self if block_given?
            end
            def free p=nil
                return Efl::Evas.evas_object_del p unless p.nil?
                Efl::Evas.evas_object_del @ptr
                @ptr.free
                @ptr=nil
            end
            def geometry_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                Efl::Evas.evas_object_geometry_get @evas, x, y, w, h
                [ x.read_int, y.read_int, w.read_int, h.read_int ]
            end
            def color_get
                r = FFI::MemoryPointer.new :int
                g = FFI::MemoryPointer.new :int
                b = FFI::MemoryPointer.new :int
                a = FFI::MemoryPointer.new :int
                Efl::Evas.evas_object_color_get @evas, r, g, b, a
                [ r.read_int, g.read_int, b.read_int, a.read_int ]
            end
        end
    end
end
#
# EOF
