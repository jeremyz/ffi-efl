#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elementary_all'
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
include Efl
#
Elm.init
#
class Window < Elm::ElmWin
  #
  def initialize
    super nil, "genlist"
    title_set("Genlist")
    @bg = Elm::ElmBg.new(self) do
      color_set 255, 255, 255
      size_hint_weight_expand
      show
    end
    resize_object_add(@bg)
    @itc = ElmGenItemClass.new(Native.elm_genlist_item_class_new)
    @itc[:item_style] = FFI::MemoryPointer.from_string("default")
    @itc[:text_get] = FFI::Function.new(:pointer, [:pointer, :pointer, :string]) do |data, *_|
      ptr = FFI::MemoryPointer.from_string("Item # #{data.read_string}")
      ptr.autorelease = false
      ptr
    end
    @itc[:content_get] =  FFI::Function.new(:pointer, [:pointer, :pointer, :string]) do |data, obj, part|
      Elm::ElmIcon.new(self) do
        standard_set(part == "elm.swallow.icon" ? "home" : "clock")
        size_hint_aspect_set 0, 1, 1
      end.to_ptr
    end
    @list = Elm::ElmGenList.new(self) do
      size_hint_weight_expand
      show
    end
    30.times do |i|
      @list.item_append(@itc, i.to_s, nil, :elm_genlist_item_none,
        FFI::Function.new(:pointer, [:pointer, :pointer, :pointer]) {|data, obj, evt|
          p [:selected, data.read_string] }, i.to_s)
    end
    resize_object_add(@list)
    smart_callback_add "delete,request", ->(*_) { Elm.exit }, nil
    resize 200, 300
    show
  end
end
#
Window.new
#
Elm.run
Elm.shutdown
#
# EOF
