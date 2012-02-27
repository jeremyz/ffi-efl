#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina_hash'
#
describe 'Efl::EinaHash' do
    #
    before(:all) do
        REinaHash = Efl::EinaHash::REinaHash
        Efl::Eina.init
        @d0 = FFI::MemoryPointer.from_string "D0"
        @d1 = FFI::MemoryPointer.from_string "D1"
        @d2 = FFI::MemoryPointer.from_string "D2"
        @d3 = FFI::MemoryPointer.from_string "D3"
    end
    after(:all) do
        Efl::Eina.shutdown
    end
    #
    it "should append prepend and fetch" do
        h = REinaHash.new
        h.add 'k2', @d2
        h.add 'k1', @d1
        h['k3']=@d3
        h['k0']=@d0
        h['k0'].read_string.should == "D0"
        h['k1'].read_string.should == "D1"
        h['k2'].read_string.should == "D2"
        h['k3'].read_string.should == "D3"
        cpt=0
        h.each { |k,v|
            cpt+=1
            v.read_string.empty?.should be_false
        }
        cpt.should == 4
    end
    #
    it "should be able to convert into ruby Hash from NULL pointer" do
        h = REinaHash.new(FFI::Pointer::NULL).to_h
        h.empty?.should be_true
        h.is_a?(Hash).should be_true
    end
    #
    it "should be able to convert into ruby Hash from empty REinaHash" do
        h = REinaHash.new(FFI::Pointer::NULL).to_h
        h.empty?.should be_true
        h.is_a?(Hash).should be_true
    end
    #
    it "should be able to convert into ruby Hash from non empty REinaHash" do
        h = REinaHash.new
        d0 = FFI::MemoryPointer.from_string "D0"
        d1 = FFI::MemoryPointer.from_string "D1"
        d2 = FFI::MemoryPointer.from_string "D2"
        d3 = FFI::MemoryPointer.from_string "D3"
        h.add 'k2', d2
        h.add 'k1', d1
        h['k3']=d3
        h["k0"]=d0
        h["k0"].read_string.should == "D0"
        h['k1'].read_string.should == "D1"
        h['k2'].read_string.should == "D2"
        h['k3'].read_string.should == "D3"
        cpt=0
        h.each { |k,v|
            cpt+=1
            v.read_string.empty?.should be_false
            true
        }
        cpt.should == 4
        rh = h.to_h
        rh.length.should == 4
        rh2 = {}
        rh.each { |k,v|
            rh2[k.read_string]=v.read_string
            true
        }
        rh2['k0'].should == 'D0'
        rh2['k1'].should == 'D1'
        rh2['k2'].should == 'D2'
        rh2['k3'].should == 'D3'
    end
    #
    it "should be able to convert into ruby Hash from non empty REinaHash pointer" do
        h = REinaHash.new
        d0 = FFI::MemoryPointer.from_string "D0"
        d1 = FFI::MemoryPointer.from_string "D1"
        d2 = FFI::MemoryPointer.from_string "D2"
        d3 = FFI::MemoryPointer.from_string "D3"
        h.add 'k2', d2
        h.add 'k1', d1
        h['k3']=d3
        h['k0']=d0
        h['k0'].read_string.should == "D0"
        h['k1'].read_string.should == "D1"
        h['k2'].read_string.should == "D2"
        h['k3'].read_string.should == "D3"
        rh = h.to_h
        rh.length.should == 4
    end
    #
    it "should be able to convert into ruby Hash from non empty REinaHash pointer, with key from string" do
        h = REinaHash.new
        d0 = FFI::MemoryPointer.from_string "D0"
        d1 = FFI::MemoryPointer.from_string "D1"
        d2 = FFI::MemoryPointer.from_string "D2"
        d3 = FFI::MemoryPointer.from_string "D3"
        h.add 'k2', d2
        h.add 'k1', d1
        h['k3']=d3
        h['k0']=d0
        h['k0'].read_string.should == "D0"
        h['k1'].read_string.should == "D1"
        h['k2'].read_string.should == "D2"
        h['k3'].read_string.should == "D3"
        rh =  h.to_h_conv
        rh.length.should == 4
        rh['k0'].read_string.should == "D0"
        rh['k1'].read_string.should == "D1"
        rh['k2'].read_string.should == "D2"
        rh['k3'].read_string.should == "D3"
    end
    #
    it "should be able to convert into ruby Hash from non empty REinaHash pointer, with key from string block" do
        h = REinaHash.new
        d0 = FFI::MemoryPointer.from_string "D0"
        d1 = FFI::MemoryPointer.from_string "D1"
        d2 = FFI::MemoryPointer.from_string "D2"
        d3 = FFI::MemoryPointer.from_string "D3"
        h.add 'k2', d2
        h.add 'k1', d1
        h['k3']=d3
        h['k0']=d0
        h['k0'].read_string.should == "D0"
        h['k1'].read_string.should == "D1"
        h['k2'].read_string.should == "D2"
        h['k3'].read_string.should == "D3"
        cpt=0
        rh =  h.to_h_conv { |k| cpt+=1; k.read_string }
        cpt.should == 4
        rh.length.should == 4
        rh['k0'].read_string.should == "D0"
        rh['k1'].read_string.should == "D1"
        rh['k2'].read_string.should == "D2"
        rh['k3'].read_string.should == "D3"
    end
    #
    it "should be able to build REinaHash from ruby Hash" do
        rh = {}
        k0 = FFI::MemoryPointer.from_string "0"
        k1 = FFI::MemoryPointer.from_string "1"
        k2 = FFI::MemoryPointer.from_string "2"
        k3 = FFI::MemoryPointer.from_string "3"
        d0 = FFI::MemoryPointer.from_string "D0"
        d1 = FFI::MemoryPointer.from_string "D1"
        d2 = FFI::MemoryPointer.from_string "D2"
        d3 = FFI::MemoryPointer.from_string "D3"
        rh[k0]=d0
        rh[k1]=d1
        rh[k2]=d2
        rh[k3]=d3
        h = REinaHash.new rh
        h[k0].read_string.should == "D0"
        h[k1].read_string.should == "D1"
        h[k2].read_string.should == "D2"
        h[k3].read_string.should == "D3"
    end
    #
    it "alternate constructor" do
        cstr_cnt = 0
        h = REinaHash.new { cstr_cnt+=1; Efl::Native.eina_hash_string_superfast_new FFI::Pointer::NULL }
        cstr_cnt.should == 1
    end
end
