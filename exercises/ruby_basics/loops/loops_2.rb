# Even or Odd
  count = 1
  
  loop do
    if count.even?
      puts "#{count} is Even!"
    else
      puts "#{count} is Odd!"
    end
    count +=1
    break if count > 5
  end
  
# Catch the Number
  loop do
    number = rand(100)
    puts number
    break if number.between?(0, 10)
  end
  
# Conditional Loop
  process_the_loop = [true, false].sample
  
  if process_the_loop
    puts "The loop was processed!"
  else 
    puts "The loop wans't processed!"
  end
  
# Get the sum
  loop do
    puts "What is 2 + 2?"
    ans = gets.chomp
    break puts "That's Correct!" if ans == "4"
    puts "Wrong answer! Try again!"
  end
  
# Insert Numbers
  numbers = []
  
  loop do
    print "Enter and Number: "
    num = gets.chomp.to_i
    numbers << num
    break if numbers.size == 5
  end
  
# Empty the Array
  names = ["Sally", "Joe", "Lisa", "Henry"]
  
  loop do
    names.shift
    break if names.empty?
  end
  
# Stop Counting
  5.times do |index|
    puts index
    break if index ==2
  end
  
# Only Even
  number = 0
  
  until number == 10
    number += 1
    next if number.odd?
    puts number
  end
  
# First To Five
  number_a = 0
  number_b = 0
  
  loop do
    number_a += rand(2)
    number_b += rand(2)
    
    next unless umber_a == 5 || number_b == 5
    
    if number_a > number_b
      winner = "Number A"
      loser = "Number B"
      second = number_b
    else 
      winner = "Number B"
      loser = "Number A"
      second = number_a
    end
    
    if number_a == number_b
      puts "It was a tie! Both got to 5!"
    else
      puts "5 was reached by #{winner}!"
      puts "#{loser} got to #{second}"
    end
    
    break
    
  end
  
# Greeting
  def greeting
    puts "Hello!"
  end
  
  number_of_greetings = 2
  
  while number_of_greetings > 0
    greeting
    number_of_greetings -= 1
  end
  