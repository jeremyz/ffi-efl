#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_win'
require 'efl/elm/elm_bg'
require 'efl/elm/elm_icon'
require 'efl/elm/elm_layout'
#
include Efl
#
IMAGES = ["home", "close", "arrow_up", "arrow_down"]
#
class MyWin < Elm::ElmWin
  #
  attr_reader :current
  def initialize
    @current = 0
    super(nil, "Layout") do
      title_set "Layout"
      smart_callback_add("delete,request", ->(*_) { Elm.exit }, nil)
      resize 320, 320
      show
    end
    @bg = Elm::ElmBg.new(self) do
      size_hint_weight_expand
      show
    end
    resize_object_add @bg
    #
    @layout = Elm::ElmLayout.new(self) do
      size_hint_weight_expand
      theme_set "layout", "application", "content-back-next"
      show
    end
    resize_object_add @layout
    #
    @icon = Elm::ElmIcon.new(self)
    @icon.standard_set IMAGES[@current]
    #
    @layout.part_content_set("elm.swallow.content", @icon)
    @layout.part_text_set("elm.text.title", "Test #{@current}")
    #
    @layout.signal_callback_add("elm,action,back", "", method(:signal_cb), nil)
    @layout.signal_callback_add("elm,action,next", "", method(:signal_cb), nil)
  end
  #
  def signal_cb data, object, emission, source
    @current -= 1  if emission == "elm,action,back"
    @current += 1  if emission == "elm,action,next"
    @current = IMAGES.size - 1  if @current < 0
    @current = 0  if @current >= IMAGES.size
    #
    @icon.standard_set IMAGES[@current]
    @layout.part_text_set("elm.text.title", "Test #{@current}")
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
