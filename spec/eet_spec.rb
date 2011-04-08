#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eet'
#
describe EFL::EET do
    #
    include EFL
    #
    FP = '/tmp/_eet.cfg'
    #
    it "should init" do
        EET.init.should eql 1
        EET.init.should eql 2
        EET.init.should eql 3
    end
    #
    it "should shutdown" do
        EET.shutdown.should eql 2
        EET.shutdown.should eql 1
        EET.shutdown.should eql 0
    end
    #
    it "should clearcache" do
        EET.clearcache
        EET.clearcache
        EET.clearcache
    end
    #
    it "should open and close" do
        EET.init.should eql 1
        f = EET.open FP, EET::FILE_MODE_WRITE
        f.write 'fake', 'value'
        f.close
        EET.shutdown.should eql 0
    end
    it "should be able to get file access mode" do
        EET.init.should eql 1
        [ EET::FILE_MODE_READ, EET::FILE_MODE_WRITE, EET::FILE_MODE_READ_WRITE ].each do |m|
            EET.open FP, m do |f|
                f.mode_get.should eql m
            end
        end
        EET.shutdown.should eql 0
    end
    #
    it "should write" do
        EET.init.should eql 1
        f = EET.open FP, EET::FILE_MODE_WRITE
        f.write 'config', 'test key'
        f.close
        EET.shutdown.should eql 0
    end
    #
    it "should read" do
        EET.init.should eql 1
        f = EET.open FP, EET::FILE_MODE_READ
        f.read('config').should eql 'test key'
        f.close
        EET.shutdown.should eql 0
    end
    #
    it "should write in block" do
        EET.init.should eql 1
        EET.open FP, EET::FILE_MODE_WRITE do |f|
            f.write 'config2', 'test--key'
        end
        EET.shutdown.should eql 0
    end
    #
    it "should read in block" do
        EET.init.should eql 1
        EET.open FP, EET::FILE_MODE_READ do |f|
            f.read('config2').should eql 'test--key'
        end
        EET.shutdown.should eql 0
    end
    #
end
