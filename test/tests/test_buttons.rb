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
            @bg = Elm::ElmBg.new self do |bg|
                bg.size_hint_weight_expand
                self.resize_object_add bg
                bg.show
            end
            self.send fct
            self.resize 320, 480
            self.show
        end
        #
        def __create_butt_ico txt=nil, do_icon=true
            if do_icon
                ico = Elm::ElmIcon.new self
                ico.file = "#{PACKAGE_DATA_DIR}/images/logo_small.png", nil
            else
                ico = nil
            end
            bt = Efl::Elm::ElmButton.new self
            bt.text = txt unless txt.nil?
            bt.content = ico if ico
            bt.smart_callback_add "clicked", method(:bt_clicked_cb)
            bt.smart_callback_add "unpressed", method(:bt_unpressed_cb)
            @bx.pack_end bt
            @buttons << bt
            ico.show if ico
            bt.show
            [bt,ico]
        end
        #
        def buttons
            @scr = Efl::Elm::ElmScroller.new self do |scr|
                scr.bounce = false, true
                scr.policy = :elm_scroller_policy_off, :elm_scroller_policy_auto
                self.resize_object_add scr
                scr.size_hint_weight_expand
                scr.show
            end
            @bx = Efl::Elm::ElmBox.new self do |bx|
                bx.size_hint_weight_expand
                @scr.content = bx
                bx.show
            end
            #
            @buttons = []
            #
            bt,ico = __create_butt_ico "Icon sized to button"
            ico.size_hint_aspect = :evas_aspect_control_vertical, 1, 1
            #
            bt,ico = __create_butt_ico "Icon no scale"
            ico.scale = false, false
            #
            bt,ico = __create_butt_ico "Disabled Button"
            bt.disabled = true
            ico.size_hint_aspect = :evas_aspect_control_vertical, 1, 1
            #
            bt,ico = __create_butt_ico
            bt.disabled = true
            ico.size_hint_aspect = :evas_aspect_control_vertical, 1, 1
            #
            bt,ico = __create_butt_ico "Label Only", false
            bt.smart_callback_add "repeated", method(:bt_repeated_cb)
            bt.autorepeat = true
            bt.autorepeat_gap_timeout = 0.5
            bt.autorepeat_initial_timeout = 2.0
            #
            bt,ico = __create_butt_ico
            ico.scale = false, false
            #
            bt,ico = __create_butt_ico "Anchor style", false
            bt.style = "anchor"
            #
            bt,ico = __create_butt_ico
            ico.size_hint_aspect = :evas_aspect_control_vertical, 1, 1
            bt.style = "anchor"
            #
            bt,ico = __create_butt_ico
            ico.size_hint_aspect = :evas_aspect_control_vertical, 1, 1
            bt.style = "anchor"
            bt.disabled = true
            bt.access_info_set "This is some custom text describing this widget"
        end
        #
        def bt_clicked_cb data, evas_obj, event_info
            idx = @buttons.index @buttons.find { |b| b.to_ptr==evas_obj }
            puts "clicked event on Button: #{idx+1}"
        end
        #
        def bt_unpressed_cb data, evas_obj, event_info
            idx = @buttons.index @buttons.find { |b| b.to_ptr==evas_obj }
            puts "unpressed event on Button: #{idx+1}"
        end
        #
        def bt_repeated_cb data, evas_obj, event_info
            @count = ((@count||=0)+1)%1000
            Efl::Elm::ElmButton.new(evas_obj).text = "count = #{@count}"
        end
    end
    #
    def self.test_button
        TestBg.new 'buttons', 'Buttons', :buttons
    end
end
#
# EOF
