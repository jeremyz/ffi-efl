# -*- coding: UTF-8 -*-
#
#if HAVE_SPEC_RAKE_SPECTASK and not PROJ.spec.files.to_a.empty?
require 'rspec/core/rake_task'
#
namespace :spec do

    desc 'Run all specs with basic output'
    RSpec::Core::RakeTask.new(:run) do |t,args|
        t.ruby_opts = PROJ.ruby_opts
        t.rspec_opts = PROJ.spec.opts
        t.pattern = ENV['pattern'] if ENV['pattern']
    end

    desc 'Run all specs with text output'
    RSpec::Core::RakeTask.new(:doc) do |t|
        t.ruby_opts = PROJ.ruby_opts
        t.rspec_opts = PROJ.spec.opts + ['-fs' ]
        t.pattern = ENV['pattern'] if ENV['pattern']
    end

    desc 'Run all specs with html output'
    RSpec::Core::RakeTask.new(:html) do |t|
        t.ruby_opts = PROJ.ruby_opts
        t.rspec_opts = PROJ.spec.opts + ['-fh' ]
        t.pattern = ENV['pattern'] if ENV['pattern']
    end

    if HAVE_RCOV
        desc 'Run all specs with RCov'
        RSpec::Core::RakeTask.new(:rcov) do |t|
            t.ruby_opts = PROJ.ruby_opts
            t.rspec_opts = PROJ.spec.opts
            t.rcov = true
            t.rcov_opts = PROJ.rcov.opts + ['--exclude', 'spec']
        end
    end

end  # namespace :spec

desc 'Alias to spec:run'
task :spec => 'spec:run'

# EOF
