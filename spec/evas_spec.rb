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
end
