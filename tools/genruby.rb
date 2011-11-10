#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
path = File.dirname __FILE__
lib_path = File.join path, '..', 'lib', 'efl', 'native'
#
# header, module name, fct prefix, lib
libraries = [
    # HEADER            MODUE NAME      FCT PREFIX      LIB             OUTPUT
    [ 'eina_types.h',   'Eina',         'eina',         'eina',         'eina_types.rb' ],
    [ 'eina_main.h',    'Eina',         'eina',         'eina',         'eina.rb' ],
    [ 'eina_xattr.h',   'EinaXattr',    'eina_xattr',   'eina',         'eina_xattr.rb' ],
    [ 'eina_log.h',     'EinaLog',      'eina_log',     'eina',         'eina_log.rb' ],
    [ 'eina_list.h',    'EinaList',     'eina_list',    'eina',         'eina_list.rb' ],
    [ 'eina_hash.h',    'EinaHash',     'eina_hash',    'eina',         'eina_hash.rb' ],
    [ 'Eet.h',          'Eet',          'eet',          'eet',          'eet.rb' ],
    [ 'Evas.h',         'Evas',         'evas',         'evas',         'evas.rb' ],
#    [ 'Evas_GL.h',      'EvasGl',       'evas_gl',      'evas',         'evas/evas_gl.rb' ],
    [ 'Edje.h',         'Edje',         'edje',         'edje',         'edje.rb' ],
    [ 'Ecore.h',        'Ecore',        'ecore',        'ecore',        'ecore.rb' ],
#    [ 'Ecore_Con.h',    'EcoreCon',     'ecore_con',    'ecore',        'ecore/ecore_con.rb' ],
    [ 'Ecore_Input.h',  'EcoreInput',   'ecore_event',  'ecore_input',  'ecore_input.rb' ],
    [ 'Ecore_Getopt.h', 'EcoreGetopt',  'ecore_getopt', 'ecore',        'ecore_getopt.rb' ],
    [ 'Ecore_Evas.h',   'EcoreEvas',    'ecore_evas',   'ecore_evas',   'ecore_evas.rb' ],
#    [ 'Ecore_Fb.h',     'EcoreFb',      'ecore',        'ecore',        'ecore/ecore_fb.rb' ],
#    [ 'Ecore_File.h',   'EcoreFile',    'ecore',        'ecore',        'ecore/ecore_file.rb' ],
    [ 'EMap.h',         'EMap',         'emap',         'emap',         'emap.rb' ],
    [ 'Elementary.h',   'Elm',          'elm',          'libelementary-ver-pre-svn-09.so.0',    'elementary.rb' ],
]
#
INDENT=' '*8
#
HEADER =<<-EOF
#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'efl/ffi'
#
module Efl
    #
    module MNAME
        #
        FCT_PREFIX = 'MY_FCT_PREFIX_'
        #
        def self.method_missing m, *args, &block
            sym, args_s = ModuleHelper.find_function m, FCT_PREFIX
            self.module_eval "def self.\#{m} *args, &block; r=Efl::Native.\#{sym}(\#{args_s}); yield r if block_given?; r; end"
            self.send m, *args, &block
        end
        #
    end
    #
    module Native
EOF
FOOTER =<<-EOF
    end
end
#
# EOF
EOF
#
TYPES = {
    'int' => ':int',
    'char' => ':char',
    'void' => ':void',
    'long' => ':long',
    'short' => ':short',
    'float' => ':float',
    'pid_t' => ':ulong',
    'time_t' => ':ulong',
    'size_t' => ':ulong',
    'ssize_t' => ':long',
    'double' => ':double',
    'long int' => ':long',
    'long long' => ':long_long',
    'unsigned int' => ':uint',
    'unsigned char' => ':uchar',
    'unsigned short' => ':ushort',
    'unsigned long long' => ':ulong_long',
    'int *' => ':int_p',
    'void *' => ':void_p',
    'short *' => ':short_p',
    'float *' => ':float_p',
    'size_t *' => ':ulong_p',
    'ssize_t *' => ':long_p',
    'double *' => ':double_p',
    'unsigned int *' => ':uint_p',
    'unsigned char *' => ':uchar_p',
    'unsigned short *' => ':ushort_p',
    'char *' => ':string',                                              # FIXME ?!?!
    'char **' => ':string_array',                                       # FIXME ?!?!
    'char ***' => ':string_array_p',                                    # FIXME ?!?!
    'fd_set *' => ':pointer',
    'FILE *' => ':pointer',
    'va_list' => ':pointer',                                            # FIXME ?!?!
    'struct tm *' => ':pointer',
    'struct timeval *' => ':pointer',
    'struct sockaddr *' => ':pointer',
    # Efl BASE TYPES
    'Eina_Bool' => ':eina_bool',
    'Eina_Bool *' => ':eina_bool_p',
    'Eina_Inlist *' => ':pointer',
    'Eina_Iterator' => ':eina_iterator',
    'Eina_Iterator *' => ':eina_iterator_p',
    'Eina_Accessor' => ':eina_accessor',
    'Eina_Accessor *' => ':eina_accessor_p',
    'Evas_GL_API *' => ':evas_gl_api_p',
}
#
TYPES_USAGE = {}
#
def set_type t, v, cb=false
    return 'bool' if t =~/Eina_Bool/
    v = v.downcase.sub(/(const|struct|enum|union) /,' ').strip
    if not TYPES[t].nil?
        puts "type already exists >#{t}< #{v}"
        exit 1
    end
    r = TYPES[v]
    v = r[1..-1] if not r.nil?
    TYPES[t]=':'+v
    if cb
        TYPES[t+' *']=':'+v
    else
        TYPES[t+' *']=':'+v+'_p'
        TYPES[t+' **']=':'+v+'_pp'
        TYPES[t+' ***']=':'+v+'_ppp'
    end
    v
end
#
def get_type t
    k = t.gsub(/(const|enum|union)/, '').strip
    k.sub!(/\*/,' *') if k=~/\w+\*/
    r = TYPES[k]
    if r.nil?
        puts "unknown type >#{k}< #{t}"
        exit 1
    end
    TYPES_USAGE[k]||=true
    r
end
#
def get_type_from_arg arg, l
    if arg=~ /^\s*void\s*$/
        return ''
    end
    if arg =~ /\.\.\./
        return ':varargs'
    end
    k = arg.gsub(/const/,'').gsub(/\s{2,}/,' ').strip
    if k=~/(.*?)(\w+)$/
        return get_type $1
    end
    # try with unchanged argument string
    t = get_type k
    if t.nil?
        puts "wrong arg >#{k}< #{arg} (#{l})"
        exit 1
    end
    t
end
#
def wrap_text txt, indent
    txt.gsub( /(.{1,#{170}})(?: +|$\n?)|(.{1,#{170}})/,"\\1\\2\n#{indent}").sub(/\n\s+$/,'')
end
#
def gen_enums path, indent
    r = []
    open(path+'-enums','r').readlines.each do |l|
        l.strip!
        if not l=~/(typedef enum(?: \w+)?) \{([-A-Z0-9_=, ]+)\} (\w+);/
            r << indent+"# #{l}\n#{indent}# FIXME"
            next
        end
        typedef = $1
        values = $2
        typename = $3
        v = set_type typename, typename
        args = values.split(',').collect { |cst| ':'+cst.strip.downcase }.join(', ').gsub(/=/,',').gsub(/ ,/,',')
        r << indent+"# #{typedef} {...} #{typename};"
        r << wrap_text( indent+"enum :#{v}, [ #{args} ]", indent+' '*4 )
        r << [ typename+' *', indent+"typedef :pointer, :#{v}_p" ]
        r << [ typename+' **', indent+"typedef :pointer, :#{v}_pp" ]
        r << [ typename+' ***', indent+"typedef :pointer, :#{v}_ppp" ]
    end
    r
end
#
def gen_typedefs path, indent
    r = []
    open(path+'-types','r').readlines.each do |l|
        l.strip!
        if l=~/typedef (struct|enum|union) _\w+ (\w+);/
            t = $2
            v = 'pointer'
            set_type t, t
        elsif l =~/typedef\s+((?:\w+\**\s)+)(\w+);/
            t = $2
            v = $1
            v = set_type t, v
        else
            r << indent+"# #{l}\n#{indent}# FIXME"
            next
        end
        r << indent+"# #{l}"
        r << indent+"typedef :#{v}, :#{t.downcase}"
        r << [ t+' *', indent+"typedef :pointer, :#{t.downcase}_p" ]
        r << [ t+' **', indent+"typedef :pointer, :#{t.downcase}_pp" ]
        r << [ t+' ***', indent+"typedef :pointer, :#{t.downcase}_ppp" ]
    end
    r
end
#
def gen_callbacks path, indent
    r = []
    open(path+'-callbacks','r').readlines.each do |l|
        l.strip!
        if not l=~/^\s*typedef\s+(.*)((?:\(\*?\w+\)| \*?\w+))\s*\((.*)\);/
            r << indent+"# #{l}\n#{indent}# FIXME"
            next
        end
        ret = $1
        name = $2.strip
        args = $3.split(',').collect { |arg| get_type_from_arg arg, l }.join ', '
        k = name.sub(/\(/,'').sub(/\)/,'').sub(/\*/,'')
        t = name.downcase.sub(/\(/,'').sub(/\)/,'').sub(/\*/,'')
        t = set_type k, t, true
        r << indent+"# #{l}"
        r << wrap_text(indent+"callback :#{t}, [ #{args} ], #{get_type ret}", indent+' '*4 )
    end
    r
end
#
def gen_variables path, indent
    r = []
    open(path+'-variables','r').readlines.each do |l|
        l.strip!
        if not l=~ /EAPI\s+extern\s+(\w+\s+\*?)(\w+)/
            r << indent+"# #{l}\n#{indent}# FIXME"
            next
        end
        var = $2
        t = $1
        r << indent+"# #{l}"
        r << wrap_text(indent+"attach_variable :#{var}, #{get_type t}", indent+' '*4)
    end
    r
end
#
def gen_functions path, indent
    r = []
    r << indent+"fcts = ["
    open(path+'-functions','r').readlines.each do |l|
        l.strip!
        if not l=~ /EAPI ([a-zA-Z0-9_\* ]+?)(\w+) ?\(([a-zA-Z0-9_ \*,\.]+)\)( *[A-Z]{2,})?/
            r << indent+"# #{l}\n#{indent}# FIXME"
            next
        end
        ret = $1
        func = $2.downcase
        args = $3.split(',').collect { |arg| get_type_from_arg arg, l }.join ', '
        r << indent+"# #{l}"
        r << wrap_text(indent+"[ :#{func}, [ #{args} ], #{get_type ret} ],", indent+' '*4)
    end
    r << indent+"]"
    r
end
#
Dir.mkdir lib_path unless (File.exists? lib_path)
#
libraries.collect do |header,module_name,fct_prefix,lib, output|
    base = File.join path, 'api', header
    output = File.join lib_path, output
    Dir.mkdir File.dirname(output) unless File.exists? File.dirname(output)
    printf "%-60s", "parse #{base}-*"
    r = [lib, output, module_name, fct_prefix ]
    print "enums, "
    r << gen_enums(base, INDENT)
    print "typedefs, "
    r << gen_typedefs(base, INDENT)
    print "callbacks, "
    r << gen_callbacks(base, INDENT)
    print "variables, "
    r << gen_variables(base, INDENT)
    puts "functions."
    r << gen_functions(base, INDENT)
    r
end.each do |lib, output, module_name, fct_prefix, enums, typedefs, callbacks, variables, functions|
    printf "%-60s", "generate #{output}"
    open(output,'w:utf-8') do |f|
        f << HEADER.gsub(/MNAME/,module_name).sub(/MY_FCT_PREFIX/,fct_prefix)
        f << "#{INDENT}#\n#{INDENT}ffi_lib '#{lib}'"
        f << "\n#{INDENT}#\n#{INDENT}# ENUMS"
        print "enums, "
        f << "\n"+enums.collect { |t| ( t.is_a?(Array) ? ( TYPES_USAGE[t[0]] ? t[1] : nil ) : t ) }.compact.join("\n") unless enums.empty?
        f << "\n#{INDENT}#\n#{INDENT}# TYPEDEFS"
        print "typedefs, "
        f << "\n"+typedefs.collect { |t| ( t.is_a?(Array) ? ( TYPES_USAGE[t[0]] ? t[1] : nil ) : t ) }.compact.join("\n") unless typedefs.empty?
        f << "\n#{INDENT}#\n#{INDENT}# CALLBACKS"
        print "callbacks, "
        f << "\n"+callbacks.join("\n") unless callbacks.empty?
        f << "\n#{INDENT}#\n#{INDENT}# VARIABLES"
        print "variables, "
        f << "\n"+variables.join("\n") unless variables.empty?
        f << "\n#{INDENT}#\n#{INDENT}# FUNCTIONS"
        puts "functions."
        f << "\n"+functions.join("\n") unless functions.empty?
        f << "\n#{INDENT}#\n#{INDENT}attach_fcts fcts\n#{INDENT}#\n"
        f << FOOTER
    end
end
#
