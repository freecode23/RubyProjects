require_relative 'restaurant'

class FastFoodRestaurant < Restaurant

  def initialize(name, city, capacity, cuisine, drive_thru)
    super(name, city, capacity, cuisine)
    @drive_thru = drive_thru # boolean
  end

  def open?
    return super || Time.now.hour.between?(10, 15)
  end

  def capacity
    if Time.now.hour.between?(10, 15)
      @capacity + 25
    else
      @capacity
    end
  end

end
