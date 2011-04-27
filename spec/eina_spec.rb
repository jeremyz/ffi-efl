#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina'
#
describe Efl::Eina do
    #
    it "should init" do
        Efl::Eina.init.should eql 1
        Efl::Eina.init.should eql 2
        Efl::Eina.init.should eql 3
    end
    #
    it "should shutdown" do
        Efl::Eina.shutdown.should eql 2
        Efl::Eina.shutdown.should eql 1
        Efl::Eina.shutdown.should eql 0
    end
    #
end
