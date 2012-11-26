require "yaml"

module TrelloAPI
  class Keys
    attr_reader :public, :secret, :token

    def initialize(file)
      yml = YAML.load(file)

      @public = yml["public_key"]
      @secret = yml["oauth_secret"]
      @token = yml["user_token"]
    end
  end
end
