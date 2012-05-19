#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_win'
require 'efl/elm/elm_bg'
require 'efl/elm/elm_label'
#
include Efl
#
class MyWin < Elm::ElmWin
    #
    def initialize name, title, &block
        super FFI::MemoryPointer::NULL, name, &block
        title_set title
        feed
        smart_callback_add "delete,request", method(:on_delete), FFI::MemoryPointer.from_string("my data")
    end
    def feed
        @bg = Elm::ElmBg.new(self) do
            size_hint_weight_expand
            evas_object_color_set 150,180,100,180
            show
        end
        resize_object_add @bg
        @lb = Elm::ElmLabel.new(self) do
            text_set "Hello World!"
            size_hint_align_fill
            size_hint_weight_expand
            show
        end
        resize_object_add @lb
    end
    def on_delete data, evas_object, event_info
        puts "EXIT #{data.read_string}"
        Elm.exit
    end
end
#
Elm.init
#
win = MyWin.new "App name", "Window Title" do
    alpha_set true
    resize 200, 100
    center_set 600, 300
    show
end
#
Elm.run
Elm.shutdown
#
# EOF
