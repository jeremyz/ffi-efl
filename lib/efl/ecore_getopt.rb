#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi/ecore_getopt'
#
module Efl
    #
    module EcoreGetopt
        #
        class Value < FFI::Union
            layout  :strp,          :pointer,
                    :boolp,         :eina_bool_p,
                    :shortp,        :short_p,
                    :intp,          :int_p,
                    :longp,         :long_p,
                    :ushortp,       :ushort_p,
                    :uintp,         :uint_p,
                    :ulongp,        :ulong_p,
                    :doublep,       :double_p,
                    :listp,         :eina_list_p,
                    :ptrp,          :void_p
        end
        #
        class DescStoreDef < FFI::Union
            layout  :strv,          :pointer,
                    :boolv,         :uchar,
                    :shortv,        :short,
                    :intv,          :int,
                    :longv,         :long,
                    :ushortv,       :ushort,
                    :uintv,         :uint,
                    :ulongv,        :ulong,
                    :doublev,       :double
        end
        #
        class DescStore < FFI::Struct
            layout  :type,          :ecore_getopt_type,                 # enum
                    :arg_req,       :ecore_getopt_desc_arg_requirement, # enum
                    :def,           DescStoreDef
        end
        #
        callback :ecore_getopt_desc_cb, [:ecore_getopt_p, :ecore_getopt_desc_p, :string, :pointer, :ecore_getopt_value_p ], :eina_bool
        #
        class DescCallback < FFI::Struct
            layout  :func,          :ecore_getopt_desc_cb,
                    :data,          :pointer,
                    :arg_req,       :ecore_getopt_desc_arg_requirement, # enum
                    :def,           :pointer
        end
        #
        class ActionParam < FFI::Union
            layout  :store,         DescStore,
                    :store_const,   :pointer,
                    :choices,       :pointer,
                    :append_type,   :ecore_getopt_type,                 # enum
                    :callback,      DescCallback,
                    :dummy,         :pointer
        end
        #
        class Desc < FFI::Struct
            layout  :shortname,     :char,
                    :longname,      :pointer,
                    :help,          :pointer,
                    :metavar,       :pointer,
                    :action,        :ecore_getopt_action,               # enum
                    :action_param,  ActionParam
        end
        #
        class EcoreGetopt < FFI::Struct
            layout  :prog,          :pointer,
                    :usage,         :pointer,
                    :version,       :pointer,
                    :copyright,     :pointer,
                    :license,       :pointer,
                    :description,   :pointer,
                    :strict,        :char
#                    :descs,         :pointer,   # NULL terminated  EcoreGetopt_Desc[]

            def desc_ptr idx
                Efl::EcoreGetopt::Desc.new to_ptr+Efl::EcoreGetopt::EcoreGetopt.size+(idx*Efl::EcoreGetopt::Desc.size)
            end
        end
        #
        class REcoreGetopt
            def initialize desc
                @ecore_getopt = nil
                @desc = desc
                @options = [
                    [ 0, FFI::Pointer::NULL, FFI::Pointer::NULL, FFI::Pointer::NULL, 0, {:dummy=>FFI::Pointer::NULL} ]
                ]
                @values = [
                    [ :ptrp, FFI::Pointer::NULL ]
                ]
                @refs = [] # to prevent FFI::MemoryPointer.from_string from beeing GC'ed
            end
            def p_from_string r
                return r if r==FFI::Pointer::NULL
                p = FFI::MemoryPointer.from_string r
                @refs << p
                p
            end
            private :p_from_string
            def << o
                @options.insert -2, o
            end
            def value type, ptr
                @values.insert -2, [ type, ptr ]
            end
            def to_ptr
                @ecore_getopt.to_ptr
            end
            def create
                @ecore_getopt = Efl::EcoreGetopt::EcoreGetopt.new( FFI::MemoryPointer.new( :uchar, Efl::EcoreGetopt::EcoreGetopt.size+Efl::EcoreGetopt::Desc.size*@options.length) )
                [:prog,:usage,:version,:copyright,:license,:description].each do |sym|
                    @ecore_getopt[sym] = ( @desc.has_key?(sym) ? FFI::MemoryPointer.from_string(@desc[sym]) : FFI::Pointer::NULL )
                end
                @ecore_getopt[:strict] = @desc[:strict] if @desc.has_key? :strict
                @options.each_with_index do |o,i|
                    d = @ecore_getopt.desc_ptr i
                    d[:shortname] = o[0].to_s.bytes.first
                    d[:longname] = p_from_string o[1]
                    d[:help] = p_from_string o[2]
                    d[:metavar] = o[3]
                    d[:action] = o[4]
                    k, v = o[5]
                    case k
                    when :dummy
                        d[:action_param][:dummy] = v
                    when :callback
                        cb = d[:action_param][:callback]
                        cb[:func] = v[0]
                        cb[:data] = v[1]
                        cb[:arg_req] = v[2]
                        cb[:def] = v[3]
                    when :store
                        st = d[:action_param][:store]
                        st[:type] = v[0]
                        st[:arg_req] = v[1]
                        if not v[2].nil?
                            if v[2][0]==:strv
                                st[:def][:strv] = p_from_string v[2][1]
                            else
                                st[:def][v[2][0]] = v[2][1]
                            end
                        end
                    when :store_const
                        d[:action_param][:store_const] = v
                    when :choices
                        d[:action_param][:choices] = v
                    when :append
                        d[:action_param][:append_type] = v
                    else
                        d[:action_param][:dummy] = FFI::Pointer::NULL
                    end
                end
                @values_p = FFI::MemoryPointer.new Efl::EcoreGetopt::Value, @values.length, false
                @values.each_with_index do |v,i|
                    Efl::EcoreGetopt::Value.new(@values_p+(i*Efl::EcoreGetopt::Value.size))[v[0]] = v[1]
                end
            end
            def parse argv
                ptr = FFI::MemoryPointer.new(:pointer, argv.length+1)
                argv.each_with_index do |s, i|
                    ptr[i].put_pointer 0, p_from_string(s)
                end
                ptr[argv.length].put_pointer 0, FFI::Pointer::NULL
                Efl::EcoreGetopt.ecore_getopt_parse @ecore_getopt, @values_p, argv.length, ptr
            end
            def store_full short, long, help, meta, type, arg_req, def_val
                self << [ short, long, help, meta, :ecore_getopt_action_store, [:store, [type,arg_req, def_val] ] ]
            end
            def store short, long, help, type
                store_full short, long, help, FFI::Pointer::NULL, type, :ecore_getopt_desc_arg_requirement_yes, nil
            end
            def store_type type, short, long, help
                store short, long, help, ('ecore_getopt_type_'+type.to_s).to_sym
            end
            def store_metavar short, long, help, meta, type
                store_full short, long, help, meta, type, :ecore_getopt_desc_arg_requirement_yes, nil
            end
            def store_meta_type type, short, long, help, meta
                store_metavar short, long, help, meta, ('ecore_getopt_type_'+type.to_s).to_sym
            end
            def store_def short, long, help, type, def_val
                store_full short, long, help, FFI::Pointer::NULL, type, :ecore_getopt_desc_arg_requirement_optional, def_val
            end
            def store_def_type type, short, long, help, def_val
                store_def short, long, help, ('ecore_getopt_type_'+type.to_s).to_sym, [ (type.to_s+'v').to_sym, def_val ]
            end
            def store_full_type type, short, long, help, meta, arg_req, def_val
                store_full short, long, help, meta, ('ecore_getopt_type_'+type.to_s).to_sym, arg_req, [ (type.to_s+'v').to_sym, def_val ]
            end
            def store_const short, long, help, value
                self << [ short, long, help, FFI::Pointer::NULL, :ecore_getopt_action_store_const, [:store_const, value] ]
            end
            def store_true short, long, help
                self << [ short, long, help, FFI::Pointer::NULL, :ecore_getopt_action_store_true, [:dummy,FFI::MemoryPointer::NULL] ]
            end
            def store_false short, long, help
                self << [ short, long, help, FFI::Pointer::NULL, :ecore_getopt_action_store_false, [:dummy,FFI::MemoryPointer::NULL] ]
            end
            def choice short, long, help, choices
                ptr = FFI::MemoryPointer.new(:pointer, choices.length+1)
                choices.each_with_index do |s, i|
                    ptr[i].put_pointer 0, p_from_string(s)
                end
                ptr[choices.length].put_pointer 0, FFI::Pointer::NULL
                self << [ short, long, help, FFI::Pointer::NULL, :ecore_getopt_action_choice, [:choices,ptr] ]
            end
            def choice_metavar short, long, help, meta, choices
                ptr = FFI::MemoryPointer.new(:pointer, choices.length+1)
                choices.each_with_index do |s, i|
                    ptr[i].put_pointer 0, p_from_string(s)
                end
                ptr[choices.length].put_pointer 0, FFI::Pointer::NULL
                self << [ short, long, help, meta, :ecore_getopt_action_choice, [:choices,ptr] ]
            end
            def append short, long, help, sub_type
                self << [ short, long, help, FFI::Pointer::NULL, :ecore_getopt_action_append, [:append,sub_type] ]
            end
            def append_metavar short, long, help, meta, sub_type
                self << [ short, long, help, meta, :ecore_getopt_action_append, [:append,sub_type] ]
            end
            def count short, long, help
                self << [ short, long, help, FFI::Pointer::NULL, :ecore_getopt_action_count, [:dummy,FFI::Pointer::NULL] ]
            end
            def callback_full short, long, help, meta, cb, data, arg_req, def_val
                self << [ short, long, help, meta, :ecore_getopt_action_callback, [:callback, [cb, data, arg_req,def_val] ] ]
            end
            def callback_noargs short, long, help, cb, data
                callback_full short, long, help, FFI::Pointer::NULL, cb, data, :ecore_getopt_desc_arg_requirement_no, FFI::Pointer::NULL
            end
            def callback_args short, long, help, meta, cb, data
                callback_full short, long, help, meta, cb, data, :ecore_getopt_desc_arg_requirement_yes, FFI::Pointer::NULL
            end
            def help short, long
                self << [ short, long, 'show this message.', FFI::Pointer::NULL, :ecore_getopt_action_help, [:dummy,FFI::Pointer::NULL] ]
            end
            def version short, long
                self << [ short, long, 'show program version.', FFI::Pointer::NULL, :ecore_getopt_action_version, [:dummy,FFI::Pointer::NULL] ]
            end
            def copyright short, long
                self << [ short, long, 'show copyright.', FFI::Pointer::NULL, :ecore_getopt_action_copyright, [:dummy,FFI::Pointer::NULL] ]
            end
            def license short, long
                self << [ short, long, 'show license.', FFI::Pointer::NULL, :ecore_getopt_action_license, [:dummy,FFI::Pointer::NULL] ]
            end
#            def sentinel
#                self << [ 0, FFI::Pointer::NULL, FFI::Pointer::NULL, FFI::Pointer::NULL, 0, {:dummy=>FFI::Pointer::NULL} ]
#            end
            #
            def debug
                r = ''
                r << "#{self.class} : #{@ecore_getopt.to_ptr}\n"
                [:prog,:usage,:version,:copyright,:license,:description].each do |sym|
                    r<< "  #{sym.to_s} : #{@ecore_getopt[sym]==FFI::Pointer::NULL ? 'NULL' : @ecore_getopt[sym].read_string}\n"
                end
                r << "  strict : #{@ecore_getopt[:strict]}\n"
                i=0
                while true
                    d = @ecore_getopt.desc_ptr i
                    break if d[:shortname]==0 and d[:longname] == FFI::Pointer::NULL
                    r << "    desc #{d.to_ptr}\n"
                    r << "     short: #{d[:shortname].chr}\n" unless d[:shortname]==0
                    r << "     long:  #{d[:longname].read_string}\n" unless d[:longname]==FFI::Pointer::NULL
                    r << "     help:  #{d[:help].read_string}\n" unless d[:help]==FFI::Pointer::NULL
                    i+=1
                end
                r
            end
        end
    end
    #
end
#
# EOF
