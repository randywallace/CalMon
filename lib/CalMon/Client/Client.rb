#
# Author::    Randy D. Wallace Jr. (mailto:randy@randywallace.com)
# Copyright:: Copyright (c) 2012 Randy D. Wallace Jr.
# License::   MIT
#

require 'jimson'

module CalMon

  # This class handles attaching the observer to the JsonRPC server and
  # starting the server.
  class Client

    attr_reader :host, :port

    def initialize(opts = {})
      @port = opts.delete(:port) || '8999'
      @host = opts.delete(:host) || '127.0.0.1'
      @client = Jimson::Client.new("http://#{@host}:#{@port}")
    end

    def methods
      @client['system.listMethods']
    end

    def isAlive
      @client['system.isAlive']
    end

    def method_missing(method, *args)
      method = method.to_s
      if methods.include? method
        @client[method, *args]
      else
        puts "Method #{method} doesn't exist! Perhaps you meant one of: #{methods.to_s}"
      end
    end
  end
end

