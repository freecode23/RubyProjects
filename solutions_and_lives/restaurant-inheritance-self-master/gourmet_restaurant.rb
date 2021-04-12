require_relative 'restaurant'

class GourmetRestaurant < Restaurant

  def initialize(name, city, capacity, cuisine, stars)
    super(name, city, capacity, cuisine)
    @stars = stars
  end

  def print_reservations
    puts "You're not allowed to see this."
  end
end
