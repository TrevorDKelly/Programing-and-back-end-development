# Question 1
  string = 'The Flintstones Rock!'
  
  10.times { |x| puts string.rjust(string.length + x) }
  
# Question 2 
  # the error will be no implicit conversion of integer to a string
  puts "the value of 40 + 2 is " + (40 + 2).to_s
  puts "the value of 40 + 2 is #{(40 + 2)}"
  
# Question 3
  def factors(number)
    divisor = number
    factors = []
    while divisor > 0 do
      factors << number / divisor if number % divisor == 0 # this 
      divisor -= 1
    end 
    factors
  end
  
# Question 4
  # The difference here will be in mutation of the original object. 
  # the first method will mutate the buffer array that is given as an argument
  # and the second will only return a new buffer and leave the original as it was
  
# Question 5
  # the error will be an undefined local variable because the limit variable is 
  # defined outside of the method and is not passed in as an argument.
  # the solutions are to either pass the limit into the method as an argument
  # or to initialize the limit within the method
  
# Question 6
  # The output will be 34
  # the mess_with_it method reassigns the local some_number variable with the 
  # += method. reassignment is non-mutating so answer stays 42 after the method call
  
# Question 7
  # The munsters hash is safe. 
  # in the method definition, it is iterating though the values however the adjustments 
  # are being made as though the keys were being called. the values are not also 
  # keys so there will be no value to adjust. 
  # WRONG
  # the keys method would only allow you to change the actual key
  # by iterating through values each iteration returns { :a => "a", :b => 'b' }
  # therefore iteration = { :a => "a", :b => 'b' }
  # so iteration[:a] = "a"
  
  # the hash is modified and hashes are mutable so the original hash is changed
  
# Question 8
  puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
  #       (   (         paper      ,       rock             ),  rock )
  #       (   (                     paper                   ),  rock )
  # output will be 'paper'
  
# Question 9
  # the foo method will return 'yes' no matter what so when it is passed into
  # the bar method the argument becomes 'yes'. 
  # the bar method has a turnary operator where anything other than 'no' being
  # passed into it results in an output of 'no'
  # so the output is 'no'