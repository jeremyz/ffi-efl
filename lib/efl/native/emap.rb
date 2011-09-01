#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi'
#
module Efl
    #
    module EMap
        #
        FCT_PREFIX = 'emap_'
        #
        def self.method_missing m, *args, &block
            sym, args_s = ModuleHelper.find_function m, FCT_PREFIX
            self.module_eval "def self.#{m} *args, &block; r=Efl::Native.#{sym}(#{args_s}); yield r if block_given?; r; end"
            self.send m, *args, &block
        end
        #
    end
    #
    module Native
        #
        ffi_lib 'emap'
        #
        # ENUMS
        # typedef enum emap_route_type {...} EMap_Route_Type;
        enum :emap_route_type, [ :emap_track_type_gpx ]
        #
        # TYPEDEFS
        # typedef struct emap_route EMap_Route;
        typedef :pointer, :emap_route
        typedef :pointer, :emap_route_p
        # typedef struct emap_route_node EMap_Route_Node;
        typedef :pointer, :emap_route_node
        typedef :pointer, :emap_route_node_p
        #
        # CALLBACKS
        #
        # VARIABLES
        #
        # FUNCTIONS
        fcts = [
        # EAPI int emap_init();
        [ :emap_init, [ ], :int ],
        # EAPI int emap_shutdown();
        [ :emap_shutdown, [ ], :int ],
        # EAPI EMap_Route *emap_route_new();
        [ :emap_route_new, [ ], :emap_route_p ],
        # EAPI void emap_route_node_add(EMap_Route *route, EMap_Route_Node *node);
        [ :emap_route_node_add, [ :emap_route_p, :emap_route_node_p ], :void ],
        # EAPI void emap_route_free(EMap_Route *route);
        [ :emap_route_free, [ :emap_route_p ], :void ],
        # EAPI void emap_route_name_set(EMap_Route *route, const char *name);
        [ :emap_route_name_set, [ :emap_route_p, :string ], :void ],
        # EAPI const char *emap_route_name_get(EMap_Route *route);
        [ :emap_route_name_get, [ :emap_route_p ], :string ],
        # EAPI Eina_List *emap_route_nodes_get(EMap_Route *route);
        [ :emap_route_nodes_get, [ :emap_route_p ], :eina_list_p ],
        # EAPI double emap_route_distance_get(EMap_Route *route);
        [ :emap_route_distance_get, [ :emap_route_p ], :double ],
        # EAPI EMap_Route_Node *emap_route_node_new();
        [ :emap_route_node_new, [ ], :emap_route_node_p ],
        # EAPI void emap_route_node_lon_set(EMap_Route_Node *node, double lon);
        [ :emap_route_node_lon_set, [ :emap_route_node_p, :double ], :void ],
        # EAPI void emap_route_node_lat_set(EMap_Route_Node *node, double lat);
        [ :emap_route_node_lat_set, [ :emap_route_node_p, :double ], :void ],
        # EAPI double emap_route_node_lon_get(EMap_Route_Node *node);
        [ :emap_route_node_lon_get, [ :emap_route_node_p ], :double ],
        # EAPI double emap_route_node_lat_get(EMap_Route_Node *node);
        [ :emap_route_node_lat_get, [ :emap_route_node_p ], :double ],
        # EAPI void emap_route_node_elevation_set(EMap_Route_Node *node, double elevation);
        [ :emap_route_node_elevation_set, [ :emap_route_node_p, :double ], :void ],
        # EAPI double emap_route_node_elevation_get(EMap_Route_Node *node);
        [ :emap_route_node_elevation_get, [ :emap_route_node_p ], :double ],
        # EAPI void emap_route_node_time_set(EMap_Route_Node *node, time_t time);
        [ :emap_route_node_time_set, [ :emap_route_node_p, :ulong ], :void ],
        # EAPI time_t emap_route_node_time_get(EMap_Route_Node *node);
        [ :emap_route_node_time_get, [ :emap_route_node_p ], :ulong ],
        # EAPI double emap_route_nodes_distance_get(EMap_Route_Node *A, EMap_Route_Node *B);
        [ :emap_route_nodes_distance_get, [ :emap_route_node_p, :emap_route_node_p ], :double ],
        # EAPI void emap_route_node_free(EMap_Route_Node *node);
        [ :emap_route_node_free, [ :emap_route_node_p ], :void ],
        # EAPI EMap_Route * emap_route_gpx_new(const char *file);
        [ :emap_route_gpx_new, [ :string ], :emap_route_p ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
