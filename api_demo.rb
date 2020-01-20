# TODO - Let's fetch name and bio from a given GitHub username
require 'json'
require 'open-uri'
require 'byebug'

BASE_URL = "https://api.github.com/users/"

puts "What's your Github username?"
print "> "

username = gets.chomp

url = BASE_URL + username
stringified_user = open(url).read
user = JSON.parse(stringified_user)

puts "#{user["login"]}, you have #{user["public_repos"]} public repos"
