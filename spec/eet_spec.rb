#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/eet'
#
describe E17::Eet do
    #
    include E17
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
        Eet.enum_type(:eet_file_mode)[:invalid].should eql -1
        Eet.enum_type(:eet_file_mode)[:read].should eql 0
        Eet.enum_type(:eet_file_mode)[:write].should eql 1
        Eet.enum_type(:eet_file_mode)[:read_write].should eql 2
    end
    #
    it "should open and close" do
        Eet.init
        f = Eet.open FP, Eet.enum_type(:eet_file_mode)[:write]
        f.write 'fake', 'value'
        f.close
        Eet.shutdown
    end
    it "should be able to get file access mode" do
        Eet.init
        Eet.enum_type(:eet_file_mode).symbols.each do |m|
            next if m==:invalid
            Eet.open FP, Eet.enum_type(:eet_file_mode)[m] do |f|
                f.mode_get.should eql m
            end
        end
        Eet.shutdown
    end
    #
    it "should write" do
        Eet.init
        f = Eet.open FP, :write
        f.mode_get.should eql :write
        f.write 'config', 'test key'
        f.close
        Eet.shutdown
    end
    #
    it "should read" do
        Eet.init
        f = Eet.open FP, :read
        f.mode_get.should eql :read
        f.read('config').should eql 'test key'
        f.close
        Eet.shutdown
    end
    #
#    it "should read/write" do
#        Eet.init
#        f = Eet.open FP, :read_write
#        f.write 'configg', 'test key'
#        f.read('configg').should eql 'test key'
#        f.close
#        Eet.shutdown
#    end
#    #
#    it "should write in block" do
#        Eet.init
#        Eet.open FP, :write do |f|
#            f.write 'config2', 'test--key'
#        end
#        Eet.shutdown
#    end
#    #
#    it "should read in block" do
#        Eet.init
#        Eet.open FP, :read do |f|
#            f.read('config2').should eql 'test--key'
#        end
#        Eet.shutdown
#    end
#    #
#    it "should read/write in block" do
#        Eet.init
#        Eet.open FP, :read_write do |f|
#            f.write 'config22', 'test--key'
#            f.read('config22').should eql 'test--key'
#        end
#        Eet.shutdown
#    end
end
