require "trello_api"

require_relative "./trello_api_helpers"
RSpec.configure do |config|
  config.include TrelloAPIHelpers
end

describe TrelloAPI::Keys do
  it "should read the public_key from a YAML file" do
    TrelloAPI::Keys.new(fake_key_file).public.should == "Some public key"
  end

  it "should read the oauth_secret from a YAML file" do
    TrelloAPI::Keys.new(fake_key_file).secret.should == "Some secret"
  end

  it "should read the user_token from a YAML file" do
    TrelloAPI::Keys.new(fake_key_file).token.should == "Some token"
  end
end
