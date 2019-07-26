# 1
  # => [1, 2, 3]
  # select returns the iteration's value from the array it is called on
  ## it selects based on the truthiness of the block. 'hi' is the return of every
  ## block so they will all be true
  
# 2
  # count will return the number of items from the array where the blocks return
  # is truthy
  
# 3
  # => [1, 2, 3]
  # it returns the element into an array if the block's value is false
  # puts always returns nil so the whole array is returned
  
# 4
  # =>{'a'=>'ant', 'b'=>'bear', 'c'=> 'cat'}
  # the elements assigned to the 'value' variable are strings so when value[0]
  # is called it takes the first character in the string and assigns that to the
  # key of the new hash
  # each_with_object returns the object that was passed in as an argument
  
# 5
  # => [:a, 'ant']
  # when #shift is called on a hash it destructivly removes and returns the first
  # pair in the hash as an array
  
# 6 
  # =>11
  # pop takes the last element in the array and destructivly returns it
  # size gets that return and counts the characters in the string
  
# 7
  # the block will output 1 and #any will return true
  # once a block has a truthy return value #any stops running and returns true
  
# 8
  # take will return the first (n) elements in an array as an array. non mutating
  
# 9 
  # => [nil, 'bear']
  # map returns an array of elements that are the return values of the block
  # an if that gets passed a false argument returns nil
  # this conditional retruns the value if true
  
# 10
  # => [1, nil, nil]
  # when the if is true it puts the num and puts returns nil
  # for 1, the if is false so it oes to the else which returns the element