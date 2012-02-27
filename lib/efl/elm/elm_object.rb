#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elementary'
require 'efl/native/elm/elm_object'
#
module Efl
    #
    module Elm
        #
        module Helper
            def self.included kls
                def kls.constructor meth
                    self.class_eval <<-EOF
                    def initialize ptr, &block
                        if ptr.is_a? FFI::Pointer
                            super ptr, &block
                        else
                            super Native.method(:#{meth}), ptr, &block
                        end
                    end
                    EOF
                end
            end
        end
        #
        class ElmObject < Efl::Evas::REvasObject
            #
            search_prefixes 'elm_object_'
            #
            def smart_callback_add event_str, cb, data=FFI::MemoryPointer::NULL
                Native.evas_object_smart_callback_add @ptr, event_str, cb, data
            end
            #
            def text_set label
                Native.elm_object_part_text_set @ptr, nil, label
            end
            alias :text= :text_set
            #
            def text_get
                Native.elm_object_part_text_get @ptr, nil
            end
            alias :text :text_get
            #
            def content_set content
                Native.elm_object_part_content_set @ptr, nil, content
            end
            alias :content= :content_set
            #
            def content_get
                Native.elm_object_part_content_get @ptr, nil
            end
            alias :content :content_get
            #
            def content_unset
                Native.elm_object_part_content_unset @ptr, nil
            end
            #
            def parent_widget_get
                ElmObject.new Native.elm_object_parent_widget_get @ptr
            end
            alias :parent_widget :parent_widget_get
        end
        #
    end
end
#
# EOF
