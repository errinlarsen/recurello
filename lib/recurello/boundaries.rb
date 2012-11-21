module Recurello
  module ServerBoundary
    def response
      return {name: card.name, message: card.message}
    end
  end
  
  module ClientBoundary
    def self.included(base)
      base.send(:attr_reader, :request)
    end
  end
end
