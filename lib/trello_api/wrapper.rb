require "yaml"
require "trello"

module TrelloAPI
  class Wrapper
    include Trello
    include Trello::Authorization

    attr_reader :keys

    def initialize(key_file)
      @keys = TrelloAPI::Keys.new(key_file)
    end

    def setup_credentials
      Trello::Authorization.const_set(:AuthPolicy, OAuthPolicy)

      credential = OAuthCredential.new(keys.public, keys.secret)
      OAuthPolicy.consumer_credential = credential
      OAuthPolicy.token = OAuthCredential.new(keys.token, nil)
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
  end
end
