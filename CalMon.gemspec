# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "CalMon/version"

Gem::Specification.new do |s|
  s.name        = "CalMon"
  s.license     = "MIT"
  s.version     = CalMon::VERSION
  s.authors     = %w{Randy D. Wallace Jr.}
  s.email       = %w{randy@randywallace.com}
  s.homepage    = "http://randywallace.github.com/CalMon/"
  s.summary     = %q{Collect timestamp data from services and use that data to add events to google calendar.}
  s.description = <<EOF
With a JSON-RPC server, client services via a myriad of language options, 
including bash+nc, ruby, and java, send messages that ultimately are used 
to create events in Google Calendar.  These events may be used to easily 
identify when an event (a Cron Job, batch script, etc...) started, stopped, 
and what its exit status was. For an organization that relies heavily upon 
the success, timeliness, and regularlity of many many batch jobs, a tool 
like that can prove to be a real benefit to systems administrators.
EOF

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
