#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native/ecore'
require 'efl/native/elm/elm_win'
require 'efl/native/elm/elm_bg'
require 'efl/native/elm/elm_label'
require 'efl/native/elm/elm_object'
#
include Efl::Native
#
elm_init 0, FFI::MemoryPointer::NULL
#
win_del = Proc.new { |data,evas_object,event_info| elm_exit() }
#
win = elm_win_add nil, "App name", :elm_win_basic
elm_win_title_set win, "Window title"
evas_object_smart_callback_add win, "delete,request", win_del, nil
#
bg = elm_bg_add win
evas_object_size_hint_weight_set bg, 1.0, 1.0
elm_win_resize_object_add win, bg
evas_object_show bg
#
lb = elm_label_add win
elm_object_part_text_set lb, nil, "Hello World"
evas_object_size_hint_weight_set lb, 1.0, 1.0
elm_win_resize_object_add win, lb
evas_object_show lb
#
evas_object_move win, 300, 300
evas_object_resize win, 200, 100
#
evas_object_show win
#
pipe_cb = Proc.new { |date,buffer,n|
  elm_object_part_text_set lb, nil, buffer.read_string[0..n-1]
}
#
pipe = ecore_pipe_add pipe_cb, nil
#
pid = fork {
  ecore_pipe_read_close(pipe);
  [ "hello", "dying", "old", "planet", "earth"].each do |w|
    sleep 1
    ecore_pipe_write pipe, w, w.length
  end
}
#
elm_run
ecore_pipe_del pipe
elm_shutdown
