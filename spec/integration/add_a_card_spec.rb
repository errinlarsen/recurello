require "recurello"
require "trello_api_helpers"

RSpec.configure do |config|
  config.include TrelloAPIHelpers, :needs => :trello_api
end

describe "Adding a Card to a Trello Board's List", :needs => :trello_api do
  it "passes" do
    trello_api_keys.should be_a(Recurello::TrelloAPI::Keys)
  end
end
