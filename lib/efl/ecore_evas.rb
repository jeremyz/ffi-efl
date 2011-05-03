#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi/ecore_evas'
#
module Efl
    #
    module EcoreEvas
        #
        def self.ecore_evas_list
            Efl::EinaList::REinaList.new Efl::EcoreEvas.ecore_evas_ecore_evas_list_get
        end
        def self.engines_list
            Efl::EinaList::REinaList.new Efl::EcoreEvas.engines_get
        end
        #
        class REcoreEvas
            include Efl::ClassHelper
            proxy_list [Efl::EcoreEvas,'ecore_evas_'].freeze
            def initialize o=nil
                @ptr = (
                    case o
                    when NilClass
                        FFI::AutoPointer.new Efl::EcoreEvas.ecore_evas_new(nil, 0, 0, 0, 0, nil), REcoreEvas.method(:release)
                    when Hash
                        FFI::AutoPointer.new Efl::EcoreEvas.ecore_evas_new(o[:engine_name], o[:x], o[:y], o[:w], o[:h], o[:extra_options]), REcoreEvas.method(:release)
                    when FFI::Pointer
                        o
                    else
                        raise ArgumentError.new "wrong argument #{o.class.name}"
                    end
                )
                yield self if block_given?
            end
            def self.release p
                Efl::EcoreEvas.ecore_evas_free p unless p.nil?
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
                Efl::EcoreEvas.ecore_evas_geometry_get @ptr, x, y, w, h
                [ x.read_int, y.read_int, w.read_int, h.read_int ]
            end
            alias :geometry :geometry_get
            def size
                geometry_get[2..-1]
            end
            def size= wh
                Efl::Evas.evas_object_resize @ptr, *wh
            end
            def name_class_get
                n = FFI::MemoryPointer.new :pointer
                c = FFI::MemoryPointer.new :pointer
                Efl::EcoreEvas.ecore_evas_name_class_get @ptr, n, c
                [ n.read_pointer.read_string, c.read_pointer.read_string ]
            end
            def size_min_get
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                Efl::EcoreEvas.ecore_evas_size_min_get @ptr, w, h
                [ w.read_int, h.read_int ]
            end
            def size_max_get
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                Efl::EcoreEvas.ecore_evas_size_max_get @ptr, w, h
                [ w.read_int, h.read_int ]
            end
            def size_base_get
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                Efl::EcoreEvas.ecore_evas_size_base_get @ptr, w, h
                [ w.read_int, h.read_int ]
            end
            def size_step_get
                w = FFI::MemoryPointer.new :int
                h = FFI::MemoryPointer.new :int
                Efl::EcoreEvas.ecore_evas_size_step_get @ptr, w, h
                [ w.read_int, h.read_int ]
            end
            def evas
                # EAPI Evas *ecore_evas_get(const Ecore_Evas *ee);
                Efl::Evas::REvas.new Efl::EcoreEvas.ecore_evas_get @ptr
            end
            alias :get :evas
            def object_image_new
                # EAPI Evas_Object *ecore_evas_object_image_new(Ecore_Evas *ee_target);
                Efl::Evas::REvasObject.new Efl::EcoreEvas.ecore_evas_object_image_new @prt
            end
            def object_associate_get
                # EAPI Evas_Object *ecore_evas_object_associate_get(const Ecore_Evas *ee);
                Efl::Evas::REvasObject.new Efl::EcoreEvas.ecore_evas_object_associate_get @prt
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
                Efl::EcoreEvas::REcoreEvas.new Efl::EcoreEvas.ecore_evas_ecore_evas_get @ptr
            end
        end
        #
        class REvasObject
            def ecore_evas_get
                # EAPI Ecore_Evas *ecore_evas_object_ecore_evas_get(Evas_Object *obj);
                Efl::EcoreEvas::REcoreEvas.new Efl::EcoreEvas.ecore_evas_object_ecore_evas_get @ptr
            end
            def evas_get
                # EAPI Evas *ecore_evas_object_evas_get(Evas_Object *obj);
                Efl::Evas::REvas.new Efl::EcoreEvas.ecore_evas_object_evas_get @ptr
            end
        end
    end
    #
end
#
# EOF
