#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/emap'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmMap
        #
        FCT_PREFIX = 'elm_map_' unless const_defined? :FCT_PREFIX
        #
        def self.method_missing meth, *args, &block
            sym = Efl::MethodResolver.resolve self, meth, FCT_PREFIX
            self.send sym, *args, &block
        end
        #
    end
    #
    module Native
        #
        ffi_lib 'elementary'
        #
        # ENUMS
        # typedef enum {...} Elm_Map_Zoom_Mode;
        enum :elm_map_zoom_mode, [ :elm_map_zoom_mode_manual, :elm_map_zoom_mode_auto_fit, :elm_map_zoom_mode_auto_fill, :elm_map_zoom_mode_last ]
        # typedef enum {...} Elm_Map_Source_Type;
        enum :elm_map_source_type, [ :elm_map_source_type_tile, :elm_map_source_type_route, :elm_map_source_type_name, :elm_map_source_type_last ]
        # typedef enum {...} Elm_Map_Route_Type;
        enum :elm_map_route_type, [ :elm_map_route_type_motocar, :elm_map_route_type_bicycle, :elm_map_route_type_foot, :elm_map_route_type_last ]
        # typedef enum {...} Elm_Map_Route_Method;
        enum :elm_map_route_method, [ :elm_map_route_method_fastest, :elm_map_route_method_shortest, :elm_map_route_method_last ]
        # typedef enum {...} Elm_Map_Name_Method;
        enum :elm_map_name_method, [ :elm_map_name_method_search, :elm_map_name_method_reverse, :elm_map_name_method_last ]
        # typedef enum _Elm_Map_Overlay_Type {...} Elm_Map_Overlay_Type;
        enum :elm_map_overlay_type, [ :elm_map_overlay_type_none, 0, :elm_map_overlay_type_default, 1, :elm_map_overlay_type_class, 2,
            :elm_map_overlay_type_group, 3, :elm_map_overlay_type_bubble, 4, :elm_map_overlay_type_route, 5, :elm_map_overlay_type_line, 6,
            :elm_map_overlay_type_polygon, 7, :elm_map_overlay_type_circle, 8, :elm_map_overlay_type_scale, 9 ]
        #
        # TYPEDEFS
        # typedef struct _Elm_Map_Marker Elm_Map_Marker;
        typedef :pointer, :elm_map_marker
        # typedef struct _Elm_Map_Marker_Class Elm_Map_Marker_Class;
        typedef :pointer, :elm_map_marker_class
        # typedef struct _Elm_Map_Group_Class Elm_Map_Group_Class;
        typedef :pointer, :elm_map_group_class
        # typedef struct _Elm_Map_Route Elm_Map_Route;
        typedef :pointer, :elm_map_route
        # typedef struct _Elm_Map_Name Elm_Map_Name;
        typedef :pointer, :elm_map_name
        # typedef struct _Elm_Map_Overlay Elm_Map_Overlay;
        typedef :pointer, :elm_map_overlay
        #
        # CALLBACKS
        # typedef Evas_Object *(*Elm_Map_Marker_Get_Func) (Evas_Object *obj, Elm_Map_Marker *marker, void *data);
        callback :elm_map_marker_get_func_cb, [ :evas_object, :elm_map_marker, :pointer ], :evas_object
        # typedef void (*Elm_Map_Marker_Del_Func) (Evas_Object *obj, Elm_Map_Marker *marker, void *data, Evas_Object *o);
        callback :elm_map_marker_del_func_cb, [ :evas_object, :elm_map_marker, :pointer, :evas_object ], :void
        # typedef Evas_Object *(*Elm_Map_Marker_Icon_Get_Func) (Evas_Object *obj, Elm_Map_Marker *marker, void *data);
        callback :elm_map_marker_icon_get_func_cb, [ :evas_object, :elm_map_marker, :pointer ], :evas_object
        # typedef Evas_Object *(*Elm_Map_Group_Icon_Get_Func) (Evas_Object *obj, void *data);
        callback :elm_map_group_icon_get_func_cb, [ :evas_object, :pointer ], :evas_object
        # typedef void (*Elm_Map_Overlay_Get_Cb) (void *data, Evas_Object *map, Elm_Map_Overlay *overlay);
        callback :elm_map_overlay_get_cb, [ :pointer, :evas_object, :elm_map_overlay ], :void
        # typedef void (*Elm_Map_Name_Cb) (void *data, Evas_Object *map, Elm_Map_Name *name);
        callback :elm_map_name_cb, [ :pointer, :evas_object, :elm_map_name ], :void
        # typedef void (*Elm_Map_Route_Cb) (void *data, Evas_Object *map, Elm_Map_Route *route);
        callback :elm_map_route_cb, [ :pointer, :evas_object, :elm_map_route ], :void
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_map_add(Evas_Object *parent);
        [ :elm_map_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_map_zoom_set(Evas_Object *obj, int zoom);
        [ :elm_map_zoom_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_map_zoom_get(const Evas_Object *obj);
        [ :elm_map_zoom_get, [ :evas_object ], :int ],
        # EAPI void elm_map_zoom_mode_set(Evas_Object *obj, Elm_Map_Zoom_Mode mode);
        [ :elm_map_zoom_mode_set, [ :evas_object, :elm_map_zoom_mode ], :void ],
        # EAPI Elm_Map_Zoom_Mode elm_map_zoom_mode_get(const Evas_Object *obj);
        [ :elm_map_zoom_mode_get, [ :evas_object ], :elm_map_zoom_mode ],
        # EAPI void elm_map_zoom_min_set(Evas_Object *obj, int zoom);
        [ :elm_map_zoom_min_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_map_zoom_min_get(const Evas_Object *obj);
        [ :elm_map_zoom_min_get, [ :evas_object ], :int ],
        # EAPI void elm_map_zoom_max_set(Evas_Object *obj, int zoom);
        [ :elm_map_zoom_max_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_map_zoom_max_get(const Evas_Object *obj);
        [ :elm_map_zoom_max_get, [ :evas_object ], :int ],
        # EAPI void elm_map_region_get(const Evas_Object *obj, double *lon, double *lat);
        [ :elm_map_region_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_map_region_bring_in(Evas_Object *obj, double lon, double lat);
        [ :elm_map_region_bring_in, [ :evas_object, :double, :double ], :void ],
        # EAPI void elm_map_region_show(Evas_Object *obj, double lon, double lat);
        [ :elm_map_region_show, [ :evas_object, :double, :double ], :void ],
        # EAPI void elm_map_canvas_to_region_convert(const Evas_Object *obj, const Evas_Coord x, const Evas_Coord y, double *lon, double *lat);
        [ :elm_map_canvas_to_region_convert, [ :evas_object, :int, :int, :pointer, :pointer ], :void ],
        # EAPI void elm_map_region_to_canvas_convert(const Evas_Object *obj, double lon, double lat, Evas_Coord *x, Evas_Coord *y);
        [ :elm_map_region_to_canvas_convert, [ :evas_object, :double, :double, :pointer, :pointer ], :void ],
        # EAPI void elm_map_paused_set(Evas_Object *obj, Eina_Bool paused);
        [ :elm_map_paused_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_map_paused_get(const Evas_Object *obj);
        [ :elm_map_paused_get, [ :evas_object ], :bool ],
        # EAPI void elm_map_rotate_set(Evas_Object *obj, double degree, Evas_Coord cx, Evas_Coord cy);
        [ :elm_map_rotate_set, [ :evas_object, :double, :int, :int ], :void ],
        # EAPI void elm_map_rotate_get(const Evas_Object *obj, double *degree, Evas_Coord *cx, Evas_Coord *cy);
        [ :elm_map_rotate_get, [ :evas_object, :pointer, :pointer, :pointer ], :void ],
        # EAPI void elm_map_wheel_disabled_set(Evas_Object *obj, Eina_Bool disabled);
        [ :elm_map_wheel_disabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_map_wheel_disabled_get(const Evas_Object *obj);
        [ :elm_map_wheel_disabled_get, [ :evas_object ], :bool ],
        # EAPI void elm_map_user_agent_set(Evas_Object *obj, const char *user_agent);
        [ :elm_map_user_agent_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_map_user_agent_get(const Evas_Object *obj);
        [ :elm_map_user_agent_get, [ :evas_object ], :string ],
        # EAPI Elm_Map_Overlay * elm_map_overlay_add(Evas_Object *obj, double lon, double lat);
        [ :elm_map_overlay_add, [ :evas_object, :double, :double ], :elm_map_overlay ],
        # EAPI void elm_map_overlay_del(Elm_Map_Overlay *overlay);
        [ :elm_map_overlay_del, [ :elm_map_overlay ], :void ],
        # EAPI Elm_Map_Overlay_Type elm_map_overlay_type_get(const Elm_Map_Overlay *overlay);
        [ :elm_map_overlay_type_get, [ :elm_map_overlay ], :elm_map_overlay_type ],
        # EAPI void elm_map_overlay_data_set(Elm_Map_Overlay *overlay, void *data);
        [ :elm_map_overlay_data_set, [ :elm_map_overlay, :pointer ], :void ],
        # EAPI void * elm_map_overlay_data_get(const Elm_Map_Overlay *overlay);
        [ :elm_map_overlay_data_get, [ :elm_map_overlay ], :pointer ],
        # EAPI void elm_map_overlay_hide_set(Elm_Map_Overlay *overlay, Eina_Bool hide);
        [ :elm_map_overlay_hide_set, [ :elm_map_overlay, :bool ], :void ],
        # EAPI Eina_Bool elm_map_overlay_hide_get(const Elm_Map_Overlay *overlay);
        [ :elm_map_overlay_hide_get, [ :elm_map_overlay ], :bool ],
        # EAPI void elm_map_overlay_displayed_zoom_min_set(Elm_Map_Overlay *overlay, int zoom);
        [ :elm_map_overlay_displayed_zoom_min_set, [ :elm_map_overlay, :int ], :void ],
        # EAPI int elm_map_overlay_displayed_zoom_min_get(const Elm_Map_Overlay *overlay);
        [ :elm_map_overlay_displayed_zoom_min_get, [ :elm_map_overlay ], :int ],
        # EAPI void elm_map_overlay_paused_set(Elm_Map_Overlay *overlay, Eina_Bool paused);
        [ :elm_map_overlay_paused_set, [ :elm_map_overlay, :bool ], :void ],
        # EAPI Eina_Bool elm_map_overlay_paused_get(const Elm_Map_Overlay *overlay);
        [ :elm_map_overlay_paused_get, [ :elm_map_overlay ], :bool ],
        # EAPI void elm_map_overlay_content_set(Elm_Map_Overlay *overlay, Evas_Object *obj);
        [ :elm_map_overlay_content_set, [ :elm_map_overlay, :evas_object ], :void ],
        # EAPI const Evas_Object * elm_map_overlay_content_get(const Elm_Map_Overlay *overlay);
        [ :elm_map_overlay_content_get, [ :elm_map_overlay ], :evas_object ],
        # EAPI void elm_map_overlay_icon_set(Elm_Map_Overlay *overlay, Evas_Object *icon);
        [ :elm_map_overlay_icon_set, [ :elm_map_overlay, :evas_object ], :void ],
        # EAPI const Evas_Object * elm_map_overlay_icon_get(const Elm_Map_Overlay *overlay);
        [ :elm_map_overlay_icon_get, [ :elm_map_overlay ], :evas_object ],
        # EAPI void elm_map_overlay_region_set(Elm_Map_Overlay *overlay, double lon, double lat);
        [ :elm_map_overlay_region_set, [ :elm_map_overlay, :double, :double ], :void ],
        # EAPI void elm_map_overlay_region_get(const Elm_Map_Overlay *overlay, double *lon, double *lat);
        [ :elm_map_overlay_region_get, [ :elm_map_overlay, :pointer, :pointer ], :void ],
        # EAPI void elm_map_overlay_color_set(Elm_Map_Overlay *overlay, int r, int g, int b, int a);
        [ :elm_map_overlay_color_set, [ :elm_map_overlay, :int, :int, :int, :int ], :void ],
        # EAPI void elm_map_overlay_color_get(const Elm_Map_Overlay *overlay, int *r, int *g, int *b, int *a);
        [ :elm_map_overlay_color_get, [ :elm_map_overlay, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void elm_map_overlay_show(Elm_Map_Overlay *overlay);
        [ :elm_map_overlay_show, [ :elm_map_overlay ], :void ],
        # EAPI void elm_map_overlays_show(Eina_List *overlays);
        [ :elm_map_overlays_show, [ :eina_list ], :void ],
        # EAPI void elm_map_overlay_get_cb_set(Elm_Map_Overlay *overlay, Elm_Map_Overlay_Get_Cb get_cb, void *data);
        [ :elm_map_overlay_get_cb_set, [ :elm_map_overlay, :elm_map_overlay_get_cb, :pointer ], :void ],
        # EAPI Elm_Map_Overlay * elm_map_overlay_class_add(Evas_Object *obj);
        [ :elm_map_overlay_class_add, [ :evas_object ], :elm_map_overlay ],
        # EAPI void elm_map_overlay_class_append(Elm_Map_Overlay *clas, Elm_Map_Overlay *overlay);
        [ :elm_map_overlay_class_append, [ :elm_map_overlay, :elm_map_overlay ], :void ],
        # EAPI void elm_map_overlay_class_remove(Elm_Map_Overlay *clas, Elm_Map_Overlay *overlay);
        [ :elm_map_overlay_class_remove, [ :elm_map_overlay, :elm_map_overlay ], :void ],
        # EAPI void elm_map_overlay_class_zoom_max_set(Elm_Map_Overlay *clas, int zoom);
        [ :elm_map_overlay_class_zoom_max_set, [ :elm_map_overlay, :int ], :void ],
        # EAPI int elm_map_overlay_class_zoom_max_get(const Elm_Map_Overlay *clas);
        [ :elm_map_overlay_class_zoom_max_get, [ :elm_map_overlay ], :int ],
        # EAPI Eina_List * elm_map_overlay_group_members_get(const Elm_Map_Overlay *grp);
        [ :elm_map_overlay_group_members_get, [ :elm_map_overlay ], :eina_list ],
        # EAPI Elm_Map_Overlay * elm_map_overlay_bubble_add(Evas_Object *obj);
        [ :elm_map_overlay_bubble_add, [ :evas_object ], :elm_map_overlay ],
        # EAPI void elm_map_overlay_bubble_follow(Elm_Map_Overlay *bubble, const Elm_Map_Overlay *parent);
        [ :elm_map_overlay_bubble_follow, [ :elm_map_overlay, :elm_map_overlay ], :void ],
        # EAPI void elm_map_overlay_bubble_content_append(Elm_Map_Overlay *bubble, Evas_Object *content);
        [ :elm_map_overlay_bubble_content_append, [ :elm_map_overlay, :evas_object ], :void ],
        # EAPI void elm_map_overlay_bubble_content_clear(Elm_Map_Overlay *bubble);
        [ :elm_map_overlay_bubble_content_clear, [ :elm_map_overlay ], :void ],
        # EAPI Elm_Map_Overlay * elm_map_overlay_route_add(Evas_Object *obj, const Elm_Map_Route *route);
        [ :elm_map_overlay_route_add, [ :evas_object, :elm_map_route ], :elm_map_overlay ],
        # EAPI Elm_Map_Overlay * elm_map_overlay_line_add(Evas_Object *obj, double flon, double flat, double tlon, double tlat);
        [ :elm_map_overlay_line_add, [ :evas_object, :double, :double, :double, :double ], :elm_map_overlay ],
        # EAPI Elm_Map_Overlay * elm_map_overlay_polygon_add(Evas_Object *obj);
        [ :elm_map_overlay_polygon_add, [ :evas_object ], :elm_map_overlay ],
        # EAPI void elm_map_overlay_polygon_region_add(Elm_Map_Overlay *overlay, double lon, double lat);
        [ :elm_map_overlay_polygon_region_add, [ :elm_map_overlay, :double, :double ], :void ],
        # EAPI Elm_Map_Overlay * elm_map_overlay_circle_add(Evas_Object *obj, double lon, double lat, double radius);
        [ :elm_map_overlay_circle_add, [ :evas_object, :double, :double, :double ], :elm_map_overlay ],
        # EAPI Elm_Map_Overlay * elm_map_overlay_scale_add(Evas_Object *obj, Evas_Coord x, Evas_Coord y);
        [ :elm_map_overlay_scale_add, [ :evas_object, :int, :int ], :elm_map_overlay ],
        # EAPI void elm_map_tile_load_status_get(const Evas_Object *obj, int *try_num, int *finish_num);
        [ :elm_map_tile_load_status_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI const char **elm_map_sources_get(const Evas_Object *obj, Elm_Map_Source_Type type);
        [ :elm_map_sources_get, [ :evas_object, :elm_map_source_type ], :pointer ],
        # EAPI void elm_map_source_set(Evas_Object *obj, Elm_Map_Source_Type type, const char *source_name);
        [ :elm_map_source_set, [ :evas_object, :elm_map_source_type, :string ], :void ],
        # EAPI const char *elm_map_source_get(const Evas_Object *obj, Elm_Map_Source_Type type);
        [ :elm_map_source_get, [ :evas_object, :elm_map_source_type ], :string ],
        # EAPI Elm_Map_Route *elm_map_route_add(Evas_Object *obj, Elm_Map_Route_Type type, Elm_Map_Route_Method method, double flon, double flat, double tlon, double tlat, Elm_Map_Route_Cb route_cb, void *data);
        [ :elm_map_route_add, [ :evas_object, :elm_map_route_type, :elm_map_route_method, :double, :double, :double, :double, :elm_map_route_cb,
            :pointer ], :elm_map_route ],
        # EAPI void elm_map_route_del(Elm_Map_Route *route);
        [ :elm_map_route_del, [ :elm_map_route ], :void ],
        # EAPI double elm_map_route_distance_get(const Elm_Map_Route *route);
        [ :elm_map_route_distance_get, [ :elm_map_route ], :double ],
        # EAPI const char *elm_map_route_node_get(const Elm_Map_Route *route);
        [ :elm_map_route_node_get, [ :elm_map_route ], :string ],
        # EAPI const char *elm_map_route_waypoint_get(const Elm_Map_Route *route);
        [ :elm_map_route_waypoint_get, [ :elm_map_route ], :string ],
        # EAPI Elm_Map_Name *elm_map_name_add(const Evas_Object *obj, const char *address, double lon, double lat, Elm_Map_Name_Cb name_cb, void *data);
        [ :elm_map_name_add, [ :evas_object, :string, :double, :double, :elm_map_name_cb, :pointer ], :elm_map_name ],
        # EAPI const char *elm_map_name_address_get(const Elm_Map_Name *name);
        [ :elm_map_name_address_get, [ :elm_map_name ], :string ],
        # EAPI void elm_map_name_region_get(const Elm_Map_Name *name, double *lon, double *lat);
        [ :elm_map_name_region_get, [ :elm_map_name, :pointer, :pointer ], :void ],
        # EAPI void elm_map_name_del(Elm_Map_Name *name);
        [ :elm_map_name_del, [ :elm_map_name ], :void ],
        # EAPI Evas_Object *elm_map_track_add(Evas_Object *obj, void *emap);
        [ :elm_map_track_add, [ :evas_object, :pointer ], :evas_object ],
        # EAPI void elm_map_track_remove(Evas_Object *obj, Evas_Object *route);
        [ :elm_map_track_remove, [ :evas_object, :evas_object ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
