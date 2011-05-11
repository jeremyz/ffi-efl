#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina'
require 'efl/eina_log'
require './spec/helper'
#
describe Efl::EinaLog do
    before(:all) {
        Efl::Eina.init
        EinaLog = Efl::EinaLog
    }
    after(:all) {
        Efl::Eina.shutdown
    }
    #
    it "level set/get" do
        EinaLog.level_set 2
        EinaLog.level_get.should == 2
        EinaLog.level_set 3
        EinaLog.level_get.should == 3
    end
    #
    it "color_disable set/get" do
        EinaLog.color_disable_set true
        EinaLog.color_disable_get.should be_true
        EinaLog.color_disable_set false
        EinaLog.color_disable_get.should be_false
    end
    #
    it "file_disable set/get" do
        EinaLog.file_disable_set true
        EinaLog.file_disable_get.should be_true
        EinaLog.file_disable_set false
        EinaLog.file_disable_get.should be_false
    end
    #
    it "function_disable set/get" do
        EinaLog.function_disable_set true
        EinaLog.function_disable_get.should be_true
        EinaLog.function_disable_set false
        EinaLog.function_disable_get.should be_false
    end
    #
    it "abort_on_critical set/get" do
        EinaLog.abort_on_critical_set true
        EinaLog.abort_on_critical_get.should be_true
        EinaLog.abort_on_critical_set false
        EinaLog.abort_on_critical_get.should be_false
    end
    #
    it "abort_on_critical_level set/get" do
        EinaLog.abort_on_critical_level_set 2
        EinaLog.abort_on_critical_level_get.should == 2
        EinaLog.abort_on_critical_level_set 3
        EinaLog.abort_on_critical_level_get.should == 3
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
    # EAPI void eina_log_threads_enable(void);
    # EAPI void eina_log_print_cb_set(Eina_Log_Print_Cb cb, void *data);
    #
    # EAPI void eina_log_print(int domain, Eina_Log_Level level, const char *file, const char *function, int line, const char *fmt, ...);
    # EAPI void eina_log_vprint(int domain, Eina_Log_Level level, const char *file, const char *fnc, int line, const char *fmt, va_list args);
    # EAPI void eina_log_print_cb_stdout(const Eina_Log_Domain *d, Eina_Log_Level level, const char *file, const char *fnc, int line, const char *fmt, void *data, va_list args);
    # EAPI void eina_log_print_cb_stderr(const Eina_Log_Domain *d, Eina_Log_Level level, const char *file, const char *fnc, int line, const char *fmt, void *data, va_list args);
    # EAPI void eina_log_print_cb_file(const Eina_Log_Domain *d, Eina_Log_Level level, const char *file, const char *fnc, int line, const char *fmt, void *data, va_list args);
end
