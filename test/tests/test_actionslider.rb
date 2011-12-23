#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
module Tests
    #
    class TestActionSlider < Efl::Elm::ElmWin
        def initialize name, title, fct
            super nil, name
            self.title = title
            self.autodel = true
            self.send fct
            self.resize 320, 400
            self.show
        end
        def simple
            @bg = Elm::ElmBg.new self do |bg|
                bg.size_hint_weight_set Evas::EVAS_HINT_EXPAND, 0
                self.resize_object_add bg
                bg.show
            end
            @bx = Elm::ElmBox.new self do |bx|
                bx.size_hint_weight_set Evas::EVAS_HINT_EXPAND, 0
                self.resize_object_add bx
                bx.show
            end
            as_pos = Native.enum_type :elm_actionslider_pos
            # standards calls
            as = Elm::ElmActionSlider.new self do |as|
                as.size_hint_weight_set Evas::EVAS_HINT_EXPAND, 0
                as.size_hint_align_set Evas::EVAS_HINT_FILL, 0
                as.part_text = "left", "Snooze"
                as.part_text = "center", nil
                as.part_text = "right", "Stop"
                as.indicator_pos = :elm_actionslider_right
                as.magnet_pos = :elm_actionslider_right
                as.enabled_pos = as_pos[:elm_actionslider_left]|as_pos[:elm_actionslider_right]
                as.smart_callback_add "selected", method(:cb_pos_selected)
                as.smart_callback_add "pos_changed", method(:cb_position_change_magnetic)
                as.show
            end
            @bx.pack_end as
            # use xxx_set helpers
            as = Elm::ElmActionSlider.new self do |as|
                as.size_hint_weight_set Evas::EVAS_HINT_EXPAND, 0
                as.size_hint_align_set Evas::EVAS_HINT_FILL, 0
                as.texts_set "Snooze", nil, "Stop"
                as.indicator_set 'c'
                as.magnet_set 'c'
                as.enabled_set 'lr'
                as.smart_callback_add "selected", method(:cb_pos_selected)
                as.show
            end
            @bx.pack_end as
            # use xxx = helpers
            as = Elm::ElmActionSlider.new self do |as|
                as.size_hint_weight_set Evas::EVAS_HINT_EXPAND, 0
                as.size_hint_align_set Evas::EVAS_HINT_FILL, 0
                as.style = "bar"
                as.texts = nil, "Accept", "Reject"
                as.indicator = 'l'
                as.magnet = 'cr'
                as.enabled = 'cr'
                as.smart_callback_add "selected", method(:cb_pos_selected)
                as.show
            end
            @bx.pack_end as
            # use setup
            as = Elm::ElmActionSlider.new self do |as|
                as.size_hint_weight_set Evas::EVAS_HINT_EXPAND, 0
                as.size_hint_align_set Evas::EVAS_HINT_FILL, 0
                as.style = "bar"
                as.text = "Go"
                as.setup [nil, "Accept", "Reject"], 'l', 'l', 'a'
                as.smart_callback_add "selected", method(:cb_pos_selected)
                as.smart_callback_add "pos_changed", method(:cb_position_change_magnetic)
                as.show
            end
            @bx.pack_end as
            as = Elm::ElmActionSlider.new self do |as|
                as.size_hint_weight_set Evas::EVAS_HINT_EXPAND, 0
                as.size_hint_align_set Evas::EVAS_HINT_FILL, 0
                as.text = "Go"
                as.setup ["Left", "Center", "right"], 'l', 'a'
                as.smart_callback_add "selected", method(:cb_pos_selected)
                as.show
            end
            @bx.pack_end as
            as = Elm::ElmActionSlider.new self do |as|
                as.size_hint_weight_set Evas::EVAS_HINT_EXPAND, 0
                as.size_hint_align_set Evas::EVAS_HINT_FILL, 0
                as.text = "Go"
                as.setup ["Enable", "Magnet", "Disable"], 'c', 'c'
                as.smart_callback_add "selected", method(:cb_pos_selected)
                as.smart_callback_add "pos_changed", method(:cb_magnet_enable_disable)
                as.show
            end
            @bx.pack_end as
        end
        def cb_pos_selected data, evas_obj, event_info
            as = Elm::ElmActionSlider.new evas_obj
            puts "Selection #{event_info.null? ? 'NULL' : event_info.read_string}"
            puts "   label: #{Elm::ElmActionSlider.new(evas_obj).selected_label}"
        end
        def cb_position_change_magnetic data, evas_obj, event_info
            as = Elm::ElmActionSlider.new evas_obj
            return if event_info.null?
            case event_info.read_string
            when "left"
                as.magnet_pos = :elm_actionslider_left
            when "right"
                as.magnet_pos = :elm_actionslider_right
            end
        end
        def cb_magnet_enable_disable data, evas_obj, event_info
            as = Elm::ElmActionSlider.new evas_obj
            return if event_info.null?
            case event_info.read_string
            when "left"
                as.magnet_pos = :elm_actionslider_center
            when "right"
                as.magnet_pos = :elm_actionslider_none
            end
        end
    end
    #
    def self.test_actionslider
        TestActionSlider.new 'actionslider', 'Actionslider', :simple
    end
    #
end
#
# EOF
