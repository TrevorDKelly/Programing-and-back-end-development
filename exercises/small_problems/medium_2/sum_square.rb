# difference between (1 + 2 ...)**2 and (1**2) + (2**2) ...
# 
# get int
# return int
# 
# from 1 to given
#   calculate square of sums
#     get sum of all
#     square it
#   calculate sum of squares
#     map squares
#     get sum
#   get difference  

def sum_square_difference(int)
  arr = (1..int).to_a
  
  arr.sum**2 - arr.inject { |sum, n| sum + (n**2) }
end

p sum_square_difference(3) == 22
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150