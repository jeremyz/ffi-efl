#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eet'
#
describe Efl::Eet do
    #
    before(:all) { Eet = Efl::Eet }
    #
    FP = '/tmp/_eet.cfg'
    #
    it "should init" do
        Eet.init.should eql 1
        Eet.init.should eql 2
        Eet.init.should eql 3
    end
    #
    it "should shutdown" do
        Eet.shutdown.should eql 2
        Eet.shutdown.should eql 1
        Eet.shutdown.should eql 0
    end
    #
    it "should clearcache" do
        Eet.clearcache
        Eet.clearcache
        Eet.clearcache
    end
    #
    it "should have good enums" do
        Efl::API.enum_type(:eet_file_mode)[:eet_file_mode_invalid].should eql -1
        Efl::API.enum_type(:eet_file_mode)[:eet_file_mode_read].should eql 0
        Efl::API.enum_type(:eet_file_mode)[:eet_file_mode_write].should eql 1
        Efl::API.enum_type(:eet_file_mode)[:eet_file_mode_read_write].should eql 2
    end
    #
    it "should open and close" do
        Eet.init
        f = Eet.open FP, Efl::API.enum_type(:eet_file_mode)[:eet_file_mode_write]
        f.write 'fake', 'value'
        f.close
        Eet.shutdown
    end
    #
    it "should be able to get file access mode" do
        Eet.init
        Efl::API.enum_type(:eet_file_mode).symbols.each do |m|
            next if m==:eet_file_mode_invalid
            Eet.open FP, Efl::API.enum_type(:eet_file_mode)[m] do |f|
                f.mode_get.should eql m
            end
        end
        Eet.shutdown
    end
    #
    it "should write" do
        Eet.init
        f = Eet.open FP, :eet_file_mode_write
        f.mode_get.should eql :eet_file_mode_write
        f.write 'config', 'test key'
        f.close
        Eet.shutdown
    end
    #
    it "should read" do
        Eet.init
        f = Eet.open FP, :eet_file_mode_read
        f.mode_get.should eql :eet_file_mode_read
        f.read('config').should eql 'test key'
        f.close
        Eet.shutdown
    end
    #
    it "should read/write" do
        Eet.init
        f = Eet.open FP, :eet_file_mode_read_write
        f.write 'configg', 'test key'
        f.read('configg').should eql 'test key'
        f.close
        Eet.shutdown
    end
    #
    it "should write in block" do
        Eet.init
        Eet.open FP, :eet_file_mode_write do |f|
            f.write 'config2', 'test--key'
        end
        Eet.shutdown
    end
    #
    it "should read in block" do
        Eet.init
        Eet.open FP, :eet_file_mode_read do |f|
            f.read('config2').should eql 'test--key'
        end
        Eet.shutdown
    end
    #
    it "should read/write in block" do
        Eet.init
        Eet.open FP, :eet_file_mode_read_write do |f|
            f.write 'config22', 'test--key'
            f.read('config22').should eql 'test--key'
        end
        Eet.shutdown
    end
end
