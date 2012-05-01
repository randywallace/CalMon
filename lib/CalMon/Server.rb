
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

