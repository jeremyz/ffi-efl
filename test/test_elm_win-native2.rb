#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native/elm/elm_win'
require 'efl/native/elm/elm_bg'
require 'efl/native/elm/elm_label'
require 'efl/native/elm/elm_object'
#
include Efl
#
Elm.init 0, FFI::MemoryPointer::NULL
#
win_del = Proc.new { |data,evas_object,event_info|
    Elm.exit();
}
#
win = ElmWin.add nil, "App name", :elm_win_basic
ElmWin.title_set win, "Window title"
Evas.object_smart_callback_add win, "delete,request", win_del, nil
#
bg = ElmBg.add win
Evas.object_size_hint_weight_set bg, 1.0, 1.0
ElmWin.resize_object_add win, bg
Evas.object_show bg
#
lb = ElmLabel.add win
ElmObject.part_text_set lb, nil, "Hello World"
Evas.object_size_hint_weight_set lb, 1.0, 1.0
ElmWin.resize_object_add win, lb
Evas.object_show lb
#
Evas.object_move win, 300, 300
Evas.object_resize win, 200, 100
#
Evas.object_show win
#

Elm.run
Elm.shutdown
#
# EOF
