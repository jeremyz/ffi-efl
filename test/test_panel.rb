#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_win'
require 'efl/elm/elm_bg'
require 'efl/elm/elm_box'
require 'efl/elm/elm_panel'
require 'efl/elm/elm_label'
#
include Efl
#
class MyWin < Elm::ElmWin
  #
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
    @bx = Elm::ElmBox.new(self) do
      horizontal_set false
      size_hint_weight_expand
      size_hint_align_fill
      show
    end
    resize_object_add @bx
    #
    @panel1 = Elm::ElmPanel.new(self) do
      orient_set :elm_panel_orient_top
      toggle
      size_hint_weight_expand
      size_hint_align_fill
      show
    end
    @bx.pack_end @panel1
    #
    @content = Elm::ElmLabel.new(self) do
      text_set "content 1"
      show
    end
    @panel1.content_set @content
    #
    @panel2 = Elm::ElmPanel.new(self) do
      orient_set :elm_panel_orient_right
      hidden_set true
      size_hint_weight_expand
      size_hint_align_fill
      show
    end
    @bx.pack_end @panel2
    #
    @content = Elm::ElmLabel.new(self) do
      text_set "content 2"
      show
    end
    @panel2.content_set @content
    #
    @panel3 = Elm::ElmPanel.new(self) do
      orient_set :elm_panel_orient_bottom
      size_hint_weight_expand
      size_hint_align_fill
      show
    end
    @bx.pack_end @panel3
    #
    @content = Elm::ElmLabel.new(self) do
      text_set "content 3"
      show
    end
    @panel3.content_set @content
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
