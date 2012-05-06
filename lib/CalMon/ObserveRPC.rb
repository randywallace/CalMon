#
# Author::    Randy D. Wallace Jr. (mailto:randy@randywallace.com)
# Copyright:: Copyright (c) 2012 Randy D. Wallace Jr.
# License::   MIT
#

# This class bridges the gap between the JsonRPC Server and additional
# handlers for what the client sends to the server.

module CalMon
  class ObserveRPC
    def initialize(rpc_instance)
      rpc_instance.add_observer(self)
    end

    def update(timestamp, method)
      puts "Successfully received " << timestamp.to_s << " from " << method
    end
  end
end
