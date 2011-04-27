#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elementary'
#
Efl::Elm.init

win_del = Proc.new { |data,evas_object,event_info|
    Efl::FFI.elm_exit();
}

win = Efl::FFI.elm_win_add ::FFI::MemoryPointer::NULL, "App name", :elm_win_basic
Efl::FFI.elm_win_title_set win, "Window title"
Efl::FFI.evas_object_smart_callback_add win, "delete,request", win_del, ::FFI::MemoryPointer::NULL

bg = Efl::FFI.elm_bg_add win
Efl::FFI.evas_object_size_hint_weight_set bg, 1.0, 1.0
Efl::FFI.elm_win_resize_object_add win, bg
Efl::FFI.evas_object_show bg

lb = Efl::FFI.elm_label_add win
Efl::FFI.elm_label_label_set lb, "Hello World!"
Efl::FFI.evas_object_size_hint_weight_set lb, 1.0, 1.0
Efl::FFI.elm_win_resize_object_add win, lb
Efl::FFI.evas_object_show lb

Efl::FFI.evas_object_move win, 300, 300
Efl::FFI.evas_object_resize win, 200, 100

Efl::FFI.evas_object_show win

Efl::Elm.run
Efl::Elm.shutdown
#
# EOF

