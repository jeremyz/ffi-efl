#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/ecore'
#
describe E17::Ecore do
    #
    include E17
    #
    it "should init" do
        Ecore.init.should eql 1
        Ecore.init.should eql 2
        Ecore.init.should eql 3
    end
    #
    it "should shutdown" do
        Ecore.shutdown.should eql 2
        Ecore.shutdown.should eql 1
        Ecore.shutdown.should eql 0
    end
    #
    it "should run a single iteration of the mainloop" do
        Ecore.init
        Ecore.main_loop_iterate
        Ecore.shutdown
    end
    #
    it 'should write and read data from pipe' do
        data = FFI::MemoryPointer.from_string("none")
        cb = Proc.new do |data,buffer,bytes|
            data.read_string.should eql 'none'
            buffer.read_string.should eql 'hello world'
            bytes.should eql 12
        end
        Ecore.init
        pipe = Ecore::EcorePipe.new cb, data
        pipe.write("hello world").should be_true
        Ecore.main_loop_iterate
        pipe.read_close
        pipe.write_close
        pipe.del.address.should eql data.address
        Ecore.shutdown
    end
end
