require "CalMon/RPC"

module CalMon
  class Server

    def initialize
      @server = Jimson::Server.new(CalMon::RPC.new)
    end

    def start
      @server.start
    end

  end
end

