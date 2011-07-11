# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "silent_postgresql/version"

Gem::Specification.new do |s|
  s.name        = "silent_postgresql"
  s.version     = SilentPostgresql::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["lg2046"]
  s.email       = ["lg2046@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Rails plugin that silences Postgresql connection adapter verbose output}
  s.description = %q{Write a gem description}

  s.rubyforge_project = "silent_postgresql"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
