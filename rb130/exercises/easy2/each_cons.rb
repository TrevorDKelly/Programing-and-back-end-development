# get array
# return nil
# 
# iterate thru each element and pass it and teh next element into yield
# 
# return nil if empty arr
# iterate 0 to size -2
#   i and i+1 to yield
# nil

def each_cons(arr, step = 2)
  return nil if arr.size < step
  (0..(arr.size - step)).each do |i|
    yield(*arr[i..(i + step - 1)])
  end
  nil
end
