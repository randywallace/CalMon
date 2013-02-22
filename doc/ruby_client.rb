#!/usr/bin/env ruby

require 'rubygems'
require 'jimson'
client = Jimson::Client.new("http://127.0.0.1:8999")
puts client.start_time(Time.now, "This is a test")
puts client.stop_time(Time.now, "This is a test")
puts client.running_time(Time.now,"This is a test")
