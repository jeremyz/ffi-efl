#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elementary'
#
include Efl
#
puts Elm.init

class MyWin < Elm::ElmWin
    def initialize name, title
        super FFI::MemoryPointer::NULL, name
        title_set title
        feed
        smart_callback_add "delete,request", method(:exit)
    end
    def feed
        @bg = add 'bg' do |bg|
            bg.size_hint_weight_set 1.0, 1.0
            bg.show
        end
        resize_object_add @bg.ptr
        @lb = add 'label'do |lb|
            lb.elm_label_label_set "Hello World!"
            lb.size_hint_weight_set 1.0, 1.0
            lb.show
        end
        resize_object_add @lb.ptr
    end
    def exit *args
        puts "EXIT"
        Efl::API.elm_exit();
    end
end
#
win = MyWin.new "App name", "Window Title" do |w|
    eo = w.evas_object
    eo.move 300, 300
    eo.resize 200, 100
    eo.show
end

Elm.run
puts Elm.shutdown
#
# EOF

