#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ecore_input'
#
describe 'Efl::EcoreInput' do
    #
    before(:all) do
        EcoreInput = Efl::EcoreInput
        @init = EcoreInput.init
    end
    after(:all) do
        EcoreInput.shutdown
    end
    #
    it "should init" do
        EcoreInput.init.should == @init+1
        EcoreInput.init.should == @init+2
        EcoreInput.init.should == @init+3
    end
    #
    it "should shutdown" do
        EcoreInput.shutdown.should == @init+2
        EcoreInput.shutdown.should == @init+1
        EcoreInput.shutdown.should == @init
    end
    #
end
