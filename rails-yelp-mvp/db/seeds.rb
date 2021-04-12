# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Restaurant.destroy_all

# ['chinese', 'italian', 'japanese', 'french', 'belgian']
puts 'Creating restaurants...'
restaurants_attributes = [
  {
    name:         'Ciao',
    address:      'Nezu 3-10-33',
    category:     'italian',
    phone_number: '03-5809-0635'
  },
  {
    name:         'Higashi-Yama Tokyo',
    address:      'Meguro',
    category:     'japanese'
  },
  {
    name:         'Le Pain Quotidien Shiba Park',
    address:      'Shibakoen',
    category:     'french'
  },
   {
    name:         'Hei Fung Terrace',
    address:      'Yurakucho',
    category:     'chinese'
  },
  {
    name:         'Belgian Brasserie Court Antwerp Central',
    address:      'Marunochi',
    category:     'belgian'
  },
]
Restaurant.create!(restaurants_attributes)
puts 'Finished!'
