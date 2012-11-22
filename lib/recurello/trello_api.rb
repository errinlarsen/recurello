require "yaml"
require "trello"

module Recurello
  class TrelloAPI
    include Trello
    include Trello::Authorization

    class Keys
      attr_reader :public, :secret, :token

      def initialize(file_name)
        yml = YAML.load_file(file_name)

        @public = yml[:public_key]
        @secret = yml[:secret]
        @token = yml[:user_token]
      end
    end

    def authorize(keys)
      Trello::Authorization.const_set :AuthPolicy, OAuthPolicy
      OAuthPolicy.consumer_credential =
        OAuthCredential.new keys.public, keys.secret
      OAuthPolicy.token = OAuthCredential.new keys.token, nil
    end

    def member
      return Member
    end

    def create_card(opts)
      return Card.create(opts)
    end
  end
end
