module Walkable
  def walk
    "#{self} #{gait} forward"
  end
end

class Person
  include Walkable
  
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def to_s
    "#{name}"
  end

  private

  def gait
    "strolls"
  end
end

class Nobel < Person
  attr_reader :title
  
  def initialize(name, title)
    super(name)
    @title = title
  end
  
  def to_s
    "#{title} #{name}"
  end
  
  private
  
  def gait
    "struts"
  end
end

class Cat
  include Walkable
  
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "#{name}"
  end
  
  private

  def gait
    "saunters"
  end
end

class Cheetah < Cat

  private

  def gait
    "runs"
  end
end


mike = Person.new("Mike")
p mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
p kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
p flash.walk