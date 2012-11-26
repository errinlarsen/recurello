module TrelloAPIHelpers
  def fake_key_file
    return StringIO.new <<trello_keys_yml
---
public_key: "Some public key"
oauth_secret: "Some secret"
user_token: "Some token"
trello_keys_yml
  end
end
