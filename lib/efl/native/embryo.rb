#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module Embryo
        #
        FCT_PREFIX = 'embryo_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'embryo.so.1'
        #
        # ENUMS
        # typedef enum _Embryo_Error {...} Embryo_Error;
        enum :embryo_error, [ :embryo_error_none, 0, :embryo_error_exit, 1, :embryo_error_assert, 2, :embryo_error_stackerr, 3, :embryo_error_bounds,
            4, :embryo_error_memaccess, 5, :embryo_error_invinstr, 6, :embryo_error_stacklow, 7, :embryo_error_heaplow, 8, :embryo_error_callback, 9,
            :embryo_error_native, 10, :embryo_error_divide, 11, :embryo_error_sleep, 12, :embryo_error_memory, 16, :embryo_error_format, 17,
            :embryo_error_version, 18, :embryo_error_notfound, 19, :embryo_error_index, 20, :embryo_error_debug, 21, :embryo_error_init, 22,
            :embryo_error_userdata, 23, :embryo_error_init_jit, 24, :embryo_error_params, 25, :embryo_error_domain, 26 ]
        # typedef enum _Embryo_Status {...} Embryo_Status;
        enum :embryo_status, [ :embryo_program_fail, 0, :embryo_program_ok, 1, :embryo_program_sleep, 2, :embryo_program_busy, 3,
            :embryo_program_toolong, 4 ]
        #
        # TYPEDEFS
        # typedef struct _Embryo_Version Embryo_Version;
        typedef :pointer, :embryo_version
        # typedef unsigned int Embryo_UCell;
        typedef :uint, :embryo_ucell
        # typedef int Embryo_Cell;
        typedef :int, :embryo_cell
        # typedef struct _Embryo_Program Embryo_Program;
        typedef :pointer, :embryo_program
        # typedef int Embryo_Function;
        typedef :int, :embryo_function
        #
        # VARIABLES
        # EAPI extern Embryo_Version *embryo_version;
        attach_variable :embryo_version, :embryo_version
        #
        # FUNCTIONS
        fcts = [
        # EAPI int embryo_init(void);
        [ :embryo_init, [  ], :int ],
        # EAPI int embryo_shutdown(void);
        [ :embryo_shutdown, [  ], :int ],
        # EAPI Embryo_Program *embryo_program_new(void *data, int size);
        [ :embryo_program_new, [ :pointer, :int ], :embryo_program ],
        # EAPI Embryo_Program *embryo_program_const_new(void *data, int size);
        [ :embryo_program_const_new, [ :pointer, :int ], :embryo_program ],
        # EAPI Embryo_Program *embryo_program_load(const char *file);
        [ :embryo_program_load, [ :string ], :embryo_program ],
        # EAPI void embryo_program_free(Embryo_Program *ep);
        [ :embryo_program_free, [ :embryo_program ], :void ],
        # EAPI void embryo_program_native_call_add(Embryo_Program *ep, const char *name, Embryo_Cell (*func) (Embryo_Program *ep, Embryo_Cell *params));
        [ :embryo_program_native_call_add, [ :embryo_program, :string,(callback [:embryo_program,:embryo_cell], :embryo_cell)], :void ],
        # EAPI void embryo_program_vm_reset(Embryo_Program *ep);
        [ :embryo_program_vm_reset, [ :embryo_program ], :void ],
        # EAPI void embryo_program_vm_push(Embryo_Program *ep);
        [ :embryo_program_vm_push, [ :embryo_program ], :void ],
        # EAPI void embryo_program_vm_pop(Embryo_Program *ep);
        [ :embryo_program_vm_pop, [ :embryo_program ], :void ],
        # EAPI void embryo_swap_16(unsigned short *v);
        [ :embryo_swap_16, [ :pointer ], :void ],
        # EAPI void embryo_swap_32(unsigned int *v);
        [ :embryo_swap_32, [ :pointer ], :void ],
        # EAPI Embryo_Function embryo_program_function_find(Embryo_Program *ep, const char *name);
        [ :embryo_program_function_find, [ :embryo_program, :string ], :int ],
        # EAPI Embryo_Cell embryo_program_variable_find(Embryo_Program *ep, const char *name);
        [ :embryo_program_variable_find, [ :embryo_program, :string ], :int ],
        # EAPI int embryo_program_variable_count_get(Embryo_Program *ep);
        [ :embryo_program_variable_count_get, [ :embryo_program ], :int ],
        # EAPI Embryo_Cell embryo_program_variable_get(Embryo_Program *ep, int num);
        [ :embryo_program_variable_get, [ :embryo_program, :int ], :int ],
        # EAPI void embryo_program_error_set(Embryo_Program *ep, Embryo_Error error);
        [ :embryo_program_error_set, [ :embryo_program, :embryo_error ], :void ],
        # EAPI Embryo_Error embryo_program_error_get(Embryo_Program *ep);
        [ :embryo_program_error_get, [ :embryo_program ], :embryo_error ],
        # EAPI void embryo_program_data_set(Embryo_Program *ep, void *data);
        [ :embryo_program_data_set, [ :embryo_program, :pointer ], :void ],
        # EAPI void *embryo_program_data_get(Embryo_Program *ep);
        [ :embryo_program_data_get, [ :embryo_program ], :pointer ],
        # EAPI const char *embryo_error_string_get(Embryo_Error error);
        [ :embryo_error_string_get, [ :embryo_error ], :string ],
        # EAPI int embryo_data_string_length_get(Embryo_Program *ep, Embryo_Cell *str_cell);
        [ :embryo_data_string_length_get, [ :embryo_program, :pointer ], :int ],
        # EAPI void embryo_data_string_get(Embryo_Program *ep, Embryo_Cell *str_cell, char *dst);
        [ :embryo_data_string_get, [ :embryo_program, :pointer, :string ], :void ],
        # EAPI void embryo_data_string_set(Embryo_Program *ep, const char *src, Embryo_Cell *str_cell);
        [ :embryo_data_string_set, [ :embryo_program, :string, :pointer ], :void ],
        # EAPI Embryo_Cell *embryo_data_address_get(Embryo_Program *ep, Embryo_Cell addr);
        [ :embryo_data_address_get, [ :embryo_program, :int ], :pointer ],
        # EAPI Embryo_Cell embryo_data_heap_push(Embryo_Program *ep, int cells);
        [ :embryo_data_heap_push, [ :embryo_program, :int ], :int ],
        # EAPI void embryo_data_heap_pop(Embryo_Program *ep, Embryo_Cell down_to);
        [ :embryo_data_heap_pop, [ :embryo_program, :int ], :void ],
        # EAPI int embryo_program_recursion_get(Embryo_Program *ep);
        [ :embryo_program_recursion_get, [ :embryo_program ], :int ],
        # EAPI Embryo_Status embryo_program_run(Embryo_Program *ep, Embryo_Function func);
        [ :embryo_program_run, [ :embryo_program, :int ], :embryo_status ],
        # EAPI Embryo_Cell embryo_program_return_value_get(Embryo_Program *ep);
        [ :embryo_program_return_value_get, [ :embryo_program ], :int ],
        # EAPI void embryo_program_max_cycle_run_set(Embryo_Program *ep, int max);
        [ :embryo_program_max_cycle_run_set, [ :embryo_program, :int ], :void ],
        # EAPI int embryo_program_max_cycle_run_get(Embryo_Program *ep);
        [ :embryo_program_max_cycle_run_get, [ :embryo_program ], :int ],
        # EAPI int embryo_parameter_cell_push(Embryo_Program *ep, Embryo_Cell cell);
        [ :embryo_parameter_cell_push, [ :embryo_program, :int ], :int ],
        # EAPI int embryo_parameter_string_push(Embryo_Program *ep, const char *str);
        [ :embryo_parameter_string_push, [ :embryo_program, :string ], :int ],
        # EAPI int embryo_parameter_cell_array_push(Embryo_Program *ep, Embryo_Cell *cells, int num);
        [ :embryo_parameter_cell_array_push, [ :embryo_program, :pointer, :int ], :int ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
