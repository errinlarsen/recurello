module Recurello
  class ListFinder
    include Recurello::ServerBoundary

    attr_reader :api

    def initialize(api)
      @api = api
    end

    def find_list_from_card(card)
      return api.find_list(card.member_name, card.board_name, card.list_name)
    end

    def find_list_id_from_card(card)
      return api.find_list_id(card.member_name, card.board_name, card.list_name)
    end
  end
end
