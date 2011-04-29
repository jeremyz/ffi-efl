#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi/eet'
#
module Efl
    #
    module Eet
        #
        class REetFile
            #
            include Efl::ClassHelper
            @search_paths = [ [Efl::Eet,'eet_'].freeze ]
            #
            def initialize ptr
                @ptr=ptr
            end
            private :initialize
            #
            def self.open path, mode=:eet_file_mode_read, &blk
                if blk
                    f = Efl::Eet.eet_open path, mode
                    raise Exception.new "Unable to open file #{path}" if f.nil?
                    yield REetFile.new f
                    Efl::Eet.eet_close f
                else
                    f = Efl::Eet.eet_open path, mode
                    return REetFile.new f unless f.nil?
                end
            end
            #
            def write key, data, compress=false
                Efl::Eet.eet_write @ptr, key, FFI::MemoryPointer.from_string(data), data.bytesize, ( compress ? 1 : 0 )
            end
            #
            def read key
                ptr = FFI::MemoryPointer.new(:int)
                data = Efl::Eet.eet_read @ptr, key, ptr
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
