#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ecore'
#
describe "Efl::Ecore #{Efl::Ecore.version.full}" do
    #
    before(:all) do
        Ecore = Efl::Ecore
        USER_SIGNAL_CB = Proc.new do |data, type, event|
            data.read_string.should == "ok"
            type.should == Ecore::EVENT_SIGNAL_USER
            event.read_int.should == 666
            Ecore.event_current_type_get.should == Ecore::EVENT_SIGNAL_USER
            Ecore.event_current_event_get.address.should == event.address
            Ecore.main_loop_quit
        end
        EVENT_FREE_CB = Proc.new do |data,event|
            data.read_string.should == "none"
            event.read_int.should == 666
        end
        OK = FFI::MemoryPointer.from_string "ok"
        KO = FFI::MemoryPointer.from_string "ko"
        NONE = FFI::MemoryPointer.from_string "none"
        @init = Ecore.init
    end
    after(:all) do
        Ecore.shutdown
    end
    #
    it "should init" do
        Ecore.init.should == @init+1
        Ecore.init.should == @init+2
        Ecore.init.should == @init+3
    end
    #
    it "should shutdown" do
        Ecore.shutdown.should == @init+2
        Ecore.shutdown.should == @init+1
        Ecore.shutdown.should == @init
    end
    #
    it "should run a single iteration of the mainloop" do
        Ecore.main_loop_iterate
    end
    #
    it 'should be able to add, del event hanlder and process event' do
        evt = FFI::MemoryPointer.new(:int)
        evt.write_int 666
        # add, del, add event handler
        evt_handler = Ecore.event_handler_add Ecore::EVENT_SIGNAL_USER, USER_SIGNAL_CB, KO
        evt_handler.null?.should be_false
        Ecore.event_handler_del(evt_handler).address.should == KO.address
        evt_handler = Ecore.event_handler_add Ecore::EVENT_SIGNAL_USER, USER_SIGNAL_CB, OK
        evt_handler.null?.should be_false
        # add, del, add event
        ecore_evt = Ecore.event_add Ecore::EVENT_SIGNAL_USER, evt, EVENT_FREE_CB, NONE
        ecore_evt.null?.should be_false
        Ecore.event_del(ecore_evt).address.should == NONE.address
        ecore_evt = Ecore.event_add Ecore::EVENT_SIGNAL_USER, evt, EVENT_FREE_CB, NONE
        ecore_evt.null?.should be_false
        Ecore.main_loop_begin   # process event
        Ecore.event_handler_del(evt_handler).address.should == OK.address
    end
    #
    it "should be able to get and set event handler data" do
        evt = FFI::MemoryPointer.new(:int)
        evt.write_int 666
        evt_handler = Ecore.event_handler_add Ecore::EVENT_SIGNAL_USER, USER_SIGNAL_CB, KO
        evt_handler.null?.should be_false
        Ecore.event_handler_data_get(evt_handler).read_string.should == "ko"
        Ecore.event_handler_data_set(evt_handler, OK).address.should == KO.address
        Ecore.event_handler_data_get(evt_handler).read_string.should == "ok"
        ecore_evt = Ecore.event_add Ecore::EVENT_SIGNAL_USER, evt, EVENT_FREE_CB, NONE
        ecore_evt.null?.should be_false
        Ecore.main_loop_begin   # process event
        Ecore.event_handler_del(evt_handler).address.should == OK.address
    end
    #
    it "should be able to create new event type" do
        Ecore.event_type_new.should_not == 0
        Ecore.event_type_new.should_not == 0
        Ecore.event_type_new.should_not == 0
    end
    #
    it "should be possible to add and del event filters" do
        loop_data = FFI::MemoryPointer.from_string("loop_data")
        event_free_cb = Proc.new do |data,event|
            data.read_string.should == "ko"
            event.read_int.should == 69
        end
        start_cb = Proc.new do |data|
            data.read_string.should == "ok"
            loop_data
        end
        count = 0
        filter_cb = Proc.new do |data,loop_data,type,event|
            data.read_string.should == "ok"
            loop_data.read_string.should == "loop_data"
            type.should == Ecore::EVENT_SIGNAL_USER
            count += 1
            if event.read_int == 69
                count.should == 1
                false   # drop first event
            else
                count.should == 2
                event.read_int.should == 666
                true
            end
        end
        end_cb = Proc.new do |data,loop_data|
            data.read_string.should == "ok"
            loop_data.read_string.should == "loop_data"
        end
        filter = Ecore.event_filter_add start_cb, filter_cb, end_cb, OK
        evt_handler = Ecore.event_handler_add Ecore::EVENT_SIGNAL_USER, USER_SIGNAL_CB, OK
        e1 = FFI::MemoryPointer.new(:int)
        e1.write_int 69
        evt1 = Ecore.event_add Ecore::EVENT_SIGNAL_USER, e1, event_free_cb, KO
        e2 = FFI::MemoryPointer.new(:int)
        e2.write_int 666
        evt2 = Ecore.event_add Ecore::EVENT_SIGNAL_USER, e2, EVENT_FREE_CB, NONE
        Ecore.event_filter_del(filter).address.should == OK.address
        evt2 = Ecore.event_add Ecore::EVENT_SIGNAL_USER, e2, EVENT_FREE_CB, NONE
        Ecore.event_handler_del(evt_handler).address.should == OK.address
        Ecore.main_loop_iterate
        Ecore.main_loop_iterate
        Ecore.main_loop_iterate
        e1.free
        e2.free
    end
    #
    describe 'Efl::Ecore::REcorePipe' do
    #
        it 'should write and read data from pipe' do
            data = FFI::MemoryPointer.from_string("none")
            cb = Proc.new do |data,buffer,bytes|
                data.read_string.should == 'none'
                buffer.read_string.should == 'hello world'
                bytes.should == 12
            end
            pipe = Ecore::REcorePipe.new cb, data
            pipe.write("hello world").should be_true
            Ecore.main_loop_iterate
            pipe.read_close
            pipe.write_close
            pipe.del    # without this, pipe is freed by autopointer, but after Ecore.shutdown then SIGSEV
        end
        it "manual destructor should not raise FFI::AutoPointer error" do
            data = FFI::MemoryPointer.from_string("none")
            cb = Proc.new do |data,buffer,bytes|
                data.read_string.should == 'none'
                buffer.read_string.should == 'hello world'
                bytes.should == 12
            end
            pipe = Ecore::REcorePipe.new cb, data
            pipe.del
        end
    end
end
