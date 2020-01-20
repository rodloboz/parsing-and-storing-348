# TODO - let's read/write data from beers.json

require 'json'
require 'byebug'

require_relative 'view'

filepath = "data/beers.json"


# Reading - Parsing
stringified_beers = File.open(filepath).read
beers = JSON.parse(stringified_beers)

name = ask_for_attribute(:name)
appearance = ask_for_attribute(:appearance)
origin = ask_for_attribute(:origin)

beer = {
  "name" => name,
  "appearance" => appearance,
  "origin" => origin
}
beers["beers"] << beer

# Writing - Storing
File.open(filepath, 'wb') do |file|
  stringified_beers = JSON.generate(beers)
  # File write receives a String
  file.write(stringified_beers)
end






