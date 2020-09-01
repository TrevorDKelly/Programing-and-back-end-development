class Luhn
  def initialize(number)
    @number = number
  end

  def addends
    digits = @number.digits

    digits.map!.with_index do |digit, index|
      if index.even?
        digit
      else
        digit *= 2
        digit -= 9 if digit > 9
        digit
      end
    end

    digits.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    self.checksum % 10 == 0
  end

  def self.create(number)
    number *= 10

    checksum_ones_digit = new(number).checksum % 10

    number + ((10 - checksum_ones_digit) % 10)
  end
end

# addends
#   have number
#   return array
#
#   for every other number starting at index -2 to start, double the number
#   if when it is doubled, it is greater tahn 10, subtract 9
#
#   split number - digits
#
#   step ( to, by) 2 to digits size
#     digits[index] *= 2
#     if digits[index] > 2 then -9
#
#   reverse digits
#   return digits

# checksum
#   reduce addends

# create
#   get integer
#   return integer
#
#   from the input int, multiply it by 10 and add a one digit number to make it a valid checksum nuber
#
#   * num by 10 and create a nuw luhn object
#   loop
#     return if valid
#     add 1 to number
