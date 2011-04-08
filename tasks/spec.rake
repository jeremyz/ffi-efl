# -*- coding: UTF-8 -*-
#
#if HAVE_SPEC_RAKE_SPECTASK and not PROJ.spec.files.to_a.empty?
require 'rspec/core/rake_task'
#
namespace :spec do

    desc 'Run all specs with basic output'
    RSpec::Core::RakeTask.new(:run) do |t|
        t.ruby_opts = PROJ.ruby_opts
        t.rspec_opts = PROJ.spec.opts
#        t.libs += PROJ.libs
    end

    desc 'Run all specs with text output'
    RSpec::Core::RakeTask.new(:doc) do |t|
        t.ruby_opts = PROJ.ruby_opts
        t.rspec_opts = PROJ.spec.opts + ['-fs' ]
#        t.libs += PROJ.libs
    end

    desc 'Run all specs with html output'
    RSpec::Core::RakeTask.new(:html) do |t|
        t.ruby_opts = PROJ.ruby_opts
        t.rspec_opts = PROJ.spec.opts + ['-fh' ]
#        t.libs += PROJ.libs
    end

    if HAVE_RCOV
        desc 'Run all specs with RCov'
        RSpec::Core::RakeTask.new(:rcov) do |t|
            t.ruby_opts = PROJ.ruby_opts
            t.rspec_opts = PROJ.spec.opts
#            t.libs += PROJ.libs
            t.rcov = true
#            t.rcov_path = PROJ.rcov.dir
            t.rcov_opts = PROJ.rcov.opts + ['--exclude', 'spec']
        end

#        RCov::VerifyTask.new(:verify) do |t| 
#            t.threshold = PROJ.rcov.threshold
#            t.index_html = File.join(PROJ.rcov.dir, 'index.html')
#            t.require_exact_threshold = PROJ.rcov.threshold_exact
#        end

#        task :verify => :rcov
#        remove_desc_for_task %w(spec:clobber_rcov)
    end

end  # namespace :spec

desc 'Alias to spec:run'
task :spec => 'spec:run'

#task :clobber => 'spec:clobber_rcov' if HAVE_RCOV

#end  # if HAVE_SPEC_RAKE_SPECTASK

# EOF
