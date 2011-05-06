#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
def realize_evas
    width = 300
    height = 200
    @pixels = FFI::MemoryPointer.new :int, width*height
    @e = Efl::Evas::REvas.new
    @e.output_method_set Efl::Evas::render_method_lookup("buffer")
    @e.output_viewport_set 0, 0, width, height
    @e.output_size_set width, height
    einfo = Efl::Native::EngineInfoBufferStruct.new @e.engine_info
    einfo[:info][:depth_type] = Efl::Evas::EVAS_ENGINE_BUFFER_DEPTH_ARGB32
    einfo[:info][:dest_buffer] = @pixels
    einfo[:info][:dest_buffer_row_bytes] = width * FFI::type_size(:int);
    einfo[:info][:use_color_key] = 0;
    einfo[:info][:alpha_threshold] = 0;
    einfo[:info][:func][:new_update_region] = nil #FFI::Pointer::NULL;
    einfo[:info][:func][:free_update_region] = nil #FFI::Pointer::NULL;
    @e.engine_info_set einfo
end

