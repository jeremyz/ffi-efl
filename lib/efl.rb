#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
#
module Efl
    #
    VERSION = '0.0.8'
    #
    PREFIX=`pkg-config --variable=exec_prefix ecore`.strip
    if PREFIX.empty?
        puts "unable to determine Efl::PREFIX using pkg-config"
    end
    PACKAGE_BIN_DIR = File.join PREFIX, 'bin'
    PACKAGE_LIB_DIR = File.join PREFIX, 'lib'
    PACKAGE_DATA_DIR = File.join PREFIX, 'share'
    #
    autoload :EcoreEvas,    './lib/efl/ecore_evas.rb'
    autoload :EcoreGetopt,  './lib/efl/ecore_getopt.rb'
    autoload :EcoreInput,   './lib/efl/ecore_input.rb'
    autoload :Ecore,        './lib/efl/ecore.rb'
    autoload :Edje,         './lib/efl/edje.rb'
    autoload :Eet,          './lib/efl/eet.rb'
    autoload :EinaHash,     './lib/efl/eina_hash.rb'
    autoload :EinaList,     './lib/efl/eina_list.rb'
    autoload :EinaLog,      './lib/efl/eina_log.rb'
    autoload :Eina,         './lib/efl/eina.rb'
    autoload :Elm,          './lib/efl/elementary.rb'
    autoload :Evas,         './lib/efl/evas.rb'
end
#
# EOF
