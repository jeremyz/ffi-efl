#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ecore'
require 'efl/evas'
#
describe Efl::Evas do
    #
    before(:all) {
        Evas = Efl::Evas
        Native = Efl::Native
    }
    #
    it "should init" do
        Evas.init.should == 1
        Evas.init.should == 2
        Evas.init.should == 3
    end
    #
    it "should shutdown" do
        Evas.shutdown.should == 2
        Evas.shutdown.should == 1
        Evas.shutdown.should == 0
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
        Evas.init
        Evas.alloc_error.should == :evas_alloc_error_none
        Evas.shutdown
    end
    #
    it "should process async events" do
        cb = Proc.new do |target,type,evt|
            target.read_string.should == "target"
            type.should == :evas_callback_show
            evt.read_string.should == "work"
        end
        Evas.init
        target = FFI::MemoryPointer.from_string("target")
        work = FFI::MemoryPointer.from_string("work")
        Evas.async_events_put target, :evas_callback_show, work, cb
        Evas.async_events_process.should == 1
        Evas.async_events_process.should == 0
        Evas.shutdown
    end
    #
    describe Efl::Evas::REvas do
        before(:all) do
            Evas.init
            @width = 800
            @height = 600
            @pixels = FFI::MemoryPointer.new :int, @width*@height
            @e = Evas::REvas.new
            @e.output_method_set Evas::render_method_lookup("buffer")
            @e.output_viewport_set 0, 0, @width, @height
            @e.output_size_set @width, @height
            einfo = Native::EngineInfoBufferStruct.new @e.engine_info_get
            einfo[:info][:depth_type] = Efl::Evas::EVAS_ENGINE_BUFFER_DEPTH_ARGB32
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
        it "focus should work" do
            Native.evas_focus_in @e.to_ptr
            Native.evas_focus_state_get(@e.to_ptr).should be_true
            Native.evas_focus_out @e.to_ptr
            Native.evas_focus_state_get(@e.to_ptr).should be_false
            Evas.focus_in @e.to_ptr
            Evas.focus_state_get(@e.to_ptr).should be_true
            Evas.focus_out @e.to_ptr
            Evas.focus_state_get(@e.to_ptr).should be_false
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
        it "output method should work" do
            @e.output_method_get.should == Evas::render_method_lookup("buffer")
            # output_method_set tested in before(:all)
            l = Efl::Evas.render_method_list
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
            @e.output_size_get.should == [69,666]
        end
        it "output viewport should work" do
            @e.output_viewport_set 0, 0, 666, 69
            @e.output_viewport_get.should == [0,0,666,69]
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
            @e.event_freeze_get.should == 0
            @e.event_freeze
            @e.event_freeze_get.should == 1
            @e.event_thaw
            @e.event_freeze_get.should == 0
        end
        #
        it "up/down mouse event should work" do
            @e.event_feed_mouse_down 2, :evas_button_double_click, Time.now.to_i, FFI::Pointer::NULL
            @e.pointer_button_down_mask_get.should == 2
            @e.event_feed_mouse_up 2, :evas_button_double_click, Time.now.to_i, FFI::Pointer::NULL
            @e.pointer_button_down_mask_get.should == 0
        end
        #
        it "move mouse event should work" do
            @e.pointer_output_xy_get.should == [0,0]
            @e.pointer_canvas_xy_get.should == [0,0]
            @e.event_feed_mouse_move 6, 6, Time.now.to_i, FFI::Pointer::NULL
            @e.pointer_output_xy_get.should == [6,6]
            @e.pointer_canvas_xy_get.should == [6,6]
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
        it "add/del event callback should work" do
            @cb = false
            kd_cb = Proc.new do |data, e, obj, event_info|
                data.read_string.should eq "mouse_in"
                e.address.should == @e.address
                obj.address.should == @bg.address
                @db=true
                true
            end
            kd_d = FFI::MemoryPointer.from_string "mouse_in"
            @bg = Evas::REvasObject.new @e.object_rectangle_add
            @bg.move 0, 0
            @bg.resize 20, 20
            @bg.show
            @bg.event_callback_add :evas_callback_mouse_in, kd_cb, kd_d
            @e.event_feed_mouse_in Time.now.to_i, FFI::Pointer::NULL
            @bg.event_callback_del(:evas_callback_mouse_in, kd_cb).address.should == kd_d.address
            @db.should be_true
        end
        #
        it "image cache functions should work" do
            @e.image_cache_flush
            @e.image_cache_reload
            @e.image_cache_set 666
            @e.image_cache_get.should == 666
        end
        #
        it "font functions should work" do
            @e.font_hinting_set :evas_font_hinting_bytecode
            @e.font_hinting_get.should == :evas_font_hinting_bytecode
            @e.font_hinting_can_hint(:evas_font_hinting_none).should be_true
            @e.font_cache_flush
            @e.font_cache_set 666
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
    end
    describe Efl::Evas::REvasObject do
        #
        before(:all) do
            Evas.init
            @pixels = FFI::MemoryPointer.new :int, 100*100
            @e = Evas::REvas.new
            @e.output_method_set Evas.render_method_lookup("buffer")
            @e.output_viewport_set 0, 0, 100, 100
            @e.output_size_set 100, 100
            einfo = Native::EngineInfoBufferStruct.new @e.engine_info_get
            einfo[:info][:depth_type] = Efl::Evas::EVAS_ENGINE_BUFFER_DEPTH_ARGB32
            einfo[:info][:dest_buffer] = @pixels
            einfo[:info][:dest_buffer_row_bytes] = 100 * FFI::type_size(:int);
            einfo[:info][:use_color_key] = 0;
            einfo[:info][:alpha_threshold] = 0;
            einfo[:info][:func][:new_update_region] = nil #FFI::Pointer::NULL;
            einfo[:info][:func][:free_update_region] = nil #FFI::Pointer::NULL;
            @e.engine_info_set einfo
            @o = @e.object_add(:rectangle) { |o|
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
            Evas.shutdown
        end
        #
        it "clipper should work" do
            clipper = @e.object_add :rectangle
            clipper.color = 255,255,255,255
            clipper.move 25, 25
            clipper.resize 50, 50
            @o.clip = clipper.to_ptr
            clipper.show
            @o.clip_get.address.should == clipper.address
            require 'efl/eina_list'
            Efl::EinaList::REinaList.new(clipper.clipees_get).to_ary[0].address.should == @o.address
            @o.clip_unset
            @o.clip_get.address.should == 0

        end
        #
        it "focus functions should work" do
            @o.focus_get.should be_false
            @o.focus_set true
            @o.focus_get.should be_true
            @o.focus = false
            @o.focus_get.should be_false
        end
        #
        it "layer functions should work" do
            @o.layer_get.should == 0
            @o.layer_set 2
            @o.layer_get.should == 2
            @o.layer = 0
            @o.layer_get.should == 0
        end
        #
        it "name functions should work" do
            @o.name_set "My name"
            @o.name_get.should == "My name"
        end
        #
        it "geometry functions should work" do
            @o.geometry_get.should == [0,0,100,100]
            @o.resize 50,50
            @o.geometry.should == [0,0,50,50]
            @o.move 10, 10
            @o.geometry_get.should == [10,10,50,50]
        end
        #
        it "show hide visible should work" do
            @o.show
            @o.visible?.should be_true
            @o.hide
            @o.visible_get.should be_false
            @o.show
            @o.visible?.should be_true
        end
        #
        it "color get/set should work" do
            @o.color_get.should == [200,200,200,200]
            @o.color_set 0,50,100,200
            @o.color.should == [0,50,100,200]
            @o.color = 200,200,200,200
            @o.color.should == [200,200,200,200]
        end
        #
        it "evas_get should worl" do
            @o.evas_get.should === @e
            @o.evas.should === @e
        end
        #
        it "type_get should work" do
            @o.type_get.should == 'rectangle'
        end
        # TODO raise, lower
        it "raise, lower, stck_below, stack_above should work" do
            os = []
            0.upto(3) do
                os << @e.object_add(:rectangle)
            end
            os[2].above.should === os[3]
            os[2].below.should === os[1]
            os[2].above_get.should === os[3]
            os[2].below_get.should === os[1]
            os[2].stack_below os[1]
            os[2].above_get.should === os[1]
            os[2].below_get.should === os[0]
            os[2].stack_above os[1]
            os[2].above_get.should === os[3]
            os[2].below_get.should === os[1]
            os.each do |o| o.free; end
        end
        #
        it "event_callback should work" do
            @o.move 0, 0 # FIXME why should I need this ?!?
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
        it "pass event should work" do
            @o.pass_events_get.should be_false
            @o.pass_events_set true
            @o.pass_events_get.should be_true
            @o.pass_events=false
            @o.pass_events_get.should be_false
            @o.pass_events_set true
            @o.pass_events_get.should be_true
            @o.pass_events=false
            @o.pass_events_get.should be_false
        end
    end
    #
end
