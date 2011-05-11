#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elementary'
require './spec/helper'
#
describe "Efl::Elm #{Efl::Elm.version.full}" do
    #
    before(:all) {
        Elm = Efl::Elm
        Elm.init.should == 1
    }
    after(:all) {
        Elm.shutdown.should == 0
    }
    #
    describe Efl::Elm::ElmWin do
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
        it "transparent set/get" do
            bool_check @win, 'transparent'
        end
        #
        it "override set/get" do
            bool_check @win, 'override'
        end
        #
        it "fullscreen set/get" do
            bool_check @win, 'fullscreen', 4
        end
        # FIXME depends on issue: ecore-2
        it "maximized set/get" do
            bool_check @win, 'maximized', 3
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
        # TODO EAPI void elm_win_illume_command_send(Evas_Object *obj, Elm_Illume_Command command, void *params);;
        # TODO EAPI Ecore_X_Window elm_win_xwindow_get(const Evas_Object *obj);
        #
        describe Efl::Elm::ElmInWin do
            it "activate, content set/get/unset" do
                @iwin = @win.inwin_add
                o1 = @win.evas.object_rectangle_add
                o2 = @win.evas.object_rectangle_add
                @iwin.activate
                @iwin.content_set o1
                @iwin.content.should == o1.to_ptr
                @iwin.content?.should == o1.to_ptr
                @iwin.content_get.should === o1.to_ptr
                @iwin.content= o2
                @iwin.content.should === o2.to_ptr
                @iwin.content?.should === o2.to_ptr
                @iwin.content_get.should === o2.to_ptr
                @iwin.content_unset
                @iwin.content.should == FFI::Pointer::NULL
                @iwin.content?.should == FFI::Pointer::NULL
                @iwin.content_get.should == FFI::Pointer::NULL
                o1.free
                o2.free
            end
        end
    end
    #
    describe Efl::Elm::ElmBg do
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
            @bg.class.superclass.instance_method(:color).bind(@bg).call.should == [200,255,100,150]
        end
        #
        it "overlay get/set unset" do
            r = @win.evas.object_rectangle_add
            @bg.overlay_get.should==FFI::Pointer::NULL
            @bg.overlay_set r
            @bg.overlay_get.should == r.to_ptr
            @bg.overlay_unset.should == r.to_ptr
            @bg.overlay_get.should == FFI::Pointer::NULL
            r.free
        end
    end
    #
    describe Efl::Elm::ElmLabel do
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
    describe Efl::Elm::ElmPager do
        #
        before(:all) {
            realize_win
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
    #
    describe Efl::Elm::ElmPanel do
        #
        before(:all) {
            realize_win
            @p = Elm::ElmPanel.new @win
            @os = []
        }
        after(:all) {
            @p.free
            @bg.free
            @win.free
        }
        #
        it "orient set/get" do
            @p.orient_set :elm_panel_orient_bottom
            @p.orient_get.should == :elm_panel_orient_bottom
            @p.orient= :elm_panel_orient_top
            @p.orient.should == :elm_panel_orient_top
        end
        #
        it "content set/get/unset" do
            o = @win.evas.object_rectangle_add
            @p.content_set o
            @p.content_get.should == o.to_ptr
            @p.content_unset.should == o.to_ptr
            o.free
            o = @win.evas.object_rectangle_add
            @p.content= o
            @p.content.should == o.to_ptr
            @p.content_unset.should == o.to_ptr
            o.free
        end
        #
        it "hidden set/get toggle" do
            @p.hidden_set true
            @p.hidden_get.should be_true
            @p.hidden=false
            @p.hidden.should be_false
            @p.toggle
            @p.hidden_get.should be_true
            @p.hidden.should be_true
            @p.toggle
            @p.hidden_get.should be_false
            @p.hidden.should be_false
        end
    end
end

