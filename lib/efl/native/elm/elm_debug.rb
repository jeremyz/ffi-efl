#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmDebug
        #
        FCT_PREFIX = 'elm_debug_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'elementary.so.1'
        #
        # FUNCTIONS
        fcts = [
        # EAPI void elm_object_tree_dump(const Evas_Object *top);
        [ :elm_object_tree_dump, [ :evas_object ], :void ],
        # EAPI void elm_object_tree_dot_dump(const Evas_Object *top, const char *file);
        [ :elm_object_tree_dot_dump, [ :evas_object, :string ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
