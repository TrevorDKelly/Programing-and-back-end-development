# Question 1
  # a
    # numbers are imutable
    # in the #times block the id will stay the same
    # after reassignment in the #times block it will have a new object id
    # a_inner will have the same id as a_outer
    # a_inner cannot be called outside the #times block
    
  # b
    # b_outer is a string and is mutable
    # it's id in the block will be the same as outside
    # it will get a new id once reassigned inside the block
    # b_inner will have the id of the newly redefined b_outer
    # b_outer cannot be called outside the block
    
  # c
    # c_outer is an array and is mutable
    # it's id in hte block will be the same as outside
    # it will have the same id after being redefined in the block
      #WRONG it is not change of the object in the array, it is redefining c as a new array
    # c_inner cannot be called outside the block
    
  # d
    # d is a numeric object within the c array and is not mutable
    # it's value inside the block is the same as outside
    # it will have a different id when redefined inside the block
    # d_inner will have the same id as the redefined d_outer
    # d_inner cannot be called outside the block

# Question 2
  # when passed into the method the objects all maintain their id's
    # the objects inside the method are unique but point to the same
    # place in the memory as the arguments passed to them.
  # When reassigned in the method they all will get new object id's
    # unless they are immutable objects reassigned to the same object
  # after the method the outer objects will have maintained the same id's
    # which will be different from the inner objects
    
# Question 3
  # my_sting will not be altered by the method
    # the += is reassignment so the local variable passed into the method does not change
    # it is only the inner scoped variable that has 'rutabaga' added after
  # my_array will be altered
    # it will be ['pumpkins', 'rutabaga']
    # #<< is mutating and will change the original object that the outer scope
      # variable is pointing to.

# Question 4
  # the sting has the mutating method #<< called on it so the object id is 
    # altered. the inner and outer scoped variables are changed
  # the array is not mutated. the inner scoped variable is reassigned but the 
    # outer scoped variable is unchanged
    
# Question 5
  # this shold be broken up into two methods that are named appropriately
  # to show that a string goes in one and is not adjusted and the other 
  # mutates an array
  
# Question 6
  # A method will always return the last executed line of code. 
  # in this method the boolean that is passed as an argument to the if statement
  # is the same as what the statment returns. there doesnt need to be a conditional
  # because just putting color == "blue" || color == "green" has the same return value
  
