#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-

require 'efl/native/elm/elm_win'
require 'efl/native/elm/elm_bg'
require 'efl/native/elm/elm_check'
require 'efl/native/elm/elm_object'
require 'efl/native/elm/elm_focus'

require 'efl/native/ecore'

include Efl::Native

elm_init 0, nil

def cb_change_text (obj)
    elm_object_part_text_set(obj, nil, "done")
    # elm_check_state_set(obj, false)
end

def print_cb (data, obj, event)
    if elm_check_state_get(obj)
        puts "marked"
        elm_object_part_text_set(obj, nil, "I feel touched, and I like it")
        ecore_timer_add(1.0, method(:cb_change_text), obj)
    else
        puts "unmarked"
    end
end

# Main Window
win = elm_win_add(nil, "Checkbox Test", 0)
elm_win_title_set(win, "Test of Checkbox functions")
elm_win_autodel_set(win, true)
elm_policy_set( Efl::Native.enum_type(:elm_policy)[:elm_policy_quit],
               Efl::Native.enum_type(:elm_policy_quit)[:elm_policy_quit_last_window_closed])
elm_object_focus_set(win, true)
evas_object_resize(win, 200, 100)
evas_object_show(win)

# Background
bg = elm_bg_add(win)
evas_object_size_hint_weight_set(bg, 1.0, 1.0)
elm_win_resize_object_add(win, bg)
evas_object_show(bg)

# Checkbox
cb = elm_check_add(win)
elm_object_part_text_set(cb, nil, "click me!")
elm_object_focus_set(cb, true)
evas_object_smart_callback_add(cb, "changed", method(:print_cb), nil)
evas_object_move(cb, 10, 10)
evas_object_resize(cb, 200, 30)
evas_object_show(cb)

elm_run
elm_shutdown

