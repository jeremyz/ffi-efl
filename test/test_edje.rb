#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ecore'
require 'efl/ecore_evas'
require 'efl/edje'
#
WIDTH=320
HEIGHT=240
#
EDC_FILE=File.join '/tmp','edje_test.edc'
EDJE_FILE=File.join '/tmp','edje_test.edj'
#
txt = ( ARGV.length>0 ? ARGV[0] : nil )
#
# compile edje_file
puts "write #{EDC_FILE}"
content = DATA.read
File.open(EDC_FILE,'w') do |f| f << content end
puts "compile #{EDJE_FILE}"
system "edje_cc #{EDC_FILE}"
#
# load edje
def create_my_group canvas, txt
    edje = canvas.edje_object_add
    if not edje.file_set EDJE_FILE, "my_group"
        puts "unable to open #{EDJE_FILE}"
        exit 1
    end
    puts "file and group : #{edje.file_get.join ' ; ' }"
    puts "key1 : #{Efl::Native.edje_file_data_get EDJE_FILE, "key1"}"
    puts "key2 : #{Efl::Native.edje_object_data_get edje, "key2"}"
    edje.part_text_set "text", txt unless txt.nil?
    edje.move 0, 0
    edje.resize WIDTH, HEIGHT
    edje.show
    edje
end
#
def del_cb ecore_evas
    puts "delete request callback"
    Efl::Ecore.main_loop_quit
end
#
Efl::EcoreEvas::init
Efl::Edje::init
#
window = Efl::EcoreEvas::REcoreEvas.new { |w|
    w.resize WIDTH, HEIGHT
    w.move 100, 100
}
window.ecore_evas_callback_delete_request_set  method(:del_cb)
canvas = window.get
edje = create_my_group canvas, txt
window.show
#
Efl::Ecore.main_loop_begin
#
edje.free
window.free
#
Efl::Edje::shutdown
Efl::EcoreEvas::shutdown

__END__

data {
    item: "key1" "val1";
}
collections {
   group {
        name: "my_group";
        data {
            item: "key2" "val2";
        }
        parts {
            part {
                name: "background";
                type: RECT;
                mouse_events: 0;
                description {
                    state: "default" 0.0;
                    color: 255 255 255 255;
                    rel1 {
                        relative: 0.0 0.0;
                        offset: 0 0;
                    }
                    rel2 {
                        relative: 1.0 1.0;
                        offset: -1 -1;
                    }
                }
            }
            part {
                name: "text";
                type: TEXT;
                mouse_events: 1;
                description {
                    state: "default" 0.0;
                    color: 255 0 0 255;
                    rel1 {
                        relative: 0.1 0.2;
                        offset: 5 10;
                    }
                    rel2 {
                        relative: 0.9 0.8;
                        offset: -6 -11;
                    }
                    text {
                        font: "Sans";
                        size: 10;
                        text: "hello world";
                    }
                }
                description {
                    state: "over" 0.0;
                    inherit: "default" 0.0;
                    color: 0 255 0 255;
                }
            }
            programs {
                program {
                    signal: "mouse,in";
                    source: "text";
                    action: STATE_SET "over" 0.0;
                    target: "text";
                    transition: LINEAR 0.1;
                }
                program {
                    signal: "mouse,out";
                    source: "text";
                    action: STATE_SET "default" 0.0;
                    target: "text";
                    transition: LINEAR 0.1;
                }
            }
        }
    }
}

