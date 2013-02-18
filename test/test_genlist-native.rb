#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native/elm/elm_win'
require 'efl/native/elm/elm_bg'
require 'efl/native/elm/elm_label'
require 'efl/native/elm/elm_genlist'
#
class ElmGenItemClass < FFI::Struct
  layout  :version, :int,
  :refcount, :uint,
  :delete_me, :pointer,
  :item_style, :pointer,
  :decorate_item_style, :pointer,
  :decorate_all_item_style, :pointer,
  :text_get, :pointer,
  :content_get, :pointer,
  :state_get, :pointer,
  :del, :pointer
end
#
include Efl::Native
#
elm_init 0, FFI::MemoryPointer::NULL
#
win = elm_win_add(nil, "genlist", 0)
elm_win_title_set(win, "Genlist")
elm_policy_set(0, 1)
elm_win_autodel_set(win, true)
#
bg = elm_bg_add(win)
elm_bg_color_set(bg, 255, 255, 255)
evas_object_size_hint_weight_set(bg, 1.0, 1.0)
elm_win_resize_object_add(win, bg)
evas_object_show(bg)
#
if !@itc
  itc_ptr = elm_genlist_item_class_new
  @itc = ElmGenItemClass.new(itc_ptr)
  @itc[:item_style] = FFI::MemoryPointer.from_string("default")
  @itc[:text_get] = FFI::Function.new(:pointer, [:pointer, :pointer, :string]) {|data, *_|
    ptr = FFI::MemoryPointer.from_string("Item # #{data.read_string}")
    ptr.autorelease = false
    ptr
  }
  @itc[:content_get] = FFI::Function.new(:pointer, [:pointer, :pointer, :string]) do
    |data, obj, part|
    ic = elm_icon_add(obj)
    elm_icon_standard_set(ic, "clock")  if part == "elm.swallow.icon"
    evas_object_size_hint_aspect_set(ic, 0, 1, 1)
    ic
  end
  @itc[:state_get] = nil
  @itc[:del] = nil
end
#
list = elm_genlist_add(win)
#
30.times do |i|
  elm_genlist_item_append(list, @itc, i.to_s, nil, :elm_genlist_item_none,
    FFI::Function.new(:pointer, [:pointer, :pointer, :pointer]) {|data, obj, evt|
      p [:selected, data.read_string] }, i.to_s)
end
#
evas_object_size_hint_weight_set(list, 1.0, 1.0)
elm_win_resize_object_add(win, list)
evas_object_show(list)
#
evas_object_resize(win, 200, 300)
evas_object_show(win)
#
elm_run
elm_shutdown
#
# EOF
