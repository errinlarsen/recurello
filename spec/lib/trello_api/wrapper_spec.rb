require "trello_api"

require_relative "./trello_api_helpers"
RSpec.configure do |config|
  config.include TrelloAPIHelpers
end

describe TrelloAPI::Wrapper do
  it "instantiates a TrelloAPI::Keys object" do
    TrelloAPI::Wrapper.new(fake_key_file).keys.should be_a(TrelloAPI::Keys)
  end
end
