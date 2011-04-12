#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/ecore'
#
describe E17::ECORE do
    #
    include E17
    #
    it "should init" do
        ECORE.init.should eql 1
        ECORE.init.should eql 2
        ECORE.init.should eql 3
    end
    #
    it "should shutdown" do
        ECORE.shutdown.should eql 2
        ECORE.shutdown.should eql 1
        ECORE.shutdown.should eql 0
    end
    #
    it "should run a single iteration of the mainloop" do
        ECORE.init
        ECORE.main_loop_iterate
        ECORE.shutdown
    end
    #
    it 'should write and read data from pipe' do
        ECORE.init
        cb = Proc.new do |data,buffer,bytes|
            data.read_string.should eql 'none'
            buffer.read_string.should eql 'hello world'
            bytes.should eql 12
        end
        data = FFI::MemoryPointer.from_string("none")
        pipe = ECORE.pipe_add cb, data
        buffer = FFI::MemoryPointer.new(:string,128)
        buffer.write_string 'hello world'
        ECORE.pipe_write pipe, buffer, 12
        ECORE.main_loop_iterate
        ECORE.pipe_read_close pipe
        ECORE.pipe_write_close pipe
        ECORE.pipe_del pipe
        ECORE.shutdown
    end
end
