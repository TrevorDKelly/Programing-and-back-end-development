# class Greeting
#   def greet(say)
#     puts say
#   end
# end

# class Hello < Greeting
#   def hi
#     greet('Hello!')
#   end
# end

# class Goodbye < Greeting
#   def bye
#     greet('Goodbye!')
#   end
# end

class KrispyKreme
  def initialize(filling, glaze)
    @filling_type = filling
    @glaze = glaze
  end
  
  def to_s
    type = @filling_type ? @filling_type : 'Plain'
    on_top = @glaze ? " with #{@glaze}" : ''
    "#{type}#{on_top}"
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

