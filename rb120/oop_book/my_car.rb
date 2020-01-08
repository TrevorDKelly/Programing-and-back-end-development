module Towable
  def can_it_tow
    puts 'It can tow!'
  end
end

class Vehicle
  attr_accessor :model, :color, :speed, :car_on
  attr_reader :year
  
  @@vehicle_count = 0
  @@car_count = 0
  @@truck_count = 0

  def initialize(y, m, c)
    @year = y
    self.model = m
    self.color = c
    self.speed = 0
    self.car_on = true
    @@vehicle_count += 1
  end

  def self.show_count
    puts "Vehicles: #{@@vehicle_count}"
    puts "Cars: #{@@car_count}"
    puts "Trucks: #{@@truck_count}"
  end

  def self.gas_milage(gallons, miles)
    puts "The gas milage is #{miles / gallons}mpg."
  end

  def to_s
    "#{year}, #{color}, #{model}"
  end

  def speed_up
    if car_on
      self.speed += 5
      puts "The #{self} is now going #{speed}mph."
    else
      puts 'The vehicle is not on!'
    end
  end

  def slow_down
    if car_on && speed <= 0
      puts 'The vehicle is stopped already'
    elsif !car_on
      puts 'The vehicle is not on!'
    else
      self.speed -= 5
      puts "The #{self} is now going #{speed}mph."
    end
  end

  def turn_on
    self.car_on = true
    puts 'The vehicle is now on'
  end

  def turn_off
    if speed.zero?
      self.car_on = false
      puts 'The vehicle is now off'
    else
      puts 'Stop the vehicle before you turn it off'
    end
  end

  def stop
    self.speed = 0
    puts "The #{self} is now going #{speed}mph."
  end

  def spray_paint(new_color)
    self.color = new_color
  end
  
  def age
    puts "The #{self} is #{calculate_age} years old"
  end
  
  private
  
  def calculate_age
    Time.now.year - self.year
  end
end

class MyCar < Vehicle
  CAN_TOW = false

  def initialize(y, m, c)
    super(y, m, c)
    @@car_count +=1
  end
end

class MyTruck < Vehicle
  include Towable
  CAN_TOW = true

  def initialize(y, m, c)
    super(y, m, c)
    @@truck_count +=1
  end
end

car = MyCar.new(2001, 'Dodge', 'red')

car.age