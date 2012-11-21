require "recurello"
require "trello_gateway"

require "yaml"
key_file_name = File.join(File.dirname(__FILE__), "..", "..", "trello_keys.yml")
keys_hash = YAML.load_file(key_file_name)
keys = Struct.new(*keys_hash.keys.map(&:to_sym)).new(*keys_hash.values)

describe ""
