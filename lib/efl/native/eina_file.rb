#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/native'
#
module Efl
    #
    module EinaFile
        #
        FCT_PREFIX = 'eina_file_' unless const_defined? :FCT_PREFIX
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
        ffi_lib 'eina.so.1'
        #
        # ENUMS
        # typedef enum {...} Eina_File_Type;
        enum :eina_file_type, [ :eina_file_unknown, :eina_file_fifo, :eina_file_chr, :eina_file_dir, :eina_file_blk, :eina_file_reg, :eina_file_lnk,
            :eina_file_sock, :eina_file_wht ]
        # typedef enum {...} Eina_File_Populate;
        enum :eina_file_populate, [ :eina_file_random, :eina_file_sequential, :eina_file_willneed, :eina_file_populate ]
        #
        # TYPEDEFS
        # typedef struct _Eina_File_Direct_Info Eina_File_Direct_Info;
        typedef :pointer, :eina_file_direct_info
        # typedef struct _Eina_Stat Eina_Stat;
        typedef :pointer, :eina_stat
        # typedef struct _Eina_File_Line Eina_File_Line;
        typedef :pointer, :eina_file_line
        # typedef struct _Eina_File Eina_File;
        typedef :pointer, :eina_file
        #
        # CALLBACKS
        # typedef void (*Eina_File_Dir_List_Cb) (const char *name, const char *path, void *data);
        callback :eina_file_dir_list_cb, [ :string, :string, :pointer ], :void
        #
        # FUNCTIONS
        fcts = [
        # EAPI Eina_Bool eina_file_dir_list(const char *dir, Eina_Bool recursive, Eina_File_Dir_List_Cb cb, void *data);
        [ :eina_file_dir_list, [ :string, :bool, :eina_file_dir_list_cb, :pointer ], :bool ],
        # EAPI Eina_Array *eina_file_split(char *path);
        [ :eina_file_split, [ :string ], :pointer ],
        # EAPI Eina_Iterator *eina_file_ls(const char *dir);
        [ :eina_file_ls, [ :string ], :pointer ],
        # EAPI Eina_Iterator *eina_file_stat_ls(const char *dir);
        [ :eina_file_stat_ls, [ :string ], :pointer ],
        # EAPI int eina_file_statat(void *container, Eina_File_Direct_Info *info, Eina_Stat *buf);
        [ :eina_file_statat, [ :pointer, :eina_file_direct_info, :eina_stat ], :int ],
        # EAPI Eina_Iterator *eina_file_direct_ls(const char *dir);
        [ :eina_file_direct_ls, [ :string ], :pointer ],
        # EAPI char *eina_file_path_sanitize(const char *path);
        [ :eina_file_path_sanitize, [ :string ], :string ],
        # EAPI Eina_File *eina_file_open(const char *name, Eina_Bool shared);
        [ :eina_file_open, [ :string, :bool ], :eina_file ],
        # EAPI void eina_file_close(Eina_File *file);
        [ :eina_file_close, [ :eina_file ], :void ],
        # EAPI size_t eina_file_size_get(Eina_File *file);
        [ :eina_file_size_get, [ :eina_file ], :ulong ],
        # EAPI time_t eina_file_mtime_get(Eina_File *file);
        [ :eina_file_mtime_get, [ :eina_file ], :ulong ],
        # EAPI const char *eina_file_filename_get(Eina_File *file);
        [ :eina_file_filename_get, [ :eina_file ], :string ],
        # EAPI Eina_Iterator *eina_file_xattr_get(Eina_File *file);
        [ :eina_file_xattr_get, [ :eina_file ], :pointer ],
        # EAPI Eina_Iterator *eina_file_xattr_value_get(Eina_File *file);
        [ :eina_file_xattr_value_get, [ :eina_file ], :pointer ],
        # EAPI void *eina_file_map_all(Eina_File *file, Eina_File_Populate rule);
        [ :eina_file_map_all, [ :eina_file, :eina_file_populate ], :pointer ],
        # EAPI void *eina_file_map_new(Eina_File *file, Eina_File_Populate rule, unsigned long int offset, unsigned long int length);
        [ :eina_file_map_new, [ :eina_file, :eina_file_populate, :ulong, :ulong ], :pointer ],
        # EAPI void eina_file_map_free(Eina_File *file, void *map);
        [ :eina_file_map_free, [ :eina_file, :pointer ], :void ],
        # EAPI Eina_Iterator *eina_file_map_lines(Eina_File *file);
        [ :eina_file_map_lines, [ :eina_file ], :pointer ],
        # EAPI Eina_Bool eina_file_map_faulted(Eina_File *file, void *map);
        [ :eina_file_map_faulted, [ :eina_file, :pointer ], :bool ],
        ]
        #
        attach_fcts fcts
        #
    end
end
#
# EOF
