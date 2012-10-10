#
# Author::    Randy D. Wallace Jr. (mailto:randy@randywallace.com)
# Copyright:: Copyright (c) 2012 Randy D. Wallace Jr.
# License::   MIT
#


module CalMon
  # This class bridges the gap between the JsonRPC Server and additional
  # handlers for what the client sends to the server.
  class ObserveRPC

    attr_reader :last_result

    def initialize(rpc_instance)
      @last_result = Hash.new
      rpc_instance.add_observer(self)
    end
    
    def update(timestamp, method, process)
      @last_result[method.to_sym] = timestamp.utc.to_s
      
      # Update database
      #

      # Post to 'Calendar' based on Config
      #

      puts "Successfully received " << timestamp.to_s << " from " << method << " for " << process
    end
  end
end
