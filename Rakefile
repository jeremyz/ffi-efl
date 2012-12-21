require 'bundler/gem_tasks'

begin
    require 'rspec/core/rake_task'
rescue LoadError
    puts "missing bundler gem, you should\n$ gem install bundler"
    exit 1
end
RSpec::Core::RakeTask.new

task :default => :spec
