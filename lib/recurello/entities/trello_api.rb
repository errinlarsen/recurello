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

    def create_card(options)
      Trello::Card.create(options)
    end

    def find_list(member_name, board_name, list_name)
      member = Member.find(member_name)
      board = member.boards.find { |brd| brd.name == board_name}
      return board.lists.find { |lst| lst.name == list_name }
    end

    def find_list_id(member_name, board_name, list_name)
      return find_list(member_name, board_name, list_name).id
    end

    private
    def authorize(keys)
      Trello::Authorization.const_set(:AuthPolicy, OAuthPolicy)

      credential = OAuthCredential.new(keys.public, keys.secret)
      OAuthPolicy.consumer_credential = credential
      OAuthPolicy.token = OAuthCredential.new(keys.token, nil)
    end
  end
end
