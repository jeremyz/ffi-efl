#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/evas'
#
describe Efl::Evas do
    #
    include Efl
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
        Efl::API.enum_value(:evas_alloc_error_none).should eql 0
        Efl::API.enum_value(:evas_alloc_error_fatal).should eql 1
        Efl::API.enum_value(:evas_alloc_error_recovered).should eql 2
        Efl::API.enum_type(:evas_alloc_error)[0].should eql :evas_alloc_error_none
        Efl::API.enum_type(:evas_alloc_error)[1].should eql :evas_alloc_error_fatal
        Efl::API.enum_type(:evas_alloc_error)[2].should eql :evas_alloc_error_recovered
        Efl::API.enum_type(:evas_alloc_error)[:evas_alloc_error_none].should eql 0
        Efl::API.enum_type(:evas_alloc_error)[:evas_alloc_error_fatal].should eql 1
        Efl::API.enum_type(:evas_alloc_error)[:evas_alloc_error_recovered].should eql 2
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
    describe Efl::Evas::Evas do
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
            e4 = Evas::Evas.new Efl::API.evas_new
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
            e = Evas::Evas.new
            Efl::API.evas_focus_in e.ptr
            Efl::API.evas_focus_state_get(e.ptr).should be_true
            Efl::API.evas_focus_out e.ptr
            Efl::API.evas_focus_state_get(e.ptr).should be_false
            Efl::Evas.focus_in e.ptr
            Efl::Evas.focus_state_get(e.ptr).should be_true
            Efl::Evas.focus_out e.ptr
            Efl::Evas.focus_state_get(e.ptr).should be_false
            e.focus_in { |r| r.should be_nil }
            e.focus_state_get.should be_true
            e.focus_state_get { |r| r.should be_true }
            e.focus_out.should be_nil
            e.focus_state_get.should be_false
            e.focus_state_get { |r| r.should be_false }
            e.free
        end
        #
    end
    #
end
