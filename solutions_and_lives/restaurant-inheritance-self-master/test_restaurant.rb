require_relative 'restaurant'
require_relative 'fast_food_restaurant'
require_relative 'gourmet_restaurant'

# cocos = Restaurant.new("Coco's", "Meguro", 50, "Japanese curry")
# puts ""
# puts "#{cocos.name} is in #{cocos.city}"

# puts "It's capacity is #{cocos.capacity}"

# puts "#{cocos.name} is under construction...."

# cocos.capacity = 100

# puts "After contruction, it's capacity is #{cocos.capacity}"

# puts "#{cocos.name} is now #{cocos.closed? ? 'closed' : 'open'}"

# cocos.reserve("Ivan")
# cocos.reserve("Jack")

# p cocos
# puts ""
# mcds = FastFoodRestaurant.new("McDonald's", 'Shibuya', 75, 'burgers', false)
# p mcds
# puts ""
# mcds.reserve("Ryo")
# mcds.reserve("Harrison")
# # puts "#{mcds.name}'s capacity is #{mcds.capacity}"
# # land = GourmetRestaurant.new("Land", 'Meguro', 20, Restaurant.categories.sample, 0)
# # p land

# land.reserve("Ivan")
# land.reserve("Jack")

# puts "#{mcds.name} ->"
# mcds.print_reservations
# puts "#{land.name} ->"
# land.print_reservations

# puts "#{mcds.name} is now #{mcds.open? ? 'open' : 'closed'}"
# puts ""
# puts "#{land.name} is now #{land.open? ? 'open' : 'closed'}"


# p Restaurant.categories
# mcds.categories

cocos = Restaurant.new("Coco's", "Meguro", 50, "Japanese curry", 'Frank')

# puts "#{cocos.chef.restaurant.chef.name} is located in #{cocos.city} and the chef is #{cocos.chef.name}"

p cocos.return_a_sample_of_the_class_method_categories
# p cocos.chef.class









