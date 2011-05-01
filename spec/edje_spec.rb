#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/edje'
#
describe Efl::Edje do
    #
    before(:all) { Edje = Efl::Edje }
    #
    it "should init" do
        Edje.init.should == 1
        Edje.init.should == 2
        Edje.init.should == 3
    end
    #
    it "should shutdown" do
        Edje.shutdown.should == 2
        Edje.shutdown.should == 1
        Edje.shutdown.should == 0
    end
    #
end
