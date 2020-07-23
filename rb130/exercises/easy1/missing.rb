# given array
# return array
# 
# get the minimum and max in the given array and return an array that has all those numbers that are not included in the given array.
# 
# create an array of all numbers from min to max. delete the numbers in the given arr
# 
# find min
# find max
# create range of min to max - to_a
# 
# new arr - given

def missing(arr)
  return [] if arr.empty?
  min, max = arr.minmax
  (min..max).to_a - arr
end

