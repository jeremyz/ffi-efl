# -*- coding: UTF-8 -*-
#
require 'rbconfig'

# Setup some constants
WIN32 = %r/djgpp|(cyg|ms|bcc)win|mingw/ =~ RUBY_PLATFORM unless defined? WIN32

DEV_NULL = WIN32 ? 'NUL:' : '/dev/null'

def quiet( &block )
    io = [STDOUT.dup, STDERR.dup]
    STDOUT.reopen DEV_NULL
    STDERR.reopen DEV_NULL
    block.call
ensure
    STDOUT.reopen io.first
    STDERR.reopen io.last
    $stdout, $stderr = STDOUT, STDERR
end

BUILD_DIR = "build"

USE_RAKE_COMPILER = ( ( (RUBY_PLATFORM =~ /java/) ? false : true ) and test ?d, 'ext' )
if USE_RAKE_COMPILER
    gem 'rake-compiler', '>=0.6.0'
    require 'rake/extensiontask'
    ENV['RUBY_CC_VERSION'] = '1.8.7:1.9.2'
end

LIBEXT = case RbConfig::CONFIG['host_os'].downcase
    when /darwin/
        "dylib"
    when /mswin|mingw/
        "dll"
    else
        RbConfig::CONFIG['DLEXT']
    end

CPU = case RbConfig::CONFIG['host_cpu'].downcase
    when /i[3456]86/
        # Darwin always reports i686, even when running in 64bit mode
        if RbConfig::CONFIG['host_os'] =~ /darwin/ && 0xfee1deadbeef.is_a?(Fixnum)
            "x86_64"
        else
        "i386"
        end
    when /amd64|x86_64/
        "x86_64"
    when /ppc64|powerpc64/
        "powerpc64"
    when /ppc|powerpc/
        "powerpc"
    else
        RbConfig::CONFIG['host_cpu']
    end

OS = case RbConfig::CONFIG['host_os'].downcase
    when /linux/
        "linux"
    when /darwin/
        "darwin"
    when /freebsd/
        "freebsd"
    when /openbsd/
        "openbsd"
    when /sunos|solaris/
        "solaris"
    when /mswin|mingw/
        "win32"
    else
        RbConfig::CONFIG['host_os'].downcase
    end

CC=ENV['CC'] || RbConfig::CONFIG['CC'] || "gcc"

GMAKE = RbConfig::CONFIG['host_os'].downcase =~ /bsd|solaris/ ? "gmake" : "make"


DIFF = if WIN32 then 'diff.exe'
       else
            if quiet {system "gdiff", __FILE__, __FILE__} then 'gdiff'
            else 'diff' end
       end unless defined? DIFF

SUDO = if WIN32 then ''
       else
            if quiet {system 'which sudo'} then 'sudo'
            else '' end
       end

RCOV = WIN32 ? 'rcov.bat' : 'rcov'
RDOC = WIN32 ? 'rdoc.bat' : 'rdoc'
GEM  = WIN32 ? 'gem.bat'  : 'gem'

%w(rcov spec/rake/spectask rubyforge bones facets/ansicode).each do |lib|
    begin
        require lib
        Object.instance_eval {const_set "HAVE_#{lib.tr('/','_').upcase}", true}
    rescue LoadError
        Object.instance_eval {const_set "HAVE_#{lib.tr('/','_').upcase}", false}
    end
end

HAVE_SVN = (Dir.entries(Dir.pwd).include?('.svn') and system("svn --version 2>&1 > #{DEV_NULL}"))
HAVE_GIT = (Dir.entries(Dir.pwd).include?('.git') and system("git --version 2>&1 > #{DEV_NULL}"))

# Add rake as a development dependency
#
PROJ.gem.development_dependencies << ['rake', '>=0.8.7']

# Add bones as a development dependency
#
if HAVE_BONES
    bones_version = defined?(Bones::VERSION) ? Bones::VERSION : Bones.version
    PROJ.gem.development_dependencies << ['bones', ">= #{bones_version}"]
end

# EOF
