#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elementary'
#
include Efl
#
class MyWin < Elm::ElmWin
    #
    def initialize name, title
        super FFI::MemoryPointer::NULL, name
        title_set title
        feed
        smart_callback_add "delete,request", method(:exit), FFI::MemoryPointer.from_string("my data")
    end
    def feed
        @bg = Elm::ElmBg.new(self) do |bg|
            bg.size_hint_weight_set 1.0, 1.0
#            bg.color = 200,255,100
            bg.evas_object_color_set 200,255,100,150
            bg.show
        end
        resize_object_add @bg
        @lb = Elm::ElmLabel.new(self) do |lb|
            lb.label_set "Hello World!"
            lb.size_hint_weight_set 1.0, 1.0
        end
        @lb.show
        resize_object_add @lb
    end
    def exit data, evas_object, event_info
        puts "EXIT #{data.read_string}"
        Elm.exit
    end
end
#
Elm.init
#
win = MyWin.new "App name", "Window Title" do |w|
    w.alpha_set true
    w.move 300, 300
    w.resize 200, 100
    w.show
end
#
Elm.run
Elm.shutdown
#
# EOF

