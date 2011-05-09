#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ecore'
require 'efl/ecore_evas'
require 'efl/eina_list'
require 'efl/ecore_getopt'
#
describe Efl::EcoreGetopt do
    #
    after(:all) do
        Efl::Ecore.shutdown
    end
    before(:all) do
        Efl::Ecore.init
        #
        @p = Efl::EcoreGetopt::REcoreGetopt.new :prog =>"Prog", :usage => "Usage", :version => "0.0.0", :copyright => "less", :license => "MIT", :description => "description", :strict => 1
        @callback = Proc.new do |parser, desc, string, data, value|
            parser.address.should == @p.to_ptr.address
            string.should == "my_data"
            data.read_string.should == "cb_data"
            value.read_pointer.read_int.should == 99
            true
        end
        #
        @values = {
            :license => FFI::MemoryPointer.new(:uchar),
            :copyright => FFI::MemoryPointer.new(:uchar),
            :version => FFI::MemoryPointer.new(:uchar),
            :help => FFI::MemoryPointer.new(:uchar),
            :engines => FFI::MemoryPointer.new(:uchar),
            :int => FFI::MemoryPointer.new(:int),
            :double => FFI::MemoryPointer.new(:double),
            :short => FFI::MemoryPointer.new(:short),
            :long => FFI::MemoryPointer.new(:long),
            :const => FFI::MemoryPointer.new(:int),
            :true => FFI::MemoryPointer.new(:uchar),
            :false => FFI::MemoryPointer.new(:uchar),
            :choice => FFI::MemoryPointer.new(:pointer),
            :append => FFI::MemoryPointer.new(:pointer),
            :count => FFI::MemoryPointer.new(:int),
            :callback => FFI::MemoryPointer.new(:int),
        }
        @meta1 = FFI::MemoryPointer.from_string "My pretty"
        @meta2 = FFI::MemoryPointer.from_string "My precious"
        @cb_data = FFI::MemoryPointer.from_string "cb_data"
        #
        @p.license 'L', 'license'
        @p.value :boolp, @values[:license]
        @p.copyright 'C', 'copyright'
        @p.value :boolp, @values[:copyright]
        @p.version 'V', 'version'
        @p.value :boolp, @values[:version]
        @p.help 'H', 'help'
        @p.value :boolp, @values[:help]
        # FIXME debug callback : ecore_getopt_callback_ecore_evas_list_engines
#        @p.callback_noargs 'E', 'list-engines', 'list ecore-evas available engines', @engines_cb, FFI::Pointer::NULL
        @p.callback_noargs 'E', 'list-engines', 'list ecore-evas available engines', Efl::Native.method(:ecore_getopt_callback_ecore_evas_list_engines), FFI::Pointer::NULL
        @p.value :boolp, @values[:engines]
        @p.store_type :int, 'i', 'int', 'store an integer'
        @p.value :intp, @values[:int]
        @p.store_meta_type :double, 'd', 'double', 'store an double+meta', @meta1
        @p.value :doublep, @values[:double]
        @p.store_def_type :short, 's', 'short', 'store an short+default', 6
        @p.value :shortp, @values[:short]
        @p.store_full_type :long, 'l', 'long', 'store a long+full', @meta2, :ecore_getopt_desc_arg_requirement_yes, 666
        @p.value :longp, @values[:long]
        @p.store_const 'c', 'const', 'store a constant', 123456
        @p.value :intp, @values[:const]
        @p.store_true 't', 'true', 'store true'
        @p.value :boolp, @values[:false]
        @p.store_false 'f', 'false', 'store false'
        @p.value :boolp, @values[:true]
        @p.choice 'm', 'many', 'store choice', ['ch1','ch2','ch3']
        @p.value :strp, @values[:choice]
        @p.append 'a', 'append', 'store append', :ecore_getopt_type_int
        @p.value :listp, @values[:append]
        @p.count 'k', 'count', 'store count'
        @p.value :intp, @values[:count]
        @p.callback_args 'b', 'callback', 'callback full', @meta1, @callback, @cb_data
        @p.value :intp, @values[:callback]
        @p.create
#        puts @p.debug
        #
    end
    before(:each) do
        [ :license, :copyright, :version, :help, :engines ].each do |sym|
            @values[sym].write_char 0
        end
        @values[:int].write_int 0
        @values[:double].write_double 3.1415926
        @values[:short].write_short 9
        @values[:long].write_long 666
        @values[:const].write_int -666
        @values[:true].write_uchar 1
        @values[:false].write_uchar 0
        @values[:choice].write_pointer FFI::Pointer::NULL
        @values[:append].write_pointer FFI::Pointer::NULL
        @values[:count].write_int 664
        @values[:callback].write_int 99
    end
    #
    describe "license copyright version help" do
        it "should handle -L" do
            args = @p.parse ["My lovely prog name","-L"]
            @values[:license].read_char.should == 1
        end
        it "should handle --license" do
            args = @p.parse ["My lovely prog name","--license"]
            @values[:license].read_char.should == 1
        end
        it "should handle -C" do
            args = @p.parse ["progname","-C"]
            @values[:copyright].read_char.should == 1
        end
        it "should handle --copyright" do
            args = @p.parse ["My lovely prog name","--copyright"]
            @values[:copyright].read_char.should == 1
        end
        it "should handle -V" do
            args = @p.parse ["My lovely prog name","-V"]
            @values[:version].read_char.should == 1
        end
        it "should handle --version" do
            args = @p.parse ["progname","--version"]
            @values[:version].read_char.should == 1
        end
        it "should handle -H" do
            args = @p.parse ["My lovely prog name","-H"]
            @values[:help].read_char.should == 1
        end
        it "should handle --help" do
            args = @p.parse ["progname","--help"]
            @values[:help].read_char.should == 1
        end
        it "should handle -E" do
            args = @p.parse ["My lovely prog name","-E"]
            @values[:engines].read_char.should == 1
        end
        it "should handle --list-engines" do
            args = @p.parse ["My lovely prog name","--list-engines"]
            @values[:engines].read_char.should == 1
        end
    end
    describe "simple short options" do
        it "should handle -i" do
            @values[:int].read_int.should == 0
            args = @p.parse ["progname","-i 666"]
            @values[:int].read_int.should == 666
        end
        it "should handle -d" do
            @values[:double].read_double.should == 3.1415926
            args = @p.parse ["progname","-d 6.66"]
            @values[:double].read_double.should == 6.66
        end
        it "should handle -s" do
            @values[:short].read_short.should == 9
            args = @p.parse ["progname","-s 125"]
            @values[:short].read_short.should == 125
        end
        it "should handle -l" do
            @values[:long].read_long.should == 666
            args = @p.parse ["progname","-l 69"]
            @values[:long].read_long.should == 69
        end
        it "should handle -c" do
            @values[:const].read_int.should == -666
            args = @p.parse ["progname","-c"]
            @values[:const].read_int.should == 123456
        end
        it "should handle -t" do
            @values[:false].read_uchar.should == 0
            args = @p.parse ["progname","-t"]
            @values[:false].read_uchar.should == 1
        end
        it "should handle -f" do
            @values[:true].read_uchar.should == 1
            args = @p.parse ["progname","-f"]
            @values[:true].read_uchar.should == 0
        end
        it "should handle -m" do
            @values[:choice].read_pointer.should == FFI::Pointer::NULL
            args = @p.parse ["progname","-mch2"]
            @values[:choice].read_pointer.read_string.should == "ch2"
        end
        it "should handle -a" do
            @values[:append].read_pointer.should == FFI::Pointer::NULL
            args = @p.parse ["progname","-a10", "-a20"]
            l = Efl::EinaList::REinaList.new(@values[:append].read_pointer).to_a
            l[0].read_int.should==10
            l[1].read_int.should==20
        end
        it "should handle -k" do
            @values[:count].read_int.should == 664
            args = @p.parse ["progname","-kk"]
            @values[:count].read_int.should == 666
        end
        it "should handle -b" do
            args = @p.parse ["progname","-bmy_data"]
        end
    end
    describe "simple long options" do
        it "should handle --int" do
            @values[:int].read_int.should == 0
            args = @p.parse ["progname","--int=666"]
            @values[:int].read_int.should == 666
        end
        it "should handle --double" do
            @values[:double].read_double.should == 3.1415926
            args = @p.parse ["progname","--double=6.66"]
            @values[:double].read_double.should == 6.66
        end
        it "should handle --short" do
            @values[:short].read_short.should == 9
            args = @p.parse ["progname","--short=125"]
            @values[:short].read_short.should == 125
        end
        it "should handle --long" do
            @values[:long].read_long.should == 666
            args = @p.parse ["progname","--long=69"]
            @values[:long].read_long.should == 69
        end
        it "should handle --const" do
            @values[:const].read_int.should == -666
            args = @p.parse ["progname","--const"]
            @values[:const].read_int.should == 123456
        end
        it "should handle --true" do
            @values[:false].read_uchar.should == 0
            args = @p.parse ["progname","--true"]
            @values[:false].read_uchar.should == 1
        end
        it "should handle --false" do
            @values[:true].read_uchar.should == 1
            args = @p.parse ["progname","--false"]
            @values[:true].read_uchar.should == 0
        end
        it "should handle --many" do
            @values[:choice].read_pointer.should == FFI::Pointer::NULL
            args = @p.parse ["progname","--many=ch3"]
            @values[:choice].read_pointer.read_string.should == "ch3"
        end
        it "should handle -append" do
            @values[:append].read_pointer.should == FFI::Pointer::NULL
            args = @p.parse ["progname","--append=10", "--append=20"]
            l = Efl::EinaList::REinaList.new(@values[:append].read_pointer).to_a
            l[0].read_int.should==10
            l[1].read_int.should==20
        end
        it "should handle --count" do
            @values[:count].read_int.should == 664
            args = @p.parse ["progname","--count","--count"]
            @values[:count].read_int.should == 666
        end
        it "should handle --callback" do
            args = @p.parse ["progname","--callback=my_data"]
        end
    end
end
