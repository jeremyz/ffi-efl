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
EDC_FILE=File.join '/tmp','edje_test.edc'
EDJE_FILE=File.join '/tmp','edje_test.edj'
#
if not File.exists? EDJE_FILE
    File.open(EDC_FILE,'w') do |f| f << DATA.read end
    system "edje_cc #{EDC_FILE}"
end
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
#

__END__

// compile: edje_cc edje_example.edc
collections {
   group {
        name: "my_group"; // must be the same as in edje_example.c
        parts {
            part {
                name: "background";
                type: RECT; // plain boring rectangle
                mouse_events: 0; // we don't need any mouse event on the background
                // just one state "default"
                description {
                    state: "default" 0.0; // must always exist
                    color: 255 255 255 255; // white
                    // define part coordinates:
                    rel1 { // top-left point at (0, 0) [WIDTH * 0 + 0, HEIGHT * 0 + 0]
                        relative: 0.0 0.0;
                        offset: 0 0;
                    }
                    rel2 { // bottom-right point at (WIDTH * 1.0 - 1, HEIGHT * 1.0 - 1)
                        relative: 1.0 1.0;
                        offset: -1 -1;
                    }
                }
            }
            part {
                name: "text";
                type: TEXT;
                mouse_events: 1; // we want to change the color on mouse-over
                // 2 states, one "default" and another "over" to be used
                // on mouse over effect
                description {
                    state: "default" 0.0;
                    color: 255 0 0 255; // red
                    // define part coordinates:
                    rel1 { // top-left at (WIDTH * 0.1 + 5, HEIGHT * 0.2 + 10)
                        relative: 0.1 0.2;
                        offset: 5 10;
                    }
                    rel2 { // bottom-right at (WIDTH * 0.9 - 6, HEIGHT * 0.8 - 11)
                        relative: 0.9 0.8;
                        offset: -6 -11;
                    }
                    // define text specific state details
                    text {
                        font: "Sans"; /* using fontconfig name! */
                        size: 10;
                        text: "hello world";
                    }
                }
                description {
                    state: "over" 0.0;
                    inherit: "default" 0.0; // copy everything from "default" at this point
                    color: 0 255 0 255; // override color, now it is green
                }
            }
            // do programs to change color on text mouse in/out (over)
            programs {
                program {
                    // what triggers this program:
                    signal: "mouse,in";
                    source: "text";
                    // what this program does:
                    action: STATE_SET "over" 0.0;
                    target: "text";
                    // do the state-set in a nice interpolation animation
                    // using linear time in 0.1 second
                    transition: LINEAR 0.1;
                }
                program {
                    // what triggers this program:
                    signal: "mouse,out";
                    source: "text";
                    // what this program does:
                    action: STATE_SET "default" 0.0;
                    target: "text";
                    // do the state-set in a nice interpolation animation
                    // using linear time in 0.1 second
                    transition: LINEAR 0.1;
                }
            }
        }
    }
}

