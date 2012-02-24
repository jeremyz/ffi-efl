#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina_log'
require './spec/helper'
#
describe 'Efl::EinaLog' do
    before(:all) do
        Efl::Eina.init
        EinaLog = Efl::EinaLog
    end
    after(:all) do
        Efl::Eina.shutdown
    end
    #
    it "level set/get" do
        EinaLog.level_set 2
        EinaLog.level_get.should == 2
        EinaLog.level = 3
        EinaLog.level.should == 3
    end
    #
    it "eina_log_level enum should be well defined" do
        Efl::Native.enum_value(:eina_log_level_critical).should == 0
        Efl::Native.enum_value(:eina_log_level_err).should == 1
        Efl::Native.enum_value(:eina_log_level_warn).should == 2
        Efl::Native.enum_value(:eina_log_level_info).should == 3
        Efl::Native.enum_value(:eina_log_level_dbg).should == 4
        Efl::Native.enum_value(:eina_log_levels).should == 5
        Efl::Native.enum_value(:eina_log_level_unknown).should == (-2147483647-1)
    end
    #
    it "color_disable set/get" do
        bool_check EinaLog, 'color_disable'
    end
    #
    it "file_disable set/get" do
        bool_check EinaLog, 'file_disable'
    end
    #
    it "function_disable set/get" do
        bool_check EinaLog, 'function_disable'
    end
    #
    it "abort_on_critical set/get" do
        bool_check EinaLog, 'abort_on_critical'
    end
    #
    it "abort_on_critical_level set/get" do
        EinaLog.abort_on_critical_level_set 2
        EinaLog.abort_on_critical_level_get.should == 2
        EinaLog.abort_on_critical_level = 3
        EinaLog.abort_on_critical_level.should == 3
    end
    #
    it "domain register, unregister, level set/get" do
        d = EinaLog.domain_register "mydom", EinaLog::COLOR_CYAN
        d.should > 0
        EinaLog.domain_level_set "mydom", 2
        EinaLog.domain_level_get("mydom").should == 2
        EinaLog.domain_registered_level_get(d).should == 2
        EinaLog.domain_level_set "mydom", 1
        EinaLog.domain_level_get("mydom").should == 1
        EinaLog.domain_registered_level_get(d).should == 1
        EinaLog.domain_unregister d
    end
    #
    it "treads enable check" do
        EinaLog.main_thread_check.should be_true
        EinaLog.threads_enable
    end
    #
end
