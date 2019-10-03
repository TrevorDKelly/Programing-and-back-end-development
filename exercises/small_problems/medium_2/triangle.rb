# get 3 integers
# return symbol
# 
# check
#   no sides are 0
#   2 smaller sides add up to more than biggest side
#   
# compare sides
#   if all sides equal  
#   if 2 sides equal
#   if no sides equal
# 
# add nums to array
# check valid
#   no sides are 0
#   sort array
#   [0] + [1] > [2]
# array uniq size
#   3 scalene
#   2 isosceles
#   1 equilateral

def valid_triangle?(tri_arr)
  return false if tri_arr.any?(0)
  tri_arr.sort!
  tri_arr[0] + tri_arr[1] > tri_arr[2]
end

def triangle(side1, side2, side3)
  tri_array = [side1, side2, side3]
  return :invalid unless valid_triangle?(tri_array)
  
  case tri_array.uniq.size
  when 3 then :scalene
  when 2 then :isosceles
  when 1 then :equilateral
  end
end


# get 3 nums
# retrun symbol
# 
# check valid
#   sum of angles is 180
#   no angle is 0
# check max angle
#   > 90 is obtuse
#   = 90 right
#   < 90 is accute

def triangle(num1, num2, num3)
  angles = [num1, num2, num3]
  return :invalid if (angles.sum != 180) || angles.any?(0)
  case angles.max
  when 90         then :right
  when (90...180) then :obtuse
  else                 :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid