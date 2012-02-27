#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/eina_log'
Efl::Eina.init
Efl::EinaLog.level_set :eina_log_level_critical
#
def realize_evas
    width = 300
    height = 200
    @pixels = FFI::MemoryPointer.new :int, width*height
    @e = Efl::Evas::REvas.new do
        output_method_set Efl::Evas::render_method_lookup("buffer")
        output_viewport_set 0, 0, width, height
        output_size_set width, height
    end
    einfo = Efl::Native::EngineInfoBufferStruct.new @e.engine_info
    einfo[:info][:depth_type] = Efl::Evas::EVAS_ENGINE_BUFFER_DEPTH_ARGB32
    einfo[:info][:dest_buffer] = @pixels
    einfo[:info][:dest_buffer_row_bytes] = width * FFI::type_size(:int);
    einfo[:info][:use_color_key] = 0;
    einfo[:info][:alpha_threshold] = 0;
    einfo[:info][:func][:new_update_region] = nil #FFI::Pointer::NULL;
    einfo[:info][:func][:free_update_region] = nil #FFI::Pointer::NULL;
    @e.engine_info_set einfo
end
#
def ecore_loop n
    n.downto(0) do
        sleep 0.1
        Efl::Ecore.main_loop_iterate
    end
end
#
def bool_check t, fct, delay=nil
    t.send fct+'_set', true
    ecore_loop delay if delay
    t.send(fct).should be_true
    t.send(fct+'?').should be_true
    t.send(fct+'_get').should be_true
    t.send fct+'=', false
    ecore_loop delay if delay
    t.send(fct).should be_false
    t.send(fct+'?').should be_false
    t.send(fct+'_get').should be_false
end
#
def char_check t, fct, delay=nil
    t.send fct+'_set', "char1"
    ecore_loop delay if delay
    t.send(fct).should == "char1"
    t.send(fct+'?').should == "char1"
    t.send(fct+'_get').should == "char1"
    t.send fct+'=', "char2"
    ecore_loop delay if delay
    t.send(fct).should == "char2"
    t.send(fct+'?').should == "char2"
    t.send(fct+'_get').should == "char2"
end
#
def realize_win
    @win = Elm::ElmWin.new(nil, 'TEST') do
        title= 'spec win'
        move 100, 100
        resize 100, 100
    end
    @bg = Elm::ElmBg.new(@win) do
        size_hint_weight_set 1.0, 1.0
        evas_object_color_set 200,255,100,150
        show
    end
    @win.show
end
