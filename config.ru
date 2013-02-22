#
# Dreamhost specific configuration for shared Phusion Passenger configuration.
#

#ENV['GEM_HOME'] = '/home/USERNAME/.gems'
#ENV['GEM_PATH'] = '$GEM_HOME:/usr/lib/ruby/gems/1.8'
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')

require 'rubygems'
#Gem.clear_paths
require 'CalMon'

log = File.new("log/CalMon.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)

CalMon::Server.new.start
