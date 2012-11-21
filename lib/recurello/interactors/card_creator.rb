module Recurello
  class CardCreator
    include Recurello::ServerBoundary

    def initialize(gateway)
      @gateway = gateway
      gateway.authorize
    end
  end
end
