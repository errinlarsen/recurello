module Recurello
  class Card
    attr_accessor :name, :desc, :member_name, :board_name, :list_name, :list_id

    def initialize(opts={})
      @name         = opts.fetch(:name)         { "" }
      @desc         = opts.fetch(:desc)         { "" }
      @member_name  = opts.fetch(:member_name)  { "" }
      @board_name   = opts.fetch(:board_name)   { "" }
      @list_name    = opts.fetch(:list_name)    { "" }
      @list_id      = opts.fetch(:list_id)      { "" }
    end
  end
end
