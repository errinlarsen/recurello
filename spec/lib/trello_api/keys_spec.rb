require "trello_api"

describe TrelloAPI::Keys do
  it "should read the public_key from a YAML file" do
    TrelloAPI::Keys.new(test_yml_file).public.should == "Some public key"
  end

  it "should read the oauth_secret from a YAML file" do
    TrelloAPI::Keys.new(test_yml_file).secret.should == "Some secret"
  end

  it "should read the user_token from a YAML file" do
    TrelloAPI::Keys.new(test_yml_file).token.should == "Some token"
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
