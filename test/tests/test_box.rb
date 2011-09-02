#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
module Tests
    #
    class TestBox < Efl::Elm::ElmWin
        def initialize name, title, fct
            super nil, name
            self.title = title
            self.autodel = true
            @bg = Elm::ElmBg.new self do |bg|
                bg.size_hint_weight_expand
                self.resize_object_add bg
                bg.show
            end
            self.send fct
            self.show
        end
        #
        def box_vert
            @bx = Elm::ElmBox.new self do |bx|
                bx.size_hint_weight_expand
                self.resize_object_add bx
                bx.show
            end
            icons = []
            (0..2).each do
                icons << Elm::ElmIcon.new(self) do |ico|
                    ico.file = "#{PACKAGE_DATA_DIR}/images/logo_small.png", nil
                    ico.scale = false, false
                    @bx.pack_end ico
                    ico.show
                end
            end
            icons[0].size_hint_align = 0.5, 0.5
            icons[1].size_hint_align = 0.0, 0.5
            icons[2].size_hint_align = Efl::Evas::EVAS_HINT_EXPAND, 0.5
        end
        #
        def box_vert2
            @bx = Elm::ElmBox.new self do |bx|
                bx.padding = 10, 10
                self.resize_object_add bx
                bx.size_hint_weight_expand
                bx.show
            end
            (1..5).each do |n|
                bt = Efl::Elm::ElmButton.new self
                bt.text = "Button #{n}"
                bt.size_hint_align_fill
                bt.size_hint_weight = 0.0, 0.0
                bt.smart_callback_add "clicked", method(:del_cb)
                @bx.pack_end bt
                bt.show
            end
        end
        #
        def del_cb data, evas_obj, event_info
            o = Efl::Elm::ElmObject.new(evas_obj)
            @bx.unpack o
            o.move 0, 0
            o.color = 128, 64, 0, 128
        end
        #
        def box_horiz
            @bx = Elm::ElmBox.new self do |bx|
                bx.horizontal = true
                self.resize_object_add bx
                bx.size_hint_weight_expand
                bx.show
            end
            icons = []
            (0..2).each do
                icons << Elm::ElmIcon.new(self) do |ico|
                    ico.file = "#{PACKAGE_DATA_DIR}/images/logo_small.png", nil
                    ico.scale = false, false
                    @bx.pack_end ico
                    ico.show
                end
            end
            icons[0].size_hint_align = 0.5, 0.5
            icons[1].size_hint_align = 0.5, 0.0
            icons[2].size_hint_align = 0.0, Efl::Evas::EVAS_HINT_EXPAND
        end
        #
        def box_transition
            @bx = Elm::ElmBox.new self do |bx|
                self.resize_object_add bx
                bx.size_hint_weight_expand
                bx.show
            end
            (1..3).each do |n|
                bt = Efl::Elm::ElmButton.new self
                bt.text = "Button #{n}"
                bt.size_hint_weight_expand
#                bt.size_hint_align_fill
                bt.smart_callback_add "clicked", method(:del_cb)
                @bx.pack_end bt
                bt.resize 100, 100
                bt.show
            end
            @idx = 0
            @transitions = [
                Efl::Native.find_variable('evas_object_box_layout_vertical'),
                Efl::Native.find_variable('evas_object_box_layout_horizontal'),
                Efl::Native.find_variable('evas_object_box_layout_stack'),
                Efl::Native.find_variable('evas_object_box_layout_homogeneous_vertical'),
                Efl::Native.find_variable('evas_object_box_layout_homogeneous_horizontal'),
                Efl::Native.find_variable('evas_object_box_layout_flow_vertical'),
                Efl::Native.find_variable('evas_object_box_layout_flow_horizontal'),
                Efl::Native.find_variable('evas_object_box_layout_stack'),
            ]
            self.resize 300, 300
            @bx.resize 300, 300
            @bx.layout =  @transitions[@idx], nil, nil
            self.show
            transition_change
        end
        #
        def transition_change data=nil
            last_layout = @transitions[@idx]
            @idx = (@idx+1) % @transitions.length
            next_layout = @transitions[@idx]
            transition = Efl::Native.elm_box_transition_new 1.0, last_layout, nil, nil, next_layout, nil, nil, method(:transition_change), nil
            transition_fct = Efl::Native.find_variable('elm_box_layout_transition')
            transition_free = Efl::Native.find_variable('elm_box_transition_free')
            @bx.layout = transition_fct, transition, transition_free
        end
        #
    end
    #
    def self.test_box_vert
        TestBox.new 'box-vert', 'Box Vert', :box_vert
    end
    def self.test_box_vert2
        TestBox.new 'box-vert', 'Box Vert', :box_vert2
    end
    def self.test_box_horiz
        TestBox.new 'box-horiz', 'Box Horiz', :box_horiz
    end
    def self.test_box_transition
        TestBox.new 'box-transition', 'Box Transition', :box_transition
    end
    #
end
#
# EOF
