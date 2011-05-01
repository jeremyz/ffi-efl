#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina'
#
describe Efl::Eina do
    #
    it "should init" do
        Efl::Eina.init.should == 1
        Efl::Eina.init.should == 2
        Efl::Eina.init.should == 3
    end
    #
    it "should shutdown" do
        Efl::Eina.shutdown.should == 2
        Efl::Eina.shutdown.should == 1
        Efl::Eina.shutdown.should == 0
    end
    #
end
