#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/eina_list'
#
module Efl
    #
    module Emap
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
        # FUNCTIONS
        fcts = [
        # EAPI int emap_init();
        [ :emap_init, [  ], :int ],
        # EAPI int emap_shutdown();
        [ :emap_shutdown, [  ], :int ],
        # EAPI EMap_Route *emap_route_new();
        [ :emap_route_new, [  ], :emap_route ],
        # EAPI void emap_route_node_add(EMap_Route *route, EMap_Route_Node *node);
        [ :emap_route_node_add, [ :emap_route, :emap_route_node ], :void ],
        # EAPI void emap_route_free(EMap_Route *route);
        [ :emap_route_free, [ :emap_route ], :void ],
        # EAPI void emap_route_name_set(EMap_Route *route, const char *name);
        [ :emap_route_name_set, [ :emap_route, :string ], :void ],
        # EAPI const char *emap_route_name_get(EMap_Route *route);
        [ :emap_route_name_get, [ :emap_route ], :string ],
        # EAPI Eina_List *emap_route_nodes_get(EMap_Route *route);
        [ :emap_route_nodes_get, [ :emap_route ], :eina_list ],
        # EAPI double emap_route_distance_get(EMap_Route *route);
        [ :emap_route_distance_get, [ :emap_route ], :double ],
        # EAPI EMap_Route_Node *emap_route_node_new();
        [ :emap_route_node_new, [  ], :emap_route_node ],
        # EAPI void emap_route_node_lon_set(EMap_Route_Node *node, double lon);
        [ :emap_route_node_lon_set, [ :emap_route_node, :double ], :void ],
        # EAPI void emap_route_node_lat_set(EMap_Route_Node *node, double lat);
        [ :emap_route_node_lat_set, [ :emap_route_node, :double ], :void ],
        # EAPI double emap_route_node_lon_get(EMap_Route_Node *node);
        [ :emap_route_node_lon_get, [ :emap_route_node ], :double ],
        # EAPI double emap_route_node_lat_get(EMap_Route_Node *node);
        [ :emap_route_node_lat_get, [ :emap_route_node ], :double ],
        # EAPI void emap_route_node_elevation_set(EMap_Route_Node *node, double elevation);
        [ :emap_route_node_elevation_set, [ :emap_route_node, :double ], :void ],
        # EAPI double emap_route_node_elevation_get(EMap_Route_Node *node);
        [ :emap_route_node_elevation_get, [ :emap_route_node ], :double ],
        # EAPI void emap_route_node_time_set(EMap_Route_Node *node, time_t time);
        [ :emap_route_node_time_set, [ :emap_route_node, :ulong ], :void ],
        # EAPI time_t emap_route_node_time_get(EMap_Route_Node *node);
        [ :emap_route_node_time_get, [ :emap_route_node ], :ulong ],
        # EAPI double emap_route_nodes_distance_get(EMap_Route_Node *A, EMap_Route_Node *B);
        [ :emap_route_nodes_distance_get, [ :emap_route_node, :emap_route_node ], :double ],
        # EAPI void emap_route_node_free(EMap_Route_Node *node);
        [ :emap_route_node_free, [ :emap_route_node ], :void ],
        # EAPI EMap_Route * emap_route_gpx_new(const char *file);
        [ :emap_route_gpx_new, [ :string ], :emap_route ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
