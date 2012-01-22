#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl'
require 'efl/native/eina'
#
module Efl
    #
    module Eina
        #
        def self.version
            Native::VersionStruct.new(Native.eina_version)
        end
        #
    end
    #
end
#
# EOF
