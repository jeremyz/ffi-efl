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
        win_title_set title
        feed
        Efl::API.evas_object_smart_callback_add @ptr, "delete,request", method(:exit), FFI::MemoryPointer::NULL
    end
    def feed
        @bg = add 'bg'
        Efl::API.evas_object_size_hint_weight_set @bg, 1.0, 1.0
        resize_object_add @bg
        Efl::API.evas_object_show @bg
        @lb = add 'label'
        Efl::API.elm_label_label_set @lb, "Hello World!"
        Efl::API.evas_object_size_hint_weight_set @lb, 1.0, 1.0
        resize_object_add @lb
        Efl::API.evas_object_show @lb
    end
    def exit *args
        Efl::API.elm_exit();
    end
end
#
win = MyWin.new "App name", "Window Title" do |w|
    Efl::API.evas_object_move w.ptr, 300, 300
    Efl::API.evas_object_resize w.ptr, 200, 100
    Efl::API.evas_object_show w.ptr
end

Elm.run
puts Elm.shutdown
#
# EOF

