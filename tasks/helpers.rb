# -*- coding: UTF-8 -*-
#
require 'fileutils'
require 'find'
require 'date'
#
# Reads a file at +path+ and spits out an array of the +paragraphs+
# specified.
#
#    changes = paragraphs_of('History.txt', 0..1).join("\n\n")
#    summary, *description = paragraphs_of('README.txt', 3, 3..8)
#
def paragraphs_of( path, *paragraphs )
    title = String === paragraphs.first ? paragraphs.shift : nil
    ary = File.read(path).delete("\r").split(/\n\n+/)

    result = if title
        tmp, matching = [], false
        rgxp = %r/^=+\s*#{Regexp.escape(title)}/i
        paragraphs << (0..-1) if paragraphs.empty?

        ary.each do |val|
            if val =~ rgxp
                break if matching
                matching = true
                rgxp = %r/^=+/i
            elsif matching
                tmp << val
            end
        end
        tmp
    else ary end

    result.values_at(*paragraphs)
end

# Adds the given gem _name_ to the current project's dependency list. An
# optional gem _version_ can be given. If omitted, the newest gem version
# will be used.
#
def depend_on( name, version = nil )
    spec = Gem::Specification.find_by_name(name)
    version = spec.version.to_s if version.nil? and !spec.nil?

    PROJ.gem.dependencies << case version
        when nil; [name]
        when %r/^\d/; [name, ">= #{version}"]
        else [name, version] end
end

# Adds the given arguments to the include path if they are not already there
#
#def ensure_in_path( *args )
#    args.each do |path|
#        path = File.expand_path(path)
#        $:.unshift(path) if test(?d, path) and not $:.include?(path)
#    end
#end

# Find a rake task using the task name and remove any description text. This
# will prevent the task from being displayed in the list of available tasks.
#
def remove_desc_for_task( names )
    Array(names).each do |task_name|
        task = Rake.application.tasks.find {|t| t.name == task_name}
        next if task.nil?
        task.instance_variable_set :@comment, nil
    end
end

# Change working directories to _dir_, call the _block_ of code, and then
# change back to the original working directory (the current directory when
# this method was called).
#
#def in_directory( dir, &block )
#    curdir = pwd
#    begin
#        cd dir
#        return block.call
#    ensure
#        cd curdir
#    end
#end

# Scans the current working directory and creates a list of files that are
# candidates to be in the manifest.
#
#def manifest
#    files = []
#    exclude = PROJ.exclude.dup
#    comment = %r/^\s*#/
#
#    # process the ignore file and add the items there to the exclude list
#    if test(?f, PROJ.ignore_file)
#        ary = []
#        File.readlines(PROJ.ignore_file).each do |line|
#            next if line =~ comment
#            line.chomp!
#            line.strip!
#            next if line.nil? or line.empty?
#
#            glob = line =~ %r/\*\./ ? File.join('**', line) : line
#            Dir.glob(glob).each {|fn| ary << "^#{Regexp.escape(fn)}"}
#        end
#        exclude.concat ary
#    end
#
#    # generate a regular expression from the exclude list
#    exclude = Regexp.new(exclude.join('|'))
#
#    Find.find '.' do |path|
#        path.sub! %r/^(\.\/|\/)/o, ''
#        next unless test ?f, path
#        next if path =~ exclude
#        files << path
#    end
#    files.sort!
#end

# We need a "valid" method that determines if a string is suitable for use
# in the gem specification.
#
class Object
    def valid?
        return !(self.empty? or self == "\000") if self.respond_to?(:to_str)
        return false
    end
end

# EOF
