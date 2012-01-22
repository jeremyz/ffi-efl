#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina_list'
#
describe 'Efl::EinaList' do
    #
    before(:all) do
        REinaList = Efl::EinaList::REinaList
        Efl::Eina.init
    end
    after(:all) do
        Efl::Eina.shutdown
    end
    #
    it "should append prepend and fetch" do
        l = REinaList.new
        d1 = ::FFI::MemoryPointer.from_string "D0"
        d2 = ::FFI::MemoryPointer.from_string "D1"
        d3 = ::FFI::MemoryPointer.from_string "D2"
        d4 = ::FFI::MemoryPointer.from_string "D3"
        l.append d3
        l.prepend d2
        l << d4
        l.unshift d1
        0.upto 3 do |i|
            l.nth(i).read_string.should == "D#{i}"
        end
        l.each { |p| p.read_string.empty?.should be_false }
        l.free
    end
    #
    it "should be able to convert into ruby Array from NULL pointer" do
        ary = REinaList.new(FFI::Pointer::NULL).to_ary
        ary.empty?.should be_true
        ary.is_a?(Array).should be_true
    end
    #
    it "should be able to convert into ruby Array from empty REinaList" do
        ary = REinaList.new.to_a
        ary.empty?.should be_true
        ary.is_a?(Array).should be_true
    end
    #
    it "should be able to convert into ruby Array from non empty REinaList" do
        l = REinaList.new
        d1 = ::FFI::MemoryPointer.from_string "D0"
        d2 = ::FFI::MemoryPointer.from_string "D1"
        d3 = ::FFI::MemoryPointer.from_string "D2"
        d4 = ::FFI::MemoryPointer.from_string "D3"
        l.append d3
        l.prepend d2
        l << d4
        l.unshift d1
        ary = l.to_ary
        ary.length.should == 4
        0.upto 3 do |i|
            ary[i].read_string.should == "D#{i}"
        end
        l.free
    end
    #
    it "should be able to convert into ruby Array from non empty REinaList pointer" do
        l = REinaList.new
        d1 = ::FFI::MemoryPointer.from_string "D0"
        d2 = ::FFI::MemoryPointer.from_string "D1"
        d3 = ::FFI::MemoryPointer.from_string "D2"
        d4 = ::FFI::MemoryPointer.from_string "D3"
        l.append d3
        l.prepend d2
        l << d4
        l.unshift d1
        ary = l.to_a
        ary.length.should == 4
        0.upto 3 do |i|
            ary[i].read_string.should == "D#{i}"
        end
        l.free
    end
    #
    it "should be able to convert into ruby Array from non empty REinaList pointer" do
        l = REinaList.new
        d1 = ::FFI::MemoryPointer.from_string "D0"
        d2 = ::FFI::MemoryPointer.from_string "D1"
        d3 = ::FFI::MemoryPointer.from_string "D2"
        d4 = ::FFI::MemoryPointer.from_string "D3"
        l.append d3
        l.prepend d2
        l << d4
        l.unshift d1
        ary = l.to_a :string
        ary.length.should == 4
        0.upto 3 do |i|
            ary[i].should == "D#{i}"
        end
        l.free
    end
    #
    it "should be able to build from a ruby Array of pointers" do
        a =  []
        a << ::FFI::MemoryPointer.from_string("D0")
        a << ::FFI::MemoryPointer.from_string("D1")
        a << ::FFI::MemoryPointer.from_string("D2")
        a << ::FFI::MemoryPointer.from_string("D3")
        l = REinaList.new a
        0.upto 3 do |i|
            l.nth(i).read_string.should == "D#{i}"
        end
        l.free
    end
    #
    it "should be able to build from a ruby Array of int" do
        a =  [3,4,5,6]
        l = REinaList.from_a a, :int
        0.upto 3 do |i|
            l.nth(i).read_int.should == i+3
        end
        l.free
    end
    #
    it "Enumerable" do
        l = REinaList.new
        d1 = ::FFI::MemoryPointer.from_string "D0"
        d2 = ::FFI::MemoryPointer.from_string "D1"
        d3 = ::FFI::MemoryPointer.from_string "D2"
        d4 = ::FFI::MemoryPointer.from_string "D3"
        l.append d3
        l.prepend d2
        l << d4
        l.unshift d1
        r = 0
        l.each do |e| r+=1; end
        r.should == 4
        r = l.inject(0) do |s,e| s+=1; s; end
        r.should == 4
    end
end
