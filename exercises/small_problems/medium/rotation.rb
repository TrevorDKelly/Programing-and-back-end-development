# Part 1
  # get array
  # return array
  # 
  # move first item to end
  # dont edit argument
  # 
  # new local variable is the 2nd to end of array 
  # add first of array to new array
  
  def rotate_array(arr)
    arr[1..-1] << arr[0]
  end
  
  def rotate_string(str)
    return '' if str.empty?
    rotate_array(str.split('')).join
  end
  
  def rotate_integer(int)
    num = int.abs
    rotated = rotate_string(num.to_s).to_i
    int.negative? ? -rotated : rotated
  end
  
# Part 2
  # get int, rotate_int
  # return int
  # 
  # move rotate number to end
  # 
  # change int to string
  # string to array
  # get index to move
  #   -int
  # remove from array
  #   delete_at
  #   assign to variable
  # add to end of array
  
  def rotate_rightmost_digits(int, rotate)
    arr = int.to_s.chars
    arr[-rotate..-1] = rotate_array(arr[-rotate..-1])
    arr.join.to_i
  end
  
# Part 3
  # rotate number
  # rotate from 2nd number
  # 
  # length = number size.
  # loop untll length is 0
  #   rightmost rotate number with length
  #   length - 1
  
  def max_rotation(num)
    num_length = num.to_s.size
    
    while num_length > 0
      num = rotate_rightmost_digits(num, num_length)
      num_length -= 1
    end
    
    num
  end
  
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845