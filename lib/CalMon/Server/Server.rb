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

    attr_reader :rpc, :observer, :server

    def initialize(opts = {})
      @rpc = CalMon::RPC.new
      @observer = CalMon::ObserveRPC.new(@rpc)
      @server = Jimson::Server.new(@rpc, 
                                   :port => opts.delete(:port) || 8999, 
                                   :server => opts.delete(:server) || 'webrick',
                                   )
    end

    def start
      @server.start
    end

  end
end

