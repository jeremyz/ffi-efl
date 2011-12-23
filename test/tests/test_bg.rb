#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
module Tests
    #
    class TestBg < Efl::Elm::ElmWin
        def initialize name, title, fct
            super nil, name
            self.title = title
            self.autodel = true
            self.send fct
            @bg.size_hint_min = 160, 160
            @bg.size_hint_max = 640, 640
            self.resize 320, 230
            self.show
        end
        def plain_bg
            @bg = Elm::ElmBg.new self do |bg|
                bg.size_hint_weight_expand
                self.resize_object_add bg
                bg.show
            end
        end
        def image_bg
            @bg = Elm::ElmBg.new self do |bg|
                bg.file =  "#{PACKAGE_DATA_DIR}/images/plant_01.jpg", nil
                bg.size_hint_weight_expand
                self.resize_object_add bg
                bg.show
            end
        end
        def options_bg
            plain_bg
            @bx = Elm::ElmBox.new self do |bx|
                bx.size_hint_weight_expand
                self.resize_object_add bx
                bx.show
            end
            @o_bg = Elm::ElmBg.new self do |bg|
                bg.file =  "#{PACKAGE_DATA_DIR}/images/plant_01.jpg", nil
                bg.size_hint_weight_expand
                bg.size_hint_align_fill
                @bx.pack_end bg
                bg.show
            end
            @hbx = Elm::ElmBox.new self do |bx|
                bx.horizontal = true
                bx.size_hint_weight_expand_fill
                bx.size_hint_align_fill
            end
            @rdg = Elm::ElmRadio.new self do |r|
                r.state_value = :elm_bg_option_center
                r.text = "Center"
                r.size_hint_weight_expand_fill
                r.smart_callback_add "changed", method(:cb_radio_changed)
                @hbx.pack_end r
                r.show
            end
            Elm::ElmRadio.new self do |r|
                r.state_value = :elm_bg_option_scale
                r.group_add @rdg
                r.text = "Scale"
                r.size_hint_weight_expand_fill
                r.smart_callback_add "changed", method(:cb_radio_changed)
                @hbx.pack_end r
                r.show
            end
            Elm::ElmRadio.new self do |r|
                r.state_value = :elm_bg_option_stretch
                r.group_add @rdg
                r.text = "Stretch"
                r.size_hint_weight_expand_fill
                r.smart_callback_add "changed", method(:cb_radio_changed)
                @hbx.pack_end r
                r.show
            end
            Elm::ElmRadio.new self do |r|
                r.state_value = :elm_bg_option_tile
                r.group_add @rdg
                r.text = "Tile"
                r.size_hint_weight_expand_fill
                r.smart_callback_add "changed", method(:cb_radio_changed)
                @hbx.pack_end r
                r.show
            end
            @rdg.value_set :elm_bg_option_scale
            Elm::ElmCheck.new self do |ck|
                ck.text = "Show Overlay"
                ck.size_hint_weight_expand_fill
                ck.smart_callback_add "changed", method(:cb_overlay_changed)
                @hbx.pack_end ck
                ck.show
            end
            Elm::ElmSpinner.new self do |sp|
                sp.style = "vertical"
                sp.min_max = 1, 4
                sp.label_format = "%.0f"
                sp.editable = false
                sp.special_value_add 1, "White"
                sp.special_value_add 2, "Red"
                sp.special_value_add 3, "Blue"
                sp.special_value_add 4, "Green"
                sp.size_hint_weight_expand
                sp.size_hint_align_fill
                sp.smart_callback_add "changed", method(:cb_color_changed)
                @hbx.pack_end sp
                sp.show
            end
            @bx.pack_end @hbx
            @hbx.show
        end
        def cb_radio_changed data, evas_obj, event_info
            @o_bg.option = Elm::ElmRadio.new(evas_obj).value
        end
        def cb_overlay_changed data, evas_obj, event_info
            if Elm::ElmCheck.new(evas_obj).state
                over = @o_bg.parent_widget.evas.edje_object_add
                over.file = "#{PACKAGE_DATA_DIR}/objects/test.edj", "bg_overlay"
                @o_bg.content = over
            else
                @o_bg.content = FFI::Pointer::NULL
            end
        end
        def cb_color_changed data, evas_obj, event_info
            case Elm::ElmSpinner.new(evas_obj).value
            when 1.0
                @o_bg.color = 255, 255, 255
            when 2.0
                @o_bg.color = 255, 0, 0
            when 3.0
                @o_bg.color = 0, 0, 255
            when 4.0
                @o_bg.color = 0, 255, 0
            end
        end
    end
    #
    def self.test_bg_plain
        TestBg.new 'bg-plain', 'Bg Plain', :plain_bg
    end
    #
    def self.test_bg_image
        TestBg.new 'bg-image', 'Bg Image', :image_bg
    end
    def self.test_bg_options
        TestBg.new 'bg-options', 'Bg Options', :options_bg
    end
    #
end
#
# EOF
