# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "CalMon/version"

Gem::Specification.new do |s|
  s.name        = "CalMon"
  s.license     = "MIT"
  s.version     = CalMon::VERSION
  s.authors     = %w{Randy D. Wallace Jr.}
  s.email       = %w{randy@randywallace.com}
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "CalMon"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = %w{lib}

  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "rake"
  s.add_runtime_dependency "google-api-client"
  s.add_runtime_dependency "jimson"
end
