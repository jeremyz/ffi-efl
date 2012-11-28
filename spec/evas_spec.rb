#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/evas'
require './spec/helper'
#
describe "Efl::Evas #{Efl::Evas.version.full}" do
    #
    before(:all) do
        Evas = Efl::Evas
        Native = Efl::Native unless Kernel.const_defined? 'Native'
        @init = Evas.init
    end
    after(:all) do
        Evas.shutdown.should == 0
    end
    #
    it "should init" do
        Evas.init.should == @init+1
        Evas.init.should == @init+2
        Evas.init.should == @init+3
    end
    #
    it "should shutdown" do
        Evas.shutdown.should == @init+2
        Evas.shutdown.should == @init+1
        Evas.shutdown.should == @init
    end
    #
    it "enum evas_bidi_direction should be correct" do
        Efl::Native.enum_value(:evas_bidi_direction_natural).should == 0
        Efl::Native.enum_value(:evas_bidi_direction_neutral).should == 0
        Efl::Native.enum_value(:evas_bidi_direction_ltr).should == 1
        Efl::Native.enum_value(:evas_bidi_direction_rtl).should == 2
    end
    #
    it "evas alloc error enum is ok" do
        Native.enum_value(:evas_alloc_error_none).should == 0
        Native.enum_value(:evas_alloc_error_fatal).should == 1
        Native.enum_value(:evas_alloc_error_recovered).should == 2
        Native.enum_type(:evas_alloc_error)[0].should == :evas_alloc_error_none
        Native.enum_type(:evas_alloc_error)[1].should == :evas_alloc_error_fatal
        Native.enum_type(:evas_alloc_error)[2].should == :evas_alloc_error_recovered
        Native.enum_type(:evas_alloc_error)[:evas_alloc_error_none].should == 0
        Native.enum_type(:evas_alloc_error)[:evas_alloc_error_fatal].should == 1
        Native.enum_type(:evas_alloc_error)[:evas_alloc_error_recovered].should == 2
    end
    #
    it "should have no memory allocation error occured" do
        Evas.alloc_error.should == :evas_alloc_error_none
    end
    #
    it "should process async events" do
        cb = Proc.new do |target,type,evt|
            target.read_string.should == "target"
            type.should == :evas_callback_show
            evt.read_string.should == "work"
        end
        target = FFI::MemoryPointer.from_string("target")
        work = FFI::MemoryPointer.from_string("work")
        Evas.async_events_put target, :evas_callback_show, work, cb
        Evas.async_events_process.should == 1
        Evas.async_events_process.should == 0
    end
    #
    describe 'Efl::Evas::REvas' do
        before(:all) do
            realize_evas
        end
        after(:all) do
            @e.free
            @pixels.free
        end
        #
        it "should be able to create and destroy evas" do
            e1 = Evas::REvas.new do
                address.should_not == 0
            end
            e2 = Evas::REvas.new e1.to_ptr
            e1.address.should == e2.address
            (e1==e2).should be_false
            (e1===e2).should be_true
            e1.free
            e1.free
            e1.to_ptr.should be_nil
            e2.to_ptr.should_not be_nil # it's a reference to a freed object, no good!
            e4 = Evas::REvas.new Native.evas_new
            e4.address.should_not == 0
            e5 = e4.dup
            e4.address.should == e5.address
            e6 = e4.clone
            e4.address.should == e6.address
            e4.free
            e4.to_ptr.should be_nil
        end
        #
        it "focus " do
            Native.evas_focus_in @e.to_ptr
            Native.evas_focus_state_get(@e.to_ptr).should be_true
            Native.evas_focus_out @e.to_ptr
            Native.evas_focus_state_get(@e.to_ptr).should be_false
            Evas.focus_in @e.to_ptr
            Evas.focus_state_get(@e.to_ptr).should be_true
            Evas.focus_out @e.to_ptr
            Evas.focus_state_get(@e.to_ptr).should be_false
            @e.focus_in { |r| r.should be_nil }
            @e.focus_state.should be_true
            @e.focus_state_get { |r| r.should be_true }
            @e.focus_out.should be_nil
            @e.focus_state_get.should be_false
            @e.focus_state { |r| r.should be_false }
        end
        #
        it "nochange " do
            @e.nochange_push
            @e.nochange_pop
        end
        #
        it "attach data " do
            data = FFI::MemoryPointer.from_string "my data"
            @e.data_attach_set data
            @e.data_attach.read_string.should == "my data"
            @e.data_attach_get.read_string.should == "my data"
        end
        #
        it "should not crash" do
            @e.damage_rectangle_add 1, 2, 3, 4
            @e.obscured_rectangle_add 1, 2, 3, 4
            @e.obscured_clear
            list = @e.render_updates
            Evas.render_updates_free list
            @e.render
            @e.norender
            @e.render_idle_flush
            @e.render_dump
        end
        #
        it "output method " do
            @e.output_method.should == Evas::render_method_lookup("buffer")
            @e.output_method_get.should == Evas::render_method_lookup("buffer")
            # output_method_set tested in before(:all)
            l = Efl::Evas.render_method_list
            Evas::render_method_list_free l
        end
        #
        it "engine info " do
            # engine_info_get and engine_info_set tested in before(:all)
            true.should be_true
        end
        #
        it "output size " do
            @e.output_size_set 69, 666
            @e.size.should == [69,666]
            @e.output_size.should == [69,666]
            @e.output_size_get.should == [69,666]
            @e.output_size = 666, 69
            @e.size == [666,69]
        end
        #
        it "output viewport " do
            @e.output_viewport_set 0, 0, 666, 69
            @e.viewport.should == [0,0,666,69]
            @e.output_viewport.should == [0,0,666,69]
            @e.output_viewport_get.should == [0,0,666,69]
            @e.output_viewport =  0, 0, 69, 666
            @e.viewport.should == [0,0,69,666]
        end
        #
        it "coordinates evas<=>world " do
            @e.output_viewport_set 0, 0, 800, 600
            x = @e.coord_screen_x_to_world 666
            r = @e.coord_world_x_to_screen x
            r.should <= 668
            r.should >= 664
            y = @e.coord_screen_y_to_world 69
            r = @e.coord_world_y_to_screen y
            r.should <= 71
            r.should >= 67
        end
        #
        it "freeze and thaw " do
            @e.event_freeze?.should == 0
            @e.event_freeze
            @e.event_freeze?.should == 1
            @e.event_thaw
            @e.event_freeze_get.should == 0
        end
        #
        it "up/down mouse event " do
            @e.event_feed_mouse_down 2, :evas_button_double_click, Time.now.to_i, FFI::Pointer::NULL
            @e.pointer_button_down_mask.should == 2
            @e.event_feed_mouse_up 2, :evas_button_double_click, Time.now.to_i, FFI::Pointer::NULL
            @e.pointer_button_down_mask_get.should == 0
        end
        #
        it "move mouse event " do
            @e.pointer_output.should == [0,0]
            @e.pointer_output_xy_get.should == [0,0]
            @e.pointer_canvas.should == [0,0]
            @e.pointer_canvas_xy_get.should == [0,0]
            @e.event_feed_mouse_move 6, 6, Time.now.to_i, FFI::Pointer::NULL
            @e.pointer_output.should == [6,6]
            @e.pointer_output_xy_get.should == [6,6]
            @e.pointer_canvas.should == [6,6]
            @e.pointer_canvas_xy_get.should == [6,6]
        end
        #
        it "in/out mouse event " do
            @e.pointer_inside_get.should be_false
            @e.event_feed_mouse_in Time.now.to_i, FFI::Pointer::NULL
            @e.pointer_inside.should be_true
            @e.event_feed_mouse_out Time.now.to_i, FFI::Pointer::NULL
            @e.pointer_inside.should be_false
        end
        #
        it "add/del event callback " do
            @cb = false
            kd_cb = Proc.new do |data, e, obj, event_info|
                data.read_string.should eq "mouse_in"
                e.address.should == @e.address
                obj.address.should == @bg.address
                @db=true
                true
            end
            kd_d = FFI::MemoryPointer.from_string "mouse_in"
            @bg = @e.object_rectangle_add
            @bg.move 0, 0
            @bg.resize 20, 20
            @bg.show
            @bg.event_callback_add :evas_callback_mouse_in, kd_cb, kd_d
            @e.event_feed_mouse_in Time.now.to_i, FFI::Pointer::NULL
            @bg.event_callback_del(:evas_callback_mouse_in, kd_cb).address.should == kd_d.address
            @db.should be_true
            @bg.free
        end
        #
        it "image cache functions " do
            @e.image_cache_flush
            @e.image_cache_reload
            @e.image_cache_set 666
            @e.image_cache.should == 666
            @e.image_cache_get.should == 666
        end
        #
        it "font functions " do
            @e.font_hinting_set :evas_font_hinting_bytecode
            @e.font_hinting.should == :evas_font_hinting_bytecode
            @e.font_hinting_get.should == :evas_font_hinting_bytecode
            @e.font_hinting_can_hint(:evas_font_hinting_none).should be_true
            @e.font_cache_flush
            @e.font_cache_set 666
            @e.font_cache.should == 666
            @e.font_cache_get.should == 666
            l = @e.font_available_list
            @e.font_available_list_free l
            @e.font_path_clear
            a = ['/tmp1','/tmp2']
            @e.font_path_append a[1]
            @e.font_path_prepend a[0]
            require 'efl/eina_list'
            Efl::EinaList::REinaList.new(@e.font_path_list).each_with_index do |p,i|
                p.read_string.should == a[i]
            end
        end
        #
        it "focus " do
            @e.focus.should == FFI::Pointer::NULL
            @e.focus_get.should == FFI::Pointer::NULL
            @o = @e.object_rectangle_add { |o|
                o.color = 200,200,200,200
                o.move 0, 0
                o.resize 100, 100
                o.show
            }
            @o.focus = true
            @e.focus.should == @o.to_ptr
            @e.focus_get.should == @o.to_ptr
            @o.free
        end
        #
        it "object_name_find " do
            @e.object_name_find("name").should == FFI::Pointer::NULL
            @o = @e.object_rectangle_add
            @o.name="name"
            @e.object_name_find("name").should == @o.to_ptr
            @o.free
        end
        #
    end
    #
    describe 'Efl::Evas::REvasObject' do
        #
        before(:all) do
            realize_evas
            @o = @e.object_rectangle_add { |o|
                o.color = 200,200,200,200
                o.move 0, 0
                o.resize 100, 100
                o.show
            }
        end
        after(:all) do
            @e.free
            @pixels.free
        end
        #
        it "clipper " do
            clipper = @e.object_rectangle_add
            clipper.color = 255,255,255,255
            clipper.move 25, 25
            clipper.resize 50, 50
            @o.clip = clipper.to_ptr
            clipper.show
            @o.clip.address.should == clipper.address
            require 'efl/eina_list'
            Efl::EinaList::REinaList.new(clipper.clipees_get).to_ary[0].address.should == @o.address
            @o.clip_unset
            @o.clip_get.address.should == 0

        end
        #
        it "focus functions " do
            @o.focus.should be_false
            @o.focus_set true
            @o.focus_get.should be_true
            @o.focus = false
            @o.focus_get.should be_false
        end
        #
        it "layer functions " do
            @o.layer.should == 0
            @o.layer_set 2
            @o.layer_get.should == 2
            @o.layer = 0
            @o.layer_get.should == 0
        end
        #
        it "name functions " do
            @o.name_set "My name"
            @o.evas_name.should == "My name"
            @o.name_get.should == "My name"
        end
        #
        it "geometry functions " do
            @o.geometry.should == [0,0,100,100]
            @o.resize 50,50
            @o.geometry.should == [0,0,50,50]
            @o.move 10, 10
            @o.geometry_get.should == [10,10,50,50]
        end
        #
        it "center " do
            @o.geometry.should == [10,10,50,50]
            @o.center_get.should == [35,35]
            @o.center.should == [35,35]
            @o.center_set 50, 50
            @o.center.should == [50,50]
            @o.geometry.should == [25,25,50,50]
        end
        #
        it "show hide visible " do
            @o.show
            @o.visible?.should be_true
            @o.hide
            @o.visible.should be_false
            @o.visible_get.should be_false
            @o.show
            @o.visible?.should be_true
        end
        #
        it "color get/set " do
            @o.color.should == [200,200,200,200]
            @o.color_get.should == [200,200,200,200]
            @o.color_set 0,50,100,200
            @o.color.should == [0,50,100,200]
            @o.color = 200,200,200,200
            @o.color.should == [200,200,200,200]
        end
        #
        it "evas_get should worl" do
            @o.evas.should === @e
            @o.evas_get.should === @e
        end
        #
        it "type_get " do
            @o.evas_type.should == 'rectangle'
            @o.type_get.should == 'rectangle'
        end
        # TODO raise, lower
        it "raise, lower, stck_below, stack_above " do
            os = []
            0.upto(3) do
                os << @e.object_rectangle_add
            end
            os[2].above.should === os[3]
            os[2].below.should === os[1]
            os[2].above.should === os[3]
            os[2].below.should === os[1]
            os[2].stack_below os[1]
            os[2].above_get.should === os[1]
            os[2].below_get.should === os[0]
            os[2].stack_above os[1]
            os[2].above.should === os[3]
            os[2].below.should === os[1]
            os.each do |o| o.free; end
        end
        #
        it "event_callback " do
            @o.move 0, 0 # FIXME why do I need this ?!?
            count = 0
            cb = Proc.new do |data,evas,evas_object,event_info|
                count +=1
            end
            cb_data = FFI::MemoryPointer.from_string "my cb data"
            @o.event_callback_add :evas_callback_mouse_in, cb, @o
            Efl::Evas.event_feed_mouse_in @o.evas, Time.now.to_i, cb_data
            sleep 0.1
            count.should==1
        end
        #
        it "pass events " do
            @o.pass_events.should be_false
            @o.pass_events_set true
            @o.pass_events.should be_true
            @o.pass_events=false
            @o.pass_events.should be_false
            @o.pass_events_set true
            @o.pass_events.should be_true
            @o.pass_events=false
            @o.pass_events_get.should be_false
        end
        #
        it "repeat events " do
            @o.repeat_events.should be_false
            @o.repeat_events_set true
            @o.repeat_events.should be_true
            @o.repeat_events=false
            @o.repeat_events.should be_false
            @o.repeat_events_set true
            @o.repeat_events.should be_true
            @o.repeat_events=false
            @o.repeat_events_get.should be_false
        end
        #
        it "propagate event " do
            @o.propagate_events.should be_true
            @o.propagate_events=false
            @o.propagate_events.should be_false
            @o.propagate_events_set true
            @o.propagate_events.should be_true
            @o.propagate_events=false
            @o.propagate_events.should be_false
            @o.propagate_events_set true
            @o.propagate_events_get.should be_true
        end
        #
        it "map enable " do
            @o.map_enable.should be_false
            @o.map_enable_set true
            @o.map_enable.should be_true
            @o.map_enable=false
            @o.map_enable.should be_false
            @o.map_enable_set true
            @o.map_enable.should be_true
            @o.map_enable=false
            @o.map_enable_get.should be_false
        end
        #
        it "size_hint_ " do
            @o.size_hint_min_set 100, 150
            @o.size_hint_min.should == [100,150]
            @o.size_hint_min_get.should == [100,150]
            @o.size_hint_max_set 300, 350
            @o.size_hint_max.should == [300,350]
            @o.size_hint_max_get.should == [300,350]
            @o.size_hint_request_set 400, 450
            @o.size_hint_request.should == [400,450]
            @o.size_hint_request_get.should == [400,450]
            @o.size_hint_aspect_set :evas_aspect_control_both, 400, 450
            @o.size_hint_aspect.should == [:evas_aspect_control_both,400,450]
            @o.size_hint_aspect_get.should == [:evas_aspect_control_both,400,450]
            @o.size_hint_align_set 0.2, 0.5
            @o.size_hint_align.should == [0.2,0.5]
            @o.size_hint_align_get.should == [0.2,0.5]
            @o.size_hint_weight_set 0.3, 0.6
            @o.size_hint_weight.should == [0.3,0.6]
            @o.size_hint_weight_get.should == [0.3,0.6]
            @o.size_hint_padding_set 10, 20, 30, 40
            @o.size_hint_padding.should == [10,20,30,40]
            @o.size_hint_padding_get.should == [10,20,30,40]
        end
        #
        it "data get/set " do
            @o.data_set "key", "val"
            @o.data("key").should == "val"
            @o.data_get("key").should == "val"
            @o.data_del("key")
            @o.data_get("key").should == nil
        end
        #
        it "pointer mode get/set " do
            @o.pointer_mode = :evas_object_pointer_mode_nograb
            @o.pointer_mode.should == :evas_object_pointer_mode_nograb
            @o.pointer_mode_get.should == :evas_object_pointer_mode_nograb
            @o.pointer_mode = :evas_object_pointer_mode_autograb
            @o.pointer_mode.should == :evas_object_pointer_mode_autograb
            @o.pointer_mode_get.should == :evas_object_pointer_mode_autograb
        end
        #
        it "anti_alias get/set " do
            @o.anti_alias_set true
            @o.anti_alias_get.should be_true
            @o.anti_alias=false
            @o.anti_alias.should be_false
            @o.anti_alias_get.should be_false
        end
        #
        it "scale set/get " do
            @o.scale_set 1.5
            @o.scale_get.should == 1.5
            @o.scale= 1.6
            @o.scale.should == 1.6
        end
        #
        it "render op get/set" do
            @o.render_op_set :evas_render_copy
            @o.render_op_get.should == :evas_render_copy
            @o.render_op = :evas_render_mask
            @o.render_op.should == :evas_render_mask
        end
        #
        it "precise_is_inside get/set " do
            @o.precise_is_inside_set true
            @o.precise_is_inside?.should be_true
            @o.precise_is_inside_get.should be_true
            @o.precise_is_inside=false
            @o.precise_is_inside?.should be_false
            @o.precise_is_inside.should be_false
        end
        #
        it "static_clip get/set " do
            @o.static_clip_set true
            @o.static_clip?.should be_true
            @o.static_clip_get.should be_true
            @o.static_clip=false
            @o.static_clip?.should be_false
            @o.static_clip.should be_false
        end
        #
    end
    #
    describe 'Efl::Evas::REvasLine' do
        #
        before(:all) do
            realize_evas
            @l = @e.object_line_add
        end
        after(:all) do
            @l.free
            @e.free
        end
        it "xy get/set " do
            @l.line_xy_set 10, 20, 30, 40
            @l.line_xy_get.should == [10, 20, 30, 40]
        end
    end
    #
    describe 'Efl::Evas::REvasPolygon' do
        #
        before(:all) do
            realize_evas
            @p = @e.object_polygon_add
        end
        after(:all) do
            @p.free
            @e.free
        end
        it "xy point_add " do
            @p.point_add 10, 20
            @p.point_add 30, 40
            @p.<< 50, 60
            @p.<< 80, 80
        end
        #
        it "point clear" do
            @p.points_clear
        end
    end
    #
    describe 'Efl::Evas::REvasText' do
        #
        before(:all) do
            realize_evas
            @t = @e.object_text_add
        end
        after(:all) do
            @t.free
            @e.free
        end
        #
        it "font_source get/set " do
            @t.font_source_set "myFont"
            @t.font_source_get.should == "myFont"
            @t.font_source = "myFont2"
            @t.font_source.should == "myFont2"
        end
        #
        it "font get/set " do
            @t.font_set "Arial", 12
            @t.font_get.should == ["Arial",12]
            @t.font =  "Ariall", 16
            @t.font_get.should == ["Ariall",16]
        end
        #
        it "text set/get " do
            @t.text_set "hello"
            @t.text_get.should == "hello"
            @t.text="hello world"
            @t.text.should == "hello world"
        end
        #
        it "test different accessors" do
            @t.ascent_get.should > 0
            @t.descent_get.should > 0
            @t.max_ascent_get.should > 0
            @t.max_descent_get.should > 0
            @t.horiz_advance_get.should > 0
            @t.vert_advance_get.should > 0
            @t.inset_get.should > 0
            @t.direction_get.should == :evas_bidi_direction_ltr
            @t.style_pad_get.length.should == 4
            @t.ascent.should > 0
            @t.descent.should > 0
            @t.max_ascent.should > 0
            @t.max_descent.should > 0
            @t.horiz_advance.should > 0
            @t.vert_advance.should > 0
            @t.inset.should > 0
            @t.direction.should == :evas_bidi_direction_ltr
            @t.style_pad.length.should == 4
        end
        #
        it "bidi_delimiters set/get " do
            @t.bidi_delimiters_set "@"
            @t.bidi_delimiters_get.should == "@"
            @t.bidi_delimiters= "#"
            @t.bidi_delimiters.should == "#"
        end
        #
        it "char_pos_get char_coords_get last_up_to_pos " do
            @t.text="hello world"
            coords = @t.char_pos_get 6
            @t.char_coords(coords[0], coords[1])[0].should == 6
            @t.char_coords_get(coords[0], coords[1])[0].should == 6
            coords = @t.char_pos_get 3
            @t.char_coords(coords[0], coords[1])[0].should == 3
            @t.char_coords_get(coords[0], coords[1])[0].should == 3
            @t.last_up_to_pos(coords[0], coords[1]).should == 3
        end
        #
        it "style ste/get " do
            @t.style_set :evas_text_style_shadow
            @t.style_get.should == :evas_text_style_shadow
            @t.style= :evas_text_style_outline
            @t.style.should == :evas_text_style_outline
        end
        #
        it "shadow_color set/get " do
            @t.shadow_color_set 100, 150, 200, 50
            @t.shadow_color_get.should == [100, 150, 200, 50]
            @t.shadow_color = 100, 150, 200, 50
            @t.shadow_color.should == [100, 150, 200, 50]
        end
        #
        it "glow_color set/get " do
            @t.glow_color_set 100, 150, 200, 50
            @t.glow_color_get.should == [100, 150, 200, 50]
            @t.glow_color = 100, 150, 200, 50
            @t.glow_color.should == [100, 150, 200, 50]
        end
        #
        it "glow2_color set/get " do
            @t.glow2_color_set 100, 150, 200, 50
            @t.glow2_color_get.should == [100, 150, 200, 50]
            @t.glow2_color = 100, 150, 200, 50
            @t.glow2_color.should == [100, 150, 200, 50]
        end
        #
        it "outline_color set/get " do
            @t.outline_color_set 100, 150, 200, 50
            @t.outline_color_get.should == [100, 150, 200, 50]
            @t.outline_color = 100, 150, 200, 50
            @t.outline_color.should == [100, 150, 200, 50]
        end
        #
    end
    #
    describe 'Efl::Evas::REvasBox' do
        #
        before(:all) do
            realize_evas
            @b = @e.object_box_add
            @os = []
            0.upto(4) do
                @os << @e.object_rectangle_add
            end
        end
        after(:all) do
            @b.free
            @e.free
        end
        #
        it "append, prepend, insert_before, insert_after, insert_at, remove, remove_at, remove_all  and children_get " do
            @b.append @os[4]
            @b.prepend @os[0]
            @b.insert_before @os[1], @os[4]
            @b.insert_after @os[2], @os[1]
            @b.insert_at @os[3], 3
            @b.children_get.each_with_index do |o,i|
                Evas::REvasRectangle.new(o).should === @os[i]
            end
            @os.delete_at 2
            @b.remove_at(2).should be_true
            @b.remove_at(20).should be_false
            o = @os.delete_at 2
            @b.remove(o).should be_true
            @b.children_get.each_with_index do |o,i|
                Evas::REvasRectangle.new(o).should === @os[i]
            end
            @b.remove_all true
            @b.children.to_a.length.should == 0
        end
        #
        it "align set/get " do
            @b.align_set 0.2, 0.3
            @b.align_get.should == [0.2,0.3]
            @b.align = 0.3, 0.2
            @b.align.should == [0.3,0.2]
        end
        #
        it "padding set/get " do
            @b.padding_set 20, 30
            @b.padding_get.should == [20,30]
            @b.padding = 30, 20
            @b.padding.should == [30,20]
        end
        #
    end
    #
end
