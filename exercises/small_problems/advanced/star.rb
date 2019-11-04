# get int
# output star
#
# box is size of int
# first line has one at center and two at corners
# next line has corners move in
# middle has full line
# backwards for bottom
#
# find the middle
# absolute value of distance from middle 
#   - 1 is spaces.
# print them centered on line
#
# 1 up to input
#   spaces = (middle - num) absolute - 1
#   centered print star, number of spaces, star, spaces, star
#   if middle print all stars

def star(size)
  middle = (size + 1) / 2
  1.upto(size) do |line|
    space = (middle - line).abs - 1
    if space.negative? 
      puts '*' * size
    else
      puts ('*' + (' ' * space) + '*' + (' ' * space) + '*' ).center(size)
    end
  end
end

