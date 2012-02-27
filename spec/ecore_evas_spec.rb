#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina_list'
require 'efl/ecore'
require 'efl/ecore_evas'
require './spec/helper'
#
describe 'Efl::EcoreEvas' do
    #
    before(:all) do
        EcoreEvas = Efl::EcoreEvas
        EcoreEvas.init.should==1
    end
    after(:all) do
        EcoreEvas.shutdown.should==0
    end
    #
    it "should init" do
        EcoreEvas.init.should == 2
        EcoreEvas.init.should == 3
    end
    #
    it "should shutdown" do
        EcoreEvas.shutdown.should == 2
        EcoreEvas.shutdown.should == 1
    end
    #
    it "engines get/list/free" do
        EcoreEvas.engines_free EcoreEvas.engines_get
        l = EcoreEvas.engines_list
        r = l.inject("\t") do |s,e| s+=e.read_string+' ' end
        EcoreEvas.engines_free l
    end
    #
    it "ecore_evas_list" do
        el = EcoreEvas.ecore_evas_list
        el.to_ary.length.should == 0
        el.free
        r=[]
        0.upto(3) do
            r << EcoreEvas::REcoreEvas.new
        end
        el = EcoreEvas.ecore_evas_list
        el.to_ary.length.should == 4
        el.free
        r.each do |e| e.free end
    end
    #
    describe Efl::EcoreEvas::REcoreEvas do
        before(:all) do
            EcoreEvas.init.should == 2
        end
        before(:each) do
            @e = EcoreEvas::REcoreEvas.new :engine_name=>"software_x11", :x=>10, :y=>10, :w=>100, :h=>120 do
                move 10, 10
                show
            end
            @canvas = @e.evas
            @bg = @canvas.object_rectangle_add do
                color_set 100, 100, 255, 255
                show
            end
            @bg.size = @e.size
            @e.object_associate @bg, :ecore_evas_object_associate_base
        end
        after(:each) do
            @e.free
        end
        after(:all) do
            EcoreEvas.shutdown.should == 1
        end
        #
        it "engine_name_get " do
            @e.engine_name_get.should == "software_x11"
        end
        #
        it "data get/set " do
            @e.data_set 'key', '666'
            @e.data_get('key').read_string.should == '666'
        end
        #
        it "move, resize move_resize and geometry_get  (and check association)" do
            @e.geometry_get.should == [10,10,100,120]
            @bg.geometry_get.should == [0,0,100,120]
            @e.move 50, 50
            ecore_loop 3
            g = @e.geometry_get
            g[0].should >=50
            g[0].should <=60
            g[1].should >=60
            g[1].should <=80
            g.delete_at 0
            g.delete_at 0
            g.should == [100,120]
            @bg.geometry_get.should == [0,0,100,120]
            @e.resize 200,150
            ecore_loop 3
            g = @e.geometry_get
            g.delete_at 0
            g.delete_at 0
            g.should == [200,150]
            @bg.geometry_get.should == [0,0,200,150]
            @e.move_resize 10, 0, 130, 100
            ecore_loop 3
            g = @e.geometry_get
            g[0].should >=10
            g[0].should <=20
            g[1].should >=20
            g[1].should <=30
            g.delete_at 0
            g.delete_at 0
            g.should == [130,100]
            @bg.geometry_get.should == [0,0,130,100]
            g = @e.geometry_get
        end
        #
        it "rotation " do
            @e.rotation_set 25
            @e.rotation_get.should == 25
            @e.rotation = 50
            @e.rotation_get.should == 50
            @e.rotation_with_resize_set 0
            @e.rotation_get.should == 0
        end
        #
        it "shaped get/set " do
            bool_check @e, 'shaped'
        end
        #
        it "alpha get/set " do
            bool_check @e, 'alpha'
        end
        #
        it "transparent get/set " do
            bool_check @e, 'transparent'
        end
        #
        it "show hide visibility " do
            ecore_loop 3
            @e.visibility?.should == 1
            @e.hide
            ecore_loop 3
            @e.visibility_get.should == 0
            @e.show
            ecore_loop 3
            @e.visibility?.should == 1
        end
        #
        it "raise lower activate " do
            @e.raise
            @e.lower
            @e.activate
        end
        #
        it "title set/get " do
            @e.title_set "title"
            @e.title_get.should == "title"
            @e.title = "other"
            @e.title_get.should == "other"
        end
        #
        #
        it "name_class set/get " do
            @e.name_class_set "name", "class"
            @e.name_class_get.should == ['name','class']
            @e.name_class = "name1", "class1"
            @e.name_class_get.should == ['name1','class1']
        end
        #
        it "size_min set/get " do
            @e.size_min_set 20, 30
            @e.size_min_get.should == [20, 30]
        end
        #
        it "size_max set/get " do
            @e.size_max_set 20, 30
            @e.size_max_get.should == [20, 30]
        end
        #
        it "size_base set/get " do
            @e.size_base_set 20, 30
            @e.size_base_get.should == [20, 30]
        end
        #
        it "size_step set/get " do
            @e.size_step_set 20, 30
            @e.size_step_get.should == [20, 30]
        end
        #
        it "layer set/get " do
            @e.layer_set 2
            @e.layer_get.should == 2
            @e.layer = 1
            @e.layer?.should == 1
        end
        #
        it "focus set/get " do
            @e.focus?.should be_false
            @e.focus_set true
            ecore_loop 3
            @e.focus_get.should be_true
            @e.focus?.should be_true
        end
        #
        it "iconified set/get " do
            bool_check @e, 'iconified'
        end
        #
        it "borderless set/get " do
            bool_check @e, 'borderless'
        end
        #
        it "override set/get " do
            bool_check @e, 'override'
        end
        #
        it "fullscreen set/get " do
            bool_check @e, 'fullscreen', 5
        end
        #
        it "avoid_damage set/get " do
            @e.avoid_damage_set :ecore_evas_avoid_damage_expose
            ecore_loop 3
            @e.avoid_damage_get.should == :ecore_evas_avoid_damage_expose
            @e.avoid_damage = :ecore_evas_avoid_damage_built_in
            ecore_loop 3
            @e.avoid_damage?.should == :ecore_evas_avoid_damage_built_in
        end
        #
        it "withdrawn set/get " do
            bool_check @e, 'withdrawn'
        end
        #
        it "sticky set/get " do
            bool_check @e, 'sticky', 3
        end
        #
        it "ignore_events set/get " do
            bool_check @e, 'ignore_events'
        end
        #
        it "manual_render set/get " do
            @e.manual_render_set true
            @e.manual_render_get.should be_true
            @e.manual_render = false
            @e.manual_render?.should be_false
            @e.manual_render.should be_nil
        end
        #
        it "comp_sync set/get " do
            bool_check @e, 'comp_sync'
        end
        #
        it "ecore_evas_callback_resize " do
            cpt = 0
            cb = Proc.new do |ecore_evas|
                cpt+=1
            end
            @e.callback_resize_set cb
            @e.resize 60,90
            ecore_loop 3
            cpt.should >0
        end
        #
        it "ecore_evas_callback_move " do
            cpt = 0
            cb = Proc.new do |ecore_evas|
                cpt+=1
            end
            @e.callback_move_set cb
            @e.move 60,90
            ecore_loop 3
            cpt.should >0
        end
        #
        it "ecore_evas_callback_show " do
            cpt = 0
            cb = Proc.new do |ecore_evas|
                cpt+=1
            end
            @e.callback_show_set cb
            @e.show
            ecore_loop 3
            cpt.should >0
        end
        #
        it "ecore_evas_callback_hide " do
            cpt = 0
            cb = Proc.new do |ecore_evas|
                cpt+=1
            end
            @e.show
            ecore_loop 3
            @e.callback_hide_set cb
            @e.hide
            ecore_loop 3
            cpt.should >0
        end
        #
    end
end
