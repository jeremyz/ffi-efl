#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi/evas'
#
module Efl
    module FFI
        #
        EVAS_ENGINE_BUFFER_DEPTH_ARGB32 = 0
        EVAS_ENGINE_BUFFER_DEPTH_BGRA32 = 1
        EVAS_ENGINE_BUFFER_DEPTH_RGB24  = 2
        EVAS_ENGINE_BUFFER_DEPTH_BGR24  = 3
        EVAS_ENGINE_BUFFER_DEPTH_RGB32  = 4
        #
        class EvasEngineInfo < ::FFI::Struct
            layout  :magic,         :int
        end
        callback :new_update_region_cb, [:int, :int, :int, :int, :int_p], :pointer
        callback :free_update_region_cb, [:int, :int, :int, :int, :pointer], :void
        class EvasEngineInfoBufferFunc < ::FFI::Struct
            layout  :new_update_region,     :new_update_region_cb,
                    :free_update_region,    :free_update_region_cb
        end
        class EvasEngineInfoBufferInfo < ::FFI::Struct
            layout  :depth_type,            :int,
                    :dest_buffer,           :pointer,
                    :dest_buffer_row_bytes, :int,
                    :use_color_key,         :char,
                    :alpha_threshold,       :int,
                    :color_key_r,           :int,
                    :color_key_g,           :int,
                    :color_key_b,           :int,
                    :func,          EvasEngineInfoBufferFunc,
        end
        class EvasEngineInfoBuffer < ::FFI::Struct
            layout  :magic,         EvasEngineInfo,
                    :info,          EvasEngineInfoBufferInfo,
#                    :func,          EvasEngineInfoBufferFunc,
                    :mode,          :evas_engine_render_mode,
        end
        #
    end
    #
    module Evas
        #
        class Evas
            include Efl::Helper
            @func_prefixes = [ 'evas_' ].freeze
            def initialize o=nil
                @ptr = (
                    case o
                    when NilClass
                        ::FFI::AutoPointer.new Efl::FFI.evas_new, method(:free)
                    when self.class
                        o.ptr
                    when ::FFI::AutoPointer
                        o
                    when ::FFI::Pointer
                        ::FFI::AutoPointer.new o, method(:free)
                    else
                        raise ArgumentError.new "#{ptr.class} valid argument"
                    end
                )
                yield self if block_given?
            end
            def free
                Efl::FFI.evas_free @ptr
                @ptr=nil
            end
            def object_add t
                Efl::Evas::EvasObject.new Efl::FFI.send "evas_object_#{t}_add", @ptr
            end
            def output_size_get
                x = ::FFI::MemoryPointer.new :int
                y = ::FFI::MemoryPointer.new :int
                Efl::FFI.evas_output_size_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
            def output_viewport_get
                x = ::FFI::MemoryPointer.new :int
                y = ::FFI::MemoryPointer.new :int
                w = ::FFI::MemoryPointer.new :int
                h = ::FFI::MemoryPointer.new :int
                Efl::FFI.evas_output_viewport_get @ptr, x, y, w, h
                [ x.read_int, y.read_int, w.read_int, h.read_int ]
            end
            def pointer_output_xy_get
                x = ::FFI::MemoryPointer.new :int
                y = ::FFI::MemoryPointer.new :int
                Efl::FFI.evas_pointer_output_xy_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
            def pointer_canvas_xy_get
                x = ::FFI::MemoryPointer.new :int
                y = ::FFI::MemoryPointer.new :int
                Efl::FFI.evas_pointer_canvas_xy_get @ptr, x, y
                [ x.read_int, y.read_int ]
            end
        end
        #
        class EvasObject
            include Efl::Helper
            @func_prefixes = [ 'evas_object_', 'evas_' ].freeze
            def initialize o=nil
                @ptr = (
                    case o
                    when NilClass
                        ::FFI::AutoPointer.new Efl::FFI.evas_new, method(:free)
                    when self.class
                        o.ptr
                    when ::FFI::AutoPointer
                        o
                    when ::FFI::Pointer
                        ::FFI::AutoPointer.new o, method(:free)
                    else
                        raise ArgumentError.new "#{ptr.class} valid argument"
                    end
                )
                yield self if block_given?
            end
            def free
                Efl::FFI.evas_object_del @ptr
                @ptr=nil
            end
            def geometry_get
                x = ::FFI::MemoryPointer.new :int
                y = ::FFI::MemoryPointer.new :int
                w = ::FFI::MemoryPointer.new :int
                h = ::FFI::MemoryPointer.new :int
                Efl::FFI.evas_object_geometry_get @evas, x, y, w, h
                [ x.read_int, y.read_int, w.read_int, h.read_int ]
            end
            def color_get
                r = ::FFI::MemoryPointer.new :int
                g = ::FFI::MemoryPointer.new :int
                b = ::FFI::MemoryPointer.new :int
                a = ::FFI::MemoryPointer.new :int
                Efl::FFI.evas_object_color_get @evas, r, g, b, a
                [ r.read_int, g.read_int, b.read_int, a.read_int ]
            end
        end
    end
end
#
# EOF
