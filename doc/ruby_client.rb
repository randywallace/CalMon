#!/usr/bin/env ruby

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../lib')

require 'rubygems'
require 'CalMon/Client/Client'
require 'optparse'

def run_client(opts = {})
  @host = opts.delete(:host)   || '127.0.0.1'
  @port   = opts.delete(:port) || '8999'
  @client = CalMon::Client.new(:host => @host, :port => @port)
  if @client.isAlive.inspect
    @client.methods.inspect
    @client.star_time(Time.now, "This is a test")
    @client.stop_time(Time.now, "This is a test")
    @client.running_time(Time.now,"This is a test")
  else
    puts "Server is unavailable"
  end
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

