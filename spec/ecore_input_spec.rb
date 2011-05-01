#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ecore_input'
#
describe Efl::EcoreInput do
    #
    before(:all) do
        EcoreInput = Efl::EcoreInput
    end
    #
    it "should init" do
        EcoreInput.init.should == 1
        EcoreInput.init.should == 2
        EcoreInput.init.should == 3
    end
    #
    it "should shutdown" do
        EcoreInput.shutdown.should == 2
        EcoreInput.shutdown.should == 1
        EcoreInput.shutdown.should == 0
    end
    #
end
