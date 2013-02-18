#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native/elm/elm_win'
require 'efl/native/elm/elm_bg'
require 'efl/native/elm/elm_button'
require 'efl/native/elm/elm_object'
#
include Efl::Native
#
elm_init 0, FFI::MemoryPointer::NULL
#
def on_click data, object, event
  elm_exit
end
#
win = elm_win_add(nil, "Greetings", 0)
elm_win_title_set(win, "Hello, World!")
elm_win_autodel_set(win, true)
elm_policy_set(0, 1)
evas_object_resize(win, 240, 60)
evas_object_show(win)
#
bg = elm_bg_add(win)
evas_object_size_hint_weight_set(bg, 1.0, 1.0)
elm_win_resize_object_add(win, bg)
evas_object_show(bg)
#
btn = elm_button_add(win)
elm_object_part_text_set(btn, nil, "Good-Bye, World!")
evas_object_smart_callback_add(btn, "clicked", method(:on_click), nil)
evas_object_resize(btn, 120, 30)
evas_object_move(btn, 60, 15)
evas_object_show(btn)
#
elm_run
elm_shutdown
#
# EOF
