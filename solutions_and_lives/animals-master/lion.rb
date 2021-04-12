require_relative 'animal'

class Lion < Animal
  def talk
    "#{@name} roars"
  end

  def eat(food)
    "#{super(food)}. Law of the Jungle!"
  end
end


# class Animal
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def self.phyla
#     return ["backbone", "no backbone", "stuff with shells", "bugs"]
#   end

#   def eat(food)
#     "#{@name} eats a #{food}"
#   end

# end
