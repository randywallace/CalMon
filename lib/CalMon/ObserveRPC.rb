
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
