require "recurello"

describe Recurello::CardCreator do
  it "authorizes a TrelloGateway object" do
    trello_gateway = double()
    trello_gateway.should_receive(:authorize)

    Recurello::CardCreator.new(trello_gateway)
  end
end
