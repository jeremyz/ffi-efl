#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/edje'
#
describe E17::EDJE do
    #
    include E17
    #
    it "should init" do
        EDJE.init.should eql 1
        EDJE.init.should eql 2
        EDJE.init.should eql 3
    end
    #
    it "should shutdown" do
        EDJE.shutdown.should eql 2
        EDJE.shutdown.should eql 1
        EDJE.shutdown.should eql 0
    end
    #
end
