# get array
# retuning new arr
#   first element moves to end
# 
# non destructive
# 
# get first element
#   first = arr[0]
# get rest of elements
#   new_arr = arr[1..-1]
# add first to new array
#   new_arr << first


def rotate_array(input_array)
  first = input_array.first
  return_array = input_array[1..-1]
  return_array << first
end

# rotate rightmost digits

# get int, int
# return int
#   the nth from last number rotated to the back
#   
# alway going to be positive
# 
# get the last n numbers
#   convert to string
#   rotated = input[n..-1] into the rotate_array method
# return first numbers plus rotated numbers
#   input[0...n]+ rotated

def rotate_rightmost_digits(input, n)
  input = input.digits.reverse
  (input[0...-n] + rotate_array(input[-n..-1])).join.to_i
end

# max rotation
#
# get int
# retrun int
#   max rotated
#   
# get length
# from length down to 0 (x)
#   rotate last x of input
# 
# length = inpt to string size
# from length to 0 |x|
#   input = rotate rightmost(input x)
#   
# retunr input

def max_rotation(input)
  input.to_s.size.downto(1) do |i|
    input = rotate_rightmost_digits(input, i)
  end
  input
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845