require "recurello"

class TestServerClass
  include Recurello::ServerBoundary
end

describe Recurello::ServerBoundary do
  it "should respond to the #response message" do
    TestServerClass.new.should respond_to(:response)
  end
end


class TestClientClass
  include Recurello::ClientBoundary
end

describe Recurello::ClientBoundary do
  it "should respond to the #request message" do
    TestClientClass.new.should respond_to(:request)
  end
end
