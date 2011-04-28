#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi/eet'
#
module Efl
    module Eet
        #
        class << self
            #
            def open path, mode=:eet_file_mode_read, &blk
                if blk
                    f = Efl::FFI.eet_open path, mode
                    raise Exception.new "Unable to open file #{path}" if f.nil?
                    yield EetFile.new f
                    Efl::FFI.eet_close f
                else
                    f = Efl::FFI.eet_open path, mode
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
                Efl::FFI.eet_close @ptr
                @ptr=nil
            end
            #
            def mode_get
                Efl::FFI.eet_mode_get @ptr
            end
            #
            def write key, data, compress=false
                Efl::FFI.eet_write @ptr, key, ::FFI::MemoryPointer.from_string(data), data.bytesize, ( compress ? 1 : 0 )
            end
            #
            def read key
                ptr = ::FFI::MemoryPointer.new(:int)
                data = Efl::FFI.eet_read @ptr, key, ptr
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
