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
        EcoreInput.init.should eql 1
        EcoreInput.init.should eql 2
        EcoreInput.init.should eql 3
    end
    #
    it "should shutdown" do
        EcoreInput.shutdown.should eql 2
        EcoreInput.shutdown.should eql 1
        EcoreInput.shutdown.should eql 0
    end
    #
end
