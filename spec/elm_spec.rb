#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina'
require 'efl/elementary'
#
describe Efl::Elm do
    #
    before(:all) { Elm = Efl::Elm }
    #
    before(:each) {
        Elm.init
        @win = Elm::ElmWin.new(nil, 'TEST') do |w|
            w.title= 'spec win'
            w.move 100, 100
            w.resize 100, 100
            w.show
        end
        @bg = Elm::ElmBg.new(@win) do |bg|
            bg.size_hint_weight_set 1.0, 1.0
            bg.evas_object_color_set 200,255,100,150
            bg.show
        end
    }
    after(:each) {
        @bg.free
        @win.free
        Elm.shutdown
    }
    #
    describe Efl::Elm::ElmBg do
        #
        it "file set/get" do
            @bg.file_set "file", "group1"
            @bg.file_get.should == ["file","group1"]
            @bg.file= "file", "group1"
            @bg.file.should == ["file","group1"]
        end
        #
        it "option set/get" do
            @bg.option_set :elm_bg_option_scale
            @bg.option_get.should == :elm_bg_option_scale
            @bg.option=:elm_bg_option_center
            @bg.option.should == :elm_bg_option_center
        end
        #
        it "color set/get" do
            @bg.color_set 12,24,36
            @bg.color_get.should == [12,24,36]
            @bg.color= 2,4,8
            @bg.color.should == [2,4,8]
            @bg.class.superclass.instance_method(:color).bind(@bg).call.should == [200,255,100,150]
        end
        #
        it "overlay get/set unset" do
            @r = @win.evas.object_rectangle_add
            @bg.overlay_get.should==FFI::Pointer::NULL
            @bg.overlay_set @r
            @bg.overlay_get.should == @r.to_ptr
            @bg.overlay_unset.should == @r.to_ptr
            @bg.overlay_get.should == FFI::Pointer::NULL
            @r.free
        end
    end
    #
end

