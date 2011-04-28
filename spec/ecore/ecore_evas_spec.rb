#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ecore/ecore_evas'
#
describe Efl::EcoreEvas do
    #
    before(:all) do
        EcoreEvas = Efl::EcoreEvas
    end
    #
    it "should init" do
        EcoreEvas.init.should eql 1
        EcoreEvas.init.should eql 2
        EcoreEvas.init.should eql 3
    end
    #
    it "should shutdown" do
        EcoreEvas.shutdown.should eql 2
        EcoreEvas.shutdown.should eql 1
        EcoreEvas.shutdown.should eql 0
    end
    #
end
