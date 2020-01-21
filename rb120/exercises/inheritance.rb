# module Towable
#   def tow
#     puts 'I can tow a trailer'
#   end
# end

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
  
#   def start_engine
#     'Ready to go!'
#   end
# end

# class Truck < Vehicle
#   include Towable
  
#   attr_reader :bed_type
  
#   def initialize(year, bed_type)
#     super(year)
#     @bed_type = bed_type
#   end
  
#   def start_engine(speed)
#     super() + " Drive #{speed}, please"
#   end
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994, 'flat')
# puts truck1.year

# car1 = Car.new(2006)
# puts car1.year

# p truck1.start_engine('fast')
# truck1.tow

#--------------------------------------------------------------------------------------------------

# module Towable
#   def tow
#     puts 'I cant tow a trailer'
#   end
# end

# class Vehicle
#   attr_reader :year
  
#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   include Towable
# end

# class Car < Vehicle
# end

# truck = Truck.new(2011)
# car = Car.new(2001)
# truck.tow


# Cat, Animal
# Cat, Animal, Object, Kernel, BasicObject
# Bird, Flyable, Animal

# -----------------------------------------------------------------------------

module Transportation
  class Vehicle
  end
  
  class Truck < Vehicle
  end
  
  class Car < Vehicle
  end
end
