require 'CalMon'

describe CalMon::RPC do
  it "adds three numbers" do
    CalMon::RPC.new.sum(1,2,3).should eq(6)
  end
  it "subtracts two numbers" do
    CalMon::RPC.new.sub(5,2).should eq(3)
  end
  it "Notifies of start time" do
    CalMon::RPC.new.start_time("2012-05-12 10:05:33").should eq("Success")
  end
  it "Notifies of stop time" do
    CalMon::RPC.new.stop_time("2012-05-12 10:05:33").should eq("Success")
  end
  it "Notifies of running time" do
    CalMon::RPC.new.running_time("2012-05-12 10:05:33").should eq("Success")
  end
end

describe CalMon::ObserveRPC do
  it "receives a message of the start time" do
    observed = CalMon::RPC.new
    observer = CalMon::ObserveRPC.new(observed)
    observed.start_time("2012-05-12 10:05:33")
    observed.count_observers.should eq(1)
  end
end
describe CalMon::Server do it "initializes a server" do 
    server = CalMon::Server.new
    server.rpc.should be_an_instance_of(CalMon::RPC)
    server.observer.should be_an_instance_of(CalMon::ObserveRPC)
    server.server.should be_an_instance_of(Jimson::Server)
  end
end

