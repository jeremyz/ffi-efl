#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/eet'
#
describe E17::EET do
    #
    include E17
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
        EET.init
        f = EET.open FP, EET::FILE_MODE_WRITE
        f.write 'fake', 'value'
        f.close
        EET.shutdown
    end
    it "should be able to get file access mode" do
        EET.init
        [ EET::FILE_MODE_READ, EET::FILE_MODE_WRITE, EET::FILE_MODE_READ_WRITE ].each do |m|
            EET.open FP, m do |f|
                f.mode_get.should eql m
            end
        end
        EET.shutdown
    end
    #
    it "should write" do
        EET.init
        f = EET.open FP, EET::FILE_MODE_WRITE
        f.write 'config', 'test key'
        f.close
        EET.shutdown
    end
    #
    it "should read" do
        EET.init
        f = EET.open FP, EET::FILE_MODE_READ
        f.read('config').should eql 'test key'
        f.close
        EET.shutdown
    end
    #
    it "should read/write" do
        EET.init
        f = EET.open FP, EET::FILE_MODE_READ_WRITE
        f.write 'configg', 'test key'
        f.read('configg').should eql 'test key'
        f.close
        EET.shutdown
    end
    #
    it "should write in block" do
        EET.init
        EET.open FP, EET::FILE_MODE_WRITE do |f|
            f.write 'config2', 'test--key'
        end
        EET.shutdown
    end
    #
    it "should read in block" do
        EET.init
        EET.open FP, EET::FILE_MODE_READ do |f|
            f.read('config2').should eql 'test--key'
        end
        EET.shutdown
    end
    #
    it "should read/write in block" do
        EET.init
        EET.open FP, EET::FILE_MODE_READ_WRITE do |f|
            f.write 'config22', 'test--key'
            f.read('config22').should eql 'test--key'
        end
        EET.shutdown
    end
end
