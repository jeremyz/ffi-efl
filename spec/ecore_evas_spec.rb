#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina_list'
require 'efl/evas'
require 'efl/ecore'
require 'efl/ecore_evas'
#
def ecore_loop n
    n.downto(0) do
        sleep 0.1
        Efl::Ecore.main_loop_iterate
    end
end
#
describe Efl::EcoreEvas do
    #
    before(:all) do
        EcoreEvas = Efl::EcoreEvas
        EcoreEvas.init
    end
    after(:all) do
        EcoreEvas.shutdown
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
    it "should work" do
        EcoreEvas.engines_free EcoreEvas.engines_get
        l = EcoreEvas.engines_list
        r = l.inject("\t") do |s,e| s+=e.read_string+' ' end
        puts r
        EcoreEvas.engines_free l
    end
    #
    it "ecore_evas_list should work" do
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
        before(:all) {
            EcoreEvas.init
        }
        before(:each) do
            @e = EcoreEvas::REcoreEvas.new :engine_name=>"software_x11", :x=>10, :y=>10, :w=>100, :h=>120
            @canvas = @e.evas
            @bg = @canvas.object_add(:rectangle) { |o|
                o.color = 100, 100, 255, 255
                o.size = @e.size
            }
            @bg.show
            @e.object_associate @bg, :ecore_evas_object_associate_base
            @e.move 10, 10
            @e.show
        end
        after(:each) do
            @e.free
        end
        after(:all) do
            EcoreEvas.shutdown
        end
        #
        it "engine_name_get should work" do
            @e.engine_name_get.should == "software_x11"
        end
        #
        it "data get/set should work" do
            @e.data_set 'key', '666'
            @e.data_get('key').read_string.should == '666'
        end
        #
        it "move, resize move_resize and geometry_get should work (and check association)" do
            @e.geometry_get.should == [10,10,100,120]
            @bg.geometry_get.should == [0,0,100,120]
            @e.move 20, 17  # w+23 window bar height
            ecore_loop 3
            @e.geometry_get.should == [20,40,100,120]
            @bg.geometry_get.should == [0,0,100,120]
            @e.resize 200,150
            ecore_loop 3
            @e.geometry_get.should == [20,40,200,150]
            @bg.geometry_get.should == [0,0,200,150]
            @e.move_resize 10, 0, 130, 100
            ecore_loop 3
            @e.geometry_get.should == [10,23,130,100]
            @bg.geometry_get.should == [0,0,130,100]
            g = @e.geometry_get
        end
        #
        it "rotation should work" do
            @e.rotation_set 25
            @e.rotation_get.should == 25
            @e.rotation_set 50
            @e.rotation_get.should == 50
        end
        #
        it "shaped get/set should work" do
            @e.shaped?.should be_false
            @e.shaped_set true
            @e.shaped_get.should be_true
            @e.shaped = false
            @e.shaped?.should be_false
        end
        #
        it "alpha get/set should work" do
            @e.alpha?.should be_false
            @e.alpha_set true
            @e.alpha_get.should be_true
            @e.alpha = false
            @e.alpha?.should be_false
        end
        #
        it "transparent get/set should work" do
            @e.transparent?.should be_false
            @e.transparent_set true
            @e.transparent_get.should be_true
            @e.transparent = false
            @e.transparent?.should be_false
        end
        #
        it "show hide visibility should work" do
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
        it "raise lower activate should work" do
            @e.raise
            @e.lower
            @e.activate
        end
        #
        it "title set/get should work" do
            @e.title_set "title"
            @e.title_get.should == "title"
            @e.title = "other"
            @e.title_get.should == "other"
        end
        #
        #
        it "name_class set/get should work" do
            @e.name_class_set "name", "class"
            @e.name_class_get.should == ['name','class']
            @e.name_class = "name1", "class1"
            @e.name_class_get.should == ['name1','class1']
        end
        #
        it "size_min set/get should work" do
            @e.size_min_set 20, 30
            @e.size_min_get.should == [20, 30]
        end
        #
        it "size_max set/get should work" do
            @e.size_max_set 20, 30
            @e.size_max_get.should == [20, 30]
        end
        #
        it "size_base set/get should work" do
            @e.size_base_set 20, 30
            @e.size_base_get.should == [20, 30]
        end
        #
        it "size_step set/get should work" do
            @e.size_step_set 20, 30
            @e.size_step_get.should == [20, 30]
        end
        #
        it "layer set/get should work" do
            @e.layer_set 2
            @e.layer_get.should == 2
            @e.layer = 1
            @e.layer?.should == 1
        end
        #
        it "focus set/get should work" do
            @e.focus?.should be_false
            @e.focus_set true
            ecore_loop 3
            @e.focus_get.should be_true
            @e.focus?.should be_true
        end
        #
        it "iconified set/get should work" do
            @e.iconified_set true
            @e.iconified_get.should be_true
            @e.iconified = false
            @e.iconified?.should be_false
        end
        #
        it "borderless set/get should work" do
            @e.borderless_set true
            @e.borderless_get.should be_true
            @e.borderless = false
            @e.borderless?.should be_false
        end
        #
        it "override set/get should work" do
            @e.override_set true
            @e.override_get.should be_true
            @e.override = false
            @e.override?.should be_false
        end
        #
        # FIXME maximized
        # ecore/src/lib/ecore_evas/ecore_evas.c => ecore_evas_maximized_set => IFC => return
#        it "maximized set/get should work" do
#            @e.maximized?.should be_false
#            @e.maximized_set true
#            ecore_loop 10
#            @e.maximized_get.should be_true
#            @e.maximized = false
#            ecore_loop 3
#            @e.maximized?.should be_false
#        end
        #
        it "fullscreen set/get should work" do
            @e.fullscreen_set true
            ecore_loop 3
            @e.fullscreen_get.should be_true
            @e.fullscreen = false
            ecore_loop 3
            @e.fullscreen?.should be_false
        end
        #
        it "avoid_damage set/get should work" do
            @e.avoid_damage_set :ecore_evas_avoid_damage_expose
            ecore_loop 3
            @e.avoid_damage_get.should == :ecore_evas_avoid_damage_expose
            @e.avoid_damage = :ecore_evas_avoid_damage_built_in
            ecore_loop 3
            @e.avoid_damage?.should == :ecore_evas_avoid_damage_built_in
        end
        #
        it "withdrawn set/get should work" do
            @e.withdrawn_set true
            @e.withdrawn_get.should be_true
            @e.withdrawn = false
            @e.withdrawn?.should be_false
        end
        #
        it "sticky set/get should work" do
            @e.sticky_set true
            ecore_loop 3
            @e.sticky_get.should be_true
            @e.sticky = false
            ecore_loop 3
            @e.sticky?.should be_false
        end
        #
        it "ignore_events set/get should work" do
            @e.ignore_events_set true
            @e.ignore_events_get.should be_true
            @e.ignore_events = false
            @e.ignore_events?.should be_false
        end
        #
        # TODO ecore_evas_callback_*
    end
end
