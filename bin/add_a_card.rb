#!/usr/bin/env ruby
require "bundler/setup"

$LOAD_PATH.unshift File.dirname(__FILE__) + "/../lib"
require "recurello"

key_file_name = File.join(File.dirname(__FILE__), "..", "trello_keys.yml")
keys = Recurello::TrelloAPI::Keys.new(File.open(key_file_name, "r"))

trello = Recurello::TrelloAPI.new(keys)

me = trello.member.find("errinlarsen")
boards = me.boards
todo_board = boards.find { |b| b.name == "Todo" }
lists = todo_board.lists
next_list = lists.find { |l| l.name == "Next" }

options = {
  name:         "Test card #1",
  list_id:      next_list.id,
  description:  "This is it!"
}

trello.create_card(options)
