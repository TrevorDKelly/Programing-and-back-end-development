# True or False

  boolean = [true, false].sample
  
  boolean == true ? puts("I'm true!") : puts("I'm false!")
  
  # Does not neen the '== true'
  # it is already looking for a true or false and boolean is going to be one of those
  boolean ? puts("I'm true!") : puts("I'm false!")

# Truthy Number 

  # This will print "My favorite number is 7"
  # ifs look for a boolean and only false and nil come back false.
  # this if is checking the variable 'number' which is assigned 7
  # since this is not nil or false the if reads it as true
  
  
# Sleep Alert

  status = ["tired", "awake"].sample
  
  what_to_do = if status == "awake"
                 "Be productive"
               else
                 "Go to sleep"
               end
    
  puts what_to_do
    
# Cool numbers

  # the error in the code is a missing = in the if statement
  # putting 'if number = 5' is assigning number to 5
  # it should be 'if number == 5'
  
  