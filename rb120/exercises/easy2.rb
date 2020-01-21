module Mailable
  def print_address
    "#{name}"
    "#{address}"
    "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable
  
  attr_reader :name, :address, :city, :state, :zipcode
end

class Employee
  include Mailable
  
  attr_reader :name, :address, :city, :state, :zipcode
end

betty = Customer.new
bob = Employee.new
betty.print_address
bob.print_address

module Drivable
  def drive
    puts "Driving"
  end
end

class Car
  include Drivable
end


#------------------------------------------------------------------------------

class House
  include Comparable
  attr_reader :price
  
  def initialize(price)
    @price = price
  end
  
  def <=>(other)
    price <=> other.price
  end
end

house1 = House.new(100)
house2 = House.new(150)

#------------------------------------------------------------------------------

class Transform
  attr_reader :input
  
  def initialize(input)
    @input = input
  end
  
  def self.lowercase(input)
    input.downcase
  end
  
  def uppercase
    input.upcase
  end
end

#------------------------------------------------------------------------------

class Wallet
  include Comparable
  
  def initialize(amount)
    @amount = amount
  end
  
  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end
  
  protected
  
  attr_reader :amount
end

wallet1 = Wallet.new(500)
wallet2 = Wallet.new(450)

p wallet1 > wallet2