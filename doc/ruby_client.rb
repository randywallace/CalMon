#!/usr/bin/env ruby

require 'rubygems'
require 'jimson'
require 'optparse'

def run_client(opts = {})
  @server = opts.delete(:server) || '127.0.0.1'
  @port   = opts.delete(:port)   || '8999'
  client = Jimson::Client.new("http://#{@server}:#{@port}")
  puts client.start_time(Time.now, "This is a test")
  puts client.stop_time(Time.now, "This is a test")
  puts client.running_time(Time.now,"This is a test")
end

class ParseOptions
  def self.parse(args)
    options = {}
    OptionParser.new do |opt|
      opt.on '-s SERVER', '--server=SERVER', 'CalMon Hostname/IP' do |val|
        options[:server] = val
      end
      opt.on '-p PORT', '--port=PORT', 'CalMon Port' do |val|
        options[:port] = val
      end
      opt.on_tail '-h', '--help', 'Show Help' do
        puts opt
        exit
      end
      opt.parse!
      run_client options 
    end
  end
end

ParseOptions.parse ARGV


