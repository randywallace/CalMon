#!/usr/bin/env ruby

$:.unshift File.dirname(__FILE__)

require "CalMon/version"

module CalMon

end

require 'rubygems'

require 'jimson'

class Test
  extend Jimson::Handler

  def sum(a,b,c)
    a + b + c
  end
  
  def sub(a,b)
    a - b
  end
end

server = Jimson::Server.new(Test.new)
server.start
