#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'ffi'
#
module EFL
    module EET
        #
        extend FFI::Library
        #
        ffi_lib 'eet'
        functions = [
            [ :eet_init, [ ], :int ],
            [ :eet_shutdown, [], :int ],
            [ :eet_clearcache, [], :void ],
            [ :eet_open, [:string, :int], :pointer ],
            [ :eet_mode_get, [:pointer], :int ],
            [ :eet_close, [:pointer], :int ],
            [ :eet_write, [:pointer, :string, :pointer, :int, :int], :int ],
            [ :eet_read, [:pointer, :string, :pointer], :pointer ],
        ].each do |func|
            begin
                attach_function *func
            rescue Object => e
                puts "Could not attach #{func} #{e.message}"
            end
        end
        #
        FILE_MODE_INVALID = -1
        FILE_MODE_READ = 0
        FILE_MODE_WRITE = 1
        FILE_MODE_READ_WRITE  = 2
        #
        class << self
            #
            alias init eet_init
            alias shutdown eet_shutdown
            alias clearcache eet_clearcache
            #
            def open path, mode=FILE_MODE_READ, &blk
                if blk
                    f = eet_open path, mode
                    raise Exception.new "Unable to open file #{path}" if f.nil?
                    yield EETFile.new f
                    eet_close f
                else
                    f = eet_open path, mode
                    return EETFile.new f unless f.nil?
                end
            end
        end
        #
        class EETFile
            #
            def initialize ptr
                @ptr=ptr
            end
            private :initialize
            #
            def close
                EET.eet_close @ptr
                @ptr=nil
            end
            #
            def mode_get
                EET.eet_mode_get @ptr
            end
            #
            def write key, data, compress=false
                EET.eet_write @ptr, key, FFI::MemoryPointer.from_string(data), data.bytesize, ( compress ? 1 : 0 )
            end
            #
            def read key
                ptr = FFI::MemoryPointer.new(:int)
                data = EET.eet_read @ptr, key, ptr
                s = ptr.read_int
                ptr.free
                return nil if s==0
                ( data.null? ? nil : data.read_string[0..s-1] )
            end
            #
        end
        #
        class Error < Exception
            ERROR_NONE=0
            ERROR_BAD_OBJECT=1
            ERROR_EMPTY=2
            ERROR_NOT_WRITABLE=3
            ERROR_OUT_OF_MEMORY=4
            ERROR_WRITE_ERROR=5
            ERROR_WRITE_ERROR_FILE_TOO_BIG=6
            ERROR_WRITE_ERROR_IO_ERROR=7
            ERROR_WRITE_ERROR_OUT_OF_SPACE=8
            ERROR_WRITE_ERROR_FILE_CLOSED=9
            ERROR_MMAP_FAILED=10
            ERROR_X509_ENCODING_FAILED=11
            ERROR_SIGNATURE_FAILED=12
            ERROR_INVALID_SIGNATURE=13
            ERROR_NOT_SIGNED=14
            ERROR_NOT_IMPLEMENTED=15
            ERROR_PRNG_NOT_SEEDED=16
            ERROR_ENCRYPT_FAILED=17
            ERROR_DECRYPT_FAILED=18
            #
            MSGS = {
                0=>'No error, it\'s all fine!',
                1=>' Given object or handle is NULL or invalid',
                2=>'There was nothing to do',
                3=>'Could not write to file or fine is #FILE_MODE_READ',
                4=>'Could not allocate memory',
                5=>'Failed to write data to destination',
                6=>'Failed to write file since it is too big',
                7=>'Failed to write since generic Input/Output error',
                8=>'Failed to write due out of space',
                9=>'Failed to write because file was closed',
                10=>'Could not mmap file',
                11=>'Could not encode using X509',
                12=>'Could not validate signature',
                13=>'Signature is invalid',
                14=>'File or contents are not signed',
                15=>'Function is not implemented',
                16=>'Could not introduce random seed',
                17=>'Could not encrypt contents',
                18=>'Could not decrypt contents',
            }
            #
        end
    end
end
#
# EOF
