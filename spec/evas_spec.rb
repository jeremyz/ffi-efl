#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina_list'
require 'efl/ecore'
require 'efl/evas'
require './spec/helper'
#
describe Efl::Evas do
    #
    before(:all) {
        Evas = Efl::Evas
        Native = Efl::Native unless Kernel.const_defined? 'Native'
        Evas.init.should == 1
    }
    after(:all) {
        Evas.shutdown.should == 0
    }
    #
    it "should init" do
        Evas.init.should == 2
        Evas.init.should == 3
    end
    #
    it "should shutdown" do
        Evas.shutdown.should == 2
        Evas.shutdown.should == 1
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
    describe Efl::Evas::REvas do
        before(:all) do
            realize_evas
        end
        after(:all) do
            @e.free
            @pixels.free
        end
        #
        it "should be able to create and destroy evas" do
            e1 = Evas::REvas.new
            e1.address.should_not == 0
            e2 = Evas::REvas.new e1.to_ptr
            e1.address.should == e2.address
            (e1==e2).should be_false
            (e1===e2).should be_true
            e1.free
            e1.free
            e1.to_ptr.should be_nil
            e2.free
            e2.free
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
        # TODO evas_event_feed_*
        #   evas_event_feed_multi_down
        #   evas_event_feed_multi_up
        #   evas_event_feed_multi_move
        #   evas_event_feed_mouse_cancel
        #   evas_event_feed_mouse_wheel
        #   evas_event_feed_key_down
        #   evas_event_feed_key_up
        #   evas_event_feed_hold
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
        # TODO evas_object_top_at_xy_get, evas_object_top_at_pointer_get, evas_object_top_in_rectangle_get
        # TODO evas_objects_at_xy_get, evas_objects_in_rectangle_get, evas_object_bottom_get, evas_object_top_get
    end
    #
    describe Efl::Evas::REvasObject do
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
            @o.free
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
        it "sccale set/get " do
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
    describe Efl::Evas::REvasLine do
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
    describe Efl::Evas::REvasPolygon do
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
    describe Efl::Evas::REvasText do
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
    describe Efl::Evas::REvasBox do
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

        # EAPI void evas_object_box_smart_set (Evas_Object_Box_Api *api);
        # EAPI const Evas_Object_Box_Api *evas_object_box_smart_class_get (void);
        # EAPI void evas_object_box_layout_set (Evas_Object *o, Evas_Object_Box_Layout cb, const void *data, void (*free_data)(void *data));

        # EAPI void evas_object_box_layout_horizontal (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        # EAPI void evas_object_box_layout_vertical (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        # EAPI void evas_object_box_layout_homogeneous_vertical (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        # EAPI void evas_object_box_layout_homogeneous_horizontal (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        # EAPI void evas_object_box_layout_homogeneous_max_size_horizontal(Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        # EAPI void evas_object_box_layout_homogeneous_max_size_vertical (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        # EAPI void evas_object_box_layout_flow_horizontal (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        # EAPI void evas_object_box_layout_flow_vertical (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);
        # EAPI void evas_object_box_layout_stack (Evas_Object *o, Evas_Object_Box_Data *priv, void *data);

        # EAPI Eina_Iterator *evas_object_box_iterator_new (const Evas_Object *o);
        # EAPI Eina_Accessor *evas_object_box_accessor_new (const Evas_Object *o);

        # EAPI const char *evas_object_box_option_property_name_get (Evas_Object *o, int property);

        # EAPI int evas_object_box_option_property_id_get (Evas_Object *o, const char *name);
        # EAPI Eina_Bool evas_object_box_option_property_set (Evas_Object *o, Evas_Object_Box_Option *opt, int property, ...);
        # EAPI Eina_Bool evas_object_box_option_property_vset (Evas_Object *o, Evas_Object_Box_Option *opt, int property, va_list args);
        # EAPI Eina_Bool evas_object_box_option_property_get (Evas_Object *o, Evas_Object_Box_Option *opt, int property, ...);
        # EAPI Eina_Bool evas_object_box_option_property_vget (Evas_Object *o, Evas_Object_Box_Option *opt, int property, va_list args);
    end
    #
        # EAPI Evas_Object *evas_object_image_filled_add (Evas *e);
        # EAPI void evas_object_image_memfile_set (Evas_Object *obj, void *data, int size, char *format, char *key);
        # EAPI void evas_object_image_file_set (Evas_Object *obj, const char *file, const char *key);
        # EAPI void evas_object_image_file_get (const Evas_Object *obj, const char **file, const char **key);
        # EAPI void evas_object_image_border_set (Evas_Object *obj, int l, int r, int t, int b);
        # EAPI void evas_object_image_border_get (const Evas_Object *obj, int *l, int *r, int *t, int *b);
        # EAPI void evas_object_image_border_center_fill_set (Evas_Object *obj, Evas_Border_Fill_Mode fill);
        # EAPI Evas_Border_Fill_Mode evas_object_image_border_center_fill_get (const Evas_Object *obj);
        # EAPI void evas_object_image_filled_set (Evas_Object *obj, Eina_Bool setting);
        # EAPI Eina_Bool evas_object_image_filled_get (const Evas_Object *obj);
        # EAPI void evas_object_image_border_scale_set (Evas_Object *obj, double scale);
        # EAPI double evas_object_image_border_scale_get (const Evas_Object *obj);
        # EAPI void evas_object_image_fill_set (Evas_Object *obj, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h);
        # EAPI void evas_object_image_fill_get (const Evas_Object *obj, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        # EAPI void evas_object_image_fill_spread_set (Evas_Object *obj, Evas_Fill_Spread spread);
        # EAPI Evas_Fill_Spread evas_object_image_fill_spread_get (const Evas_Object *obj);
        # EAPI void evas_object_image_size_set (Evas_Object *obj, int w, int h);
        # EAPI void evas_object_image_size_get (const Evas_Object *obj, int *w, int *h);
        # EAPI int evas_object_image_stride_get (const Evas_Object *obj);
        # EAPI Evas_Load_Error evas_object_image_load_error_get (const Evas_Object *obj);
        # EAPI void evas_object_image_data_set (Evas_Object *obj, void *data);
        # EAPI void *evas_object_image_data_convert (Evas_Object *obj, Evas_Colorspace to_cspace);
        # EAPI void *evas_object_image_data_get (const Evas_Object *obj, Eina_Bool for_writing);
        # EAPI void evas_object_image_data_copy_set (Evas_Object *obj, void *data);
        # EAPI void evas_object_image_data_update_add (Evas_Object *obj, int x, int y, int w, int h);
        # EAPI void evas_object_image_alpha_set (Evas_Object *obj, Eina_Bool has_alpha);
        # EAPI Eina_Bool evas_object_image_alpha_get (const Evas_Object *obj);
        # EAPI void evas_object_image_smooth_scale_set (Evas_Object *obj, Eina_Bool smooth_scale);
        # EAPI Eina_Bool evas_object_image_smooth_scale_get (const Evas_Object *obj);
        # EAPI void evas_object_image_preload (Evas_Object *obj, Eina_Bool cancel);
        # EAPI void evas_object_image_reload (Evas_Object *obj);
        # EAPI Eina_Bool evas_object_image_save (const Evas_Object *obj, const char *file, const char *key, const char *flags);
        # EAPI Eina_Bool evas_object_image_pixels_import (Evas_Object *obj, Evas_Pixel_Import_Source *pixels);
        # EAPI void evas_object_image_pixels_get_callback_set(Evas_Object *obj, Evas_Object_Image_Pixels_Get_Cb func, void *data);
        # EAPI void evas_object_image_pixels_dirty_set (Evas_Object *obj, Eina_Bool dirty);
        # EAPI Eina_Bool evas_object_image_pixels_dirty_get (const Evas_Object *obj);
        # EAPI void evas_object_image_load_dpi_set (Evas_Object *obj, double dpi);
        # EAPI double evas_object_image_load_dpi_get (const Evas_Object *obj);
        # EAPI void evas_object_image_load_size_set (Evas_Object *obj, int w, int h);
        # EAPI void evas_object_image_load_size_get (const Evas_Object *obj, int *w, int *h);
        # EAPI void evas_object_image_load_scale_down_set (Evas_Object *obj, int scale_down);
        # EAPI int evas_object_image_load_scale_down_get (const Evas_Object *obj);
        # EAPI void evas_object_image_load_region_set (Evas_Object *obj, int x, int y, int w, int h);
        # EAPI void evas_object_image_load_region_get (const Evas_Object *obj, int *x, int *y, int *w, int *h);
        # EAPI void evas_object_image_colorspace_set (Evas_Object *obj, Evas_Colorspace cspace);
        # EAPI Evas_Colorspace evas_object_image_colorspace_get (const Evas_Object *obj);
        # EAPI void evas_object_image_native_surface_set (Evas_Object *obj, Evas_Native_Surface *surf);
        # EAPI Evas_Native_Surface *evas_object_image_native_surface_get (const Evas_Object *obj);
        # EAPI void evas_object_image_scale_hint_set (Evas_Object *obj, Evas_Image_Scale_Hint hint);
        # EAPI Evas_Image_Scale_Hint evas_object_image_scale_hint_get (const Evas_Object *obj);
        # EAPI void evas_object_image_content_hint_set (Evas_Object *obj, Evas_Image_Content_Hint hint);
        # EAPI Evas_Image_Content_Hint evas_object_image_content_hint_get (const Evas_Object *obj);
        # EAPI void evas_object_image_alpha_mask_set (Evas_Object *obj, Eina_Bool ismask);
        # EAPI Eina_Bool evas_object_image_source_set (Evas_Object *obj, Evas_Object *src);
        # EAPI Evas_Object *evas_object_image_source_get (Evas_Object *obj);
        # EAPI Eina_Bool evas_object_image_source_unset (Evas_Object *obj);
        # EAPI Evas_Object *evas_object_textblock_add(Evas *e);
        # EAPI const char *evas_textblock_escape_string_get(const char *escape);
        # EAPI const char *evas_textblock_string_escape_get(const char *string, int *len_ret);
        # EAPI const char *evas_textblock_escape_string_range_get(const char *escape_start, const char *escape_end);
        # EAPI Evas_Textblock_Style *evas_textblock_style_new(void);
        # EAPI void evas_textblock_style_free(Evas_Textblock_Style *ts);
        # EAPI void evas_textblock_style_set(Evas_Textblock_Style *ts, const char *text);
        # EAPI const char *evas_textblock_style_get(const Evas_Textblock_Style *ts);
        # EAPI void evas_object_textblock_style_set(Evas_Object *obj, Evas_Textblock_Style *ts);
        # EAPI const Evas_Textblock_Style *evas_object_textblock_style_get(const Evas_Object *obj);
        # EAPI void evas_object_textblock_replace_char_set(Evas_Object *obj, const char *ch);
        # EAPI const char *evas_object_textblock_replace_char_get(Evas_Object *obj);
        # EAPI void evas_object_textblock_valign_set(Evas_Object *obj, double align);
        # EAPI double evas_object_textblock_valign_get(const Evas_Object *obj);
        # EAPI void evas_object_textblock_bidi_delimiters_set(Evas_Object *obj, const char *delim);
        # EAPI const char *evas_object_textblock_bidi_delimiters_get(const Evas_Object *obj);
        # EAPI void evas_object_textblock_newline_mode_set(Evas_Object *obj, Eina_Bool mode);
        # EAPI Eina_Bool evas_object_textblock_newline_mode_get(const Evas_Object *obj);
        # EAPI void evas_object_textblock_text_markup_set(Evas_Object *obj, const char *text);
        # EAPI void evas_object_textblock_text_markup_prepend(Evas_Textblock_Cursor *cur, const char *text);
        # EAPI const char *evas_object_textblock_text_markup_get(const Evas_Object *obj);
        # EAPI const Evas_Textblock_Cursor *evas_object_textblock_cursor_get(const Evas_Object *obj);
        # EAPI Evas_Textblock_Cursor *evas_object_textblock_cursor_new(Evas_Object *obj);
        # EAPI void evas_textblock_cursor_free(Evas_Textblock_Cursor *cur);
        # EAPI void evas_textblock_cursor_paragraph_first(Evas_Textblock_Cursor *cur);
        # EAPI void evas_textblock_cursor_paragraph_last(Evas_Textblock_Cursor *cur);
        # EAPI Eina_Bool evas_textblock_cursor_paragraph_next(Evas_Textblock_Cursor *cur);
        # EAPI Eina_Bool evas_textblock_cursor_paragraph_prev(Evas_Textblock_Cursor *cur);
        # EAPI const Evas_Object_Textblock_Node_Format *evas_textblock_node_format_first_get(const Evas_Object *obj);
        # EAPI const Evas_Object_Textblock_Node_Format *evas_textblock_node_format_last_get(const Evas_Object *obj);
        # EAPI const Evas_Object_Textblock_Node_Format *evas_textblock_node_format_next_get(const Evas_Object_Textblock_Node_Format *n);
        # EAPI const Evas_Object_Textblock_Node_Format *evas_textblock_node_format_prev_get(const Evas_Object_Textblock_Node_Format *n);
        # EAPI void evas_textblock_node_format_remove_pair(Evas_Object *obj, Evas_Object_Textblock_Node_Format *n);
        # EAPI void evas_textblock_cursor_set_at_format(Evas_Textblock_Cursor *cur, const Evas_Object_Textblock_Node_Format *n);
        # EAPI const Evas_Object_Textblock_Node_Format *evas_textblock_cursor_format_get(const Evas_Textblock_Cursor *cur);
        # EAPI const char *evas_textblock_node_format_text_get(const Evas_Object_Textblock_Node_Format *cur);
        # EAPI void evas_textblock_cursor_at_format_set(Evas_Textblock_Cursor *cur, const Evas_Object_Textblock_Node_Format *fmt);
        # EAPI Eina_Bool evas_textblock_cursor_format_is_visible_get(const Evas_Textblock_Cursor *cur);
        # EAPI Eina_Bool evas_textblock_cursor_format_next(Evas_Textblock_Cursor *cur);
        # EAPI Eina_Bool evas_textblock_cursor_format_prev(Evas_Textblock_Cursor *cur);
        # EAPI Eina_Bool evas_textblock_cursor_is_format(const Evas_Textblock_Cursor *cur);
        # EAPI Eina_Bool evas_textblock_cursor_char_next(Evas_Textblock_Cursor *cur);
        # EAPI Eina_Bool evas_textblock_cursor_char_prev(Evas_Textblock_Cursor *cur);
        # EAPI void evas_textblock_cursor_paragraph_char_first(Evas_Textblock_Cursor *cur);
        # EAPI void evas_textblock_cursor_paragraph_char_last(Evas_Textblock_Cursor *cur);
        # EAPI void evas_textblock_cursor_line_char_first(Evas_Textblock_Cursor *cur);
        # EAPI void evas_textblock_cursor_line_char_last(Evas_Textblock_Cursor *cur);
        # EAPI int evas_textblock_cursor_pos_get(const Evas_Textblock_Cursor *cur);
        # EAPI void evas_textblock_cursor_pos_set(Evas_Textblock_Cursor *cur, int pos);
        # EAPI Eina_Bool evas_textblock_cursor_line_set(Evas_Textblock_Cursor *cur, int line);
        # EAPI int evas_textblock_cursor_compare(const Evas_Textblock_Cursor *cur1, const Evas_Textblock_Cursor *cur2);
        # EAPI void evas_textblock_cursor_copy(const Evas_Textblock_Cursor *cur, Evas_Textblock_Cursor *cur_dest);
        # EAPI int evas_textblock_cursor_text_append(Evas_Textblock_Cursor *cur, const char *text);
        # EAPI int evas_textblock_cursor_text_prepend(Evas_Textblock_Cursor *cur, const char *text);
        # EAPI Eina_Bool evas_textblock_cursor_format_append(Evas_Textblock_Cursor *cur, const char *format);
        # EAPI Eina_Bool evas_textblock_cursor_format_prepend(Evas_Textblock_Cursor *cur, const char *format);
        # EAPI void evas_textblock_cursor_char_delete(Evas_Textblock_Cursor *cur);
        # EAPI void evas_textblock_cursor_range_delete(Evas_Textblock_Cursor *cur1, Evas_Textblock_Cursor *cur2);
        # EAPI const char *evas_textblock_cursor_paragraph_text_get(const Evas_Textblock_Cursor *cur);
        # EAPI int evas_textblock_cursor_paragraph_text_length_get(const Evas_Textblock_Cursor *cur);
        # EAPI char *evas_textblock_cursor_range_text_get(const Evas_Textblock_Cursor *cur1, const Evas_Textblock_Cursor *cur2, Evas_Textblock_Text_Type format);
        # EAPI char *evas_textblock_cursor_content_get(const Evas_Textblock_Cursor *cur);
        # EAPI int evas_textblock_cursor_geometry_get(const Evas_Textblock_Cursor *cur, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch, Evas_BiDi_Direction *dir, Evas_Textblock_Cursor_Type ctype);
        # EAPI int evas_textblock_cursor_char_geometry_get(const Evas_Textblock_Cursor *cur, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch);
        # EAPI int evas_textblock_cursor_pen_geometry_get(const Evas_Textblock_Cursor *cur, Evas_Coord *cpen_x, Evas_Coord *cy, Evas_Coord *cadv, Evas_Coord *ch);
        # EAPI int evas_textblock_cursor_line_geometry_get(const Evas_Textblock_Cursor *cur, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch);
        # EAPI Eina_Bool evas_textblock_cursor_char_coord_set(Evas_Textblock_Cursor *cur, Evas_Coord x, Evas_Coord y);
        # EAPI int evas_textblock_cursor_line_coord_set(Evas_Textblock_Cursor *cur, Evas_Coord y);
        # EAPI Eina_List *evas_textblock_cursor_range_geometry_get(const Evas_Textblock_Cursor *cur1, const Evas_Textblock_Cursor *cur2);
        # EAPI Eina_Bool evas_textblock_cursor_format_item_geometry_get(const Evas_Textblock_Cursor *cur, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch);
        # EAPI Eina_Bool evas_textblock_cursor_eol_get(const Evas_Textblock_Cursor *cur);
        # EAPI Eina_Bool evas_object_textblock_line_number_geometry_get(const Evas_Object *obj, int line, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch);
        # EAPI void evas_object_textblock_clear(Evas_Object *obj);
        # EAPI void evas_object_textblock_size_formatted_get(const Evas_Object *obj, Evas_Coord *w, Evas_Coord *h);
        # EAPI void evas_object_textblock_size_native_get(const Evas_Object *obj, Evas_Coord *w, Evas_Coord *h);
        # EAPI void evas_object_textblock_style_insets_get(const Evas_Object *obj, Evas_Coord *l, Evas_Coord *r, Evas_Coord *t, Evas_Coord *b);
        # EAPI void evas_smart_free (Evas_Smart *s);
        # EAPI Evas_Smart *evas_smart_class_new (const Evas_Smart_Class *sc);
        # EAPI const Evas_Smart_Class *evas_smart_class_get (const Evas_Smart *s);
        # EAPI void *evas_smart_data_get (const Evas_Smart *s);
        # EAPI const Evas_Smart_Cb_Description **evas_smart_callbacks_descriptions_get(const Evas_Smart *s, unsigned int *count);
        # EAPI const Evas_Smart_Cb_Description *evas_smart_callback_description_find(const Evas_Smart *s, const char *name);
        # EAPI Eina_Bool evas_smart_class_inherit_full (Evas_Smart_Class *sc, const Evas_Smart_Class *parent_sc, unsigned int parent_sc_size);
        # EAPI Evas_Object *evas_object_smart_add (Evas *e, Evas_Smart *s);
        # EAPI void evas_object_smart_member_add (Evas_Object *obj, Evas_Object *smart_obj);
        # EAPI void evas_object_smart_member_del (Evas_Object *obj);
        # EAPI Evas_Object *evas_object_smart_parent_get (const Evas_Object *obj);
        # EAPI Eina_Bool evas_object_smart_type_check (const Evas_Object *obj, const char *type);
        # EAPI Eina_Bool evas_object_smart_type_check_ptr (const Evas_Object *obj, const char *type);
        # EAPI Eina_List *evas_object_smart_members_get (const Evas_Object *obj);
        # EAPI Evas_Smart *evas_object_smart_smart_get (const Evas_Object *obj);
        # EAPI void *evas_object_smart_data_get (const Evas_Object *obj);
        # EAPI void evas_object_smart_data_set (Evas_Object *obj, void *data);
        # EAPI void evas_object_smart_callback_add (Evas_Object *obj, const char *event, Evas_Smart_Cb func, const void *data);
        # EAPI void *evas_object_smart_callback_del (Evas_Object *obj, const char *event, Evas_Smart_Cb func);
        # EAPI void evas_object_smart_callback_call (Evas_Object *obj, const char *event, void *event_info);
        # EAPI Eina_Bool evas_object_smart_callbacks_descriptions_set(Evas_Object *obj, const Evas_Smart_Cb_Description *descriptions);
        # EAPI void evas_object_smart_callbacks_descriptions_get(const Evas_Object *obj, const Evas_Smart_Cb_Description ***class_descriptions, unsigned int *class_count, const Evas_Smart_Cb_Description ***instance_descriptions, unsigned int *instance_count);
        # EAPI void evas_object_smart_callback_description_find(const Evas_Object *obj, const char *name, const Evas_Smart_Cb_Description **class_description, const Evas_Smart_Cb_Description **instance_description);
        # EAPI void evas_object_smart_changed (Evas_Object *obj);
        # EAPI void evas_object_smart_need_recalculate_set(Evas_Object *obj, Eina_Bool value);
        # EAPI Eina_Bool evas_object_smart_need_recalculate_get(const Evas_Object *obj);
        # EAPI void evas_object_smart_calculate (Evas_Object *obj);
        # EAPI void evas_smart_objects_calculate (Evas *e);
        # EAPI Evas_Object *evas_object_smart_clipped_clipper_get (Evas_Object *obj);
        # EAPI void evas_object_smart_clipped_smart_set (Evas_Smart_Class *sc);
        # EAPI const Evas_Smart_Class *evas_object_smart_clipped_class_get (void);
        # EAPI void evas_object_smart_move_children_relative(Evas_Object *obj, Evas_Coord dx, Evas_Coord dy);
        # EAPI Evas_Object *evas_object_table_add (Evas *evas);
        # EAPI Evas_Object *evas_object_table_add_to (Evas_Object *parent);
        # EAPI void evas_object_table_homogeneous_set (Evas_Object *o, Evas_Object_Table_Homogeneous_Mode homogeneous);
        # EAPI Evas_Object_Table_Homogeneous_Mode evas_object_table_homogeneous_get (const Evas_Object *o);
        # EAPI void evas_object_table_padding_set (Evas_Object *o, Evas_Coord horizontal, Evas_Coord vertical);
        # EAPI void evas_object_table_padding_get (const Evas_Object *o, Evas_Coord *horizontal, Evas_Coord *vertical);
        # EAPI void evas_object_table_align_set (Evas_Object *o, double horizontal, double vertical);
        # EAPI void evas_object_table_align_get (const Evas_Object *o, double *horizontal, double *vertical);
        # EAPI void evas_object_table_mirrored_set (Evas_Object *o, Eina_Bool mirrored);
        # EAPI Eina_Bool evas_object_table_mirrored_get (const Evas_Object *o);
        # EAPI Eina_Bool evas_object_table_pack (Evas_Object *o, Evas_Object *child, unsigned short col, unsigned short row, unsigned short colspan, unsigned short rowspan);
        # EAPI Eina_Bool evas_object_table_unpack (Evas_Object *o, Evas_Object *child);
        # EAPI void evas_object_table_clear (Evas_Object *o, Eina_Bool clear);
        # EAPI void evas_object_table_col_row_size_get(const Evas_Object *o, int *cols, int *rows);
        # EAPI Eina_Iterator *evas_object_table_iterator_new (const Evas_Object *o);
        # EAPI Eina_Accessor *evas_object_table_accessor_new (const Evas_Object *o);
        # EAPI Eina_List *evas_object_table_children_get (const Evas_Object *o);
        # EAPI Evas_Object *evas_object_table_child_get (const Evas_Object *o, unsigned short col, unsigned short row);
        # EAPI Eina_Bool evas_object_filter_mode_set (Evas_Object *o, Evas_Filter_Mode mode);
        # EAPI Evas_Filter_Mode evas_object_filter_mode_get (Evas_Object *o);
        # EAPI Eina_Bool evas_object_filter_set (Evas_Object *o, Evas_Filter filter);
        # EAPI Evas_Filter evas_object_filter_get (Evas_Object *o);
        # EAPI Eina_Bool evas_object_filter_param_int_set (Evas_Object *o, const char *param, int val);
        # EAPI int evas_object_filter_param_int_get (Evas_Object *o, const char *param);
        # EAPI Eina_Bool evas_object_filter_param_str_set (Evas_Object *o, const char *param, const char *val);
        # EAPI const char *evas_object_filter_param_str_get (Evas_Object *o, const char *param);
        # EAPI Eina_Bool evas_object_filter_param_obj_set (Evas_Object *o, const char *param, Evas_Object *val);
        # EAPI Evas_Object *evas_object_filter_param_obj_get (Evas_Object *o, const char *param);
        # EAPI Eina_Bool evas_object_filter_param_float_set(Evas_Object *o, const char *param, double val);
        # EAPI double evas_object_filter_param_float_get(Evas_Object *o, const char *param);
        # EAPI Eina_Bool evas_cserve_want_get (void);
        # EAPI Eina_Bool evas_cserve_connected_get (void);
        # EAPI Eina_Bool evas_cserve_stats_get (Evas_Cserve_Stats *stats);
        # EAPI void evas_cserve_image_cache_contents_clean (Evas_Cserve_Image_Cache *cache);
        # EAPI Eina_Bool evas_cserve_config_get (Evas_Cserve_Config *config);
        # EAPI Eina_Bool evas_cserve_config_set (const Evas_Cserve_Config *config);
        # EAPI void evas_cserve_disconnect (void);
end
