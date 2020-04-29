  
  # Create a function that takes an array and a number and selectively reverse 
  # the order of the array based on the number you're given (second argument). 
  # If you're given the arguments [1,2,3,4,5,6] and 2, you would return the 
  # array [2,1, 4,3, 6,5].
  
  # Examples
  # sel_reverse([1,2,3,4,5,6], 2) == [2,1, 4,3, 6,5]
  
  # sel_reverse([2,4,6,8,10,12,14,16], 3) == [6,4,2, 12,10,8, 16,14]
  
  # sel_reverse([5,7,2,6,0,4,6], 100) == [6,4,0,6,2,7,5]
  
  # Notes
  # If the list you're given can't be broken up into equal parts, just reverse 
  # the remaining numbers (see 2nd expample).
  # If len exceeds the list length, reverse everything.
  # If len is zero, return the original list.


# given an array and an integer, reverse the order of every int elements in the 
# array. 

# input 
#   array, int
# return 
#   array
  
# break up the array into sub arrays of n elements. iterate thru sub arrays reversing
# each. join back together the reversed arrays.

# split the given array
#   first = 0
#   last = int - 1
#   new arrays = iterating by every int elements - map
#     get [first..last]
#     chnge first
#       adding int
#     change last
#       adding int
  
# itereate thru new arrays map!
#   reverse

# join

def split_arrays(array, int)
  first = 0 
  last = int - 1
  new_arrays = []
  loop do
    new_arrays << array[first..last]
    break if last >= array.size - 1
    first += int
    last += int
  end
  new_arrays
end

def sel_reverse(array, int)
  new_arrays = split_arrays(array, int)
  
  new_arrays.map!(&:reverse).flatten
end

p  sel_reverse([1,2,3,4,5,6], 2) == [2,1, 4,3, 6,5]
  
 p sel_reverse([2,4,6,8,10,12,14,16], 3) == [6,4,2, 12,10,8, 16,14]
  
p  sel_reverse([5,7,2,6,0,4,6], 100) == [6,4,0,6,2,7,5]