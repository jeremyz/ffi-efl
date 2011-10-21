#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ecore'
require 'efl/ecore_evas'
require 'efl/eina_list'
require 'efl/eina_rectangle'
require 'efl/ecore_getopt'
#
describe 'Efl::EcoreGetopt' do
    #
    after(:all) do
        Efl::Ecore.shutdown
    end
    before(:all) do
        Efl::Ecore.init
    end
    #
    before(:each) do
        #
        @p = Efl::EcoreGetopt::REcoreGetopt.new :prog =>"Prog", :usage => "Usage", :version => "0.0.0", :copyright => "less", :license => "MIT", :description => "description", :strict => 1
        #
        @callback = Proc.new do |parser, desc, string, data, storage|
            parser.address.should == @p.to_ptr.address
            Efl::Native::EcoreGetoptDesc.new(desc)[:shortname].chr.should == 'b'
            string.should == "user_arg"
            data.read_string.should == "cb_data"
            storage.read_pointer.read_int.should == 69
            storage.read_pointer.write_int 666
            true
        end
        @g = Efl::Native::EinaRectangleStruct.new
        @g[:x] = 100; @g[:y] = 200; @g[:w] = 300; @g[:h] = 400
        #
        # license and copyright share the same flag named quit
        @p.license 'L', 'license', 'quit'
        @p.copyright 'C', 'copyright', 'quit'
        @p.version 'V', 'version'
        @p.help 'H', 'help'
        @p.store 'i', 'int', 'store an integer', :int, 2
        @p.store_meta 'd', 'double', 'store an double+meta', "My pretty meta", :double, 3.1415926
        @p.store_def 's', 'string', 'store an string+default', :string, "default"
        @p.store_full 'l', 'long', 'store a long+full', "My precious meta", :ecore_getopt_desc_arg_requirement_yes, :long, 666
        @p.store_const 'c', 'const', 'store a constant', -666, 123456
        @p.store_true 't', 'true', 'store true'
        @p.store_false 'f', 'false', 'store false'
        @p.count 'k', 'count', 'store count', 664
        @p.append 'a', 'append', 'store append', :int, [1,2,3]
        @p.choice 'm', 'many', 'store choice', ['ch1','ch2','ch3']
        @p.callback_args 'b', 'callback', 'callback full', "Another meta", @callback, "cb_data", :int, 69
        @p.callback_noargs 'E', 'list-engines', 'list ecore-evas available engines',
            Efl::Native.method(:ecore_getopt_callback_ecore_evas_list_engines)
        @p.callback_args 'g', 'geometry', 'x:y:w:h', "X:Y:W:H",
            Efl::Native.method(:ecore_getopt_callback_geometry_parse), nil, :pointer, @g
        @p.create
        #
    end
    #
    describe "license copyright version help" do
        if ENV['DEBUG']
            it "DEBUG" do
                puts @p.debug
            end
        end
        it "should handle -L" do
            args = @p.parse ["My lovely prog name","-L"]
            @p['quit'].should == 1
        end
        it "should handle --license" do
            args = @p.parse ["My lovely prog name","--license"]
            @p['quit'].should == 1
        end
        it "should handle -C" do
            args = @p.parse ["progname","-C"]
            @p['quit'].should == 1
        end
        it "should handle --copyright" do
            args = @p.parse ["My lovely prog name","--copyright"]
            @p['quit'].should == 1
        end
        it "should handle -V" do
            args = @p.parse ["My lovely prog name","-V"]
            @p['V'].should == 1
        end
        it "should handle --version" do
            args = @p.parse ["progname","--version"]
            @p['V'].should == 1
        end
        it "should handle -H" do
            args = @p.parse ["My lovely prog name","-H"]
            @p['H'].should == 1
        end
        it "should handle --help" do
            args = @p.parse ["progname","--help"]
            @p['H'].should == 1
        end
    end
    describe "simple short options" do
        it "should handle -i" do
            @p['i'].should == 2
            args = @p.parse ["progname","-i 666"]
            @p['i'].should == 666
        end
        it "should handle -d" do
            @p['d'].should == 3.1415926
            args = @p.parse ["progname","-d 6.66"]
            @p['d'].should == 6.66
        end
        it "should handle -s" do
            @p['s'].should == 'default'
            args = @p.parse ["progname","-sset"]
            @p['s'].should == 'set'
        end
        it "should handle -l" do
            @p['l'].should == 666
            args = @p.parse ["progname","-l 69"]
            @p['l'].should == 69
        end
        it "should handle -c" do
            @p['c'].should == -666
            args = @p.parse ["progname","-c"]
            @p['c'].should == 123456
        end
        it "should handle -t" do
            @p['t'].should == 0
            args = @p.parse ["progname","-t"]
            @p['t'].should == 1
        end
        it "should handle -f" do
            @p['f'].should == 1
            args = @p.parse ["progname","-f"]
            @p['f'].should == 0
        end
        it "should handle -k" do
            @p['k'].should == 664
            args = @p.parse ["progname","-kk"]
            @p['k'].should == 666
        end
        it "should handle -a" do
            @p['a'].should == [1,2,3]
            args = @p.parse ["progname","-a10", "-a20"]
            @p['a'].should == [1,2,3,10,20]
        end
        it "should handle -m" do
            @p['m'].should == nil
            args = @p.parse ["progname","-mch2"]
            @p['m'].should == "ch2"
        end
        it "should handle -b" do
            @p['b'].should == 69
            args = @p.parse ["progname","-buser_arg"]
            @p['b'].should == 666
        end
        it "should handle -E" do
            args = @p.parse ["My lovely prog name","-E"]
            @p['E'].should == 1
        end
        it "should handle -g" do
            g = Efl::Native::EinaRectangleStruct.new @p['g']
            g[:x].should == 100
            g[:y].should == 200
            g[:w].should == 300
            g[:h].should == 400
            args = @p.parse ["progname","-g=10:20:30:40"]
            g = Efl::Native::EinaRectangleStruct.new @p['g']
            g[:x].should == 10
            g[:y].should == 20
            g[:w].should == 30
            g[:h].should == 40
        end
    end
    describe "simple long options" do
        it "should handle --int" do
            @p['i'].should == 2
            args = @p.parse ["progname","--int=666"]
            @p['i'].should == 666
        end
        it "should handle --double" do
            @p['d'].should == 3.1415926
            args = @p.parse ["progname","--double=6.66"]
            @p['d'].should == 6.66
        end
        it "should handle --string" do
            @p['s'].should == 'default'
            args = @p.parse ["progname","--string=set"]
            @p['s'].should == 'set'
        end
        it "should handle --long" do
            @p['l'].should == 666
            args = @p.parse ["progname","--long=69"]
            @p['l'].should == 69
        end
        it "should handle --const" do
            @p['c'].should == -666
            args = @p.parse ["progname","--const"]
            @p['c'].should == 123456
        end
        it "should handle --true" do
            @p['t'].should == 0
            args = @p.parse ["progname","--true"]
            @p['t'].should == 1
        end
        it "should handle --false" do
            @p['f'].should == 1
            args = @p.parse ["progname","--false"]
            @p['f'].should == 0
        end
        it "should handle --count" do
            @p['k'].should == 664
            args = @p.parse ["progname","--count","--count"]
            @p['k'].should == 666
        end
        it "should handle --append" do
            @p['a'].should == [1,2,3]
            args = @p.parse ["progname","--append=10", "--append=20"]
            @p['a'].should == [1,2,3,10,20]
        end
        it "should handle --many" do
            @p['m'].should == nil
            args = @p.parse ["progname","--many=ch3"]
            @p['m'].should == "ch3"
        end
        it "should handle --callback" do
            @p['b'].should == 69
            args = @p.parse ["progname","--callback=user_arg"]
            @p['b'].should == 666
        end
        it "should handle --list-engines" do
            args = @p.parse ["My lovely prog name","--list-engines"]
            @p['E'].should == 1
        end
        it "should handle --geometry" do
            g = Efl::Native::EinaRectangleStruct.new @p['g']
            g[:x].should == 100
            g[:y].should == 200
            g[:w].should == 300
            g[:h].should == 400
            args = @p.parse ["progname","--geometry=10:20:30:40"]
            g = Efl::Native::EinaRectangleStruct.new @p['g']
            g[:x].should == 10
            g[:y].should == 20
            g[:w].should == 30
            g[:h].should == 40
        end
    end
end
