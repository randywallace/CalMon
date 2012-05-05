require 'observer'

module CalMon
  class RPC
    include Observable
    extend Jimson::Handler

    jimson_exclude *Observable.public_instance_methods.map {|x| x.to_sym}

    def initialize
    end

    def start_time timestamp
      changed
      notify_observers(Time.parse(timestamp), __method__.to_s)
      "Success"
    end

    def stop_time timestamp
      changed
      notify_observers(Time.parse(timestamp), __method__.to_s)
      "Success"
    end

    def running_time timestamp
      changed
      notify_observers(Time.parse(timestamp), __method__.to_s)
      "Success"
    end

    def sum(a, b, c)
      a + b + c
    end

    def sub(a, b)
      a - b
    end

  end
end

