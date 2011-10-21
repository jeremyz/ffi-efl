#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eet'
#
describe "Efl::Eet #{Efl::Eet.version.full}" do
    #
    before(:all) do
        Eet = Efl::Eet
        Native = Efl::Native unless Kernel.const_defined? 'Native'
        REetFile = Efl::Eet::REetFile
        @init = Eet.init
    end
    after(:all) do
        Eet.shutdown
    end
    #
    FP = '/tmp/_eet.cfg'
    #
    it "should init" do
        Eet.init.should == @init+1
        Eet.init.should == @init+2
        Eet.init.should == @init+3
    end
    #
    it "should shutdown" do
        Eet.shutdown.should == @init+2
        Eet.shutdown.should == @init+1
        Eet.shutdown.should == @init
    end
    #
    it "should clearcache" do
        Eet.clearcache
        Eet.clearcache
        Eet.clearcache
    end
    #
    it "should have good enums" do
        Native.enum_type(:eet_file_mode)[:eet_file_mode_invalid].should == -1
        Native.enum_type(:eet_file_mode)[:eet_file_mode_read].should == 0
        Native.enum_type(:eet_file_mode)[:eet_file_mode_write].should == 1
        Native.enum_type(:eet_file_mode)[:eet_file_mode_read_write].should == 2
    end
    #
    describe 'Efl::Eet::REetFile' do
        #
        it "should open and close" do
            f = REetFile.open FP, Native.enum_type(:eet_file_mode)[:eet_file_mode_write]
            f.write 'fake', 'value'
            f.close
        end
        #
        it "should be able to get file access mode" do
            Native.enum_type(:eet_file_mode).symbols.each do |m|
                next if m==:eet_file_mode_invalid
                REetFile.open FP, Native.enum_type(:eet_file_mode)[m] do |f|
                    f.mode_get.should == m
                end
            end
        end
        #
        it "should write" do
            f = REetFile.open FP, :eet_file_mode_write
            f.mode.should == :eet_file_mode_write
            f.write 'config', 'test key'
            f.close
        end
        #
        it "default mode should be read" do
            f = REetFile.open FP
            f.mode.should == :eet_file_mode_read
            f.close
        end
        #
        it "should read" do
            f = REetFile.open FP, :eet_file_mode_read
            f.mode_get.should == :eet_file_mode_read
            f.read('config').should == 'test key'
            f.close
        end
        #
        it "should read/write" do
            f = REetFile.open FP, :eet_file_mode_read_write
            f.write 'configg', 'test key'
            f.read('configg').should == 'test key'
            f.close
        end
        #
        it "should write in block" do
            REetFile.open FP, :eet_file_mode_write do |f|
                f.write 'config2', 'test--key'
            end
        end
        #
        it "should read in block" do
            REetFile.open FP, :eet_file_mode_read do |f|
                f.read('config2').should == 'test--key'
            end
        end
        #
        it "should read/write in block" do
            REetFile.open FP, :eet_file_mode_read_write do |f|
                f.write 'config22', 'test--key'
                f.read('config22').should == 'test--key'
            end
        end
        #
    end
end
