#!/usr/bin/env ruby
require "bundler/setup"

$LOAD_PATH.unshift File.dirname(__FILE__) + "/../lib"
require "trello_api"
require "recurello"

require "yaml"
key_file_name = File.join(File.dirname(__FILE__), "..", "trello_keys.yml")
keys_hash = YAML.load_file(key_file_name)
keys = Struct.new(*keys_hash.keys.map(&:to_sym)).new(*keys_hash.values)

trello = TrelloAPI.new
trello.authorize(public_key, secret, token)

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
