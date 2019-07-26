# Question 1
  # This will print out, each on a new line, 1, 2, 2, 3
  # the #uniq method is not destructive, 
    # it returns an array of the uniq objects in the array but doesnt mutate the original collection
  # if it were numbers.uniq! then it would be 1, 2, 3 

# Question 2
  # the ! is generally used to show that something is being changed
  # the ? generally signifies that something will return a boolean
  
  # 1. != means not eaqual. the ! changed the equal to not equal
  # 2. ! before somehting means changing it's boolean value
    # i.e. !true => false. !false => true, 
    #      a = 10  (a is true)  !a = false
    #      b = nil (b is false) !b = true
  # 3. ! after a method call usually symbolizes that it is a destructive method
    # it will change the object that a variable is pointing to
  # 4. A ? before somthing will mean return a single character sting
    # i.e. ?a => 'a', ?4 => '4', ?\s => ' '
    # makes a sting out of escapes like ""\n" and "\\"
  # 5. a ? after something will generally return a boolean
  # 6. the !! returns an object's boolean value, acts like a double negative
    # i.e. !!true => true  !!cats => true  !!nil => false
    
# Question 3
  advice = "Few things in life are as important as house training your pet dinosaur."
  
  advice.sub!('important', 'urgent')
  
# Question 4
  # the #delete method will remove all instances of the argument 
    # given in the collection it is called on
  # the #delete_at method takes in an index as it's argument and 
    # will remove the object held at that index
  # in the given array, #delete_at(1) will remove the number 2 
    # because it is at index[1]
  # in the given array, #delete(1) will remove the number 1 from the array
    # if there were more than one 1 in the array, it would remove all of them
    
# Question 5
  number = 42
  
  (10..100).include?(number)
  
# Question 6
  famous_words = "seven years ago..."
  
  "Four score and " + famous_words
  
  "Four score and " << famous_words
  
  famous_words.prepend("Four score and ")
  
# Question 7
  #42
  
# Question 8
  flintstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
  
  flintstones.flatten!
  
# Question 9
  flintstones = { 
    "Fred" => 0,
    "Wilma" => 1,
    "Barney" => 2,
    "Betty" => 3,
    "BamBam" => 4,
    "Pebbles" => 5
  }
  
  flintstones.assoc("Barney")