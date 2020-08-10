# get int
# retun int
#
# move fist digit to the end. lock new first in place
# repeat for 1..-1 until last two are switched
#
# return num if one digit
# split to digits
# move first to end
# return if only two
# return first + call for 1..-1

def max_rotation(num)
  num = num.to_s
  num = recursive(num)
  num.to_i
end

def recursive(num)
  rotated = rotate(num)
  return rotated if rotated.size <= 2
  rotated[0] + recursive(rotated[1..-1])
end


def rotate(num)
  return num if num.size == 1
  digits = num.split('')
  digits = digits[1..-1] + [digits[0]]
  digits.join
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15
p max_rotation(8_703_529_146) == 7_321_609_845
