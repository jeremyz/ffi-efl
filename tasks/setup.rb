# -*- coding: UTF-8 -*-
#
require 'rubygems'
require 'rake'
require 'rake/clean'
require 'ostruct'

class OpenStruct; undef :gem; end

# TODO: make my own openstruct type object that includes descriptions
# TODO: use the descriptions to output help on the available bones options

PROJ = OpenStruct.new(
    # Project Defaults
    :name => nil,
    :summary => nil,
    :description => nil,
    :changes => nil,
    :authors => nil,
    :email => nil,
    :url => "\000",
    :version => ENV['VERSION'] || '0.0.0',
    :exclude => %w(tmp$ bak$ ~$ CVS \.svn/ \.git/ ^pkg/),
    :release_name => ENV['RELEASE'],

    # System Defaults
    :ruby_opts => %w(-w),
    :libs => [],
    :history_file => 'Changelog',
    :readme_file => 'README.rdoc',
    :ignore_file => '.bnsignore',

    # Announce
    :ann => OpenStruct.new(
        :file => 'announcement.txt',
        :text => nil,
        :paragraphs => [],
        :email => {
            :from     => nil,
            :to       => %w(ruby-talk@ruby-lang.org),
            :server   => 'localhost',
            :port     => 25,
            :domain   => ENV['HOSTNAME'],
            :acct     => nil,
            :passwd   => nil,
            :authtype => :plain,
            :tls      => true,
        }
    ),

    # Gem Packaging
    :gem => OpenStruct.new(
        :dependencies => [],
        :development_dependencies => [],
        :executables => nil,
        :extensions => FileList['ext/**/extconf.rb'],
        :files => nil,
        :need_tar => true,
        :need_zip => false,
        :extras => {}
    ),

    # File Annotations
    :notes => OpenStruct.new(
        :exclude => %w(^tasks/setup\.rb$),
        :extensions => %w(.txt .rb .erb .rdoc) << '',
        :tags => %w(FIXME OPTIMIZE TODO)
    ),

    # Rcov
    :rcov => OpenStruct.new(
        :dir => 'coverage',
        :opts => %w[--sort coverage -T -x lib/rcov],
        :threshold => 90.0,
        :threshold_exact => false
    ),

    # Rdoc
    :rdoc => OpenStruct.new(
        :opts => [],
        :include => %w(^lib/ ^bin/ ^ext/ \.txt$ \.rdoc$),
        :exclude => %w(extconf\.rb$),
        :main => nil,
        :dir => 'doc',
        :remote_dir => nil
    ),

    # Rubyforge
    :rubyforge => OpenStruct.new(
        :name => "\000"
    ),

    # Rspec
    :spec => OpenStruct.new(
        :files => FileList['spec/**/*_spec.rb'],
        :opts => []
    ),

    # Subversion Repository
    :svn => OpenStruct.new(
        :root => nil,
        :path => '',
        :trunk => 'trunk',
        :tags => 'tags',
        :branches => 'branches'
    ),

    # Test::Unit
    :test => OpenStruct.new(
        :files => FileList['test/**/test_*.rb'],
        :file  => 'test/all.rb',
        :opts  => []
    )
)

# Load the other rake files in the tasks folder
tasks_dir = File.expand_path(File.dirname(__FILE__))
post_load_fn = File.join(tasks_dir, 'post_load.rake')
rakefiles = Dir.glob(File.join(tasks_dir, '*.rake')).sort
rakefiles.unshift(rakefiles.delete(post_load_fn)).compact!
import(*rakefiles)

# Setup the project libraries
%w(lib ext).each {|dir| PROJ.libs << dir if test ?d, dir}

load './tasks/constants.rb'
load './tasks/helpers.rb'

# EOF
