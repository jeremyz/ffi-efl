#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/evas'
require 'efl/native/elementary'
#
module Efl
    #
    module Elm
        #
        def self.version
            Native::VersionStruct.new(Native.elm_version)
        end
        #
        class << self
            def init *args
                a = args.select { |e| e.is_a? String }
                a << __FILE__ if a.length==0
                ptr = FFI::MemoryPointer.new :pointer, a.length
                a.each_with_index do |s,i|
                    ptr[i].write_pointer FFI::MemoryPointer.from_string(s)
                end
                Native.elm_init a.length, ptr
            end
        end
        #
    end
end
#
# EOF
