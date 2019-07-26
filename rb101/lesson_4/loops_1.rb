# 1
  loop do
    puts 'just keep printing'
    break
  end
  
# 2
  loop do
    puts 'This is the outer loop'
    
    loop do
      puts 'This is the inner loop'
      break
    end
    
    break
  end
  
  puts 'This is outside all loops'
  
# 3
  iterations = 1
  
  loop do
    puts "Number of iterations = #{iterations}"
    break if iterations >= 5
    iterations += 1
  end
  
# 4
  loop do
    puts 'Should i stop looping?'
    answer = gets.chomp
    break if answer.downcase == 'yes'
  end
  
# 5
  say_hello = 1

  while say_hello < 5
    puts "Hello!"
    say_hello += 1
  end
  
# 6
  numbers = []
  
  while numbers.length < 5
    numbers << rand(0, 99)
  end
  
  puts numbers
  
# 7
  count = 1
  
  until count == 11
    puts count
    count += 1
  end
  
# 8
  numbers = [7, 9, 13, 25, 18]
  
  until numbers.empty?
    puts numbers.shift
  end
  
  numbers = [7, 9, 13, 25, 18]
  count = 1
  
  until count == numbers.size
    puts numbers[count]
    count += 1
  end
  
# 9
  for i in 1..100
    puts i if i.odd?
  end
  
# 10
  friends = ['Sarah', 'John', 'Hannah', 'Dave']
  
  for friend in friends
    puts "Hello, #{friend}!"
  end
  