#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/eet/eet-defs'
require 'e17/eet/eet-funcs'
#
module E17
    module Eet
        #
        class << self
            #
            def open path, mode=FILE_MODE_READ, &blk
                if blk
                    f = eet_open path, mode
                    raise Exception.new "Unable to open file #{path}" if f.nil?
                    yield EetFile.new f
                    eet_close f
                else
                    f = eet_open path, mode
                    return EetFile.new f unless f.nil?
                end
            end
        end
        #
        class EetFile
            #
            def initialize ptr
                @ptr=ptr
            end
            private :initialize
            #
            def close
                Eet.eet_close @ptr
                @ptr=nil
            end
            #
            def mode_get
                Eet.eet_mode_get @ptr
            end
            #
            def write key, data, compress=false
                Eet.eet_write @ptr, key, FFI::MemoryPointer.from_string(data), data.bytesize, ( compress ? 1 : 0 )
            end
            #
            def read key
                ptr = FFI::MemoryPointer.new(:int)
                data = Eet.eet_read @ptr, key, ptr
                s = ptr.read_int
                ptr.free
                return nil if s==0
                ( data.null? ? nil : data.read_string[0..s-1] )
            end
            #
        end
        #
    end
end
#
# EOF
