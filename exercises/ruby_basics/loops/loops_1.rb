# Runaway Loop
  loop do 
    puts "Only prints once"
    break
  end
  
# Loopception
  loop do
    puts "This is the outer loop."
    
    loop do
      puts "This is the inner loop"
      break
    end
    break
  end
  puts "This is outside all the loops"
  
# Control the Loop
  iterations = 1
  
  loop do
    puts "number of iterations = #{iterations}"
    iterations += 1
    break if iterations > 5
  end
  
# Loop on Command
  loop do
    puts "Should I stop looping?"
    answer = gets.chomp
    break if answer == "yes"
  end
  
# Say Hello
  say_hello = true
  repete = 0
  
  while say_hello
    puts "Hello!"
    repete += 1
    say_hello = false if repete == 5
  end
  
# Print While
  numbers = Array.new(100) { |i| i }
  
  count = 0
  
  while count < 5
    puts numbers.sample
    count += 1
  end
  
  # ------------------------
  # given answer
  
  numbers = []
  
  while numbers.length < 5
    numbers << rand(100)
  end
  puts numbers
  
# Count Up
  count = 1
  
  until count > 10
    puts count
    count += 1
  end
  
# Print Until
  numbers = [7, 9, 13, 29, 18]
  count = 0
  
  until count > numbers.length
    puts numbers[count]
    count +=1
  end
  
# That's Odd
  for i in 1..100
    puts i if i.odd?
  end
  
# Greet Your Friends
  names = ["Sarah", "John", "Hannah", "Dave"]
  for i in 0..(names.size - 1)
    puts "Hello #{names[i]}!"
  end
  
  #--------------------
  #Better answer
  
  for name in names
    puts "Hello #{name}!"
  end
  