#
# Dreamhost specific configuration for shared Phusion Passenger configuration.
#

ENV['GEM_PATH'] = '/home/USERNAME/.gems' 

require 'CalMon'

#set :views, File.dirname(__FILE__) + '/views'
#set :public, File.dirname(__FILE__) + '/public'
#set :app_file, __FILE__

log = File.new("log/CalMon.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)

srv = CalMon::Server.new
run srv.start
