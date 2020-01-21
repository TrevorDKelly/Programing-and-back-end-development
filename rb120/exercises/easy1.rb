# class Banner
#   def initialize(message, width = (message.size + 4))
#     @width = width - 4
#     @message_lines_array = split_message_to_lines(message)
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_lines, empty_line, horizontal_rule].join("\n")
#   end

#   private
  
#   def banner_width
#     @message.size
#   end

#   def horizontal_rule
#     "+-#{'-' * @width}-+"
#   end

#   def empty_line
#     "| #{' ' * @width} |"
#   end

#   def message_lines
#     @message_lines_array.map do |line|
#       "| #{line.center(@width)} |"
#     end.join("\n")
#   end
  
#   def split_message_to_lines(message)
#     first = 0
#     last = @width
#     message_arr = []
#     until message[last] == nil
#     p first
#     p last
#       last -= 1 until message[last] == ' '
#       message_arr << message[first...last]
#       first = last + 1
#       last += @width + 1
#     end
#     message_arr << message[first..-1]
#   end
# end


# banner = Banner.new('To boldly go where no one has gone before.', 10)
# puts banner

#------------------------------------------------------------------------------

# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#   end

#   def to_s
#     "My name is #{@name.upcase}."
#   end
# end

# name = 42
# fluffy = Pet.new(name)
# name += 1
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

#------------------------------------------------------------------------------

# class Book
#   attr_accessor :author, :title
  
#   def initialize(author, title)
#     @author = author
#     @title = title
#   end
  
#   def to_s
#     %("#{title}", by #{author})
#   end
# end

# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

#------------------------------------------------------------------------------

# class Rectangle
#   def initialize(height, width)
#     @height = height
#     @width = width
#   end
  
#   def area
#     @height *  @width
#   end
# end

# class Square < Rectangle
#   def initialize(side)
#     super(side, side)
#   end
# end

# square = Square.new(5)
# puts "area of square = #{square.area}"

#------------------------------------------------------------------------------

# class Pet
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# class Cat < Pet
#   def initialize(name, age, color)
#     super(name, age)
#     @color = color
#   end
  
#   def to_s
#     "My cat #{@name} is #{@age} years old and has #{@color} fur"
#   end
# end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch

#------------------------------------------------------------------------------

class Vehicle
  attr_reader :make, :model
  
  def initialize(make, model)
    @make = make
    @model = model
  end
  
  def to_s
    "#{@make} #{@model}"
  end
  
  def wheels
    @wheels
  end
end

class Car < Vehicle
  def initialize(make, model)
    super(make, model)
    @wheels = 4
  end
end

class Motorcycle < Vehicle
  def initialize(make, model)
    super(make, model)
    @wheels = 2
  end
end

class Truck < Vehicle
  attr_reader :payload
  
  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
    @wheels = 6
  end
end

c = Car.new('a', 'b')
p c.wheels