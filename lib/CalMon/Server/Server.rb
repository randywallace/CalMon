#
# Author::    Randy D. Wallace Jr. (mailto:randy@randywallace.com)
# Copyright:: Copyright (c) 2012 Randy D. Wallace Jr.
# License::   MIT
#


require "CalMon/Server/RPC"
require "CalMon/Server/ObserveRPC"

module CalMon

  # This class handles attaching the observer to the JsonRPC server and
  # starting the server.
  class Server

    attr_reader :rpc, :observer, :server, :port

    def initialize(opts = {})
      @rpc = CalMon::RPC.new
      @observer = CalMon::ObserveRPC.new(@rpc)
      @port = opts.delete(:port) || 8999
      @webserver = opts.delete(:server) || 'webrick'
      @server = Jimson::Server.new(@rpc, :port => @port, :server => @webserver)
    end

    def start
      @server.start
    end

  end
end

