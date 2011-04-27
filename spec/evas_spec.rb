#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/evas'
#
describe Efl::Evas do
    #
    before(:all) { Evas = Efl::Evas }
    #
    it "should init" do
        Evas.init.should eql 1
        Evas.init.should eql 2
        Evas.init.should eql 3
    end
    #
    it "should shutdown" do
        Evas.shutdown.should eql 2
        Evas.shutdown.should eql 1
        Evas.shutdown.should eql 0
    end
    #
    it "evas alloc error enum is ok" do
        Efl::FFI.enum_value(:evas_alloc_error_none).should eql 0
        Efl::FFI.enum_value(:evas_alloc_error_fatal).should eql 1
        Efl::FFI.enum_value(:evas_alloc_error_recovered).should eql 2
        Efl::FFI.enum_type(:evas_alloc_error)[0].should eql :evas_alloc_error_none
        Efl::FFI.enum_type(:evas_alloc_error)[1].should eql :evas_alloc_error_fatal
        Efl::FFI.enum_type(:evas_alloc_error)[2].should eql :evas_alloc_error_recovered
        Efl::FFI.enum_type(:evas_alloc_error)[:evas_alloc_error_none].should eql 0
        Efl::FFI.enum_type(:evas_alloc_error)[:evas_alloc_error_fatal].should eql 1
        Efl::FFI.enum_type(:evas_alloc_error)[:evas_alloc_error_recovered].should eql 2
    end
    #
    it "should have no memory allocation error occured" do
        Evas.init
        Evas.alloc_error.should eql :evas_alloc_error_none
        Evas.shutdown
    end
    #
    it "should process async events" do
        cb = Proc.new do |target,type,evt|
            target.read_string.should eql "target"
            type.should eql :evas_callback_show
            evt.read_string.should eql "work"
        end
        Evas.init
        target = FFI::MemoryPointer.from_string("target")
        work = FFI::MemoryPointer.from_string("work")
        Evas.async_events_put target, :evas_callback_show, work, cb
        Evas.async_events_process.should eql 1
        Evas.async_events_process.should eql 0
        Evas.shutdown
    end
    #
    describe "Evas base object" do
        before(:all) do
            Evas.init
            @width = 800
            @height = 600
            @pixels = FFI::MemoryPointer.new :int, @width*@height
            @e = Evas::Evas.new
            @e.output_method_set Evas::render_method_lookup("buffer")
            @e.output_viewport_set 0, 0, @width, @height
            @e.output_size_set @width, @height
            einfo = Efl::FFI::EvasEngineInfoBuffer.new @e.engine_info_get
            einfo[:info][:depth_type] = Efl::FFI::EVAS_ENGINE_BUFFER_DEPTH_ARGB32
            einfo[:info][:dest_buffer] = @pixels
            einfo[:info][:dest_buffer_row_bytes] = @width * FFI::type_size(:int);
            einfo[:info][:use_color_key] = 0;
            einfo[:info][:alpha_threshold] = 0;
            einfo[:info][:func][:new_update_region] = nil #FFI::Pointer::NULL;
            einfo[:info][:func][:free_update_region] = nil #FFI::Pointer::NULL;
            @e.engine_info_set einfo
        end
        after(:all) do
            @e.free
            @pixels.free
            Evas.shutdown
        end
        it "should be able to create and destroy evas" do
            e1 = Evas::Evas.new
            e1.ptr.address.should_not eql 0
            e2 = Evas::Evas.new e1
            e1.ptr.address.should eql e2.ptr.address
            e3 = Evas::Evas.new e1.ptr
            e1.ptr.address.should eql e3.ptr.address
            e2.ptr.address.should eql e3.ptr.address
            (e1==e2).should be_false
            (e2==e3).should be_false
            (e1==e3).should be_false
            (e1===e2).should be_true
            (e2===e3).should be_true
            (e1===e3).should be_true
            e1.free
            e1.ptr.should be_nil
            e4 = Evas::Evas.new Efl::FFI.evas_new
            e4.ptr.address.should_not eql 0
            e5 = e4.dup
            e4.ptr.address.should eql e5.ptr.address
            e6 = e4.clone
            e4.ptr.address.should eql e6.ptr.address
            e4.free
            e4.ptr.should be_nil
        end
        #
        it "focus should work" do
            Efl::FFI.evas_focus_in @e.ptr
            Efl::FFI.evas_focus_state_get(@e.ptr).should be_true
            Efl::FFI.evas_focus_out @e.ptr
            Efl::FFI.evas_focus_state_get(@e.ptr).should be_false
            Efl::Evas.focus_in @e.ptr
            Efl::Evas.focus_state_get(@e.ptr).should be_true
            Efl::Evas.focus_out @e.ptr
            Efl::Evas.focus_state_get(@e.ptr).should be_false
            @e.focus_in { |r| r.should be_nil }
            @e.focus_state_get.should be_true
            @e.focus_state_get { |r| r.should be_true }
            @e.focus_out.should be_nil
            @e.focus_state_get.should be_false
            @e.focus_state_get { |r| r.should be_false }
        end
        #
        it "nochange should work" do
            @e.nochange_push
            @e.nochange_pop
        end
        #
        it "attach data should work" do
            data = FFI::MemoryPointer.from_string "my data"
            @e.data_attach_set data
            @e.data_attach_get.read_string.should eql "my data"
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
        it "output method should work" do
            @e.output_method_get.should eql Evas::render_method_lookup("buffer")
            # output_method_set tested in before(:all)
            l = Efl::Evas::render_method_list
            Evas::render_method_list_free l
        end
        #
        it "engine info should work" do
            # engine_info_get and engine_info_set tested in before(:all)
            true.should be_true
        end
        #
        it "output size should work" do
            @e.output_size_set 69, 666
            @e.output_size_get.should eql [69,666]
        end
        it "output viewport should work" do
            @e.output_viewport_set 0, 0, 666, 69
            @e.output_viewport_get.should eql [0,0,666,69]
        end
        #
        it "coordinates evas<=>world should work" do
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
        it "freeze and thaw should work" do
            @e.event_freeze_get.should eql 0
            @e.event_freeze
            @e.event_freeze_get.should eql 1
            @e.event_thaw
            @e.event_freeze_get.should eql 0
        end
        #
        it "up/down mouse event should work" do
            @e.event_feed_mouse_down 2, :evas_button_double_click, Time.now.to_i, FFI::Pointer::NULL
            @e.pointer_button_down_mask_get.should eql 2
            @e.event_feed_mouse_up 2, :evas_button_double_click, Time.now.to_i, FFI::Pointer::NULL
            @e.pointer_button_down_mask_get.should eql 0
        end
        #
        it "move mouse event should work" do
            @e.pointer_output_xy_get.should eql [0,0]
            @e.pointer_canvas_xy_get.should eql [0,0]
            @e.event_feed_mouse_move 6, 6, Time.now.to_i, FFI::Pointer::NULL
            @e.pointer_output_xy_get.should eql [6,6]
            @e.pointer_canvas_xy_get.should eql [6,6]
        end
        #
        it "in/out mouse event should work" do
            @e.pointer_inside_get.should be_false
            @e.event_feed_mouse_in Time.now.to_i, FFI::Pointer::NULL
            @e.pointer_inside_get.should be_true
            @e.event_feed_mouse_out Time.now.to_i, FFI::Pointer::NULL
            @e.pointer_inside_get.should be_false
        end
        #
        # TODO
        #   evas_event_feed_multi_down
        #   evas_event_feed_multi_up
        #   evas_event_feed_multi_move
        #   evas_event_feed_mouse_cancel
        #   evas_event_feed_mouse_wheel
        #   evas_event_feed_key_down
        #   evas_event_feed_key_up
        #   evas_event_feed_hold
        #
        it "event callback should work" do
            # FIXME
            kd_cb = Proc.new do |data, e, obj, event_info|
                puts data
                data.read_string.should eq "key_down"
                puts e
                e.should eql @e
                puts obj
                puts envent_info
            end
            kd_d = FFI::MemoryPointer.from_string "key down"
            @e.event_callback_add :evas_callback_mouse_in, kd_cb, kd_d
            @e.event_feed_mouse_in Time.now.to_i, FFI::Pointer::NULL
        end
        #
    end
    #
end
