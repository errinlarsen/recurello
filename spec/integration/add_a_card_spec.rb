require "recurello"

describe "Adding a Card to a Trello Board's List", :needs => :trello_api do
  it "creates a Card on the Card's Board in the Card's List" do
    card = Recurello::Card.new(
      member_name:  "errinlarsen",
      board_name:   "Todo",
      list_name:    "Next",
      name:         "Test card #1",
      desc:         "This is it!"
    )

    trello_api = TrelloAPI::Wrapper.new(fake_key_file)
    trello_api.authorize

    list_finder = Recurello::ListFinder.new(trello_api)
    card.list_id = list_finder.find_list_id_from_card(card)

    card_creator = Recurello::CardCreator.new(trello_api)
    new_card = card_creator.create(card)
  end

  def fake_key_file
    return StringIO.new <<fake_file
---
public_key: "Some public key"
oauth_secret: "Some secret"
user_token: "Some token"
fake_file
  end
end
