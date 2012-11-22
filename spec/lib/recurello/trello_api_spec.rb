require "recurello"
require "trello_api_helpers"

RSpec.configure do |config|
  config.include TrelloAPIHelpers
end

describe Recurello::TrelloAPI::Keys do
  it "should read the public_key from a YAML file" do
    trello_api_keys.public.should == "Some public key"
  end

  it "should read the oauth_secret from a YAML file" do
    trello_api_keys.secret.should == "Some secret"
  end

  it "should read the user_token from a YAML file" do
    trello_api_keys.token.should == "Some token"
  end

end

describe Recurello::TrelloAPI do
  describe "#new" do
    it "initializes a Recurello::TrelloAPI" do
      trello_api.should be_a(Recurello::TrelloAPI)
    end
  end
end
