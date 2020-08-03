class Octal
  def initialize(string)
    @input = string
  end

  def to_decimal
    return 0 if @input.match(/[^0-7]/)

    numbers = @input.chars.map(&:to_i)

    base_10_number = 0
    
    numbers.reverse.each_with_index do |number, i|
      base_10_number += number * (8**i)
    end

    base_10_number
  end
end

# base_10_number
# reverse order iterate with index
#   base_10_num += number * 8^index
#   
# return base_10
