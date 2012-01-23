#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl'
require 'efl/native/ecore_getopt'
#
module Efl
    #
    module Native
        #
        class EcoreGetoptValue < FFI::Union
            layout  :strp,          :pointer,
                    :boolp,         :pointer,
                    :shortp,        :pointer,
                    :intp,          :pointer,
                    :longp,         :pointer,
                    :ushortp,       :pointer,
                    :uintp,         :pointer,
                    :ulongp,        :pointer,
                    :doublep,       :pointer,
                    :listp,         :pointer,
                    :ptrp,          :pointer

            def value_ptr idx
                Native::EcoreGetoptValue.new to_ptr+(idx*Native::EcoreGetoptValue.size)
            end
        end
        #
        class EcoreGetoptDescStoreDef < FFI::Union
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
        class EcoreGetoptDescStore < FFI::Struct
            layout  :type,          :ecore_getopt_type,                 # enum
                    :arg_req,       :ecore_getopt_desc_arg_requirement, # enum
                    :def,           EcoreGetoptDescStoreDef
        end
        #
        callback :ecore_getopt_desc_cb, [:pointer, :pointer, :string, :pointer, :pointer ], :eina_bool
        #
        class EcoreGetoptDescCallback < FFI::Struct
            layout  :func,          :ecore_getopt_desc_cb,
                    :data,          :pointer,
                    :arg_req,       :ecore_getopt_desc_arg_requirement, # enum
                    :def,           :pointer
        end
        #
        class EcoreGetoptActionParam < FFI::Union
            layout  :store,         EcoreGetoptDescStore,
                    :store_const,   :pointer,
                    :choices,       :pointer,
                    :append_type,   :ecore_getopt_type,                 # enum
                    :callback,      EcoreGetoptDescCallback,
                    :dummy,         :pointer
        end
        #
        class EcoreGetoptDesc < FFI::Struct
            layout  :shortname,     :char,
                    :longname,      :pointer,
                    :help,          :pointer,
                    :metavar,       :pointer,
                    :action,        :ecore_getopt_action,               # enum
                    :action_param,  EcoreGetoptActionParam
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
#                        :descs,         :pointer,   # NULL terminated  EcoreGetopt_Desc[]

            def desc_ptr idx
                Native::EcoreGetoptDesc.new to_ptr+Native::EcoreGetopt.size+(idx*Native::EcoreGetoptDesc.size)
            end
        end
    end
    #
    module EcoreGetopt
        #
        class REcoreGetopt
            #
            def initialize desc
                @pts = []
                @ecore_getopt_st = nil
                @ecore_values_st = nil
                @desc = desc
                @options = [
                    [ 0 ],
                ]
                @values = {
                    :sentinel0 => [ :pointer, FFI::Pointer::NULL ]
                }
                @values_order = [ :sentinel0 ]
                @types = {
                    :string => [ :ecore_getopt_type_str, :strv, :strp ],
                    :uchar  => [ :ecore_getopt_type_bool, :boolv, :boolp ],
                    :short  => [ :ecore_getopt_type_short, :shortv, :shortp ],
                    :int    => [ :ecore_getopt_type_int, :intv, :intp ],
                    :long   => [ :ecore_getopt_type_long, :longv, :longp ],
                    :ushort => [ :ecore_getopt_type_ushort, :ushortv, :ushortp ],
                    :uint   => [ :ecore_getopt_type_uint, :uintv, :uintp ],
                    :ulong  => [ :ecore_getopt_type_ulong, :ulongv, :ulongp ],
                    :double => [ :ecore_getopt_type_double, :doublev, :doublep ],
                    :list   => [ :list, nil, :listp ],
                    :pointer=> [ :pointer, nil, :ptrp ],
                    :choice => [ :pointer, nil, :ptrp ]
                }
            end
            def want_p r
                return r if r.is_a? FFI::Pointer
                return FFI::Pointer::NULL if r.nil?
                p = FFI::MemoryPointer.from_string r
                @pts << p
                p
            end
            private :want_p
            def set_option o
                @options.insert -2, o
            end
            def set_value key, ptype, val=nil
                skey = key.to_s
                r = @values[skey]
                if r.nil?
                    case ptype
                    when :list
                        p = FFI::MemoryPointer.new :pointer
                        p.write_pointer val[0]
                        r = @values[skey] = [ ptype, p, val[1] ]    # add sub_type info
                    when :choice
                        p = FFI::MemoryPointer.new :pointer
                        p.write_pointer FFI::Pointer::NULL
                        r = @values[skey] = [ ptype, p ]
                    when :string
                        p = FFI::MemoryPointer.new :pointer
                        p.write_pointer FFI::Pointer::NULL
                        r = @values[skey] = [ ptype, p ]
                    when :pointer
                        r = @values[skey] = [ ptype, val ]
                    else
                        p = FFI::MemoryPointer.new ptype
                        p.send 'write_'+ptype.to_s, val unless val.nil?
                        r = @values[skey] = [ ptype, p ]
                    end
                    @pts << p
                end
                @values_order.insert -2, skey
                r
            end
            def [] k
                ptype, ptr, sub_type = @values[k.to_s]
                return nil if ptype.nil?
                case ptype
                when:list
                    require 'efl/eina_list'
                    Efl::EinaList::REinaList.new(ptr.read_pointer).to_a sub_type
                when :choice
                    p = ptr.read_pointer
                    ( p==FFI::Pointer::NULL ? nil : p.read_string )
                when :string
                    p = ptr.read_pointer
                    (p==FFI::Pointer::NULL ? nil : p.read_string )
                when :pointer
                    ptr.to_ptr
                else
                    ptr.send 'read_'+ptype.to_s
                end
            end
            def to_ptr
                ( @ecore_getopt_st.nil? ? nil : @ecore_getopt_st.to_ptr )
            end
            def create
                @ecore_getopt_st = Native::EcoreGetopt.new( FFI::MemoryPointer.new( :uchar, Native::EcoreGetopt.size+Native::EcoreGetoptDesc.size*@options.length) )
                [:prog,:usage,:version,:copyright,:license,:description].each do |sym|
                    @ecore_getopt_st[sym] = ( @desc.has_key?(sym) ? FFI::MemoryPointer.from_string(@desc[sym]) : FFI::Pointer::NULL )
                end
                @ecore_getopt_st[:strict] = @desc[:strict] if @desc.has_key? :strict
                @options.each_with_index do |o,i|
                    d = @ecore_getopt_st.desc_ptr i
                    if o[0]==0
                        d[:shortname] = d[:longname] = d[:help] = d[:metavar] = d[:action] = d[:action_param][:dummy] = 0
                        break
                    end
                    d[:shortname] = o[0].to_s.bytes.first
                    d[:longname] = want_p o[1]
                    d[:help] = want_p o[2]
                    d[:metavar] = want_p o[3]
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
                        st[:def][v[2]] = (v[2]==:strv ?  want_p(v[3]) : v[3] ) unless v[3].nil?
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
                @ecore_values_st = Native::EcoreGetoptValue.new FFI::MemoryPointer.new Native::EcoreGetoptValue, @values_order.length, false
                @values_order.each_with_index do |k,i|
                    vtype, vpointer, *sub_type = @values[k]
                    vpointer.write_pointer @ecore_getopt_st.desc_ptr(i)[:action_param][:store][:def][:strv] if vtype==:string
                    etype, vfield, pfield = @types[vtype]
                    @ecore_values_st.value_ptr(i)[pfield] = vpointer
                end
                self
            end
            def parse argv
                ptr = FFI::MemoryPointer.new(:pointer, argv.length+1)
                argv.each_with_index do |s, i|
                    ptr[i].put_pointer 0, want_p(s)
                end
                ptr[argv.length].put_pointer 0, FFI::Pointer::NULL
                Native.ecore_getopt_parse @ecore_getopt_st, @ecore_values_st, argv.length, ptr
            end
            def help short, long, key=nil
                set_value key||short, :uchar, 0
                set_option [ short, long, 'show this message.', FFI::Pointer::NULL, :ecore_getopt_action_help, [:dummy,FFI::Pointer::NULL] ]
            end
            def version short, long, key=nil
                set_value key||short, :uchar, 0
                set_option [ short, long, 'show program version.', FFI::Pointer::NULL, :ecore_getopt_action_version, [:dummy,FFI::Pointer::NULL] ]
            end
            def copyright short, long, key=nil
                set_value key||short, :uchar, 0
                set_option [ short, long, 'show copyright.', FFI::Pointer::NULL, :ecore_getopt_action_copyright, [:dummy,FFI::Pointer::NULL] ]
            end
            def license short, long, key=nil
                set_value key||short, :uchar, 0
                set_option [ short, long, 'show license.', FFI::Pointer::NULL, :ecore_getopt_action_license, [:dummy,FFI::Pointer::NULL] ]
            end
            def store_full short, long, help, meta, arg_req, type, def_val
                vtype, vpointer = set_value short, type, def_val
                etype, vfield, pfield = @types[vtype]
                set_option [ short, long, help, meta, :ecore_getopt_action_store, [:store, [etype, arg_req, vfield, def_val] ] ]
            end
            def store short, long, help, type, def_val=nil
                store_full short, long, help, FFI::Pointer::NULL, :ecore_getopt_desc_arg_requirement_yes, type, def_val
            end
            def store_meta short, long, help, meta, type, def_val=nil
                store_full short, long, help, meta, :ecore_getopt_desc_arg_requirement_yes, type, def_val
            end
            def store_def short, long, help, type, def_val
                store_full short, long, help, FFI::Pointer::NULL, :ecore_getopt_desc_arg_requirement_optional, type, def_val
            end
            def store_const short, long, help, def_val, value
                set_value short, :int, def_val
                set_option [ short, long, help, FFI::Pointer::NULL, :ecore_getopt_action_store_const, [:store_const, value] ]
            end
            def store_true short, long, help
                set_value short, :uchar, 0
                set_option [ short, long, help, FFI::Pointer::NULL, :ecore_getopt_action_store_true, [:dummy,FFI::MemoryPointer::NULL] ]
            end
            def store_false short, long, help
                set_value short, :uchar, 1
                set_option [ short, long, help, FFI::Pointer::NULL, :ecore_getopt_action_store_false, [:dummy,FFI::MemoryPointer::NULL] ]
            end
            def count short, long, help, def_val
                set_value short, :int, def_val
                set_option [ short, long, help, FFI::Pointer::NULL, :ecore_getopt_action_count, [:dummy,FFI::Pointer::NULL] ]
            end
            def append_meta short, long, help, meta, sub_type, def_val=nil
                if def_val.nil?
                    p = FFI::Pointer::NULL
                else
                    p = def_val.inject(FFI::Pointer::NULL) { |list,e|
                        ptr = FFI::MemoryPointer.new sub_type
                        @pts << ptr
                        ptr.send 'write_'+sub_type.to_s, e
                        Native.eina_list_append list, ptr
                    }
                end
                set_value short, :list, [want_p(p),sub_type]
                set_option [ short, long, help, meta, :ecore_getopt_action_append, [:append,@types[sub_type][0]] ]
            end
            def append short, long, help, sub_type, def_val=nil
                append_meta short, long, help, FFI::Pointer::NULL, sub_type, def_val
            end
            def choice_meta short, long, help, meta, choices
                p = FFI::MemoryPointer.new(:pointer, choices.length+1)
                @pts << p
                choices.each_with_index do |s, i|
                        p[i].put_pointer 0, want_p(s)
                end
                p[choices.length].put_pointer 0, FFI::Pointer::NULL
                set_value short, :choice
                set_option [ short, long, help, meta, :ecore_getopt_action_choice, [:choices,p] ]
            end
            def choice short, long, help, choices
                choice_meta short, long, help, FFI::Pointer::NULL, choices
            end
            def callback_full short, long, help, meta, cb, data, arg_req, type, def_val
                pt, ptr = set_value short, type, def_val
                arg_req = ( arg_req ? :ecore_getopt_desc_arg_requirement_yes : :ecore_getopt_desc_arg_requirement_no )
                set_option [ short, long, help, meta, :ecore_getopt_action_callback, [:callback, [cb, want_p(data), arg_req, ptr ] ] ]
            end
            def callback_noargs short, long, help, cb, data=nil
                callback_full short, long, help, FFI::Pointer::NULL, cb, data, false, :uchar, 0
            end
            def callback_args short, long, help, meta, cb, data, type, def_val
                callback_full short, long, help, meta, cb, data, true, type, def_val
            end
            #
            def debug
                r = ''
                r << "#{self.class} : #{@ecore_getopt_st.to_ptr}\n"
                [:prog,:usage,:version,:copyright,:license,:description].each do |sym|
                    r<< "  #{sym.to_s} : #{@ecore_getopt_st[sym]==FFI::Pointer::NULL ? 'NULL' : @ecore_getopt_st[sym].read_string}\n"
                end
                r << "  strict : #{@ecore_getopt_st[:strict]}\n"
                i=0
                r << "  Descriptions\n"
                while true
                    st = @ecore_getopt_st.desc_ptr i
                    break if st[:shortname]==0 and st[:longname] == FFI::Pointer::NULL
                    r << "    desc #{st.to_ptr}\n"
                    r << "     short: #{st[:shortname].chr}\n" unless st[:shortname]==0
                    r << "     long:  #{st[:longname].read_string}\n" unless st[:longname]==FFI::Pointer::NULL
                    r << "     help:  #{st[:help].read_string}\n" unless st[:help]==FFI::Pointer::NULL
                    i+=1
                end
                r << "  Values\n"
                @values_order.each_with_index do |k,i|
                    st = @ecore_values_st.value_ptr i
                    vtype, vpointer = @values[k]
                    etype, vfield, pfield = @types[vtype]
                    r << "    value #{st.to_ptr}\n"
                    r << "     key:   #{k}\n"
                    r << "     type:  #{vtype}\n"
                    r << "     value: #{self[k]}\n"
                end
                r
            end
        end
    end
    #
end
#
# EOF
