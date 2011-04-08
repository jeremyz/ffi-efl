#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ecore'
#
describe EFL::ECORE do
    #
    include EFL
    #
    it "should init" do
        ECORE.init.should eql 1
        ECORE.init.should eql 2
        ECORE.init.should eql 3
    end
    #
    it "should shutdown" do
        ECORE.shutdown.should eql 2
        ECORE.shutdown.should eql 1
        ECORE.shutdown.should eql 0
    end
    #
end
