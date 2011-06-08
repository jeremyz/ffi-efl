#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/evas'
require 'efl/native/edje'
#
module Efl
    #
    module Edje
        #
        def self.version
            Native::VersionStruct.new(Native.edje_version)
        end
        #
        class REdje < Efl::Evas::REvasObject
            #
            search_prefixes 'edje_object_'
            #
            def part_object_get part
                # EAPI const Evas_Object *edje_object_part_object_get (const Evas_Object *obj, const char *part);
                Evas::REvasObject.new Native.edje_object_part_object_get @ptr, part
            end
            def part_swallow_get part
                # EAPI Evas_Object *edje_object_part_swallow_get (const Evas_Object *obj, const char *part);
                Evas::REvasObject.new Native.edje_object_part_swallow_get @ptr, part
            end
            def external_object_get part
                # EAPI Evas_Object *edje_object_part_external_object_get (const Evas_Object *obj, const char *part);
                Evas::REvasObject.new Native.edje_object_part_external_object_get @ptr, part
            end
            def external_content_get part, content
                # EAPI Evas_Object *edje_object_part_external_content_get (const Evas_Object *obj, const char *part, const char *content);
                Evas::REvasObject.new Native.edje_object_part_external_content_get @ptr, part, content
            end
            def part_box_remove part, child
                # EAPI Evas_Object *edje_object_part_box_remove (Evas_Object *obj, const char *part, Evas_Object *child);
                Evas::REvasObject.new Native.edje_object_part_box_remove @ptr, part, child
            end
            def part_box_remove_at part, pos
                # EAPI Evas_Object *edje_object_part_box_remove_at (Evas_Object *obj, const char *part, unsigned int pos);
                Evas::REvasObject.new Native.edje_object_part_box_remove_at @ptr, part, pos
            end
            def part_table_child_get part, col, row
                # EAPI Evas_Object *edje_object_part_table_child_get (Evas_Object *obj, const char *part, unsigned int col, unsigned int row);
                Evas::REvasObject.new Native.edje_object_part_table_child_get @ptr, part, col, row
            end
            def file_get
                f = FFI::MemoryPointer.new :pointer
                g = FFI::MemoryPointer.new :pointer
                Native.edje_object_file_get @ptr, f, g
                [ f.read_pointer.read_string, g.read_pointer.read_string ]
            end
            def data_get k
                Native.edje_object_data_get @ptr, k
            end
            alias :data :data_get
        end
        #
    end
    #
    module Evas
        #
        class REvas
            def edje_object_add
                # EAPI Evas_Object *edje_object_add (Evas *evas);
                Edje::REdje.new Native.edje_object_add @ptr
            end
        end
        #
    end
end
#
# EOF
