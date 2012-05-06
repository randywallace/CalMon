#
# Author::    Randy D. Wallace Jr. (mailto:randy@randywallace.com)
# Copyright:: Copyright (c) 2012 Randy D. Wallace Jr.
# License::   MIT
#


require 'observer'

module CalMon

  # This class provides the RPC methods actually handled by the
  # JsonRPC Server.  Note that unless the observer is notified the
  # data sent by the remote client won't get anywhere. 
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

