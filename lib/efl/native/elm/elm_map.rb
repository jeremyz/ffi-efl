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
        ffi_lib 'elementary-ver-pre-svn-09.so.0'
        #
        # ENUMS
        # typedef enum {...} Elm_Map_Zoom_Mode;
        enum :elm_map_zoom_mode, [ :elm_map_zoom_mode_manual, :elm_map_zoom_mode_auto_fit, :elm_map_zoom_mode_auto_fill, :elm_map_zoom_mode_last ]
        # typedef enum {...} Elm_Map_Route_Sources;
        enum :elm_map_route_sources, [ :elm_map_route_source_yours, :elm_map_route_source_monav, :elm_map_route_source_ors, :elm_map_route_source_last
            ]
        # typedef enum {...} Elm_Map_Name_Sources;
        enum :elm_map_name_sources, [ :elm_map_name_source_nominatim, :elm_map_name_source_last ]
        # typedef enum {...} Elm_Map_Route_Type;
        enum :elm_map_route_type, [ :elm_map_route_type_motocar, :elm_map_route_type_bicycle, :elm_map_route_type_foot, :elm_map_route_type_last ]
        # typedef enum {...} Elm_Map_Route_Method;
        enum :elm_map_route_method, [ :elm_map_route_method_fastest, :elm_map_route_method_shortest, :elm_map_route_method_last ]
        # typedef enum _Elm_Map_Overlay_Type {...} Elm_Map_Overlay_Type;
        enum :elm_map_overlay_type, [ :elm_map_overlay_type_none, 0, :elm_map_overlay_type_default, 1, :elm_map_overlay_type_class, 2,
            :elm_map_overlay_type_bubble, 3 ]
        # typedef enum {...} Elm_Map_Name_Method;
        enum :elm_map_name_method, [ :elm_map_name_method_search, :elm_map_name_method_reverse, :elm_map_name_method_last ]
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
        # typedef char *(*Elm_Map_Module_Source_Func) (void);
        callback :elm_map_module_source_func_cb, [  ], :string
        # typedef int (*Elm_Map_Module_Zoom_Min_Func) (void);
        callback :elm_map_module_zoom_min_func_cb, [  ], :int
        # typedef int (*Elm_Map_Module_Zoom_Max_Func) (void);
        callback :elm_map_module_zoom_max_func_cb, [  ], :int
        # typedef char *(*Elm_Map_Module_Url_Func) (Evas_Object *obj, int x, int y, int zoom);
        callback :elm_map_module_url_func_cb, [ :evas_object, :int, :int, :int ], :string
        # typedef int (*Elm_Map_Module_Route_Source_Func) (void);
        callback :elm_map_module_route_source_func_cb, [  ], :int
        # typedef char *(*Elm_Map_Module_Route_Url_Func) (Evas_Object *obj, char *type_name, int method, double flon, double flat, double tlon, double tlat);
        callback :elm_map_module_route_url_func_cb, [ :evas_object, :string, :int, :double, :double, :double, :double ], :string
        # typedef char *(*Elm_Map_Module_Name_Url_Func) (Evas_Object *obj, int method, char *name, double lon, double lat);
        callback :elm_map_module_name_url_func_cb, [ :evas_object, :int, :string, :double, :double ], :string
        # typedef Eina_Bool (*Elm_Map_Module_Geo_Into_Coord_Func) (const Evas_Object *obj, int zoom, double lon, double lat, int size, int *x, int *y);
        callback :elm_map_module_geo_into_coord_func_cb, [ :evas_object, :int, :double, :double, :int, :pointer, :pointer ], :bool
        # typedef Eina_Bool (*Elm_Map_Module_Coord_Into_Geo_Func) (const Evas_Object *obj, int zoom, int x, int y, int size, double *lon, double *lat);
        callback :elm_map_module_coord_into_geo_func_cb, [ :evas_object, :int, :int, :int, :int, :pointer, :pointer ], :bool
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
        # EAPI void elm_map_geo_region_get(const Evas_Object *obj, double *lon, double *lat);
        [ :elm_map_geo_region_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_map_geo_region_bring_in(Evas_Object *obj, double lon, double lat);
        [ :elm_map_geo_region_bring_in, [ :evas_object, :double, :double ], :void ],
        # EAPI void elm_map_geo_region_show(Evas_Object *obj, double lon, double lat);
        [ :elm_map_geo_region_show, [ :evas_object, :double, :double ], :void ],
        # EAPI void elm_map_paused_set(Evas_Object *obj, Eina_Bool paused);
        [ :elm_map_paused_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_map_paused_get(const Evas_Object *obj);
        [ :elm_map_paused_get, [ :evas_object ], :bool ],
        # EAPI void elm_map_paused_markers_set(Evas_Object *obj, Eina_Bool paused);
        [ :elm_map_paused_markers_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_map_paused_markers_get(const Evas_Object *obj);
        [ :elm_map_paused_markers_get, [ :evas_object ], :bool ],
        # EAPI void elm_map_utils_downloading_status_get(const Evas_Object *obj, int *try_num, int *finish_num);
        [ :elm_map_utils_downloading_status_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_map_utils_convert_coord_into_geo(const Evas_Object *obj, int x, int y, int size, double *lon, double *lat);
        [ :elm_map_utils_convert_coord_into_geo, [ :evas_object, :int, :int, :int, :pointer, :pointer ], :void ],
        # EAPI void elm_map_utils_convert_geo_into_coord(const Evas_Object *obj, double lon, double lat, int size, int *x, int *y);
        [ :elm_map_utils_convert_geo_into_coord, [ :evas_object, :double, :double, :int, :pointer, :pointer ], :void ],
        # EAPI Elm_Map_Name *elm_map_utils_convert_coord_into_name(const Evas_Object *obj, double lon, double lat);
        [ :elm_map_utils_convert_coord_into_name, [ :evas_object, :double, :double ], :elm_map_name ],
        # EAPI Elm_Map_Name *elm_map_utils_convert_name_into_coord(const Evas_Object *obj, char *address);
        [ :elm_map_utils_convert_name_into_coord, [ :evas_object, :string ], :elm_map_name ],
        # EAPI void elm_map_canvas_to_geo_convert(const Evas_Object *obj, const Evas_Coord x, const Evas_Coord y, double *lon, double *lat);
        [ :elm_map_canvas_to_geo_convert, [ :evas_object, :int, :int, :pointer, :pointer ], :void ],
        # EAPI Elm_Map_Marker *elm_map_marker_add(Evas_Object *obj, double lon, double lat, Elm_Map_Marker_Class *clas, Elm_Map_Group_Class *clas_group, void *data);
        [ :elm_map_marker_add, [ :evas_object, :double, :double, :elm_map_marker_class, :elm_map_group_class, :pointer ], :elm_map_marker ],
        # EAPI void elm_map_max_marker_per_group_set(Evas_Object *obj, int max);
        [ :elm_map_max_marker_per_group_set, [ :evas_object, :int ], :void ],
        # EAPI void elm_map_marker_remove(Elm_Map_Marker *marker);
        [ :elm_map_marker_remove, [ :elm_map_marker ], :void ],
        # EAPI void elm_map_marker_region_get(const Elm_Map_Marker *marker, double *lon, double *lat);
        [ :elm_map_marker_region_get, [ :elm_map_marker, :pointer, :pointer ], :void ],
        # EAPI void elm_map_marker_bring_in(Elm_Map_Marker *marker);
        [ :elm_map_marker_bring_in, [ :elm_map_marker ], :void ],
        # EAPI void elm_map_marker_show(Elm_Map_Marker *marker);
        [ :elm_map_marker_show, [ :elm_map_marker ], :void ],
        # EAPI void elm_map_markers_list_show(Eina_List *markers);
        [ :elm_map_markers_list_show, [ :eina_list ], :void ],
        # EAPI Evas_Object *elm_map_marker_object_get(const Elm_Map_Marker *marker);
        [ :elm_map_marker_object_get, [ :elm_map_marker ], :evas_object ],
        # EAPI void elm_map_marker_update(Elm_Map_Marker *marker);
        [ :elm_map_marker_update, [ :elm_map_marker ], :void ],
        # EAPI void elm_map_bubbles_close(Evas_Object *obj);
        [ :elm_map_bubbles_close, [ :evas_object ], :void ],
        # EAPI Elm_Map_Group_Class *elm_map_group_class_new(Evas_Object *obj);
        [ :elm_map_group_class_new, [ :evas_object ], :elm_map_group_class ],
        # EAPI void elm_map_group_class_style_set(Elm_Map_Group_Class *clas, const char *style);
        [ :elm_map_group_class_style_set, [ :elm_map_group_class, :string ], :void ],
        # EAPI void elm_map_group_class_icon_cb_set(Elm_Map_Group_Class *clas, Elm_Map_Group_Icon_Get_Func icon_get);
        [ :elm_map_group_class_icon_cb_set, [ :elm_map_group_class, :elm_map_group_icon_get_func_cb ], :void ],
        # EAPI void elm_map_group_class_data_set(Elm_Map_Group_Class *clas, void *data);
        [ :elm_map_group_class_data_set, [ :elm_map_group_class, :pointer ], :void ],
        # EAPI void elm_map_group_class_zoom_displayed_set(Elm_Map_Group_Class *clas, int zoom);
        [ :elm_map_group_class_zoom_displayed_set, [ :elm_map_group_class, :int ], :void ],
        # EAPI void elm_map_group_class_zoom_grouped_set(Elm_Map_Group_Class *clas, int zoom);
        [ :elm_map_group_class_zoom_grouped_set, [ :elm_map_group_class, :int ], :void ],
        # EAPI void elm_map_group_class_hide_set(Evas_Object *obj, Elm_Map_Group_Class *clas, Eina_Bool hide);
        [ :elm_map_group_class_hide_set, [ :evas_object, :elm_map_group_class, :bool ], :void ],
        # EAPI Elm_Map_Marker_Class *elm_map_marker_class_new(Evas_Object *obj);
        [ :elm_map_marker_class_new, [ :evas_object ], :elm_map_marker_class ],
        # EAPI void elm_map_marker_class_style_set(Elm_Map_Marker_Class *clas, const char *style);
        [ :elm_map_marker_class_style_set, [ :elm_map_marker_class, :string ], :void ],
        # EAPI void elm_map_marker_class_icon_cb_set(Elm_Map_Marker_Class *clas, Elm_Map_Marker_Icon_Get_Func icon_get);
        [ :elm_map_marker_class_icon_cb_set, [ :elm_map_marker_class, :elm_map_marker_icon_get_func_cb ], :void ],
        # EAPI void elm_map_marker_class_get_cb_set(Elm_Map_Marker_Class *clas, Elm_Map_Marker_Get_Func get);
        [ :elm_map_marker_class_get_cb_set, [ :elm_map_marker_class, :elm_map_marker_get_func_cb ], :void ],
        # EAPI void elm_map_marker_class_del_cb_set(Elm_Map_Marker_Class *clas, Elm_Map_Marker_Del_Func del);
        [ :elm_map_marker_class_del_cb_set, [ :elm_map_marker_class, :elm_map_marker_del_func_cb ], :void ],
        # EAPI const char **elm_map_source_names_get(const Evas_Object *obj);
        [ :elm_map_source_names_get, [ :evas_object ], :pointer ],
        # EAPI void elm_map_source_name_set(Evas_Object *obj, const char *source_name);
        [ :elm_map_source_name_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_map_source_name_get(const Evas_Object *obj);
        [ :elm_map_source_name_get, [ :evas_object ], :string ],
        # EAPI void elm_map_route_source_set(Evas_Object *obj, Elm_Map_Route_Sources source);
        [ :elm_map_route_source_set, [ :evas_object, :elm_map_route_sources ], :void ],
        # EAPI Elm_Map_Route_Sources elm_map_route_source_get(const Evas_Object *obj);
        [ :elm_map_route_source_get, [ :evas_object ], :elm_map_route_sources ],
        # EAPI void elm_map_source_zoom_min_set(Evas_Object *obj, int zoom);
        [ :elm_map_source_zoom_min_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_map_source_zoom_min_get(const Evas_Object *obj);
        [ :elm_map_source_zoom_min_get, [ :evas_object ], :int ],
        # EAPI void elm_map_source_zoom_max_set(Evas_Object *obj, int zoom);
        [ :elm_map_source_zoom_max_set, [ :evas_object, :int ], :void ],
        # EAPI int elm_map_source_zoom_max_get(const Evas_Object *obj);
        [ :elm_map_source_zoom_max_get, [ :evas_object ], :int ],
        # EAPI void elm_map_user_agent_set(Evas_Object *obj, const char *user_agent);
        [ :elm_map_user_agent_set, [ :evas_object, :string ], :void ],
        # EAPI const char *elm_map_user_agent_get(const Evas_Object *obj);
        [ :elm_map_user_agent_get, [ :evas_object ], :string ],
        # EAPI Elm_Map_Route *elm_map_route_add(Evas_Object *obj, Elm_Map_Route_Type type, Elm_Map_Route_Method method, double flon, double flat, double tlon, double tlat);
        [ :elm_map_route_add, [ :evas_object, :elm_map_route_type, :elm_map_route_method, :double, :double, :double, :double ], :elm_map_route ],
        # EAPI void elm_map_route_remove(Elm_Map_Route *route);
        [ :elm_map_route_remove, [ :elm_map_route ], :void ],
        # EAPI void elm_map_route_color_set(Elm_Map_Route *route, int r, int g, int b, int a);
        [ :elm_map_route_color_set, [ :elm_map_route, :int, :int, :int, :int ], :void ],
        # EAPI void elm_map_route_color_get(const Elm_Map_Route *route, int *r, int *g, int *b, int *a);
        [ :elm_map_route_color_get, [ :elm_map_route, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI double elm_map_route_distance_get(const Elm_Map_Route *route);
        [ :elm_map_route_distance_get, [ :elm_map_route ], :double ],
        # EAPI const char *elm_map_route_node_get(const Elm_Map_Route *route);
        [ :elm_map_route_node_get, [ :elm_map_route ], :string ],
        # EAPI const char *elm_map_route_waypoint_get(const Elm_Map_Route *route);
        [ :elm_map_route_waypoint_get, [ :elm_map_route ], :string ],
        # EAPI const char *elm_map_name_address_get(const Elm_Map_Name *name);
        [ :elm_map_name_address_get, [ :elm_map_name ], :string ],
        # EAPI void elm_map_name_region_get(const Elm_Map_Name *name, double *lon, double *lat);
        [ :elm_map_name_region_get, [ :elm_map_name, :pointer, :pointer ], :void ],
        # EAPI void elm_map_name_remove(Elm_Map_Name *name);
        [ :elm_map_name_remove, [ :elm_map_name ], :void ],
        # EAPI void elm_map_rotate_set(Evas_Object *obj, double degree, Evas_Coord cx, Evas_Coord cy);
        [ :elm_map_rotate_set, [ :evas_object, :double, :int, :int ], :void ],
        # EAPI void elm_map_rotate_get(const Evas_Object *obj, double *degree, Evas_Coord *cx, Evas_Coord *cy);
        [ :elm_map_rotate_get, [ :evas_object, :pointer, :pointer, :pointer ], :void ],
        # EAPI void elm_map_wheel_disabled_set(Evas_Object *obj, Eina_Bool disabled);
        [ :elm_map_wheel_disabled_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_map_wheel_disabled_get(const Evas_Object *obj);
        [ :elm_map_wheel_disabled_get, [ :evas_object ], :bool ],
        # EAPI Evas_Object *elm_map_track_add(Evas_Object *obj, EMap_Route *emap);
        [ :elm_map_track_add, [ :evas_object, :emap_route ], :evas_object ],
        # EAPI void elm_map_track_remove(Evas_Object *obj, Evas_Object *route);
        [ :elm_map_track_remove, [ :evas_object, :evas_object ], :void ],
        # EAPI Elm_Map_Overlay * elm_map_overlay_add(Evas_Object *obj, double lon, double lat);
        [ :elm_map_overlay_add, [ :evas_object, :double, :double ], :elm_map_overlay ],
        # EAPI void elm_map_overlay_del(Elm_Map_Overlay *overlay);
        [ :elm_map_overlay_del, [ :elm_map_overlay ], :void ],
        # EAPI Elm_Map_Overlay_Type elm_map_overlay_type_get(Elm_Map_Overlay *overlay);
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
        # EAPI void elm_map_overlay_geo_set(Elm_Map_Overlay *overlay, double lon, double lat);
        [ :elm_map_overlay_geo_set, [ :elm_map_overlay, :double, :double ], :void ],
        # EAPI void elm_map_overlay_geo_get(const Elm_Map_Overlay *overlay, double *lon, double *lat);
        [ :elm_map_overlay_geo_get, [ :elm_map_overlay, :pointer, :pointer ], :void ],
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
        # EAPI
        # FIXME
        # EAPI void elm_map_overlay_class_zoom_max_set(Elm_Map_Overlay *clas, int zoom);
        [ :elm_map_overlay_class_zoom_max_set, [ :elm_map_overlay, :int ], :void ],
        # EAPI int elm_map_overlay_class_zoom_max_get(const Elm_Map_Overlay *clas);
        [ :elm_map_overlay_class_zoom_max_get, [ :elm_map_overlay ], :int ],
        # EAPI Elm_Map_Overlay * elm_map_overlay_bubble_add(Evas_Object *obj);
        [ :elm_map_overlay_bubble_add, [ :evas_object ], :elm_map_overlay ],
        # EAPI void elm_map_overlay_bubble_follow(Elm_Map_Overlay *bubble, Elm_Map_Overlay *parent);
        [ :elm_map_overlay_bubble_follow, [ :elm_map_overlay, :elm_map_overlay ], :void ],
        # EAPI void elm_map_overlay_bubble_content_append(Elm_Map_Overlay *bubble, Evas_Object *content);
        [ :elm_map_overlay_bubble_content_append, [ :elm_map_overlay, :evas_object ], :void ],
        # EAPI void elm_map_overlay_bubble_content_clear(Elm_Map_Overlay *bubble);
        [ :elm_map_overlay_bubble_content_clear, [ :elm_map_overlay ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
