require 'observer'

module CalMon
  class RPC
    extend Jimson::Handler
    include Observable

    def initialize
    end

    def start_time timestamp
      changed
      puts Time.parse(timestamp)
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

