#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
require 'efl/native/elementary'
#
module Efl
    #
    module ElmScroller
        #
        FCT_PREFIX = 'elm_scroller_' unless const_defined? :FCT_PREFIX
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
        # ENUMS
        # typedef enum {...} Elm_Scroller_Policy;
        enum :elm_scroller_policy, [ :elm_scroller_policy_auto, 0, :elm_scroller_policy_on, 1, :elm_scroller_policy_off, 2, :elm_scroller_policy_last,
            3 ]
        #
        # FUNCTIONS
        fcts = [
        # EAPI Evas_Object *elm_scroller_add(Evas_Object *parent);
        [ :elm_scroller_add, [ :evas_object ], :evas_object ],
        # EAPI void elm_scroller_content_min_limit(Evas_Object *obj, Eina_Bool w, Eina_Bool h);
        [ :elm_scroller_content_min_limit, [ :evas_object, :bool, :bool ], :void ],
        # EAPI void elm_scroller_region_show(Evas_Object *obj, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h);
        [ :elm_scroller_region_show, [ :evas_object, :int, :int, :int, :int ], :void ],
        # EAPI void elm_scroller_policy_set(Evas_Object *obj, Elm_Scroller_Policy policy_h, Elm_Scroller_Policy policy_v);
        [ :elm_scroller_policy_set, [ :evas_object, :elm_scroller_policy, :elm_scroller_policy ], :void ],
        # EAPI void elm_scroller_policy_get(const Evas_Object *obj, Elm_Scroller_Policy *policy_h, Elm_Scroller_Policy *policy_v);
        [ :elm_scroller_policy_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_scroller_region_get(const Evas_Object *obj, Evas_Coord *x, Evas_Coord *y, Evas_Coord *w, Evas_Coord *h);
        [ :elm_scroller_region_get, [ :evas_object, :pointer, :pointer, :pointer, :pointer ], :void ],
        # EAPI void elm_scroller_child_size_get(const Evas_Object *obj, Evas_Coord *w, Evas_Coord *h);
        [ :elm_scroller_child_size_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_scroller_bounce_set(Evas_Object *obj, Eina_Bool h_bounce, Eina_Bool v_bounce);
        [ :elm_scroller_bounce_set, [ :evas_object, :bool, :bool ], :void ],
        # EAPI void elm_scroller_bounce_get(const Evas_Object *obj, Eina_Bool *h_bounce, Eina_Bool *v_bounce);
        [ :elm_scroller_bounce_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_scroller_page_relative_set(Evas_Object *obj, double h_pagerel, double v_pagerel);
        [ :elm_scroller_page_relative_set, [ :evas_object, :double, :double ], :void ],
        # EAPI void elm_scroller_page_relative_get(const Evas_Object *obj, double *h_pagerel, double *v_pagerel);
        [ :elm_scroller_page_relative_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_scroller_page_size_set(Evas_Object *obj, Evas_Coord h_pagesize, Evas_Coord v_pagesize);
        [ :elm_scroller_page_size_set, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_scroller_page_size_get(const Evas_Object *obj, Evas_Coord *h_pagesize, Evas_Coord *v_pagesize);
        [ :elm_scroller_page_size_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_scroller_current_page_get(const Evas_Object *obj, int *h_pagenumber, int *v_pagenumber);
        [ :elm_scroller_current_page_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_scroller_last_page_get(const Evas_Object *obj, int *h_pagenumber, int *v_pagenumber);
        [ :elm_scroller_last_page_get, [ :evas_object, :pointer, :pointer ], :void ],
        # EAPI void elm_scroller_page_show(Evas_Object *obj, int h_pagenumber, int v_pagenumber);
        [ :elm_scroller_page_show, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_scroller_page_bring_in(Evas_Object *obj, int h_pagenumber, int v_pagenumber);
        [ :elm_scroller_page_bring_in, [ :evas_object, :int, :int ], :void ],
        # EAPI void elm_scroller_region_bring_in(Evas_Object *obj, Evas_Coord x, Evas_Coord y, Evas_Coord w, Evas_Coord h);
        [ :elm_scroller_region_bring_in, [ :evas_object, :int, :int, :int, :int ], :void ],
        # EAPI void elm_scroller_propagate_events_set(Evas_Object *obj, Eina_Bool propagation);
        [ :elm_scroller_propagate_events_set, [ :evas_object, :bool ], :void ],
        # EAPI Eina_Bool elm_scroller_propagate_events_get(const Evas_Object *obj);
        [ :elm_scroller_propagate_events_get, [ :evas_object ], :bool ],
        # EAPI void elm_scroller_gravity_set(Evas_Object *obj, double x, double y);
        [ :elm_scroller_gravity_set, [ :evas_object, :double, :double ], :void ],
        # EAPI void elm_scroller_gravity_get(const Evas_Object *obj, double *x, double *y);
        [ :elm_scroller_gravity_get, [ :evas_object, :pointer, :pointer ], :void ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
