module Recurello
  class CardCreator
    include Recurello::ServerBoundary

    attr_reader :api

    def initialize(api)
      @api = api
    end

    def create(card)
      return api.create_card(options_for_card_creation(card))
    end


    private
    def options_for_card_creation(card)
      return {
        list_id:      card.list_id,
        name:         card.name,
        description:  card.desc
      }
    end
  end
end
