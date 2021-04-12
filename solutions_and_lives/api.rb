require 'nokogiri'
require 'open-uri'

url    = "https://www.boardgamegeek.com/xmlapi/boardgame/35424"
user_serialized = open(url).read
document = Nokogiri::XML(user_serialized)

p document.root.children
