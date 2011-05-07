#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina'
require 'efl/elementary'
#
describe Efl::Elm do
    #
    before(:all) {
        Elm = Efl::Elm
        Elm.init
    }
    after(:all) {
        Elm.shutdown
    }
    #
    def realize_app
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
    end
    #
    describe Efl::Elm::ElmBg do
        before(:all) {
            realize_app
        }
        after(:all) {
            @bg.free
            @win.free
        }
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
    describe Efl::Elm::ElmLabel do
        #
        before(:all) {
            realize_app
            @lb = Elm::ElmLabel.new @win
        }
        after(:all) {
            @lb.free
            @bg.free
            @win.free
        }
        #
        it "label set/get" do
            @lb.label_set "label1"
            @lb.label_get.should == "label1"
            @lb.label= "label2"
            @lb.label.should == "label2"
        end
        #
        it "line_wrap set/get" do
            @lb.line_wrap_set :elm_wrap_char
            @lb.line_wrap_get.should == :elm_wrap_char
            @lb.line_wrap= :elm_wrap_none
            @lb.line_wrap.should == :elm_wrap_none
        end
        #
        it "wrap_width set/get" do
            @lb.wrap_width_set 69
            @lb.wrap_width_get.should == 69
            @lb.wrap_width= 666
            @lb.wrap_width.should == 666
        end
        #
        it "wrap_height set/get" do
            @lb.wrap_height_set 69
            @lb.wrap_height_get.should == 69
            @lb.wrap_height= 666
            @lb.wrap_height.should == 666
        end
        #
        it "ellipsis_set" do
            @lb.ellipsis_set true
            @lb.ellipsis= true
        end
        #
        it "slide_set" do
            @lb.slide_set true
            @lb.slide_get.should be_true
            @lb.slide= false
            @lb.slide.should be_false
        end
        #
        it "slide_duration_set" do
            @lb.slide_duration_set 3.1415926
            @lb.slide_duration_get.should == 3.1415926
            @lb.slide_duration= 3.1415926
            @lb.slide_duration.should == 3.1415926
        end
    end
    describe Efl::Elm::ElmPager do
        #
        before(:all) {
            realize_app
            @p = Elm::ElmPager.new @win
            @os = []
            0.upto(3) do
                @os << @win.evas.object_rectangle_add
            end
        }
        after(:all) {
            @p.free
            @bg.free
            @win.free
        }
        #
        it "content push pop promote bottom_get top_get" do
            @os.each do |o|
                @p.content_push o
            end
            @p.content_top_get.should == @os[-1].to_ptr
            @p.content_bottom_get.should == @os[0].to_ptr
            @p.content_pop
            @p.content_top_get.should == @os[-2].to_ptr
            @p.content_bottom_get.should == @os[0].to_ptr
            @p.content_promote @os[0]
            @p.content_top_get.should == @os[0].to_ptr
            @p.content_bottom_get.should == @os[1].to_ptr
        end
    end
end

