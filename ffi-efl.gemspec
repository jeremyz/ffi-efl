#! /usr/bin/env ruby
# -*- coding: UTF-8 -*-
#
$:.push File.expand_path("../lib", __FILE__)
require 'efl'
#
Gem::Specification.new do |s|
    s.name = "ffi-efl"
    s.version = Efl::VERSION
    s.authors = ["Jérémy Zurcher"]
    s.email = ["jeremy@asynk.ch"]
    s.homepage = "http://github.com/jeremyz/ffi-efl"
    s.summary = %q{A ruby-ffi binding to efl libraries (Enlightenment Foundation Libraries).}
    s.description = %q{It covers most of eina, eet, evas, ecore, emap, elementary.
    Prototypes are extracted from C headers with sed scripts. FFI calls are generated with a ruby script.}

    s.files = `git ls-files`.split("\n").reject { |path| path =~ /^tools/ }
    s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
    s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
    s.require_paths = ["lib"]

    s.add_runtime_dependency "ffi"
    s.add_development_dependency "rspec", ["~> 2.6"]
    s.add_development_dependency "rake"
end
#
# EOF
