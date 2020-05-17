# snail
#
# given nested array
# return array
#
# return an array that is the spiral of the visual of the nested array
#
# get size
# go right size -1 times
# go down x times
# x -1
# go up x
# go right x
# x - 1
#
# x = size - 1
# spot = [0, 0]
# newarr = []
#
# loop
#   add spot to newarr
#   x - 1 times add i to spot[1]
#   add spot to newarr
#   x - 1 times add i to spot[0]
#   x -= 1
#   i *= -1

def snail(array)
  x = array.size - 1
  spot = [0,0]
  new_arr = []
  i = 1

  loop do
    (x - 1).times do
      new_arr << array[spot[0]][spot[1]]
      spot[1] += i
    end
    break
  end
  puts new_arr
end

snail([[1,2,3],[4,5,6],[7,8,9]])
