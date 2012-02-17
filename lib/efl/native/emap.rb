#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module EMap
        #
        FCT_PREFIX = 'emap_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'emap'
        #
        # ENUMS
        # typedef enum emap_route_type {...} EMap_Route_Type;
        enum :emap_route_type, [ :emap_track_type_gpx ]
        #
        # TYPEDEFS
        # typedef struct emap_route EMap_Route;
        typedef :pointer, :emap_route
        # typedef struct emap_route_node EMap_Route_Node;
        typedef :pointer, :emap_route_node
        #
        # CALLBACKS
        #
        # VARIABLES
        #
        # FUNCTIONS
        fcts = [
        # EAPI int emap_init();
        [ :emap_init, [  ], :int ],
        # EAPI int emap_shutdown();
        [ :emap_shutdown, [  ], :int ],
        # EAPI EMap_Route *emap_route_new();
        [ :emap_route_new, [  ], :pointer ],
        # EAPI void emap_route_node_add(EMap_Route *route, EMap_Route_Node *node);
        [ :emap_route_node_add, [ :pointer, :pointer ], :void ],
        # EAPI void emap_route_free(EMap_Route *route);
        [ :emap_route_free, [ :pointer ], :void ],
        # EAPI void emap_route_name_set(EMap_Route *route, const char *name);
        [ :emap_route_name_set, [ :pointer, :string ], :void ],
        # EAPI const char *emap_route_name_get(EMap_Route *route);
        [ :emap_route_name_get, [ :pointer ], :string ],
        # EAPI Eina_List *emap_route_nodes_get(EMap_Route *route);
        [ :emap_route_nodes_get, [ :pointer ], :pointer ],
        # EAPI double emap_route_distance_get(EMap_Route *route);
        [ :emap_route_distance_get, [ :pointer ], :double ],
        # EAPI EMap_Route_Node *emap_route_node_new();
        [ :emap_route_node_new, [  ], :pointer ],
        # EAPI void emap_route_node_lon_set(EMap_Route_Node *node, double lon);
        [ :emap_route_node_lon_set, [ :pointer, :double ], :void ],
        # EAPI void emap_route_node_lat_set(EMap_Route_Node *node, double lat);
        [ :emap_route_node_lat_set, [ :pointer, :double ], :void ],
        # EAPI double emap_route_node_lon_get(EMap_Route_Node *node);
        [ :emap_route_node_lon_get, [ :pointer ], :double ],
        # EAPI double emap_route_node_lat_get(EMap_Route_Node *node);
        [ :emap_route_node_lat_get, [ :pointer ], :double ],
        # EAPI void emap_route_node_elevation_set(EMap_Route_Node *node, double elevation);
        [ :emap_route_node_elevation_set, [ :pointer, :double ], :void ],
        # EAPI double emap_route_node_elevation_get(EMap_Route_Node *node);
        [ :emap_route_node_elevation_get, [ :pointer ], :double ],
        # EAPI void emap_route_node_time_set(EMap_Route_Node *node, time_t time);
        [ :emap_route_node_time_set, [ :pointer, :ulong ], :void ],
        # EAPI time_t emap_route_node_time_get(EMap_Route_Node *node);
        [ :emap_route_node_time_get, [ :pointer ], :ulong ],
        # EAPI double emap_route_nodes_distance_get(EMap_Route_Node *A, EMap_Route_Node *B);
        [ :emap_route_nodes_distance_get, [ :pointer, :pointer ], :double ],
        # EAPI void emap_route_node_free(EMap_Route_Node *node);
        [ :emap_route_node_free, [ :pointer ], :void ],
        # EAPI EMap_Route * emap_route_gpx_new(const char *file);
        [ :emap_route_gpx_new, [ :string ], :pointer ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
