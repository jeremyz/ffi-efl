#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
path = File.dirname __FILE__
lib_path = File.join path, '..', 'lib', 'e17'
#
libraries = [
    [ 'eina_types.h', 'eina'],
    [ 'Eet.h', 'eet'],
    [ 'Evas.h', 'evas'],
    [ 'Evas_GL.h', 'evas'],
    [ 'Edje.h', 'edje'],
    [ 'Ecore.h', 'ecore'],
    [ 'Ecore_Con.h', 'ecore'],
    [ 'Ecore_Input.h', 'ecore'],
    [ 'Ecore_Getopt.h', 'ecore'],
    [ 'Ecore_Evas.h', 'ecore'],
    [ 'Ecore_Fb.h', 'ecore'],
    [ 'Ecore_File.h', 'ecore'],
    [ 'Elementary.h', 'libelementary-ver-pre-svn-09.so.0' ],
]
#
INDENT=' '*8
#
HEADER =<<-EOF
#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require 'e17/ffi'
#
module E17
    #
    module MNAME
        def self.method_missing m, *args, &block
            return E17::API.send 'MBASE_'+m.to_s, *args, &block
        end
    end
    #
    module API
        #
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
    'size_t' => ':ulong',
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
    'double *' => ':double_p',
    'unsigned int *' => ':uint_p',
    'unsigned char *' => ':uchar_p',
    'char *' => ':string',                                              # FIXME ?!?!
    'char **' => ':string_array',                                       # FIXME ?!?!
    'char ***' => ':string_array_p',                                    # FIXME ?!?!
    'fd_set *' => ':pointer',
    'FILE *' => ':pointer',
    'va_list' => ':pointer',                                            # FIXME ?!?!
    'struct tm *' => ':pointer',
    'struct timeval *' => ':pointer',
    'struct sockaddr *' => ':pointer',
    # E17 BASE TYPES
    'Eina_Bool' => ':eina_bool',
    'Eina_Bool *' => ':eina_bool_p',
    'Eina_List' => ':eina_list',
    'Eina_List *' => ':eina_list_p',
    'Eina_Hash' => ':eina_hash',
    'Eina_Hash *' => ':eina_hash_p',
    'Eina_Iterator' => ':eina_iterator',
    'Eina_Iterator *' => ':eina_iterator_p',
    'Eina_Accessor' => ':eina_accessor',
    'Eina_Accessor *' => ':eina_accessor_p',
}
#
TYPES_USAGE = {}
#
def set_type t, v, cb=false
    return 'bool' if t =~/Eina_Bool/
    v = v.downcase.gsub(/(const|enum|union)/,'').strip
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
def wrap_text txt, col, indent
    txt.gsub( /(.{1,#{col}})(?: +|$\n?)|(.{1,#{col}})/,"\\1\\2\n#{indent}").sub(/\n\s+$/,'')
end
#
def gen_enums path, indent
    r = []
    open(path+'-enums','r').readlines.each do |l|
        l.strip!
        if not l=~/(typedef enum(?: \w+)?) {([A-Z0-9_ (\s*=\s*-?[\d+]),]+)} (\w+);/
            r << indent+"# #{l}\n#{indent}# FIXME"
            next
        end
        typedef = $1
        values = $2
        typename = $3
        v = set_type typename, typename
        args = values.split(',').collect { |cst| ':'+cst.strip.downcase }.join(', ').gsub(/=/,',').gsub(/ ,/,',')
        r << indent+"# #{typedef} {...} #{typename};"
        r << wrap_text( indent+"enum :#{v}, [ #{args} ]", 150, indent+' '*4 )
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
        if not l=~/^\s*typedef\s+([a-zA-Z0-9_\* ]+?\s+\**)((?:\(\*)?\w+\)?)\s*\((.*)\);\s*$/
            r << indent+"# #{l}\n#{indent}# FIXME"
            next
        end
        ret = $1
        name = $2
        args = $3.split(',').collect { |arg| get_type_from_arg arg, l }.join ', '
        k = name.sub(/\(/,'').sub(/\)/,'').sub(/\*/,'')
        t = name.downcase.sub(/\(/,'').sub(/\)/,'').sub(/\*/,'')
        t = set_type k, t, true
        r << indent+"# #{l}"
        r << wrap_text(indent+"callback :#{t}, [ #{args} ], #{get_type ret}", 150, indent+' '*4 )
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
        r << wrap_text(indent+"[ :#{func}, [ #{args} ], #{get_type ret} ],", 150, indent+' '*4)
    end
    r << indent+"]"
    r
end
#
libraries.collect do |header,lib|
    module_name = header[0..-3].sub(/_/,'').capitalize
    base = File.join path, 'api', header
    dir = File.join lib_path, header[0..-3].split('_').first.downcase
    Dir.mkdir dir unless Dir.exists? dir
    output = File.join dir, "#{header[0..-3].downcase}-ffi.rb"
    puts "parse #{base}-*"
    r = [lib, output, module_name, header[0..-3].downcase ]
    r << gen_enums(base, INDENT)
    r << gen_typedefs(base, INDENT)
    r << gen_callbacks(base, INDENT)
    r << gen_functions(base, INDENT)
    r
end.each do |lib, output, module_name, module_base, enums, typedefs, callbacks, functions|
    puts "generate #{output}"
    open(output,'w:utf-8') do |f|
        f << HEADER.sub(/MNAME/,module_name).sub(/MBASE/,module_base)
        f << "#{INDENT}#\n#{INDENT}ffi_lib '#{lib}'"
        f << "\n#{INDENT}#\n#{INDENT}# ENUMS"
        f << "\n"+enums.collect { |t| ( t.is_a?(Array) ? ( TYPES_USAGE[t[0]] ? t[1] : nil ) : t ) }.compact.join("\n") unless enums.empty?
        f << "\n#{INDENT}#\n#{INDENT}# TYPEDEFS"
        f << "\n"+typedefs.collect { |t| ( t.is_a?(Array) ? ( TYPES_USAGE[t[0]] ? t[1] : nil ) : t ) }.compact.join("\n") unless typedefs.empty?
        f << "\n#{INDENT}#\n#{INDENT}# CALLBACKS"
        f << "\n"+callbacks.join("\n") unless callbacks.empty?
        f << "\n#{INDENT}#\n#{INDENT}# FUNCTIONS"
        f << "\n"+functions.join("\n") unless functions.empty?
        f << "\n#{INDENT}#\n#{INDENT}attach_fcts fcts\n"
        f << FOOTER
    end
end
#
