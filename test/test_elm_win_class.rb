#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elementary'
#
include Efl
#
DATA = FFI::MemoryPointer.from_string("my data")
#
class MyWin < Elm::ElmWin
    def initialize name, title
        super FFI::MemoryPointer::NULL, name
        title_set title
        feed
        smart_callback_add "delete,request", method(:exit), DATA
    end
    def feed
        # using block
        @bg = add 'bg' do |bg|
            bg.size_hint_weight_set 1.0, 1.0
            bg.color = 200,255,100,200 # same as bg.color_set 200,255,100,200
            bg.show
        end
        resize_object_add @bg.to_ptr
        @lb = add 'label'do |lb|
            lb.label_label_set "Hello World!"   # complete function name
            lb.size_hint_weight_set 1.0, 1.0    # implicit evas_object function name prefix
        end
        @lb.show
        resize_object_add @lb.to_ptr
    end
    def exit data, evas_object, event_info
        puts "EXIT #{data.read_string}"
        Elm.exit
    end
end
#
Elm.init
#
win = MyWin.new "App name", "Window Title" do |w,eo|
    w.alpha_set true
    eo.move 300, 300
    eo.resize 200, 100
    eo.show
end
#
Elm.run
Elm.shutdown
#
# EOF

