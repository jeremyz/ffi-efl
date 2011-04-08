#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/edje'
#
describe EFL::EDJE do
    #
    include EFL
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
