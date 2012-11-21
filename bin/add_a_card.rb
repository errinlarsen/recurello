#!/usr/bin/env ruby
require "bundler/setup"

$LOAD_PATH.unshift File.dirname(__FILE__) + "/../lib"
require "trello_gateway"
require "recurello"

public_key = "5b5ef1cf11a70931366b08f8756564a0"
secret = "InMyTimeOfDying"
token = "87a4bed23d5a2b2605bb3662718b0e7f42af19c715a061ace1992a019da96ccb"

# https://trello.com/1/connect?key=PUBLIC_KEY_FROM_ABOVE&name=MyApp&response_type=token&scope=read,write,account&expiration=never
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
