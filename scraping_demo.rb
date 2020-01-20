# Let's scrape recipes from http://www.epicurious.com

require 'open-uri'
require 'nokogiri'
require 'byebug'

url = "https://www.last.fm/tag/hip-hop"

page = open(url).read
doc = Nokogiri::HTML(page)

artists = []
doc.search('.chartlist-row--with-artist').each do |element|
  artist = element.search('.chartlist-artist a').first.text
  artists << artist
end

p artists.uniq



