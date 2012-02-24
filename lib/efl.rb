#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
module Efl
    #
    VERSION = '0.0.10'
    #
    module MethodResolver
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
    #
    module ClassHelper
        def to_a; [self] end
        def to_ary; [self] end
        def to_s; Object.instance_method(:to_s).bind(self).call+' ['+self.to_ptr.to_s+']' end
        alias :to_str :to_s
        def to_ptr; @ptr; end
        def === o; @ptr === o.to_ptr; end
        def null?; @ptr.null?; end
        def address; @ptr.address; end
        def self.included kls
            # create class instance @search_prefixes
            kls.class_eval "@search_prefixes ||=[]"
            # access and prepend *args to @search_prefixes
            kls.class_eval "def self.search_prefixes *args; @search_prefixes.unshift *args unless args.empty?; @search_prefixes; end"
            # on inheritance, copy ancestor's @search_prefixes
            kls.class_eval <<-EOF
            def self.inherited sub
                sub.class_eval '@search_prefixes = []'
                sub.search_prefixes *self.search_prefixes
            end
            EOF
        end
        def method_missing m, *args, &block
            m_s = m.to_s
            if m_s =~/^(.*)=$/
                m_s = $1+'_set'
                args_s = '*args[0]'
            elsif m_s =~/^(.*)\?$/
                m_s = $1+'_get'
                args_s = '*args'
            else
                args_s = '*args'
            end
            (['']+self.class.search_prefixes).each do |p|
                sym = p+m_s
                meth = (
                    if Efl::Native.respond_to? sym
                        sym
                    elsif Efl::Native.respond_to? m_s
                        m_s
                    elsif Efl::Native.respond_to? sym+'_get'
                        sym+'_get'
                    elsif Efl::Native.respond_to? m_s+'_get'
                        m_s+'_get'
                    else
                        nil
                    end
                )
                if not meth.nil?
                    self.class.class_eval "def #{m} *args, &block; r=Efl::Native.#{meth}(@ptr,#{args_s}); yield r if block_given?; r; end"
                    return self.send m, *args, &block
                end
            end
            Kernel.raise NameError.new "#{self.class.name} is unable to resolve #{m} within #{self.class.search_prefixes.inspect}"
        end
    end
    #
end
#
# EOF
