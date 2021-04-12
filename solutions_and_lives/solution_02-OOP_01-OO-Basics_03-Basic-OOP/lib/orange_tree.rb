class OrangeTree
  attr_reader :height, :fruits, :age

  def initialize
    @fruits = 0
    @height = 0
    @age = 0
    @dead = false
  end

  def dead?
    @dead
  end

  def one_year_passes!
    unless dead?
      @age += 1
      grow_up
      grow_fruits
      may_die?
    end
  end

  def pick_a_fruit!
    @fruits = @fruits - 1 if @fruits > 0
  end

  private

  def grow_up
    @height += 1 if can_still_grow_up?
  end

  def can_still_grow_up?
    @age <= 10
  end

  def grow_fruits
    @fruits = 0 # Fruits fall off

    if @age > 5 && @age < 10
      @fruits = 100
    elsif @age >= 10 && @age < 15
      @fruits = 200
    end
  end

  def may_die?
    if @age > 100
      @dead = true
    elsif @age > 50
      @dead = (@age >= rand(51..100))
    end
  end
end
