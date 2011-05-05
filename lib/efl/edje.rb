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
        class REdje < Efl::Evas::REvasObject
            #
            search_prefixes 'edje_object_'
            #
            def part_object_get part
                # EAPI const Evas_Object *edje_object_part_object_get (const Evas_Object *obj, const char *part);
                Evas::RevasObject.new Native.edje_object_part_object_get @ptr, part
            end
            def part_swallow_get part
                # EAPI Evas_Object *edje_object_part_swallow_get (const Evas_Object *obj, const char *part);
                Evas::RevasObject.new Native.edje_object_part_swallow_get @ptr, part
            end
            def external_object_get part
                # EAPI Evas_Object *edje_object_part_external_object_get (const Evas_Object *obj, const char *part);
                Evas::RevasObject.new Native.edje_object_part_external_object_get @ptr, part
            end
            def external_content_get part, content
                # EAPI Evas_Object *edje_object_part_external_content_get (const Evas_Object *obj, const char *part, const char *content);
                Evas::RevasObject.new Native.edje_object_part_external_content_get @ptr, part, content
            end
            def part_box_remove part, child
                # EAPI Evas_Object *edje_object_part_box_remove (Evas_Object *obj, const char *part, Evas_Object *child);
                Evas::RevasObject.new Native.edje_object_part_box_remove @ptr, part, child
            end
            def part_box_remove_at part, pos
                # EAPI Evas_Object *edje_object_part_box_remove_at (Evas_Object *obj, const char *part, unsigned int pos);
                Evas::RevasObject.new Native.edje_object_part_box_remove_at @ptr, part, pos
            end
            def part_table_child_get part, col, row
                # EAPI Evas_Object *edje_object_part_table_child_get (Evas_Object *obj, const char *part, unsigned int col, unsigned int row);
                Evas::RevasObject.new Native.edje_object_part_table_child_get @ptr, part, col, row
            end
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
