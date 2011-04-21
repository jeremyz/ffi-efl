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
        Edje.init.should eql 1
        Edje.init.should eql 2
        Edje.init.should eql 3
    end
    #
    it "should shutdown" do
        Edje.shutdown.should eql 2
        Edje.shutdown.should eql 1
        Edje.shutdown.should eql 0
    end
    #
end
