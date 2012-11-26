module TrelloAPIHelpers
  def trello_api
    return Recurello::TrelloAPI.new(trello_api_keys)
  end

  def trello_api_keys
    return Recurello::TrelloAPI::Keys.new(test_yml_file)
  end

  def test_yml_file
    return StringIO.new <<trello_keys_yml
---
public_key: "Some public key"
oauth_secret: "Some secret"
user_token: "Some token"
trello_keys_yml
  end
end
