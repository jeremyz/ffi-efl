#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_win'
require 'efl/elm/elm_bg'
require 'efl/elm/elm_button'
#
include Efl
#
class MyWin < Elm::ElmWin
  #
  def initialize
    super(nil, "Greetings") do
      title_set "Hello, World!"
      autodel_set true
      resize 240, 60
      show
    end
    @bg = Elm::ElmBg.new(self) do
      size_hint_weight_expand
      show
    end
    resize_object_add @bg
    @btn = Elm::ElmButton.new(self) do
      part_text_set(nil, "Good-Bye, World!")
      smart_callback_add("clicked", ->(*_) { Elm.exit }, nil)
      resize 120, 30
      move 60, 15
      show
    end
  end
end
#
Elm.init
#
MyWin.new
Elm.elm_policy_set(0, 1)
#
Elm.run
Elm.shutdown
#
# EOF
