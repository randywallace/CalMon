require "CalMon/version"

module CalMon

end

require 'rubygems'

require 'jimson'

class MyHandler
  extend Jimson::Handler

  def sum(a,b)
    a + b
  end
end

server = Jimson::Server.new(MyHandler.new)
server.start
