#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elementary'
#
include Efl
#
puts Elm.init

win_del = Proc.new { |data,evas_object,event_info|
    Efl::API.elm_exit();
}

win = Efl::API.elm_win_add FFI::MemoryPointer::NULL, "App name", :elm_win_basic
Efl::API.elm_win_title_set win, "Window title"
Efl::API.evas_object_smart_callback_add win, "delete,request", win_del, FFI::MemoryPointer::NULL

bg = Efl::API.elm_bg_add win
Efl::API.evas_object_size_hint_weight_set bg, 1.0, 1.0
Efl::API.elm_win_resize_object_add win, bg
Efl::API.evas_object_show bg

lb = Efl::API.elm_label_add win
Efl::API.elm_label_label_set lb, "Hello World!"
Efl::API.evas_object_size_hint_weight_set lb, 1.0, 1.0
Efl::API.elm_win_resize_object_add win, lb
Efl::API.evas_object_show lb

Efl::API.evas_object_move win, 300, 300
Efl::API.evas_object_resize win, 200, 100

Efl::API.evas_object_show win

Elm.run
puts Elm.shutdown
#
# EOF

