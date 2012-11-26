require "trello_api"

describe TrelloAPI::Wrapper do
  it "instantiates a TrelloAPI::Keys object" do
    TrelloAPI::Wrapper.new(test_yml_file).keys.should be_a(TrelloAPI::Keys)
  end

  def test_yml_file
    return StringIO.new <<fake_file
---
public_key: "Some public key"
oauth_secret: "Some secret"
user_token: "Some token"
fake_file
  end
end
