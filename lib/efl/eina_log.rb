#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina'
require 'efl/native/eina_log'
#
module Efl
    #
    module EinaLog
        #
        COLOR_LIGHTRED  ="\033[31;1m"
        COLOR_RED       ="\033[31m"
        COLOR_LIGHTBLUE ="\033[34;1m"
        COLOR_BLUE      ="\033[34m"
        COLOR_GREEN     ="\033[32;1m"
        COLOR_YELLOW    ="\033[33;1m"
        COLOR_ORANGE    ="\033[0;33m"
        COLOR_WHITE     ="\033[37;1m"
        COLOR_LIGHTCYAN ="\033[36;1m"
        COLOR_CYAN      ="\033[36m"
        COLOR_RESET     ="\033[0m"
        COLOR_HIGH      ="\033[1m"
        #
        def self.log_dom_crit dom, lvl, msg
            file, line, func = caller[1].split ':'
            Native.eina_log_print dom, lvl, file, func, line.to_i, msg
        end
        def self.log_dom_crit dom, msg
            self._log_dom dom, :eina_log_level_critical, msg
        end
        def self.log_dom_err dom, msg
            self._log_dom dom, :eina_log_level_err, msg
        end
        def self.log_dom_info dom, msg
            self._log_dom dom, :eina_log_level_info, msg
        end
        def self.log_dom_warn dom, msg
            self._log_dom dom, :eina_log_level_warn, msg
        end
        def self.log_dom_dbg dom, msg
            self._log_dom dom, :eina_log_level_dbg, msg
        end
        # should never be called directly
        def self._log lvl, msg
            file, line, func = caller[1].split ':'
            Native.eina_log_print Native.EINA_LOG_DOMAIN_GLOBAL, lvl, file, func, line.to_i, msg
        end
        class << self
            private :_log
        end
        #
        def self.log_crit msg
            self._log :eina_log_level_critical, msg
        end
        def self.log_err msg
            self._log :eina_log_level_err, msg
        end
        def self.log_info msg
            self._log :eina_log_level_info, msg
        end
        def self.log_warn msg
            self._log :eina_log_level_warn, msg
        end
        def self.log_dbg msg
            self._log :eina_log_level_dbg, msg
        end
        #
    end
    #
end
#
# EOF
