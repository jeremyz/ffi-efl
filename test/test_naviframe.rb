#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_win'
require 'efl/elm/elm_bg'
require 'efl/elm/elm_button'
require 'efl/elm/elm_naviframe'
#
include Efl
#
class MyWin < Elm::ElmWin
  #
  attr_reader :frames
  def initialize
    super(nil, "Greetings") do
      title_set "Hello, World!"
      smart_callback_add("delete,request", ->(*_) { Elm.exit }, nil)
      resize 240, 400
      show
    end
    @bg = Elm::ElmBg.new(self) do
      size_hint_weight_expand
      show
    end
    resize_object_add @bg
    #
    @naviframe = Elm::ElmNaviFrame.new(self) do
      size_hint_weight_expand
      size_hint_align_fill
      show
    end
    resize_object_add @naviframe
    #
    @frames = 0
    add_frame
  end
  #
  def add_frame *a
    @frames += 1
    _self = self
    @content = Elm::ElmButton.new(self) do
      text_set "content #{_self.frames}"
      size_hint_weight_expand
      size_hint_align_fill
      smart_callback_add "clicked", _self.method(:add_frame)
      show
    end
    @naviframe.item_push("test #{@frames}", nil, nil, @content, nil)
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
