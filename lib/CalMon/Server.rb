#
# Author::    Randy D. Wallace Jr. (mailto:randy@randywallace.com)
# Copyright:: Copyright (c) 2012 Randy D. Wallace Jr.
# License::   MIT
#

# This class handles attaching the observer to the JsonRPC server and
# starting the server.

require "CalMon/RPC"
require "CalMon/ObserveRPC"

module CalMon
  class Server

    def initialize
      @rpc = CalMon::RPC.new
      @observer = CalMon::ObserveRPC.new(@rpc)
      @server = Jimson::Server.new(@rpc)
    end

    def start
      @server.start
    end

  end
end

