require "recurello"
require "trello_api"

require_relative "../lib/trello_api/trello_api_helpers"
RSpec.configure do |config|
  config.include TrelloAPIHelpers
end

describe "Adding a Card to a Trello Board's List", :needs => :trello_api do
  it "creates a Card on the Card's Board in the Card's List" do
    card = Recurello::Card.new(
      member_name:  "some_member",
      board_name:   "Some Board",
      list_name:    "Some List",
      name:         "Some Card Name",
      desc:         "Some card description"
    )

    trello_api = TrelloAPI::Wrapper.new(fake_key_file)
    trello_api.setup_credentials

    trello_api.stub(:find_list_id) do |member_name, board_name, list_name|
      member_name.should == "some_member"
      board_name.should == "Some Board"
      list_name.should == "Some List"
      3 # Fake listID returned
    end

    trello_api.stub(:create_card) do |opts|
      opts.should include(
        :list_id => 3,
        :name => "Some Card Name",
        :description => "Some card description"
      )
    end

    list_finder = Recurello::ListFinder.new(trello_api)
    card.list_id = list_finder.find_list_id_from_card(card)

    card_creator = Recurello::CardCreator.new(trello_api)
    card_creator.create(card)
  end
end
