#!/usr/bin/env ruby
require "bundler/setup"

$LOAD_PATH.unshift File.dirname(__FILE__) + "/../lib"
require "recurello"

keys = Recurello::TrelloAPI::Keys.new(File.open("trello_keys.yml", "r"))
trello = Recurello::TrelloAPI.new(keys)

options = {
  member: "errinlarsen",
  board:  "Todo",
  list:   "Next",
  name:   "Test card #1",
  desc:   "This is it!"
}

new_card = trello.create_card(options)
puts new_card.inspect
