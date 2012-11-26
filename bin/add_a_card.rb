#!/usr/bin/env ruby
require "bundler/setup"

$LOAD_PATH.unshift File.dirname(__FILE__) + "/../lib"
require "recurello"
require "trello_api"

card = Recurello::Card.new(
  member_name:  "errinlarsen",
  board_name:   "Todo",
  list_name:    "Next",
  name:         "Test card #1",
  desc:         "This is it!"
)

trello_api = TrelloAPI::Wrapper.new(File.open("trello_keys.yml", "r"))
trello_api.authorize

list_finder = Recurello::ListFinder.new(trello_api)
card.list_id = list_finder.find_list_id_from_card(card)

card_creator = Recurello::CardCreator.new(trello_api)
new_card = card_creator.create(card)

puts new_card.inspect
