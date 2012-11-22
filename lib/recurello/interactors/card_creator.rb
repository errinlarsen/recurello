module Recurello
  class CardCreator
    include Recurello::ServerBoundary

    def initialize(api)
      @api = api
      api.authorize
    end
  end
end
