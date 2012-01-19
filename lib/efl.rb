#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module Efl
    #
    VERSION = '0.0.10'
    #
    module Native
        #
        extend FFI::Library
        #
        def self.attach_fcts fcts
            fcts.each do |func|
                begin
                    attach_function(*func)
                rescue Object => e
                    puts "Could not attach #{func} #{e.message}"
                end
            end
        end
        #
        class << self
            # keep
            alias :ffi_lib_orig :ffi_lib
            def ffi_lib *names
                @all_ffi_libs||=[]
                @all_ffi_libs += ffi_lib_orig(names)
                @all_ffi_libs.uniq!
            end
            def find_variable name
                @all_ffi_libs.each do |lib|
                    address = lib.find_variable name
                    return address if not address.nil?
                end
                return nil
            end
        end
        #
        class VersionStruct < FFI::Struct
            layout  :major,     :int,
                    :minor,     :int,
                    :micro,     :int,
                    :revision,  :int

            def full
                [:major,:minor,:micro,:revision].collect { |e| self[e].to_s }.join '.'
            end
        end
    end
    #
    module MethResolver
        def self.resolve mod, meth, prefix
            meth_s = meth.to_s
            if meth_s =~/^(.*)=$/
                meth_s = $1+'_set'
                args_s = '*args[0]'
            elsif meth_s =~/^(.*)\?$/
                meth_s = $1+'_get'
                args_s = '*args'
            else
                args_s = '*args'
            end
            sym = (
                if Efl::Native.respond_to? prefix+meth_s
                    prefix+meth_s
                elsif Efl::Native.respond_to? meth_s
                    meth_s
                elsif Efl::Native.respond_to? prefix+meth_s+'_get'
                    prefix+meth_s+'_get'
                elsif Efl::Native.respond_to? meth_s+'_get'
                    meth_s+'_get'
                else
                    raise NameError.new "#{mod.name}.#{meth_s} (#{meth})"
                end
            )
            mod.module_eval "def self.#{meth} *args, &block; r=Efl::Native.#{sym}(#{args_s}); yield r if block_given?; r; end"
            sym
        end
    end
end
#
# EOF
