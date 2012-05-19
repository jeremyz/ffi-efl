#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ecore'
require 'efl/elementary_all'
require './spec/helper'
#
describe "Efl::Elm #{Efl::Elm.version.full}" do
    #
    before(:all) do
        Elm = Efl::Elm
        @init = Elm.init
    end
    after(:all) do
        Elm.shutdown
    end
    it "should init" do
        Elm.init.should == @init+1
        Elm.init.should == @init+2
        Elm.init.should == @init+3
    end
    #
    it "should shutdown" do
        Elm.shutdown.should == @init+2
        Elm.shutdown.should == @init+1
        Elm.shutdown.should == @init
    end
    #
    describe 'Efl::Elm::ElmWin' do
        before(:each) {
            realize_win
        }
        after(:each) {
            @bg.free
            @win.free
        }
        #
        it "resize_object add/del" do
            r = @win.evas.object_rectangle_add
            @win.resize_object_add r
            @win.resize_object_del r
        end
        #
        it "title set/get" do
            @win.title_set "title1"
            @win.title_get.should == "title1"
            @win.title= "title2"
            @win.title.should == "title2"
        end
        #
        it "autodel set/get" do
            bool_check @win, 'autodel'
        end
        #
        it "activate, lower, raise" do
            @win.activate
            @win.lower
            @win.raise
        end
        #
        it "borderless set/get" do
            bool_check @win, 'borderless'
            @win.borderless.should be_false
        end
        #
        it "shaped set/get" do
            bool_check @win, 'shaped'
        end
        #
        it "alpha set/get" do
            bool_check @win, 'alpha'
        end
        #
        it "override set/get" do
            bool_check @win, 'override'
        end
        #
        it "fullscreen set/get" do
            bool_check @win, 'fullscreen', 4
        end
        #
        it "iconified set/get" do
            bool_check @win, 'iconified'
        end
        #
        it "layet set/get" do
            @win.layer_set 2
            @win.layer_get.should == 2
            @win.layer = 3
            @win.layer.should == 3
        end
        #
        it "rotation set/get" do
            @win.rotation_set 90
            @win.rotation_get.should == 90
            @win.rotation = 180
            @win.rotation.should == 180
            @win.rotation_with_resize_set 90
            @win.rotation_get.should == 90
            @win.rotation_with_resize= 180
            @win.rotation.should == 180
        end
        #
        it "sticky set/get" do
            bool_check @win, 'sticky', 3
        end
        #
        it "conformant set/get" do
            bool_check @win, 'conformant'
        end
        #
        it "quickpanel set/get" do
            bool_check @win, 'quickpanel'
        end
        #
        it "quickpanel_priority_major set/get" do
            @win.quickpanel_priority_major_set 6
            @win.quickpanel_priority_major_get.should == 6
            @win.quickpanel_priority_major= 1
            @win.quickpanel_priority_major.should == 1
        end
        #
        it "quickpanel_priority_minor set/get" do
            @win.quickpanel_priority_minor_set 6
            @win.quickpanel_priority_minor_get.should == 6
            @win.quickpanel_priority_minor= 1
            @win.quickpanel_priority_minor.should == 1
        end
        #
        it "quickpanel_zone set/get" do
            @win.quickpanel_zone_set 6
            @win.quickpanel_zone_get.should == 6
            @win.quickpanel_zone= 1
            @win.quickpanel_zone.should == 1
        end
        #
        it "focus_highlight_enabled" do
            bool_check @win, 'focus_highlight_enabled'
        end
        #
        it "focus_highlight_style set/get" do
            char_check @win, 'focus_highlight_style'
        end
        #
        it "keyboard_mode set/get" do
            @win.keyboard_mode_set :elm_win_keyboard_off
            @win.keyboard_mode_get.should == :elm_win_keyboard_off
            @win.keyboard_mode= :elm_win_keyboard_on
            @win.keyboard_mode.should == :elm_win_keyboard_on
            @win.keyboard_mode?.should == :elm_win_keyboard_on
        end
        #
        it "keyboard_winset/get" do
            bool_check @win, 'keyboard_win'
        end
        #
        it "screen_position_get" do
            @win.screen_position_get.should == [0,0]
            @win.screen_position.should == [0,0]
        end
        #
        it "prop_focus_skip_set" do
            @win.prop_focus_skip_set true
            @win.prop_focus_skip= false
        end
        #
        it "inlined_image_object_get" do
            o1 = @win.inlined_image_object_get
            o2 = @win.inlined_image_object
            o1.should === o2
        end
        #
    end
    #
    describe 'Efl::Elm::ElmBg' do
        before(:all) {
            realize_win
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
#            @bg.class.superclass.instance_method(:color_get).bind(@bg).call.should == [200,255,100,150]
        end
        #
    end
    #
    describe 'Efl::Elm::ElmLabel' do
        #
        before(:all) {
            realize_win
            @lb = Elm::ElmLabel.new @win
        }
        after(:all) {
            @lb.free
            @bg.free
            @win.free
        }
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
        it "ellipsis_set" do
            @lb.ellipsis_set true
            @lb.ellipsis= false
        end
        #
        it "slide_set" do
            bool_check @lb, 'slide'
        end
        #
        it "slide_duration_set" do
            @lb.slide_duration_set 3.1415926
            @lb.slide_duration_get.should == 3.1415926
            @lb.slide_duration= 3.1415926
            @lb.slide_duration.should == 3.1415926
        end
    end
    #
end

