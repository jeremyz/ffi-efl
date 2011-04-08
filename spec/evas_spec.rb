#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/evas'
#
describe EFL::EVAS do
    #
    include EFL
    #
    it "should init" do
        EVAS.init.should eql 1
        EVAS.init.should eql 2
        EVAS.init.should eql 3
    end
    #
    it "should shutdown" do
        EVAS.shutdown.should eql 2
        EVAS.shutdown.should eql 1
        EVAS.shutdown.should eql 0
    end
    #
end
