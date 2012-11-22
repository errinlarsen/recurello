require "yaml"
require "trello"

module Recurello
  class TrelloAPI
    include Trello
    include Trello::Authorization

    class Keys
      attr_reader :public, :secret, :token

      def initialize(file)
        yml = YAML.load(file)

        @public = yml["public_key"]
        @secret = yml["oauth_secret"]
        @token = yml["user_token"]
      end
    end

    def initialize(keys)
      authorize(keys)
    end

    private
    def authorize(keys)
      Trello::Authorization.const_set :AuthPolicy, OAuthPolicy
      OAuthPolicy.consumer_credential =
        OAuthCredential.new keys.public, keys.secret
      OAuthPolicy.token = OAuthCredential.new keys.token, nil
    end
  end
end
