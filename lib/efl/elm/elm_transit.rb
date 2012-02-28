#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/elm/elm_object'
require 'efl/native/elm/elm_transit'
#
module Efl
    #
    module Elm
        #
        class ElmTransit < ElmObject
            #
            include Helper
            constructor :elm_transit_add
            search_prefixes 'elm_transit_'
            def effect_resizing_add from_w, from_h, to_w, to_h
                ElmTransitEffect.new Native.elm_transit_effect_resizing_add @ptr, from_w, from_h, to_w,to_h
            end
            #
            def effect_translation_add from_w, from_h, to_w, to_h
                ElmTransitEffect.new Native.elm_transit_effect_translation_add @ptr, from_dx, from_dy, to_dx, to_dy
            end
            #
            def effect_zoom_add from_rate, to_rate
                ElmTransitEffect.new Native.elm_transit_effect_zoom_add @ptr, from_rate, to_rate
            end
            #
            def effect_zoom_add from_rate, to_rate
                ElmTransitEffect.new Native.elm_transit_effect_zoom_add @ptr, from_rate, to_rate
            end
            #
            def effect_flip_add axis, cw
                ElmTransitEffect.new Native.elm_transit_effect_flip_add @ptr, axis, cw
            end
            #
            def effect_resizable_flip_add axis, cw
                ElmTransitEffect.new Native.elm_transit_effect_resizable_flip_add @ptr, axis, cw
            end
            #
            def effect_wipe_add type, dir
                ElmTransitEffect.new Native.elm_transit_effect_wipe_add @ptr, type, dir
            end
            #
            def effect_color_add from_r, from_g, from_b, from_a, to_r, to_g, to_b, to_a
                ElmTransitEffect.new Native.elm_transit_effect_color_add @ptr, from_r, from_g, from_b, from_a, to_r, to_g, to_b, to_a
            end
            #
            def effect_fade_add
                ElmTransitEffect.new Native.elm_transit_effect_fade_add @ptr
            end
            #
            def effect_blend_add
                ElmTransitEffect.new Native.elm_transit_effect_blend_add @ptr
            end
            #
            def effect_rotation_add from_degree, to_degree
                ElmTransitEffect.new Native.elm_transit_effect_rotation_add @ptr, from_degree, to_degree
            end
            #
            def effect_image_animation_add images
                ElmTransitEffect.new Native.elm_transit_effect_image_animation_add @ptr, images
            end
            #
        end
        #
        #
        class ElmTransitEffect < ElmObject
            #
            include Helper
            constructor :elm_transit_add
            search_prefixes 'elm_transit_effect_'
            #
        end
        #
    end
end
#
# EOF
