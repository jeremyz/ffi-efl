#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module FFIHelper
    def attach_fcts
        @fcts.each do |func|
            begin
                attach_function *func
            rescue Object => e
                puts "Could not attach #{func} #{e.message}"
            end
        end
    end
    def create_aliases l
        @fcts.each do |f,a,r|
            module_eval <<-code
            class << self
                alias #{f.to_s[l..-1]} #{f}
            end
            code
        end
    end
end
#
# EOF
