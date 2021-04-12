class Chef
  attr_reader :name, :restaurant
  def initialize(name, restaurant)
    @name = name # string
    @restaurant = restaurant # instance of a restaurant
  end
end
