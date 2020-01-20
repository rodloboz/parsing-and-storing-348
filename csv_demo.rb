# TODO - let's read/write data from beers.csv

require 'csv'
require 'byebug'

require_relative 'view'

filepath = "data/beers.csv"
csv_options = {
  col_sep: ',',
  quote_char: '"',
  headers: :first_row,
  header_converters: :symbol
}


# READING (PARSING)
beers = [] # Arrays of hashes
CSV.foreach(filepath, csv_options) do |row|
  # byebug # halt/freeze the execution of the program
  beer = {
    name: row[:name],
    appearance: row[:appearance],
    origin: row[:origin]
  }
  beers << beer
end

p beers.last

name = ask_for_attribute(:name)
appearance = ask_for_attribute(:appearance)
origin = ask_for_attribute(:origin)


beer = {
  name: name,
  appearance: appearance,
  origin: origin
}
beers << beer

# WRITING (STORING)
CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << %w[Name Appearance Origin]
  beers.each do |beer|
    csv << [beer[:name], beer[:appearance], beer[:origin]]
  end
end







