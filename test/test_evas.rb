#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/evas'
require 'efl/eina_list'
require 'efl/eina_rectangle'
#
include Efl
#
Evas::init
#
def create_canvas w, h
    pixels = FFI::MemoryPointer.new :int, w*h
    e = Evas::REvas.new
    e.output_method_set Evas::render_method_lookup("buffer")
    e.output_viewport_set 0, 0, w, h
    e.output_size_set w, h
    einfo = Native::EngineInfoBufferStruct.new e.engine_info_get
    einfo[:info][:depth_type] = Evas::EVAS_ENGINE_BUFFER_DEPTH_ARGB32
    einfo[:info][:dest_buffer] = pixels
    einfo[:info][:dest_buffer_row_bytes] = w * FFI::type_size(:int);
    einfo[:info][:use_color_key] = 0;
    einfo[:info][:alpha_threshold] = 0;
    einfo[:info][:func][:new_update_region] = nil
    einfo[:info][:func][:free_update_region] = nil
    e.engine_info_set einfo
    [e,pixels]
end
#
def draw_scene c
    updates = Efl::EinaList::REinaList.new c.render_updates
    updates.each do |u|
        r = Native::EinaRectangleStruct.new u
        puts "UPDATED REGION: pos: #{r[:x]}, #{r[:y]}    size: #{r[:w]}x#{r[:h]}"
    end
    Evas::render_updates_free updates
end
#
def save_scene canvas, dest
    einfo = Native::EngineInfoBufferStruct.new canvas.engine_info_get
    w, h = canvas.output_size_get
     # PPM P6 format is dead simple to write:
    p = FFI::Pointer.new :int, einfo[:info][:dest_buffer]
    pixels_end = p + (w*h*::FFI.type_size(:int))
    open(dest,'w') do |f|
        f << "P6\n#{w} #{h}\n255\n"
        while p != pixels_end
            i = p.read_int
            a = [ (i & 0xff0000)>>16, (i & 0x00ff00)>>8, (i & 0x0000ff) ]
            f << a.pack("ccc")
            p = p+::FFI.type_size(:int)
        end
    end
    puts "saved scene as '#{dest}'"
end
#
w = 320
h = 240
#
canvas, pixels = create_canvas w, h
#
bg = canvas.object_rectangle_add do
    color_set 255, 255, 255, 255
    move 0, 0
    resize w, h
end
bg.show
#
draw_scene canvas
#
r1 = canvas.object_rectangle_add do
    color_set 0, 0, 0, 255
    move 10, 10
    resize 100, 100
end
r1.show
#
r2 = canvas.object_rectangle_add do |r|
    r.color = 0, 128, 0, 128
    r.move 10, 10
    r.resize 50, 50
end
r2.show
#
r3 = canvas.object_rectangle_add do
    color_set 0, 128, 0, 255
    move 60, 60
    resize 50, 50
end
r3.show
#
l1 = canvas.object_line_add
l1.xy = *(r2.center+r3.center)
l1.show
#
p1 = canvas.object_polygon_add do |p|
    p.color = 100, 128, 0, 130
    p.<< w/2.0,10
    p.<< w-10,h/2.0
    p.<< w/2.0, h-10
    p.<< 10, h/2.0
end
p1.show
#
draw_scene canvas
save_scene canvas, '/tmp/ffi-efl-evas-buffer-simple-render.ppm'
#
r1.free
r2.free
r3.free
l1.free
p1.free
bg.free
canvas.free
pixels.free
#
Evas::shutdown
