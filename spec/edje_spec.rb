#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
EDC_FILE=File.join '/tmp','edje_spec.edc'
EDJE_FILE=File.join '/tmp','edje_spec.edj'
#
if __FILE__==$0
    File.open(EDC_FILE,'w') do |f| f << DATA.read end
    system "edje_cc #{EDC_FILE}"
    exit File.exists?(EDJE_FILE)
else
    describe "generate #{EDJE_FILE}" do
        it "" do
            system("ruby #{__FILE__}").should be_true
        end
    end
end
#
require 'efl/eina_list'
require 'efl/edje'
require './spec/helper'
#
describe "Efl::Edje #{Efl::Edje.version.full}" do
    #
    before(:all) do
        Edje = Efl::Edje
        @init = Edje.init
    end
    after(:all) do
        Edje.shutdown
    end
    #
    it "should init" do
        Edje.init.should == @init+1
        Edje.init.should == @init+2
        Edje.init.should == @init+3
    end
    #
    it "should shutdown" do
        Edje.shutdown.should == @init+2
        Edje.shutdown.should == @init+1
        Edje.shutdown.should == @init
    end
    #
    it "enum edje_external_param_flags should be correct" do
        [ :edje_external_param_flags_none, :edje_external_param_flags_get,
            :edje_external_param_flags_set, :edje_external_param_flags_state,
            :edje_external_param_flags_constructor, :edje_external_param_flags_regular ].zip([0,1,2,4,8,7]) do |s,v|
            Efl::Native.enum_value(s).should == v
        end
    end
    #
    it "frametime get/set " do
        Edje.frametime_set 10
        Edje.frametime_get.should == 10
    end
    #
    it "freeze and thaw should run" do
#        Edje.freeze
        Edje.thaw
    end
    #
    it "font_set_append " do
        Edje.fontset_append_set "my font"
        Edje.fontset_append_get.should == "my font"
    end
    #
    it "scale get/set " do
        Edje.scale_set 0.3
        Edje.scale_get.should == 0.3
    end
    #
    it "file_collection_list " do
        l = Efl::EinaList::REinaList.new Edje.file_collection_list EDJE_FILE
        l.to_ary.length.should > 0
        Edje.file_collection_list_free l
    end
    #
    it "file_group_exists " do
        Edje.file_group_exists(EDJE_FILE, "my_group").should be_true
        Edje.file_group_exists(EDJE_FILE, "my_grup").should be_false
    end
    #
    it "file_data_get " do
        Edje.file_data_get(EDJE_FILE, "key1").should == "val1"
        Edje.file_data_get(EDJE_FILE, "key2").should == nil
    end
    #
    it "file_cache get/set " do
        Edje.file_cache_set 2
        Edje.file_cache_get.should == 2
        Edje.file_cache_flush
    end
    #
    it "collection_cache get/set " do
        Edje.collection_cache_set 6
        Edje.collection_cache_get.should == 6
        Edje.collection_cache_flush
    end
    #
    # TODO edje_color_class*
    # TODO edje_text_class*
    #
    describe 'Efl::Edje::REdje' do
        before(:all) do
            Efl::Evas.init
            realize_evas
            @ed = @e.edje_object_add
            @ed.file_set EDJE_FILE, "my_group"
            @ed.move 0, 0
            @ed.resize 300, 200
            @ed.show
        end
        after(:all) do
            @e.free
            @pixels.free
            Efl::Evas.shutdown
        end
        #
        it "scale get/set " do
            @ed.scale_set 0.3
            @ed.scale_get.should == 0.3
        end
        #
        it "mirrored get/set " do
            bool_check @ed, 'mirrored'
        end
        #
        it "data_get" do
            @ed.data("key2").should == "val2"
            @ed.data_get("key2").should == "val2"
            @ed.data_get("key1").should == nil
        end
        #
        it "file_get " do
            @ed.file_get[0].should == EDJE_FILE
            @ed.file_get[1].should == "my_group"
        end
        # EAPI void edje_extern_object_min_size_set (Evas_Object *obj, Evas_Coord minw, Evas_Coord minh);
        # EAPI void edje_extern_object_max_size_set (Evas_Object *obj, Evas_Coord maxw, Evas_Coord maxh);
        # EAPI void edje_extern_object_aspect_set (Evas_Object *obj, Edje_Aspect_Control aspect, Evas_Coord aw, Evas_Coord ah);
        # EAPI void edje_box_layout_register (const char *name, Evas_Object_Box_Layout func, void *(*layout_data_get)(void *), void (*layout_data_free)(void *), void (*free_data)(void *), void *data);
        # EAPI Edje_Load_Error edje_object_load_error_get (const Evas_Object *obj);
        # EAPI const char *edje_load_error_str (Edje_Load_Error error);
        # EAPI Eina_Bool edje_object_preload (Evas_Object *obj, Eina_Bool cancel);
        # EAPI void edje_object_signal_callback_add (Evas_Object *obj, const char *emission, const char *source, Edje_Signal_Cb func, void *data);
        # EAPI void *edje_object_signal_callback_del (Evas_Object *obj, const char *emission, const char *source, Edje_Signal_Cb func);
        # EAPI void *edje_object_signal_callback_del_full(Evas_Object *obj, const char *emission, const char *source, Edje_Signal_Cb func, void *data);
        # EAPI void edje_object_signal_emit (Evas_Object *obj, const char *emission, const char *source);
        # EAPI void edje_object_play_set (Evas_Object *obj, Eina_Bool play);
        # EAPI Eina_Bool edje_object_play_get (const Evas_Object *obj);
        # EAPI void edje_object_animation_set (Evas_Object *obj, Eina_Bool on);
        # EAPI Eina_Bool edje_object_animation_get (const Evas_Object *obj);
        # EAPI int edje_object_freeze (Evas_Object *obj);
        # EAPI int edje_object_thaw (Evas_Object *obj);
        # EAPI Eina_Bool edje_object_color_class_set (Evas_Object *obj, const char *color_class, int r, int g, int b, int a, int r2, int g2, int b2, int a2, int r3, int g3, int b3, int a3);
        # EAPI Eina_Bool edje_object_color_class_get (const Evas_Object *o, const char *color_class, int *r, int *g, int *b, int *a, int *r2, int *g2, int *b2, int *a2, int *r3, int *g3, int *b3, int *a3);
        # EAPI void edje_object_color_class_del (Evas_Object *obj, const char *color_class);
        # EAPI Eina_Bool edje_object_text_class_set (Evas_Object *obj, const char *text_class, const char *font, Evas_Font_Size size);
        # EAPI void edje_object_size_min_get (const Evas_Object *obj, Evas_Coord *minw, Evas_Coord *minh);
        # EAPI void edje_object_size_max_get (const Evas_Object *obj, Evas_Coord *maxw, Evas_Coord *maxh);
        # EAPI void edje_object_calc_force (Evas_Object *obj);
        # EAPI void edje_object_size_min_calc (Evas_Object *obj, Evas_Coord *minw, Evas_Coord *minh);
        # EAPI Eina_Bool edje_object_parts_extends_calc (Evas_Object *obj, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        # EAPI void edje_object_size_min_restricted_calc(Evas_Object *obj, Evas_Coord *minw, Evas_Coord *minh, Evas_Coord restrictedw, Evas_Coord restrictedh);
        # EAPI Eina_Bool edje_object_part_exists (const Evas_Object *obj, const char *part);
        # EAPI const Evas_Object *edje_object_part_object_get (const Evas_Object *obj, const char *part);
        # EAPI Eina_Bool edje_object_part_geometry_get (const Evas_Object *obj, const char *part, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        # EAPI void edje_object_item_provider_set (Evas_Object *obj, Edje_Item_Provider_Cb func, void *data);
        # EAPI void edje_object_text_change_cb_set (Evas_Object *obj, Edje_Text_Change_Cb func, void *data);
        # EAPI Eina_Bool edje_object_part_text_set (Evas_Object *obj, const char *part, const char *text);
        # EAPI const char *edje_object_part_text_get (const Evas_Object *obj, const char *part);
        # EAPI Eina_Bool edje_object_part_text_unescaped_set (Evas_Object *obj, const char *part, const char *text_to_escape);
        # EAPI char *edje_object_part_text_unescaped_get (const Evas_Object *obj, const char *part);
        # EAPI const char *edje_object_part_text_selection_get (const Evas_Object *obj, const char *part);
        # EAPI void edje_object_part_text_select_none (const Evas_Object *obj, const char *part);
        # EAPI void edje_object_part_text_select_all (const Evas_Object *obj, const char *part);
        # EAPI void edje_object_part_text_insert (Evas_Object *obj, const char *part, const char *text);
        # EAPI const Eina_List *edje_object_part_text_anchor_list_get (const Evas_Object *obj, const char *part);
        # EAPI const Eina_List *edje_object_part_text_anchor_geometry_get (const Evas_Object *obj, const char *part, const char *anchor);
        # EAPI const Eina_List *edje_object_part_text_item_list_get (const Evas_Object *obj, const char *part);
        # EAPI Eina_Bool edje_object_part_text_item_geometry_get (const Evas_Object *obj, const char *part, const char *item, Evas_Coord *cx, Evas_Coord *cy, Evas_Coord *cw, Evas_Coord *ch);
        # EAPI void edje_object_part_text_cursor_geometry_get (const Evas_Object *obj, const char *part, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        # EAPI void edje_object_part_text_select_allow_set (const Evas_Object *obj, const char *part, Eina_Bool allow);
        # EAPI void edje_object_part_text_select_abort (const Evas_Object *obj, const char *part);
        # EAPI void edje_object_part_text_select_begin (const Evas_Object *obj, const char *part);
        # EAPI void edje_object_part_text_select_extend (const Evas_Object *obj, const char *part);
        # EAPI Eina_Bool edje_object_part_text_cursor_next (Evas_Object *obj, const char *part, Edje_Cursor cur);
        # EAPI Eina_Bool edje_object_part_text_cursor_prev (Evas_Object *obj, const char *part, Edje_Cursor cur);
        # EAPI Eina_Bool edje_object_part_text_cursor_up (Evas_Object *obj, const char *part, Edje_Cursor cur);
        # EAPI Eina_Bool edje_object_part_text_cursor_down (Evas_Object *obj, const char *part, Edje_Cursor cur);
        # EAPI void edje_object_part_text_cursor_begin_set (Evas_Object *obj, const char *part, Edje_Cursor cur);
        # EAPI void edje_object_part_text_cursor_end_set (Evas_Object *obj, const char *part, Edje_Cursor cur);
        # EAPI void edje_object_part_text_cursor_copy (Evas_Object *obj, const char *part, Edje_Cursor src, Edje_Cursor dst);
        # EAPI void edje_object_part_text_cursor_line_begin_set (Evas_Object *obj, const char *part, Edje_Cursor cur);
        # EAPI void edje_object_part_text_cursor_line_end_set (Evas_Object *obj, const char *part, Edje_Cursor cur);
        # EAPI Eina_Bool edje_object_part_text_cursor_coord_set (Evas_Object *obj, const char *part, Edje_Cursor cur, Evas_Coord x, Evas_Coord y);
        # EAPI Eina_Bool edje_object_part_text_cursor_is_format_get (const Evas_Object *obj, const char *part, Edje_Cursor cur);
        # EAPI Eina_Bool edje_object_part_text_cursor_is_visible_format_get(const Evas_Object *obj, const char *part, Edje_Cursor cur);
        # EAPI const char *edje_object_part_text_cursor_content_get (const Evas_Object *obj, const char *part, Edje_Cursor cur);
        # EAPI void edje_object_part_text_cursor_pos_set (Evas_Object *obj, const char *part, Edje_Cursor cur, int pos);
        # EAPI int edje_object_part_text_cursor_pos_get (const Evas_Object *obj, const char *part, Edje_Cursor cur);
        # EAPI void edje_object_text_insert_filter_callback_add (Evas_Object *obj, const char *part, Edje_Text_Filter_Cb func, void *data);
        # EAPI void *edje_object_text_insert_filter_callback_del (Evas_Object *obj, const char *part, Edje_Text_Filter_Cb func);
        # EAPI void *edje_object_text_insert_filter_callback_del_full (Evas_Object *obj, const char *part, Edje_Text_Filter_Cb func, void *data);
        # EAPI Eina_Bool edje_object_part_swallow (Evas_Object *obj, const char *part, Evas_Object *obj_swallow);
        # EAPI void edje_object_part_unswallow (Evas_Object *obj, Evas_Object *obj_swallow);
        # EAPI Evas_Object *edje_object_part_swallow_get (const Evas_Object *obj, const char *part);
        # EAPI const char *edje_object_part_state_get (const Evas_Object *obj, const char *part, double *val_ret);
        # EAPI Edje_Drag_Dir edje_object_part_drag_dir_get (const Evas_Object *obj, const char *part);
        # EAPI Eina_Bool edje_object_part_drag_value_set (Evas_Object *obj, const char *part, double dx, double dy);
        # EAPI Eina_Bool edje_object_part_drag_value_get (const Evas_Object *obj, const char *part, double *dx, double *dy);
        # EAPI Eina_Bool edje_object_part_drag_size_set (Evas_Object *obj, const char *part, double dw, double dh);
        # EAPI Eina_Bool edje_object_part_drag_size_get (const Evas_Object *obj, const char *part, double *dw, double *dh);
        # EAPI Eina_Bool edje_object_part_drag_step_set (Evas_Object *obj, const char *part, double dx, double dy);
        # EAPI Eina_Bool edje_object_part_drag_step_get (const Evas_Object *obj, const char *part, double *dx, double *dy);
        # EAPI Eina_Bool edje_object_part_drag_page_set (Evas_Object *obj, const char *part, double dx, double dy);
        # EAPI Eina_Bool edje_object_part_drag_page_get (const Evas_Object *obj, const char *part, double *dx, double *dy);
        # EAPI Eina_Bool edje_object_part_drag_step (Evas_Object *obj, const char *part, double dx, double dy);
        # EAPI Eina_Bool edje_object_part_drag_page (Evas_Object *obj, const char *part, double dx, double dy);
        # EAPI Evas_Object *edje_object_part_external_object_get (const Evas_Object *obj, const char *part);
        # EAPI Eina_Bool edje_object_part_external_param_set (Evas_Object *obj, const char *part, const Edje_External_Param *param);
        # EAPI Eina_Bool edje_object_part_external_param_get (const Evas_Object *obj, const char *part, Edje_External_Param *param);
        # EAPI Evas_Object *edje_object_part_external_content_get (const Evas_Object *obj, const char *part, const char *content);
        # EAPI Edje_External_Param_Type edje_object_part_external_param_type_get (const Evas_Object *obj, const char *part, const char *param);
        # EAPI Eina_Bool edje_object_part_box_append (Evas_Object *obj, const char *part, Evas_Object *child);
        # EAPI Eina_Bool edje_object_part_box_prepend (Evas_Object *obj, const char *part, Evas_Object *child);
        # EAPI Eina_Bool edje_object_part_box_insert_before (Evas_Object *obj, const char *part, Evas_Object *child, const Evas_Object *reference);
        # EAPI Eina_Bool edje_object_part_box_insert_at (Evas_Object *obj, const char *part, Evas_Object *child, unsigned int pos);
        # EAPI Evas_Object *edje_object_part_box_remove (Evas_Object *obj, const char *part, Evas_Object *child);
        # EAPI Evas_Object *edje_object_part_box_remove_at (Evas_Object *obj, const char *part, unsigned int pos);
        # EAPI Eina_Bool edje_object_part_box_remove_all (Evas_Object *obj, const char *part, Eina_Bool clear);
        # EAPI Evas_Object *edje_object_part_table_child_get (Evas_Object *obj, const char *part, unsigned int col, unsigned int row);
        # EAPI Eina_Bool edje_object_part_table_pack (Evas_Object *obj, const char *part, Evas_Object *child_obj, unsigned short col, unsigned short row, unsigned short colspan, unsigned short rowspan);
        # EAPI Eina_Bool edje_object_part_table_unpack (Evas_Object *obj, const char *part, Evas_Object *child_obj);
        # EAPI Eina_Bool edje_object_part_table_col_row_size_get (const Evas_Object *obj, const char *part, int *cols, int *rows);
        # EAPI Eina_Bool edje_object_part_table_clear (Evas_Object *obj, const char *part, Eina_Bool clear);
        # EAPI void edje_object_message_send (Evas_Object *obj, Edje_Message_Type type, int id, void *msg);
        # EAPI void edje_object_message_handler_set (Evas_Object *obj, Edje_Message_Handler_Cb func, void *data);
        # EAPI void edje_object_message_signal_process (Evas_Object *obj);
        # EAPI void edje_message_signal_process (void);
        # EAPI Eina_Bool edje_external_type_register (const char *type_name, const Edje_External_Type *type_info);
        # EAPI Eina_Bool edje_external_type_unregister (const char *type_name);
        # EAPI void edje_external_type_array_register (const Edje_External_Type_Info *array);
        # EAPI void edje_external_type_array_unregister (const Edje_External_Type_Info *array);
        # EAPI unsigned int edje_external_type_abi_version_get (void);
        # EAPI Eina_Iterator *edje_external_iterator_get (void);
        # EAPI Edje_External_Param *edje_external_param_find (const Eina_List *params, const char *key);
        # EAPI Eina_Bool edje_external_param_int_get (const Eina_List *params, const char *key, int *ret);
        # EAPI Eina_Bool edje_external_param_double_get (const Eina_List *params, const char *key, double *ret);
        # EAPI Eina_Bool edje_external_param_string_get (const Eina_List *params, const char *key, const char **ret);
        # EAPI Eina_Bool edje_external_param_bool_get (const Eina_List *params, const char *key, Eina_Bool *ret);
        # EAPI Eina_Bool edje_external_param_choice_get (const Eina_List *params, const char *key, const char **ret);
        # EAPI const Edje_External_Param_Info *edje_external_param_info_get (const char *type_name);
        # EAPI const Edje_External_Type *edje_external_type_get (const char *type_name);
        # EAPI Eina_Bool edje_module_load (const char *module);
        # EAPI const Eina_List *edje_available_modules_get (void);
        # EAPI Edje_Perspective *edje_perspective_new (Evas *e);
        # EAPI void edje_perspective_free (Edje_Perspective *ps);
        # EAPI void edje_perspective_set (Edje_Perspective *ps, Evas_Coord px, Evas_Coord py, Evas_Coord z0, Evas_Coord foc);
        # EAPI void edje_perspective_global_set (Edje_Perspective *ps, Eina_Bool global);
        # EAPI Eina_Bool edje_perspective_global_get (const Edje_Perspective *ps);
        # EAPI const Edje_Perspective *edje_evas_global_perspective_get(const Evas *e);
        # EAPI void edje_object_perspective_set (Evas_Object *obj, Edje_Perspective *ps);
        # EAPI const Edje_Perspective *edje_object_perspective_get (const Evas_Object *obj);
    end
end

__END__

data {
    item: "key1" "val1";
}
collections {
   group {
        name: "my_group";
        data {
            item: "key2" "val2";
        }
        parts {
            part {
                name: "background";
                type: RECT;
                mouse_events: 0;
                description {
                    state: "default" 0.0;
                    color: 255 255 255 255;
                    rel1 {
                        relative: 0.0 0.0;
                        offset: 0 0;
                    }
                    rel2 {
                        relative: 1.0 1.0;
                        offset: -1 -1;
                    }
                }
            }
            part {
                name: "text";
                type: TEXT;
                mouse_events: 1;
                description {
                    state: "default" 0.0;
                    color: 255 0 0 255;
                    rel1 {
                        relative: 0.1 0.2;
                        offset: 5 10;
                    }
                    rel2 {
                        relative: 0.9 0.8;
                        offset: -6 -11;
                    }
                    text {
                        font: "Sans";
                        size: 10;
                        text: "hello world";
                    }
                }
                description {
                    state: "over" 0.0;
                    inherit: "default" 0.0;
                    color: 0 255 0 255;
                }
            }
            programs {
                program {
                    signal: "mouse,in";
                    source: "text";
                    action: STATE_SET "over" 0.0;
                    target: "text";
                    transition: LINEAR 0.1;
                }
                program {
                    signal: "mouse,out";
                    source: "text";
                    action: STATE_SET "default" 0.0;
                    target: "text";
                    transition: LINEAR 0.1;
                }
            }
        }
    }
}

