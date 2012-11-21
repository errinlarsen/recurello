require "trello"

class TrelloGateway
  include Trello
  include Trello::Authorization

  def authorize(public_key, secret, token)
    Trello::Authorization.const_set :AuthPolicy, OAuthPolicy
    OAuthPolicy.consumer_credential = OAuthCredential.new public_key, secret
    OAuthPolicy.token = OAuthCredential.new token, nil
  end

  def member
    return Member
  end

  def create_card(opts)
    return Card.create(opts)
  end
end
