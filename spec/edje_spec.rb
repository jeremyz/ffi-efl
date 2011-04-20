#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/edje'
#
describe E17::Edje do
    #
    include E17
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
