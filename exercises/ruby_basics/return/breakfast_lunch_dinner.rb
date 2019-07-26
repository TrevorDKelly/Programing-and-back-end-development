# Part 1
  
  # This will print \breakfast with no return. just running the method wouldn't 
  # print anything and would return 'breakfast' but the puts method prints out 
  # the return of what it's called on.
  
# Part 2

  # This will print \Evening for the same reasons as above. the return of the 
  # method is always the last line executed unless a specific return is given.
  
# Part 3

  # This will print \Breakfast because a return is called. the "Dinner" is not
  # reached because the return ends the method
  
# Part 4

  # This will print \Dinner\n\Breakfast . The puts within the method is called 
  # first and then the puts that calls the method prints out the return of \Breakfast
  
# Part 5

  # This will print \Dinner once. The puts inside the method prints \Dinner and 
  # since the return of puts is nil and it is the last line the puts that calls
  # the method does not print anything.
  
  # it is a p not a puts that calls the method and p shows the nil return
  
# Part 6

  # This will just print \Breakfast because if a return is called within a method
  # it ends the method. the dinner and puts dinner are not reached.
  
  