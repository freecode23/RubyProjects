# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'nokogiri'
require 'open-uri'
require 'faker'

Purchase.destroy_all if Rails.env.development?
UserGame.destroy_all if Rails.env.development?
Game.destroy_all if Rails.env.development?
User.destroy_all if Rails.env.development?

# GAMES DATABASE

game_array = []

def get_games(id_range)
  id_range = id_range.to_a
  id_range.each_with_index do |_item, index|
   game = {}

   url = "https://www.boardgamegeek.com/xmlapi2/thing?id=#{_item}"
   puts "Getting Data from Api..."
   puts ""
   data = open(url).read
   xml_doc = Nokogiri::HTML(data)

   name_array = []

   xml_doc.search('name').each do |ele|
    name_array << ele.values.split(',')[0].last
  end

  game[:name] = name_array[0]

  playingtime_array = []
  xml_doc.search('playingtime').each do |ele|
    playingtime_array << ele.values.split(',')[0].last
  end

  game[:playingtime] = playingtime_array[0]

  boardgamecategory_array = []
  xml_doc.search('[type="boardgamecategory"]').each do |ele|
    boardgamecategory_array << ele.values[2]
  end

  game[:category] = boardgamecategory_array.first

  boardgamemechanic_array = []
  xml_doc.search('[type="boardgamemechanic"]').each do |ele|
    boardgamemechanic_array << ele.values[2]
  end

  game[:mechanic] = boardgamemechanic_array.first

  boardgamedesigner_array = []
  xml_doc.search('[type="boardgamedesigner"]').each do |ele|
    boardgamedesigner_array << ele.values[2]
  end

  game[:designer] = boardgamedesigner_array.first

  xml_doc.search('image').each do |ele|
    game[:image_url] = ele.text
  end

  thumb_image = xml_doc.search('thumbnail').each do |ele|
    game[:thumb_url] = ele.text
  end

  puts "Adding Game with id of #{_item}"
  puts ""
  unless game[:name].nil?
    p game
    Game.create!(game)
  end

  puts ""
end

end

game_array << get_games(1..30)
game_array << get_games(40..60)

puts "Finished seeding database..."
puts ""

# USERS

def user_seed

  user_array = []

  user_id_num = 1

  20.times do
    puts "Seeding User #{user_id_num}"
    user_array << User.create!(
      address: Faker::Address.street_name,
      username: Faker::Name.name,
      email: Faker::Internet.email,
      password: 'secret'
      )
    user_id_num += 1
  end
  return user_array
end

puts "Seeding User database..."
saved_user_array = user_seed
puts "Finished seeding database..."
puts ""

# USER GAMES

def user_game_seed(saved_user_array, game_array)

  user_game_seed_hash = {}
  user_game_id_num = 1

  100.times do
    game = Game.all.sample
    puts "Seeding User Game #{user_game_id_num}"
    user_game = UserGame.new(
      user_id: saved_user_array.sample.id,
      game_id: game.id,
      sale_price: rand(15...30),
      description: "I want to sell my game",
      condition: ['like new', 'good', 'OK', 'damaged', 'missing pieces'].sample
      )
    user_game_id_num += 1
    user_game.remote_photo_url = game.image_url
    user_game.save!
  end
end

puts "Seeding User Game database..."
user_game_seed(saved_user_array, game_array)
puts "Finished seeding database..."
puts ""


