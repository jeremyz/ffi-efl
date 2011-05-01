#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi/ecore_evas'
#
module Efl
    #
    module EcoreEvas
        #
        class REcoreEvas
            include Efl::ClassHelper
            proxy_list [Efl::EcoreEvas,'ecore_evas_'].freeze
            def initialize o=nil, &block
                @ptr = (
                    case o
                    when NilClass
                        FFI::AutoPointer.new Efl::EcoreEvas.ecore_evas_new(nil, 0, 0, 0, 0, nil), method(:free)
                    when self.class
                        o.to_ptr
                    when FFI::AutoPointer
                        o
                    when FFI::Pointer
                        FFI::AutoPointer.new o, method(:free)
                    else
                        raise ArgumentError.new "wrong argument #{o.class.name}"
                    end
                )
                yield self if block_given?
            end
            def free p=nil
                return Efl::EcoreEvas.ecore_evas_free p unless p.nil?
                Efl::EcoreEvas.ecore_evas_free @ptr
                @ptr.free
                @ptr=nil
            end
            def get
                # EAPI Evas *ecore_evas_get(const Ecore_Evas *ee);
                Efl::Evas::REvas.new Efl::EcoreEvas.ecore_evas_get @ptr
            end
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
    # TODO
    #EAPI unsigned char ecore_getopt_callback_ecore_evas_list_engines(const Ecore_Getopt *parser, const Ecore_Getopt_Desc *desc, const char *str, void *data, Ecore_Getopt_Value *storage);
    #
end
#
# EOF
