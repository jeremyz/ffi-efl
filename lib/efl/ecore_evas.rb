#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl'
require 'efl/evas'
require 'efl/native/ecore_evas'
#
module Efl
    #
    module EcoreEvas
        #
        def self.ecore_evas_list
            EinaList::REinaList.new Native.ecore_evas_ecore_evas_list_get
        end
        def self.engines_list
            EinaList::REinaList.new Native.ecore_evas_engines_get
        end
        #
        class REcoreEvas
            include Efl::ClassHelper
            search_prefixes 'ecore_evas_'
            def initialize o=nil, &block
                @ptr = (
                    case o
                    when NilClass
                        FFI::AutoPointer.new Native.ecore_evas_new(nil, 0, 0, 0, 0, nil), REcoreEvas.method(:release)
                    when Hash
                        FFI::AutoPointer.new Native.ecore_evas_new(o[:engine_name], o[:x], o[:y], o[:w], o[:h], o[:extra_options]), REcoreEvas.method(:release)
                    when FFI::Pointer
                        o
                    else
                        raise ArgumentError.new "wrong argument #{o.class.name}"
                    end
                )
                instance_eval &block if block
            end
            def self.release p
                Native.ecore_evas_free p
            end
            def free p=nil
                @ptr.autorelease=false
                REcoreEvas.release @ptr
                @ptr=nil
            end
            def geometry_get
                x = FFI::MemoryPointer.new :int
                y = FFI::MemoryPointer.new :int
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                Native.ecore_evas_geometry_get @ptr, x, y, w, h
                [ x.read_int, y.read_int, w.read_int, h.read_int ]
            end
            alias :geometry :geometry_get
            def size
                geometry_get[2..-1]
            end
            def size= wh
                Native.evas_object_resize @ptr, *wh
            end
            def name_class_get
                n = FFI::MemoryPointer.new :pointer
                c = FFI::MemoryPointer.new :pointer
                Native.ecore_evas_name_class_get @ptr, n, c
                [ n.read_pointer.read_string, c.read_pointer.read_string ]
            end
            def size_min_get
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                Native.ecore_evas_size_min_get @ptr, w, h
                [ w.read_int, h.read_int ]
            end
            def size_max_get
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                Native.ecore_evas_size_max_get @ptr, w, h
                [ w.read_int, h.read_int ]
            end
            def size_base_get
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                Native.ecore_evas_size_base_get @ptr, w, h
                [ w.read_int, h.read_int ]
            end
            def size_step_get
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                Native.ecore_evas_size_step_get @ptr, w, h
                [ w.read_int, h.read_int ]
            end
            def evas
                # EAPI Evas *ecore_evas_get(const Ecore_Evas *ee);
                Evas::REvas.new Native.ecore_evas_get @ptr
            end
            alias :get :evas
            def object_image_new
                # EAPI Evas_Object *ecore_evas_object_image_new(Ecore_Evas *ee_target);
                Evas::REvasObject.new Native.ecore_evas_object_image_new @prt
            end
            def object_associate_get
                # EAPI Evas_Object *ecore_evas_object_associate_get(const Ecore_Evas *ee);
                Evas::REvasObject.new Native.ecore_evas_object_associate_get @prt
            end
            #
        end
        #
    end
    #
    module Evas
        #
        class REvas
            def ecore_evas_get
                # EAPI Ecore_Evas *ecore_evas_ecore_evas_get(const Evas *e);
                EcoreEvas::REcoreEvas.new Native.ecore_evas_ecore_evas_get @ptr
            end
        end
        #
        class REvasObject
            def ecore_evas_get
                # EAPI Ecore_Evas *ecore_evas_object_ecore_evas_get(Evas_Object *obj);
                EcoreEvas::REcoreEvas.new Native.ecore_evas_object_ecore_evas_get @ptr
            end
            alias :ecore_evas :ecore_evas_get
            # FIXME override REvas#evas_get => evas_object_evas_get
#            def evas_get
#                # EAPI Evas *ecore_evas_object_evas_get(Evas_Object *obj);
#                Evas::REvas.new Efl::EcoreEvas.ecore_evas_object_evas_get @ptr
#            end
#            alias :evas :evas_get
        end
    end
    #
end
#
# EOF
