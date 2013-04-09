#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
#
INDENT=' '*8
WRAP_LEN=150
#
def set_type t, sym
    return ETYPES['Eina_Bool'] if t=='Eina_Bool'
    if ETYPES[t].nil?
#        v = ( ETYPES[sym].nil? ? ( TYPES[sym].nil? ? ':'+sym.downcase : TYPES[sym] ) : ETYPES[sym] )
        v = ( TYPES[sym].nil? ? ':'+sym.downcase : TYPES[sym] )
        ETYPES[t] = v
        printf "\033[0;35m%40s\033[0m => \033[0;36m%s\033[0m\n",t,v
        return v
    else
        printf "\033[0;31mERROR type #{t} => #{sym} already exists!\033[0m\n"
        # exit 1
    end
end
#
def get_type t
    k = t.gsub(/(const|enum|union)/, '').strip
    r = TYPES[k]
    return r unless r.nil?
    r = ETYPES[k]
    return r unless r.nil?
    if not k=~ /\*/
        printf "\033[0;31munknown type >#{k}< #{t}\033[0m\n"
        exit 1
    end
    k = k.gsub(/[ \*]*/, '').strip
    r = ETYPES[k]
    return ':'+k.downcase if r==':pointer'
    ':pointer'
end
#
def get_type_from_arg arg, l
    if arg=~ /^\s*void\s*$/
        return ''
    end
    if arg =~ /\.\.\./
        return ':varargs'
    end
    k = arg.gsub(/const/,'').sub(/^\s+/,'').gsub(/\s{2,}/,' ').strip
    k=~/(.*?)(\w+)$/ # remove var name if any
    k = $1.strip if not $1.nil? and $1.length > 0
    t = get_type k
    if t.nil?
        printf "\033[0;31mwrong arg >#{k}< #{arg} (#{l})\033[0m\n"
        exit 1
    end
    t
end
#
def wrap_text txt, indent
    txt.gsub( /(.{1,#{150}})(?: +|$\n?)|(.{1,#{150}})/,"\\1\\2\n#{indent}").sub(/\n\s+$/,'')
end
#
def gen_enums path, indent
    r = []
    open(path+'-enums','r').readlines.each do |l|
        l.strip!
        if not l=~/((?:typedef )?enum(?: \w+)?) \{(.*)\} (\w+)/
            if l=~/((?:typedef )?enum(?: \w+)?) \{/
                printf "\033[0;31manonymous #{$1}\033[0m\n"
            else
                printf "\033[0;31m#{l}\n#{indent}# FIXME\033[0m\n"
                r << indent+"# #{l}\n#{indent}# FIXME"
            end
            next
        end
        typedef = $1.strip
        values = $2.strip
        typename = $3.strip
        tsym = set_type typename, typename
        syms, vals = [], []
        values.split(',').each do |define|
            s,v = define.gsub(/ /,'').split(/=/)
            syms << s
            vals << v
        end
        if vals.count(nil) == vals.length
            args = syms.collect{ |sym| ':'+sym.strip.downcase }.join(', ')
        else
            i=0
            h={}
            syms.zip(vals) do |s,v|
                sym=':'+s.downcase
                if h.has_key? v
                    h[s]=h[v]
                elsif v.nil?
                    h[s]=i
                    i+=1
                elsif v=~/\|/
                    els = v.gsub(/[\(\)]/,'').split(/\|/)
                    v = els.inject('') { |s,e| s+="#{h[e]}|" }[0..-2]
                    h[s]=v
                    i=eval(v).to_i+1
                else
                    h[s]=v
                    i=eval(v).to_i+1
                end
            end
            args = syms.inject(''){|r,s| r+=":#{s.strip.downcase}, #{h[s]}, " }.sub(/, $/,'')
        end
        r << indent+"# #{typedef} {...} #{typename};"
        r << wrap_text( indent+"enum #{tsym}, [ #{args} ]", indent+' '*4 )
    end
    r
end
#
def gen_typedefs path, indent
    r = []
    open(path+'-types','r').readlines.each do |l|
        l.strip!
        if l=~/typedef (struct|union) _?\w+ (\w+);/
            t = $2.strip
            sym = 'pointer'
        elsif l=~/typedef enum/
            # nothing todo
            next
        elsif l =~/typedef\s+((?:\w+\**\s)+)(\w+);/
            t = $2.strip
            sym = $1.strip
        else
            r << indent+"# #{l}\n#{indent}# FIXME"
            next
        end
        tsym = set_type t, sym
        r << indent+"# #{l}"
        r << indent+"typedef #{tsym}, :#{t.downcase}"
    end
    r
end
#
def gen_callbacks path, indent
    r = []
    open(path+'-callbacks','r').readlines.each do |l|
        l.strip!
        if not l=~/^\s*typedef\s+(.*)((?:\(\*\s*?\w+\)| \*?\w+))\s*\((.*)\);/
            printf "\033[0;31m# #{l}\n#{indent}# FIXME\033[0m\n"
            r << indent+"# #{l}\n#{indent}# FIXME"
            next
        end
        ret = $1.strip
        name = $2.strip
        args = $3.split(',').collect { |arg| get_type_from_arg arg, l }.join ', '
        t = name.sub(/^\(\* */,'').sub(/\)$/,'')
        sym = ( t.downcase=~/_cb$/ ? t : t+'_cb' )
        tsym = set_type t, sym
        r << indent+"# #{l}"
        r << wrap_text(indent+"callback #{tsym}, [ #{args} ], #{get_type ret}", indent+' '*4 )
    end
    r
end
#
def gen_variables path, indent
    r = []
    open(path+'-variables','r').readlines.each do |l|
        l.strip!
        if not l=~ /EAPI\s+extern\s+(\w+\s+\*?)(\w+)/
            printf "\033[0;31m# #{l}\n#{indent}# FIXME\033[0m\n"
            r << indent+"# #{l}\n#{indent}# FIXME"
            next
        end
        var = $2.strip
        t = $1.strip
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
        if not l=~ /EAPI ([a-zA-Z0-9_\* ]+?)(\w+) ?\(([a-zA-Z0-9_ \*,\.]*)\)( *[A-Z]{2,})?/
            printf "\033[0;31m# #{l}\n#{indent}# FIXME\033[0m\n"
            r << indent+"# #{l}\n#{indent}# FIXME"
            next
        end
        ret = $1.strip
        func = $2.strip.downcase
        args = $3.split(',').collect { |arg| get_type_from_arg arg, l }.join ', '
        r << indent+"# #{l}"
        r << wrap_text(indent+"[ :#{func}, [ #{args} ], #{get_type ret} ],", indent+' '*4)
    end
    r << indent+"]"
    r
end
#
NATIVE='efl/native'
#
HEADER =<<-EOF
#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
require '#{NATIVE}'REQUIRES
#
module Efl
    #
    module MNAME
        #
        FCT_PREFIX = 'MY_FCT_PREFIX_' unless const_defined? :FCT_PREFIX
        #
        def self.method_missing meth, *args, &block
            sym = Efl::MethodResolver.resolve self, meth, FCT_PREFIX
            self.send sym, *args, &block
        end
        #
    end
    #
    module Native
EOF
#
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
    'mode_t' => ':int',
    'pid_t' => ':ulong',
    'time_t' => ':ulong',
    'size_t' => ':ulong',
    'ssize_t' => ':long',
    'uintptr_t' => ':pointer',
    'double' => ':double',
    'long int' => ':long',
    'long long' => ':long_long',
    'unsigned int' => ':uint',
    'unsigned char' => ':uchar',
    'unsigned short' => ':ushort',
    'unsigned long' => ':ulong',
    'unsigned long int' => ':ulong',
    'unsigned long long' => ':ulong_long',
    'uint32_t' => ':uint',
    'int64_t' => ':long_long',
    'uint64_t' => ':ulong_long',
    'char *' => ':string',                                              # FIXME ?!?!
    'fd_set *' => ':pointer',
    'FILE *' => ':pointer',
    'va_list' => ':pointer',                                            # FIXME ?!?!
    'struct tm *' => ':pointer',
    'struct timeval *' => ':pointer',
    'struct sockaddr *' => ':pointer',
    'DBusBusType' => ':int',
    'E_Notification_Closed_Reason' => ':e_notification_closed_reason',   # cheating
}
ETYPES = {
    'Eina_Bool' => ':bool'
}
# Evas.h
EVAS_LAYER_MIN=-32768
EVAS_LAYER_MAX=32767
#
path = File.dirname __FILE__
lib_path = File.join path, '..', 'lib', 'efl', 'native'
#
def efl_h lib, header, modname, prefix=nil, outf=nil, reqs=nil, csts=nil
    {
        :lib=>lib,
        :header=>header,
        :modname=>modname,
        :prefix=>prefix||header.downcase.sub(/\.h/,''),
        :outfile=>outf||header.downcase.sub(/\.h/,'.rb'),
        :requires=> reqs||[],
        :constants=>csts||[]
    }
end
#
SO_MAJ = '.so.1'
#
libs = []
libs << efl_h('eina'+SO_MAJ,'eina_types.h','Eina','eina')
libs << efl_h('eina'+SO_MAJ,'eina_main.h','Eina','eina','eina.rb')
libs << efl_h('eina'+SO_MAJ,'eina_xattr.h','EinaXattr')
libs << efl_h('eina'+SO_MAJ,'eina_log.h','EinaLog')
libs << efl_h('eina'+SO_MAJ,'eina_list.h','EinaList')
libs << efl_h('eina'+SO_MAJ,'eina_hash.h','EinaHash')
libs << efl_h('eina'+SO_MAJ,'eina_file.h','EinaFile')
libs << efl_h('eet'+SO_MAJ,'Eet.h','Eet',nil,nil,["#{NATIVE}/eina_xattr","#{NATIVE}/eina_list"])
libs << efl_h('evas'+SO_MAJ,'Evas.h','Evas',nil,nil,["#{NATIVE}/eina_list"],['EVAS_LAYER_MIN','EVAS_LAYER_MAX'])
libs << efl_h('ecore'+SO_MAJ,'Ecore.h','Ecore')
libs << efl_h('ecore_input'+SO_MAJ,'Ecore_Input.h','EcoreInput','ecore_event',nil,["#{NATIVE}/eina_list"])
libs << efl_h('ecore'+SO_MAJ,'Ecore_Getopt.h','EcoreGetopt',nil,nil,["#{NATIVE}/eina_list"])
libs << efl_h('ecore_evas'+SO_MAJ,'Ecore_Evas.h','EcoreEvas',nil,nil,["#{NATIVE}/ecore_getopt","#{NATIVE}/evas"])
libs << efl_h('eio'+SO_MAJ,'Eio.h','Eio',nil,nil,["#{NATIVE}/eina_file","#{NATIVE}/eet"])
libs << efl_h('embryo'+SO_MAJ,'Embryo.h','Embryo')
libs << efl_h('edje'+SO_MAJ,'Edje.h','Edje',nil,nil,["#{NATIVE}/evas"])
libs << efl_h('efreet'+SO_MAJ,'Efreet.h','Efreet')
libs << efl_h('efreet'+SO_MAJ,'efreet_base.h','EfreetBase',nil,nil,["#{NATIVE}/eina_list"])
libs << efl_h('efreet'+SO_MAJ,'efreet_icon.h','EfreetIcon','efreet_icon',nil,["#{NATIVE}/eina_list"])
libs << efl_h('efreet'+SO_MAJ,'efreet_desktop.h','EfreetDesktop','efreet_desktop',nil,["#{NATIVE}/eina_list"])
libs << efl_h('efreet'+SO_MAJ,'efreet_menu.h','EfreetMenu','efreet_menu',nil,["#{NATIVE}/efreet_desktop"])
libs << efl_h('efreet'+SO_MAJ,'efreet_uri.h','EfreetUri','efreet_uri')
libs << efl_h('efreet'+SO_MAJ,'efreet_ini.h','EfreetIni','efreet_ini')
libs << efl_h('efreet'+SO_MAJ,'efreet_utils.h','EfreetUtils','efreet_utils',nil,["#{NATIVE}/efreet_desktop"])
libs << efl_h('efreet_mime'+SO_MAJ,'Efreet_Mime.h','EfreetMime')
libs << efl_h('efreet_trash'+SO_MAJ,'Efreet_Trash.h','EfreetTrash',nil,nil,["#{NATIVE}/eina_list","#{NATIVE}/efreet_uri"])
libs << efl_h('edbus'+SO_MAJ,'E_DBus.h','Edbus',nil,'edbus.rb',["#{NATIVE}/eina_list"])
libs << efl_h('enotify'+SO_MAJ,'E_Notify.h','Enotify','e_notification','enotify.rb',["#{NATIVE}/evas","#{NATIVE}/edbus"])
libs << efl_h('enotify'+SO_MAJ,'E_Notification_Daemon.h','EnotificationDaemon','e_notification_daemon','enotification_daemon.rb',["#{NATIVE}/enotify"])
libs << efl_h('ebluez'+SO_MAJ,'E_Bluez.h','Ebluez','e_bluez','ebluez.rb',["#{NATIVE}/edbus"])
libs << efl_h('eofono'+SO_MAJ,'E_Ofono.h','Eofono','e_ofono','eofono.rb',["#{NATIVE}/edbus"])
libs << efl_h('eukit'+SO_MAJ,'E_Ukit.h','Eukit','e_ukit','eukit.rb',["#{NATIVE}/edbus"])
libs << efl_h('ehal'+SO_MAJ,'E_Hal.h','Ehal','e_hal','ehal.rb',["#{NATIVE}/edbus"])
libs << efl_h('econnman0_7x'+SO_MAJ,'E_Connman.h','EConnman','e_connman','econnman.rb',["#{NATIVE}/edbus"])
libs << efl_h('eeze'+SO_MAJ,'Eeze.h','Eeze',nil,nil,["#{NATIVE}/eina_list"])
libs << efl_h('eeze'+SO_MAJ,'Eeze_Disk.h','EezeDisk')
libs << efl_h('eeze'+SO_MAJ,'Eeze_Net.h','EezeNet',nil,nil,["#{NATIVE}/eina_list"])
libs << efl_h('emotion'+SO_MAJ,'Emotion.h','Emotion',nil,nil,["#{NATIVE}/evas"])
libs << efl_h('ethumb'+SO_MAJ,'Ethumb.h','Ethumb')
libs << efl_h('ethumb_client'+SO_MAJ,'Ethumb_Client.h','EthumbClient',nil,nil,["#{NATIVE}/ethumb"])
libs << efl_h('ethumb'+SO_MAJ,'Ethumb_Plugin.h','EthumbPlugin',nil,nil,["#{NATIVE}/evas","#{NATIVE}/ecore_evas","#{NATIVE}/ethumb"])
#
ELM_LIB='elementary'+SO_MAJ
#
def elm_h header, modname, reqs=nil
    {
        :lib=>ELM_LIB,
        :header=>header,
        :modname=>modname,
        :prefix=>header.sub(/\.h/,'').sub(/elc_/,'elm_'),
        :outfile=>'elm/'+header.sub(/\.h/,'.rb').sub(/elc_/,'elm_'),
        :requires=> reqs||["#{NATIVE}/elementary"],
        :constants=>[]
    }
end
#
libs << {
    :lib=>ELM_LIB,:header=>'Elementary.h',
    :modname=>'Elm', :prefix=>'elm', :outfile=>'elementary.rb',
    :requires=>["#{NATIVE}/elm/elm_general","#{NATIVE}/elm/elm_tooltip"], :constants=>[]
}
libs << {
    :lib=>ELM_LIB,:header=>'elm_general.h',
    :modname=>'Elm', :prefix=>'elm', :outfile=>'elm/elm_general.rb',
    :requires=>["#{NATIVE}/evas","#{NATIVE}/elementary"], :constants=>[]
}
libs << elm_h('elm_tooltip.h', 'ElmTooltip')
libs[-1][:prefix] = 'elm_object_tooltip'
libs << elm_h('elm_object_item.h', 'ElmObjectItem')
libs << elm_h('elm_object.h', 'ElmObject', ["#{NATIVE}/edje","#{NATIVE}/elementary"])
libs << elm_h('elm_icon.h', 'ElmIcon')
libs << elm_h('elm_scroller.h', 'ElmScroller')
libs << elm_h('elm_entry.h', 'ElmEntry', ["#{NATIVE}/edje","#{NATIVE}/elementary","#{NATIVE}/elm/elm_icon","#{NATIVE}/elm/elm_scroller"])
libs << elm_h('elm_list.h', 'ElmList', ["#{NATIVE}/elementary","#{NATIVE}/elm/elm_scroller"])
libs << elm_h('elc_ctxpopup.h', 'ElmCtxPopup')
libs << elm_h('elc_fileselector_button.h', 'ElmFileSelectorButton')
libs << elm_h('elc_fileselector_entry.h', 'ElmFileSelectorEntry')
libs << elm_h('elc_fileselector.h', 'ElmFileSelector')
libs << elm_h('elc_hoversel.h', 'ElmHoverSel', ["#{NATIVE}/elementary","#{NATIVE}/elm/elm_icon"])
libs << elm_h('elc_multibuttonentry.h', 'ElmMultiButtonEntry')
libs << elm_h('elc_naviframe.h', 'ElmNaviFrame')
libs << elm_h('elc_popup.h', 'ElmPopup', ["#{NATIVE}/elementary","#{NATIVE}/elm/elm_entry"])
libs << elm_h('elm_actionslider.h', 'ElmActionSlider')
libs << elm_h('elm_app.h', 'ElmApp')
libs << elm_h('elm_bg.h', 'ElmBg')
libs << elm_h('elm_box.h', 'ElmBox', ["#{NATIVE}/ecore","#{NATIVE}/elementary"])
libs << elm_h('elm_bubble.h', 'ElmBubble')
libs << elm_h('elm_button.h', 'ElmButton')
libs << elm_h('elm_cache.h', 'ElmCache')
libs << elm_h('elm_calendar.h', 'ElmCalendar')
libs << elm_h('elm_check.h', 'ElmCheck')
libs << elm_h('elm_clock.h', 'ElmClock')
libs << elm_h('elm_cnp.h', 'ElmCnp')
libs << elm_h('elm_colorselector.h', 'ElmColorSelector')
libs << elm_h('elm_config.h', 'ElmConfig')
libs << elm_h('elm_conform.h', 'ElmConform')
libs << elm_h('elm_cursor.h', 'ElmCursor')
libs << elm_h('elm_datetime.h', 'ElmDatetime')
libs << elm_h('elm_dayselector.h', 'ElmDaySelector')
libs << elm_h('elm_debug.h', 'ElmDebug')
libs << elm_h('elm_diskselector.h', 'ElmDiskSelector', ["#{NATIVE}/elementary","#{NATIVE}/elm/elm_scroller"])
libs << elm_h('elm_finger.h', 'ElmFinger')
libs << elm_h('elm_flip.h', 'ElmFlip')
libs << elm_h('elm_flipselector.h', 'ElmFlipSelector')
libs << elm_h('elm_focus.h', 'ElmFocus')
libs << elm_h('elm_frame.h', 'ElmFrame')
libs << elm_h('elm_gengrid.h', 'ElmGenGrid', ["#{NATIVE}/elementary","#{NATIVE}/elm/elm_gen","#{NATIVE}/elm/elm_scroller"])
libs << elm_h('elm_gen.h', 'ElmGen')
libs << elm_h('elm_genlist.h', 'ElmGenList', ["#{NATIVE}/elementary","#{NATIVE}/elm/elm_gen","#{NATIVE}/elm/elm_list","#{NATIVE}/elm/elm_scroller"])
libs << elm_h('elm_gesture_layer.h', 'ElmGestureLayer')
libs << elm_h('elm_glview.h', 'ElmGLView')
libs << elm_h('elm_grid.h', 'ElmGrid')
libs << elm_h('elm_hover.h', 'ElmHover')
libs << elm_h('elm_image.h', 'ElmImage')
libs << elm_h('elm_index.h', 'ElmIndex')
libs << elm_h('elm_inwin.h', 'ElmInwin')
libs[-1][:prefix] = 'elm_win_inwin'
libs << elm_h('elm_label.h', 'ElmLabel', ["#{NATIVE}/elementary","#{NATIVE}/elm/elm_entry"])
libs << elm_h('elm_layout.h', 'ElmLayout', ["#{NATIVE}/edje","#{NATIVE}/elementary"])
libs << elm_h('elm_mapbuf.h', 'ElmMapBuf')
libs << elm_h('elm_menu.h', 'ElmMenu')
libs << elm_h('elm_mirroring.h', 'ElmMirroring')
libs << elm_h('elm_need.h', 'ElmNeed')
libs << elm_h('elm_notify.h', 'ElmNotify')
libs << elm_h('elm_panel.h', 'ElmPanel')
libs << elm_h('elm_panes.h', 'ElmPanes')
libs << elm_h('elm_photocam.h', 'ElmPhotoCam')
libs << elm_h('elm_photo.h', 'ElmPhoto')
libs << elm_h('elm_plug.h', 'ElmPlug')
libs << elm_h('elm_progressbar.h', 'ElmProgressBar')
libs << elm_h('elm_radio.h', 'ElmRadio')
libs << elm_h('elm_scale.h', 'ElmScale')
libs << elm_h('elm_scroll.h', 'ElmScroll')
libs << elm_h('elm_segment_control.h', 'ElmSegmentControl')
libs << elm_h('elm_separator.h', 'ElmSeparator')
libs << elm_h('elm_slider.h', 'ElmSlider')
libs << elm_h('elm_slideshow.h', 'ElmSlideshow')
libs << elm_h('elm_spinner.h', 'ElmSpinner')
libs << elm_h('elm_store.h', 'ElmStore')
libs << elm_h('elm_table.h', 'ElmTable')
libs << elm_h('elm_theme.h', 'ElmTheme')
libs << elm_h('elm_thumb.h', 'ElmThumb')
libs << elm_h('elm_toolbar.h', 'ElmToolbar', ["#{NATIVE}/elementary","#{NATIVE}/elm/elm_icon"])
libs << elm_h('elm_transit.h', 'ElmTransit')
libs << elm_h('elm_video.h', 'ElmVideo')
libs << elm_h('elm_web.h', 'ElmWeb')
libs << elm_h('elm_win.h', 'ElmWin', ["#{NATIVE}/ecore_evas","#{NATIVE}/elementary"])

Dir.mkdir lib_path unless (File.exists? lib_path)
#
libs.each do |lib|
    base = File.join path, 'api', lib[:header]
    printf "\033[1;33mparse \033[0;32m%s-*\033[0;0m\n",base
    printf " \033[0;33menums...\033[0;0m\n"
    lib[:enums]=gen_enums(base, INDENT)
    printf " \033[0;33mtypedefs...\033[0;0m\n"
    lib[:typedefs]=gen_typedefs(base, INDENT)
    printf " \033[0;33mcallbacks...\033[0;0m\n"
    lib[:callbacks]=gen_callbacks(base, INDENT)
    printf " \033[0;33mvariables...\033[0;0m\n"
    lib[:variables]=gen_variables(base, INDENT)
    printf " \033[0;33mfunctions...\033[0;0m\n"
    lib[:functions]=gen_functions(base, INDENT)
    printf "\033[1;33mdone\033[0;0m\n"
end
libs.each do |lib|
    outpath = File.join lib_path, lib[:outfile]
    printf "\033[1;33mgenerate\033[0;0m %-50s\033[0;0m",outpath
    outdir = File.dirname outpath
    Dir.mkdir outdir unless File.exists? outdir
    File.open(File.join(outpath),'w:utf-8') do |f|
        reqs = ( lib[:requires].nil? ? '' : lib[:requires].inject('') {|s,e| s+="\nrequire '#{e}'"})
        f << HEADER.gsub(/MNAME/,lib[:modname]).sub(/MY_FCT_PREFIX/,lib[:prefix]).sub(/REQUIRES/,reqs)
        f << "#{INDENT}#\n#{INDENT}ffi_lib '#{lib[:lib]}'"
        if not lib[:constants].empty?
            f << "\n#{INDENT}#\n#{INDENT}# CONSTANTS"
            f << "\n"+lib[:constants].collect { |cst| INDENT+cst+"="+eval(cst).to_s}.compact.join("\n")
        end
        print "enums, "
        if not lib[:enums].empty?
            f << "\n#{INDENT}#\n#{INDENT}# ENUMS"
            f << "\n"+lib[:enums].collect { |t| ( t.is_a?(Array) ? t[1] : t ) }.compact.join("\n")
        end
        print "typedefs, "
        if not lib[:typedefs].empty?
            f << "\n#{INDENT}#\n#{INDENT}# TYPEDEFS"
            f << "\n"+lib[:typedefs].collect { |t| ( t.is_a?(Array) ? t[1]  : t ) }.compact.join("\n")
        end
        print "callbacks, "
        if not lib[:callbacks].empty?
            f << "\n#{INDENT}#\n#{INDENT}# CALLBACKS"
            f << "\n"+lib[:callbacks].join("\n")
        end
        print "variables, "
        if not lib[:variables].empty?
            f << "\n#{INDENT}#\n#{INDENT}# VARIABLES"
            f << "\n"+lib[:variables].join("\n")
        end
        puts "functions."
        if not lib[:functions].empty?
            f << "\n#{INDENT}#\n#{INDENT}# FUNCTIONS"
            f << "\n"+lib[:functions].join("\n")
        end
        f << "\n#{INDENT}#\n#{INDENT}attach_fcts fcts\n#{INDENT}#\n"
        f << FOOTER
    end
end
#
