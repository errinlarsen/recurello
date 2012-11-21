#!/usr/bin/env ruby
require "bundler/setup"

$LOAD_PATH.unshift File.dirname(__FILE__) + "/../lib"
require "trello_gateway"
require "recurello"

# https://trello.com/1/appKey/generate
public_key = "Trello API Developer key"
secret = "Some password-y secret here"

# https://trello.com/1/connect?key=PUBLIC_KEY_FROM_ABOVE&name=Recurello&response_type=token&scope=read,write,account&expiration=never
token = "A Trello user's token for access to their Member data here"

trello = TrelloGateway.new
trello.authorize(public_key, secret, token)

me = trello.member.find("errinlarsen")
boards = me.boards
todo_board = boards.find { |b| b.name == "Todo" }
lists = todo_board.lists
next_list = lists.find { |l| l.name == "Next" }

puts "idList: #{next_list.inspect}"

options = {
  name:         "Test card #1",
  list_id:      next_list.id,
  description:  "This is it!"
}

trello.create_card(options)
