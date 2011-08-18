#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina'
#
describe "Efl::Eina #{Efl::Eina.version.full}" do
    before(:all) do
        @init = Efl::Eina.init
    end
    after(:all) do
        Efl::Eina.shutdown
    end
    #
    it "should init" do
        Efl::Eina.init.should == @init+1
        Efl::Eina.init.should == @init+2
        Efl::Eina.init.should == @init+3
    end
    #
    it "should be main thread" do
        Efl::Eina.main_loop_is.should be_true
        if RUBY_VERSION > "1.9.0"
            Thread.new do
                Efl::Eina.main_loop_is.should be_false
            end.join
        else
            puts "  no bother on 1.8 branch"
        end
    end
    #
    it "should shutdown" do
        Efl::Eina.shutdown.should == @init+2
        Efl::Eina.shutdown.should == @init+1
        Efl::Eina.shutdown.should == @init
    end
    #
end
