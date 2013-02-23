#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ecore'
require 'efl/elm/elm_win'
require 'efl/elm/elm_bg'
require 'efl/elm/elm_label'
#
include Efl
#
class MyWin < Elm::ElmWin
  #
  attr_reader :pipe
  def initialize
    super(nil, "Pipe test") do
      title_set "Hello, World!"
      smart_callback_add("delete,request", ->(*_) { Elm.exit }, nil)
      resize 200, 100
      show
    end
    @bg = Elm::ElmBg.new(self) do
      size_hint_weight_expand
      show
    end
    resize_object_add @bg
    #
    @label = Elm::ElmLabel.new(self) do
      text_set "Hello World"
      size_hint_weight_expand
      show
    end
    resize_object_add @label
    #
    @pipe = Ecore.ecore_pipe_add(method(:pipe_cb), nil)
  end
  #
  def pipe_cb date, buffer, n
    @label.text_set buffer.read_string[0..n-1]
  end
end
#
Elm.init
#
@win = MyWin.new
#
pid = fork do
  Ecore.ecore_pipe_read_close(@win.pipe)
  [ "hello", "dying", "old", "planet", "earth"].each do |w|
    sleep 1
    Ecore.ecore_pipe_write @win.pipe, w, w.length
  end
end
Elm.run
Ecore.ecore_pipe_del @win.pipe
Elm.shutdown
#
# EOF
