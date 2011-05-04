#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elementary'
require 'efl/native'
#
Efl::Elm.init
#
win_del = Proc.new { |data,evas_object,event_info|
    Efl::Elm::Native.elm_exit();
}
#
win = Efl::Elm::Native.elm_win_add FFI::MemoryPointer::NULL, "App name", :elm_win_basic
Efl::Elm::Native.elm_win_title_set win, "Window title"
Efl::Evas::Native.evas_object_smart_callback_add win, "delete,request", win_del, FFI::MemoryPointer::NULL
#
bg = Efl::Elm::Native.elm_bg_add win
Efl::Evas::Native.evas_object_size_hint_weight_set bg, 1.0, 1.0
Efl::Elm::Native.elm_win_resize_object_add win, bg
Efl::Evas::Native.evas_object_show bg
#
lb = Efl::Elm::Native.elm_label_add win
Efl::Elm::Native.elm_label_label_set lb, "Hello World!"
Efl::Evas::Native.evas_object_size_hint_weight_set lb, 1.0, 1.0
Efl::Elm::Native.elm_win_resize_object_add win, lb
Efl::Evas::Native.evas_object_show lb
#
Efl::Evas::Native.evas_object_move win, 300, 300
Efl::Evas::Native.evas_object_resize win, 200, 100
#
Efl::Evas::Native.evas_object_show win
#
Efl::Elm.run
Efl::Elm::Native.elm_shutdown
#
# EOF
