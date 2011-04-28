#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/evas'
#
include Efl
#
Evas::init
#
def create_canvas w, h
    pixels = FFI::MemoryPointer.new :int, w*h
    e = Evas::Evas.new
    e.output_method_set Evas::render_method_lookup("buffer")
    e.output_viewport_set 0, 0, w, h
    e.output_size_set w, h
    einfo = Efl::FFI::EvasEngineInfoBuffer.new e.engine_info_get
    einfo[:info][:depth_type] = Efl::FFI::EVAS_ENGINE_BUFFER_DEPTH_ARGB32
    einfo[:info][:dest_buffer] = pixels
    einfo[:info][:dest_buffer_row_bytes] = w * FFI::type_size(:int);
    einfo[:info][:use_color_key] = 0;
    einfo[:info][:alpha_threshold] = 0;
    einfo[:info][:func][:new_update_region] = nil #FFI::Pointer::NULL;
    einfo[:info][:func][:free_update_region] = nil #FFI::Pointer::NULL;
    e.engine_info_set einfo
    [e,pixels]
end
#
def destroy_canvas c, pixels
    pixels.free
    c.free
end
#
def draw_scene c
    updates = c.render_updates
    Evas::render_updates_free updates
    # FIXME needs EinaRectangle
#    require 'efl/eina/eina_list'
#    updates = Eina::EinaList.new c.render_updates
#    updates.each do |u|
#        r = Eina::EinaRectangle.new u
#        puts "UPDATED REGION: pos: #{r[:x]}, #{r[:y]}    size: #{r[:w]}x#{r[:h]}"
#    end
#    Evas::render_updates_free updates.ptr
end
#
def save_scene canvas, dest
    einfo = Efl::FFI::EvasEngineInfoBuffer.new canvas.engine_info_get
    w, h = canvas.output_size_get
     # PPM P6 format is dead simple to write:
    p = ::FFI::Pointer.new :int, einfo[:info][:dest_buffer]
    pixels_end = p + (w*h*::FFI.type_size(:int))
    open(dest,'w') do |f|
        f << "P6\n#{w} #{h}\n255\n"
        while p != pixels_end
            i = p.read_int
            a = [ (i & 0xff0000)>>16, (i & 0x00ff00)>>8, (i & 0x0000ff) ]
            f << a.pack("ccc")
            p = p+::FFI.type_size(:int)
        end

#    for (; pixels < pixels_end; pixels++) {
#        int r, g, b;
#        r = ((*pixels) & 0xff0000) >> 16;
#        g = ((*pixels) & 0x00ff00) >> 8;
#        b = (*pixels) & 0x0000ff;
#        fprintf(f, "%c%c%c", r, g, b);
#    }
    end
    puts "saved scene as '#{dest}'"
end
#
w = 320
h = 240
canvas, pixels = create_canvas w, h
#
bg = Evas::EvasObject.new canvas.object_rectangle_add
bg.color = 255, 255, 255, 255
bg.move 0, 0
bg.resize w, h
bg.show
#
draw_scene canvas
#
r1 = Evas::EvasObject.new canvas.object_rectangle_add
r1.color = 255, 0, 0, 255
r1.move 10, 10
r1.resize 100, 100
r1.show
#
r2 = Evas::EvasObject.new canvas.object_rectangle_add
r2.color = 0, 128, 0, 128
r2.move 10, 10
r2.resize 50, 50
r2.show
#
r3 = Evas::EvasObject.new canvas.object_rectangle_add
r3.color = 0, 128, 0, 255
r3.move 60, 60
r3.resize 50, 50
r3.show
#
draw_scene canvas
save_scene canvas, '/tmp/ffi-efl-evas-buffer-simple-render.ppm'
destroy_canvas canvas, pixels
#
Evas::shutdown
