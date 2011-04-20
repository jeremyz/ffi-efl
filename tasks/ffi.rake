# -*- coding: UTF-8 -*-
#
namespace :ffi do
    #
    desc "extract api out of enlightenment headers, then generate bindings"
    task :run => [ :api, :ruby ]
    #
    desc "extract api out of enlightenment headers"
    task :api do
        sh './tools/extract-api.sh'
    end
    #
    desc "generate ffi bindings"
    task :ruby do
        sh 'ruby ./tools/genruby.rb'
    end
end
#
desc 'Alias to ffi:run'
task :ffi => 'ffi:run'
#
# EOF
