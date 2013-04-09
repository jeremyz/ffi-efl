#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/eina_list'
#
module Efl
    #
    module EezeNet
        #
        FCT_PREFIX = 'eeze_net_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'eeze.so.1'
        #
        # ENUMS
        # typedef enum {...} Eeze_Net_Addr_Type;
        enum :eeze_net_addr_type, [ :eeze_net_addr_type_ip, :eeze_net_addr_type_ip6, :eeze_net_addr_type_broadcast, :eeze_net_addr_type_broadcast6,
            :eeze_net_addr_type_netmask, :eeze_net_addr_type_netmask6 ]
        #
        # TYPEDEFS
        # typedef struct Eeze_Net Eeze_Net;
        typedef :pointer, :eeze_net
        #
        # FUNCTIONS
        fcts = [
        # EAPI Eeze_Net *eeze_net_new(const char *name);
        [ :eeze_net_new, [ :string ], :eeze_net ],
        # EAPI void eeze_net_free(Eeze_Net *net);
        [ :eeze_net_free, [ :eeze_net ], :void ],
        # EAPI const char *eeze_net_mac_get(Eeze_Net *net);
        [ :eeze_net_mac_get, [ :eeze_net ], :string ],
        # EAPI int eeze_net_idx_get(Eeze_Net *net);
        [ :eeze_net_idx_get, [ :eeze_net ], :int ],
        # EAPI Eina_Bool eeze_net_scan(Eeze_Net *net);
        [ :eeze_net_scan, [ :eeze_net ], :bool ],
        # EAPI const char *eeze_net_addr_get(Eeze_Net *net, Eeze_Net_Addr_Type type);
        [ :eeze_net_addr_get, [ :eeze_net, :eeze_net_addr_type ], :string ],
        # EAPI const char *eeze_net_attribute_get(Eeze_Net *net, const char *attr);
        [ :eeze_net_attribute_get, [ :eeze_net, :string ], :string ],
        # EAPI const char *eeze_net_syspath_get(Eeze_Net *net);
        [ :eeze_net_syspath_get, [ :eeze_net ], :string ],
        # EAPI Eina_List *eeze_net_list(void);
        [ :eeze_net_list, [  ], :eina_list ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
