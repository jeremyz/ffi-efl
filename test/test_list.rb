#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_win'
require 'efl/elm/elm_bg'
require 'efl/elm/elm_list'
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
  #
  def feed
    _self = self
    @bg = Elm::ElmBg.new(self) do
      size_hint_weight_expand
      evas_object_color_set 150,180,100,180

      show
    end
    resize_object_add @bg
    @list = Elm::ElmList.new(self) do
      Dir.entries(ENV["HOME"]).each do |entry|
        next  if entry[0] == '.'
        item_append entry, nil, nil, _self.method(:on_select),
        FFI::MemoryPointer.from_string(entry)
      end
      size_hint_weight_expand
      show
    end
    resize_object_add @list
  end
  #
  def on_select data, evas_object, event_info
    p [:selected, data.read_string]
  end
  #
  def on_delete data, evas_object, event_info
    puts "EXIT #{data.read_string}"
    Elm.exit
  end
end
#
Elm.init
#
win = MyWin.new "MyList", "List Example" do
  alpha_set true
  resize 300, 200
  center_set 600, 300
  show
end
#
Elm.run
Elm.shutdown
