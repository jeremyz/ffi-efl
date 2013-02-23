#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_win'
require 'efl/elm/elm_bg'
require 'efl/elm/elm_panes'
require 'efl/elm/elm_button'
#
include Efl
#
class MyWin < Elm::ElmWin
  #
  def initialize
    super(nil, "Greetings") do
      title_set "Hello, World!"
      smart_callback_add("delete,request", ->(*_) { Elm.exit }, nil)
      resize 320, 400
      show
    end
    @bg = Elm::ElmBg.new(self) do
      size_hint_weight_expand
      show
    end
    resize_object_add @bg
    #
    @panes = Elm::ElmPanes.new(self) do
      size_hint_weight_expand
      size_hint_align_fill
      show
    end
    resize_object_add @panes
    #
    @bt1 = Elm::ElmButton.new(self) do
      part_text_set(nil, "Left")
      size_hint_weight_expand
      size_hint_align_fill
      show
    end
    @panes.part_content_set("left", @bt1)
    #
    @panes_h = Elm::ElmPanes.new(self) do
      horizontal_set true
      size_hint_weight_expand
      size_hint_align_fill
      show
    end
    @panes.part_content_set("right", @panes_h)
    #
    @bt2 = Elm::ElmButton.new(self) do
      part_text_set(nil, "Up")
      size_hint_weight_expand
      size_hint_align_fill
      show
    end
    @panes_h.part_content_set("left", @bt2)
    #
    @bt3 = Elm::ElmButton.new(self) do
      part_text_set(nil, "Down")
      size_hint_weight_expand
      size_hint_align_fill
      show
    end
    @panes_h.part_content_set("right", @bt3)
  end
end
#
Elm.init
#
MyWin.new
#
Elm.run
Elm.shutdown
#
# EOF
