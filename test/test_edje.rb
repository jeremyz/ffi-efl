#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina'
require 'efl/evas'
require 'efl/ecore'
require 'efl/ecore_evas'
require 'efl/edje'
#
Efl::Eina::init
Efl::Evas::init
Efl::Ecore::init
Efl::EcoreEvas::init
Efl::Edje::init
#
WIDTH=320
HEIGHT=240
EDJE_FILE=File.join File.dirname(__FILE__),'edje_test.edj'
#
def create_my_group canvas, txt
    #edje = edje_object_add(canvas);
    edje = canvas.edje_object_add
    if not edje.file_set EDJE_FILE, "my_group"
        puts "unable to open #{EDJE_FILE}"
        exit 1
    end
    edje.part_text_set "text", txt unless txt.nil?
    edje.move 0, 0
    edje.resize WIDTH, HEIGHT
    edje.show
    edje
end
#
txt = ( ARGV.length>0 ? ARGV[0] : nil )
#
window = Efl::EcoreEvas::REcoreEvas.new { |w|
    w.resize WIDTH, HEIGHT
}
#
canvas = window.get
edje = create_my_group canvas, txt
window.show
#
Efl::Ecore.main_loop_begin
#
edje.free
window.free
