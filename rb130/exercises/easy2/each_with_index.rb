# iterate thru with an index and pass the object and the index into the given block. return the given array
# get array and block
# return given array
# 
# i = 0 
# iterate thru arr
#   yield element and i
#   i + 1
# return arr

def each_with_index(arr)
  i = 0
  arr.each do |element|
    yield(element, i)
    i += 1
  end
end
