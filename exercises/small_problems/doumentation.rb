# Class and Instance Methods
  # ::path is called on a file and returns a string of the path
  # #path returns the pathname used to create a file
  
  # Class method vs Instance method
  # Class methods are called on a class
    #this is called on the File class
  # Instance methods are called on objects
    # this is called on an object that has the File class (like Array class or String class)

# Optional Arguments Redux
 # => /today's date/ **** => -4712-01-01
 # => 2016-01-01
 # => 2016-05-01
 # => 2016-05-13
 
# Default Arguments in the Middle
  # this will produce an error
  # default paramiters in a method have to be grouped at either the begining or the end 
  
# Manditory blocks
  a = [1, 4, 8, 11, 15, 19]
  
  a.bsearch { |x| x > 8 }
  
# Multiple Signatures
  # => index error
  # => 'beats me'
  # => 49
  
# Keyword Arguments
  # => 5
  # => 8
  
# Included Moduels
  a = [5, 9, 3, 11]
  puts a.min(2)
  
# Down the rabbit hole
  #