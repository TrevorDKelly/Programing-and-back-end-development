# convert a trinary number into a decimal number
# 
# get sting
# return integer
# 
# for each digit in the the given sting, multiply by 3^(place in the given string)
# add to running total
# 
# 10 => (0 * 3^0) + (1 * 3^1)
#           0     +     3
#                3
# 
# non trinary characters
#   3-9
#   a-z
#   special
#   (not 1, 2, 0)
# return 0

class Trinary
  def initialize(given_string)
    @given_string = given_string
  end
  
  def to_decimal
    return 0 if @given_string.match(/[^012]/)

    digits = @given_string.reverse.chars.map(&:to_i)

    decimal_number = 0

    digits.each_with_index do |digit, index|
      decimal_number += digit * (3 ** index)
    end

    decimal_number
  end
end
