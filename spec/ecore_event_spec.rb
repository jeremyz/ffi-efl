#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/ecore'
require 'e17/ecore/event'
#
describe E17::ECORE do
    #
    include E17
    #
    before(:all) do
        USER_SIGNAL_CB = Proc.new do |data, type, event|
            data.read_string.should eql "ok"
            type.should eql ECORE::EVENT_SIGNAL_USER
            event.read_int.should eql 666
            ECORE.event_current_type_get.should eql ECORE::EVENT_SIGNAL_USER
            ECORE.event_current_event_get.address.should eql event.address
            ECORE.main_loop_quit
        end
        EVENT_FREE_CB = Proc.new do |data,event|
            data.read_string.should eql "none"
            event.read_int.should eql 666
        end
        OK = FFI::MemoryPointer.from_string "ok"
        KO = FFI::MemoryPointer.from_string "ko"
        NONE = FFI::MemoryPointer.from_string "none"
    end
    #
    it 'should be able to add, del event hanlder and process event' do
        ECORE.init
        evt = FFI::MemoryPointer.new(:int)
        evt.write_int 666
        # add, del, add event handler
        evt_handler = ECORE.event_handler_add ECORE::EVENT_SIGNAL_USER, USER_SIGNAL_CB, KO
        evt_handler.null?.should be_false
        ECORE.event_handler_del(evt_handler).address.should eql KO.address
        evt_handler = ECORE.event_handler_add ECORE::EVENT_SIGNAL_USER, USER_SIGNAL_CB, OK
        evt_handler.null?.should be_false
        # add, del, add event
        ecore_evt = ECORE.event_add ECORE::EVENT_SIGNAL_USER, evt, EVENT_FREE_CB, NONE
        ecore_evt.null?.should be_false
        ECORE.event_del(ecore_evt).address.should eql NONE.address
        ecore_evt = ECORE.event_add ECORE::EVENT_SIGNAL_USER, evt, EVENT_FREE_CB, NONE
        ecore_evt.null?.should be_false
        ECORE.main_loop_begin   # process event
        ECORE.shutdown
    end
    #
    it "should be able to get and set event handler data" do
        ECORE.init
        evt = FFI::MemoryPointer.new(:int)
        evt.write_int 666
        evt_handler = ECORE.event_handler_add ECORE::EVENT_SIGNAL_USER, USER_SIGNAL_CB, KO
        evt_handler.null?.should be_false
        ECORE.event_handler_data_get(evt_handler).read_string.should eql "ko"
        ECORE.event_handler_data_set(evt_handler, OK).address.should eql KO.address
        ECORE.event_handler_data_get(evt_handler).read_string.should eql "ok"
        ecore_evt = ECORE.event_add ECORE::EVENT_SIGNAL_USER, evt, EVENT_FREE_CB, NONE
        ecore_evt.null?.should be_false
        ECORE.main_loop_begin   # process event
        ECORE.shutdown
    end
    #
    it "should be able to create new event type" do
        ECORE.init
        ECORE.ecore_event_type_new.should_not eql 0
        ECORE.ecore_event_type_new.should_not eql 0
        ECORE.ecore_event_type_new.should_not eql 0
        ECORE.shutdown
    end
    #
    it "should be possible to add and del event filters" do
        ECORE.init
        loop_data = FFI::MemoryPointer.from_string("loop_data")
        event_free_cb = Proc.new do |data,event|
            data.read_string.should eql "ko"
            event.read_int.should eql 69
        end
        start_cb = Proc.new do |data|
            data.read_string.should eql "ok"
            loop_data
        end
        count = 0
        filter_cb = Proc.new do |data,loop_data,type,event|
            data.read_string.should eql "ok"
            loop_data.read_string.should eql "loop_data"
            type.should eql ECORE::EVENT_SIGNAL_USER
            count += 1
            if event.read_int == 69
                count.should eql 1
                false   # drop first event
            else
                count.should eql 2
                event.read_int.should eql 666
                true
            end
        end
        end_cb = Proc.new do |data,loop_data|
            data.read_string.should eql "ok"
            loop_data.read_string.should eql "loop_data"
        end
        filter = ECORE.ecore_event_filter_add start_cb, filter_cb, end_cb, OK
        ECORE.event_handler_add ECORE::EVENT_SIGNAL_USER, USER_SIGNAL_CB, OK
        e1 = FFI::MemoryPointer.new(:int)
        e1.write_int 69
        evt1 = ECORE.event_add ECORE::EVENT_SIGNAL_USER, e1, event_free_cb, KO
        e2 = FFI::MemoryPointer.new(:int)
        e2.write_int 666
        evt2 = ECORE.event_add ECORE::EVENT_SIGNAL_USER, e2, EVENT_FREE_CB, NONE
        ECORE.main_loop_begin   # process event
        ECORE.ecore_event_filter_del(filter).address.should eql OK.address
        evt2 = ECORE.event_add ECORE::EVENT_SIGNAL_USER, e2, EVENT_FREE_CB, NONE
        ECORE.main_loop_begin   # process event
        ECORE.shutdown
    end
end
