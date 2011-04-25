#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'stringio'
require 'efl/ecore'
require 'efl/ecore_getopt'
#
describe Efl::EcoreGetopt do
    #
    before(:each) do
        Efl::Ecore.init
        #
        @p = Efl::EcoreGetopt::Parser.new :prog =>"Prog", :usage => "Usage", :version => "0.0.0", :copyright => "less", :license => "MIT", :description => "description", :strict => 1
        def @p.cb parser, desc, string, data, value
            puts parser, desc, string, data, value
            true
        end
        #
        @values = {
            :license => FFI::MemoryPointer.new(:uchar),
            :copyright => FFI::MemoryPointer.new(:uchar),
            :version => FFI::MemoryPointer.new(:uchar),
            :help => FFI::MemoryPointer.new(:uchar),
        }
        [ :license, :copyright, :version, :help ].each do |sym|
            @values[sym].write_char 0
        end
        #
        @p.license 'L', 'license'
        @p.value :boolp, @values[:license]
        @p.copyright 'C', 'copyright'
        @p.value :boolp, @values[:copyright]
        @p.version 'V', 'version'
        @p.value :boolp, @values[:version]
        @p.help 'H', 'help'
        @p.value :boolp, @values[:help]
#        @p.store_type :int, 'i', 'int', 'store an integer'
#        @p.store_meta_type :double, 'd', 'double', 'store an double+meta', meta
#        @p.store_def_type :str, 's', 'str', 'store an string+default', "hello world"
#        @p.store_full_type :short, 's', 'short', 'store a short+full', 'meta', :ecore_getopt_desc_arg_requirement_yes, 666
#        @p.store_const 'c', 'const', 'store a constant', FFI::MemoryPointer.from_string("my constant")
#        @p.store_true 't', 'true', 'store true'
#        @p.store_false 'f', 'false', 'store false'
#        @p.choice 'm', 'many', 'store choice', ['ch1','ch2','ch3']
#        @p.append 'a', 'append', 'store append'
#        @p.count 'k', 'count', 'store count'
#        @p.callback_args 'b', 'callback', 'callback full', meta, p.method(:cb), 666
        @p.create
#        @p.debug
        #
    end
    #
    describe "license copyright version help" do
        it "should handle -L" do
            #
            [ :license, :copyright, :version, :help ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            args = @p.parse ["My lovely prog name","-L"]
            @values[:license].read_char.should eql 1
            [ :copyright, :version, :help ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            Efl::Ecore.shutdown
        end
        it "should handle --license" do
            #
            [ :license, :copyright, :version, :help ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            args = @p.parse ["My lovely prog name","--license"]
            @values[:license].read_char.should eql 1
            [ :copyright, :version, :help ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            Efl::Ecore.shutdown
        end
        it "should handle -C" do
            #
            [ :license, :copyright, :version, :help ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            args = @p.parse ["progname","-C"]
            @values[:copyright].read_char.should eql 1
            [ :license, :version, :help ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            Efl::Ecore.shutdown
        end
        it "should handle --copyright" do
            #
            [ :license, :copyright, :version, :help ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            args = @p.parse ["My lovely prog name","--copyright"]
            @values[:copyright].read_char.should eql 1
            [ :license, :version, :help ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            Efl::Ecore.shutdown
        end
        it "should handle -V" do
            #
            [ :license, :copyright, :version, :help ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            args = @p.parse ["My lovely prog name","-V"]
            @values[:version].read_char.should eql 1
            [ :license, :copyright, :help ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            Efl::Ecore.shutdown
        end
        it "should handle --version" do
            #
            [ :license, :copyright, :version, :help ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            args = @p.parse ["progname","--version"]
            @values[:version].read_char.should eql 1
            [ :license, :copyright, :help ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            Efl::Ecore.shutdown
        end
        it "should handle -H" do
            #
            [ :license, :copyright, :version, :help ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            args = @p.parse ["My lovely prog name","-H"]
            @values[:help].read_char.should eql 1
            [ :license, :copyright, :version ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            Efl::Ecore.shutdown
        end
        it "should handle --help" do
            #
            [ :license, :copyright, :version, :help ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            args = @p.parse ["progname","--help"]
            @values[:help].read_char.should eql 1
            [ :license, :copyright, :version ].each do |sym|
                @values[sym].read_char.should eql 0
            end
            Efl::Ecore.shutdown
        end
    end
end
