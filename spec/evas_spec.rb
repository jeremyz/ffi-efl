#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/evas'
#
describe E17::EVAS do
    #
    include E17
    #
    it "should init" do
        EVAS.init.should eql 1
        EVAS.init.should eql 2
        EVAS.init.should eql 3
    end
    #
    it "should shutdown" do
        EVAS.shutdown.should eql 2
        EVAS.shutdown.should eql 1
        EVAS.shutdown.should eql 0
    end
    #
    it "should have no memory allocation error occured" do
        EVAS.init
        EVAS.alloc_error.should eql EVAS::ALLOC_ERROR_NONE
        EVAS.shutdown
    end
    #
    it "should process async events" do
        cb = Proc.new do |target,type,evt|
            target.read_string.should eql "target"
            type.should eql 0
            evt.read_string.should eql "work"
        end
        EVAS.init
        target = FFI::MemoryPointer.from_string("target")
        work = FFI::MemoryPointer.from_string("work")
        EVAS.async_events_put target, 0, work, cb
        EVAS.async_events_process.should eql 1
        EVAS.async_events_process.should eql 0
        EVAS.shutdown
    end
end
