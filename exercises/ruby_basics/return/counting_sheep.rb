# Part 1

  # this will give an undefined variable error
  
  # The times method allows a variable to be localy defined as an iterator.
  # It gets the values of 0 to the number of loops -1. The times method also returns
  # the number of times it is told to loop
  5.times do |i|
    puts i
  end
  # this prints 0 to 4 and retuns 5.
  
# Part 2

  # This will print 0 through 4 and also 10
  # The times loop prints the 0 to 4 and the puts that calls the method gets 10
  # as teh return since that is the last line of the code
  
# Part 3

  # This will print 0, 1, 2, nil
  # the return once sheep is 2 comes after the puts withing the method so the 2 
  # is printed. the return is not gived an avlue to return though. p is calling 
  # the method so it does print the nil that the method returns.
  
