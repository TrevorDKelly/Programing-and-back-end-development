# Part 1
  # This will puts 7 because the a variable is defined outside of the method 
  # within the method it is the b variable that is being mutated by th +=
  # ---------
  # a is pointing to an object that is the number 7
  # the b+=10 is the same as b = b + 10 
  # it is redefining b, therefore pointing to a new memory space
  
# Part 2
  # within the method my_value a new local 'a' variable is created 
  # the scope of the variable is contained so when my_value is called and passed
    # the argument of 'a' it is taking the 'a's value and using itwithin
    # the method.
  # it does not change the value of the  a
  # puts a => 7

# Part 3
  # still 7. The 'a' defined within the method is local to the method. the method 
    # returns its value but the 'a' variable defined outside the method is never adjusted.
    
# Part 4
  # the return will be "Xy-zy"
  # Strings are mutable so when the string:[] method is called it mutates the string 
  # being entered as an argument
  
# Part 5
  # the return will be "yzzyX"
  # same as the last one. the string is mutable and the method changes the value
  #-----------------------
  # Wrong. this is an assignment and not a method being called on the variable. 
    # b = ... is assignig the b variable to something new so it is not changing the 
    # new memory space.
    # in the previos example, a method is being called on the variable that does
    # change the information in the memory space
  
# Part 6
  # This will give an error. methods are self contained so the 'a' variable is not 
  # known within the method. it is trying to assign b using undefined variables
  
# Part 7
  # This will print 3
  # local variables can be accesed inside a block so a is being reassigned with 
    # the each block
  # it is being reassigned with each of the values in the array, the last of which 
    # is 3 so that is its value when the each method is done and the program moves on
    
# Part 8
  # This will give an error of no local variable a
  # a is defined in each block so it is local to that block. its scope is within the block
  
# Part 9
  # the variable is declared outside the method so it exists already
  # the method each is declaring 'a' equal to the array value
  # the last loop of the each method has 'a' set to 3 then adds 1
  # puts 4
  #-------WRONG-----
    # Shaddowing. since the a exists localy already, when the iterator for the each method
    # sets its variable to 'a' it is a new, local to the method, variable.
    # the method adjust's its local variable but when a is puts outside the method it is 7
    
# Part 10
  # This will give an error at line 10.
  # the my_value method is called and tries using a in the each loop
  # a is initiated outside the method so there is no local variable a