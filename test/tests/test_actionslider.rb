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
            as = Elm::ElmActionSlider.new self do |as|
                as.size_hint_weight_set Evas::EVAS_HINT_EXPAND, 0
                as.size_hint_align_set Evas::EVAS_HINT_FILL, 0
                as.text_part = "left", "Snooze"
                as.text_part = "center", nil
                as.text_part = "right", "Stop"
                as.indicator_pos = :elm_actionslider_right
                as.magnet_pos = :elm_actionslider_right
                as.enabled_pos = as_pos[:elm_actionslider_left]|as_pos[:elm_actionslider_right]
                as.smart_callback_add "selected", method(:cb_pos_selected)
                as.smart_callback_add "pos_changed", method(:cb_position_change_magnetic)
                as.show
            end
            @bx.pack_end as
            as = Elm::ElmActionSlider.new self do |as|
                as.size_hint_weight_set Evas::EVAS_HINT_EXPAND, 0
                as.size_hint_align_set Evas::EVAS_HINT_FILL, 0
                as.text_part = "left", "Snooze"
                as.text_part = "center", nil
                as.text_part = "right", "Stop"
                as.indicator_pos = :elm_actionslider_center
                as.magnet_pos = :elm_actionslider_center
                as.enabled_pos = as_pos[:elm_actionslider_left]|as_pos[:elm_actionslider_right]
                as.smart_callback_add "selected", method(:cb_pos_selected)
                as.show
            end
            @bx.pack_end as
            as = Elm::ElmActionSlider.new self do |as|
                as.size_hint_weight_set Evas::EVAS_HINT_EXPAND, 0
                as.size_hint_align_set Evas::EVAS_HINT_FILL, 0
                as.style = "bar"
                as.text_part = "left", nil
                as.text_part = "center", "Accept"
                as.text_part = "right", "Reject"
                as.indicator_pos = :elm_actionslider_left
                as.magnet_pos = as_pos[:elm_actionslider_center]|as_pos[:elm_actionslider_right]
                as.enabled_pos = as_pos[:elm_actionslider_center]|as_pos[:elm_actionslider_right]
                as.smart_callback_add "selected", method(:cb_pos_selected)
                as.show
            end
            @bx.pack_end as
            as = Elm::ElmActionSlider.new self do |as|
                as.size_hint_weight_set Evas::EVAS_HINT_EXPAND, 0
                as.size_hint_align_set Evas::EVAS_HINT_FILL, 0
                as.style = "bar"
                as.text = "Go"
                as.text_part = "left", nil
                as.text_part = "center", "Accept"
                as.text_part = "right", "Reject"
                as.indicator_pos = :elm_actionslider_left
                as.magnet_pos = :elm_actionslider_left
                as.smart_callback_add "selected", method(:cb_pos_selected)
                as.smart_callback_add "pos_changed", method(:cb_position_change_magnetic)
                as.show
            end
            @bx.pack_end as
            as = Elm::ElmActionSlider.new self do |as|
                as.size_hint_weight_set Evas::EVAS_HINT_EXPAND, 0
                as.size_hint_align_set Evas::EVAS_HINT_FILL, 0
                as.text = "Go"
                as.text_part = "left", "Left"
                as.text_part = "center", "Center"
                as.text_part = "right", "Right"
                as.indicator_pos = :elm_actionslider_left
                as.magnet_pos = :elm_actionslider_all
                as.smart_callback_add "selected", method(:cb_pos_selected)
                as.show
            end
            @bx.pack_end as
            as = Elm::ElmActionSlider.new self do |as|
                as.size_hint_weight_set Evas::EVAS_HINT_EXPAND, 0
                as.size_hint_align_set Evas::EVAS_HINT_FILL, 0
                as.text = "Go"
                as.text_part = "left", "Enable"
                as.text_part = "center", "Magnet"
                as.text_part = "right", "Disable"
                as.indicator_pos = :elm_actionslider_center
                as.magnet_pos = :elm_actionslider_center
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
