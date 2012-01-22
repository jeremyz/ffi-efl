#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl'
require 'efl/native/eet'
#
module Efl
    #
    module Eet
        #
        def self.version
            Native::VersionStruct.new(Native.eet_version)
        end
        #
        class REetFile
            #
            include Efl::ClassHelper
            search_prefixes 'eet_'
            #
            def initialize ptr
                @ptr=ptr
            end
            private :initialize
            #
            def self.open path, mode=:eet_file_mode_read
                p = Native.eet_open path, mode
                raise Exception.new "Unable to open file #{path}" if p.nil?
                o = REetFile.new FFI::AutoPointer.new p, REetFile.method(:release)
                return o if not block_given?
                yield o
                o.close
                nil
            end
            def self.release p
                Native.eet_close f
            end
            def close
                @ptr.autorelease=false
                Native.eet_close @ptr
                @ptr = nil
            end
            #
            def write key, data, compress=false
                Native.eet_write @ptr, key, data, data.bytesize, ( compress ? 1 : 0 )
            end
            #
            def read key
                ptr = FFI::MemoryPointer.new(:int)
                data = Native.eet_read @ptr, key, ptr
                s = ptr.read_int
                ptr.free
                return nil if s==0
                ( data.null? ? nil : data.read_string[0..s-1] )
            end
            #
        end
        #
    end
    #
end
#
# EOF
