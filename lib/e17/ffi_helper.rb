#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module FFIHelper
    def attach_fcts fcts
        fcts.each do |func|
            begin
                attach_function *func
            rescue Object => e
                puts "Could not attach #{func} #{e.message}"
            end
        end
    end
    def create_aliases l, fcts
        module_eval <<-code
        class << self
            #{fcts.map{ |f,a,r| "alias #{f.to_s[l..-1]} #{f}" }.join "\n" }
        end
        code
    end
end
#
# EOF
