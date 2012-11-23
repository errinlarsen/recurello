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

    def create_card(opts)
      member_name = opts.fetch(:member)
      board_name  = opts.fetch(:board)
      list_name   = opts.fetch(:list)
      card_name   = opts.fetch(:name)
      desc_str    = opts.fetch(:desc)

      member = Member.find(member_name)

      boards = member.boards
      board = boards.find { |b| b.name == board_name }

      lists = board.lists
      list = lists.find { |l| l.name == list_name }

      card_creation_options = {
        list_id:      list.id,
        name:         card_name,
        description:  desc_str
      }

      Card.create(card_creation_options)
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