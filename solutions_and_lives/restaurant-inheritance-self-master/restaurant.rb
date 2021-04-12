require_relative 'chef'

class Restaurant
  attr_reader :name, :city, :chef
  attr_accessor :capacity

  def initialize(name, city, capacity, cuisine, chef_name)
    @name = name
    @city = city
    @capacity = capacity
    @cuisine = cuisine
    @reservations = []
    @chef = Chef.new(chef_name, self)
  end

  def self.categories
    ['thai', 'curry', 'sushi', 'burgers']
  end

  def open?
    # this should return true or false ( 18 - 22 )
    return Time.now.hour.between?(18, 22)
  end

  def closed?
    !open?
  end

  def reserve(name)
    @reservations << name
  end

  def print_reservations
    @reservations.each do |reservation|
      puts "- #{reservation}"
    end
  end

  def return_a_sample_of_the_class_method_categories
    return self.class.categories.sample
  end
end














