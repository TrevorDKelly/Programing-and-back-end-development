# Repeat After Me
  puts "Type whatever you want"
  input = gets.chomp
  
  puts input

# Your Age in Months
  puts "What's your age?: "
  age = gets.chomp.to_i
  
  puts "That is #{age * 12} months."

# Print Something Part 1 & 2
  loop do
    puts "Do you want me to print something? (y/n)"
    answer = gets.chomp.downcase
    
    if answer == "y"
      puts "somehting"
      break
    elsif answer != "n"
      puts "Plese enter either \"y\" or \"n\""
    else
      break
    end
  end
  
  # __________Better answer_________
  
  choice = nil
  
  loop do
    puts "do you want me to print something? (y / n)"
    choice = gets.chomp.downcase
    break if %w(y n).include?(choice)
    puts "Please enter either \'y\' or \'n\'"
  end
  puts "something" if choice == "y"
  
  
# Launchschool Printer
  count = nil
  
  puts "How many lines of output do you want? (make sure it is more than 3!)"
  
  loop do
    count = gets.chomp.to_i
    break if count >= 3
    puts "That's not enough! enter more than 3!"
  end
  
  count.times do
    puts "Launchshool is the best!"
  end
  
# Passwords
  PASSWORD = "n"
  
  loop do
    puts "Enter your password to continue"
    input = gets.chomp
    break puts "Welcome!" if input == PASSWORD
    puts "Icorrect Password! Try Again"
  end
  
# User Name and Password
  PASSWORDS = {
    trevor: "Password",
    luna: "Meow",
    seamus: "Woof",
    n: "n"
  }
  
  loop do 
    puts "Enter your user name: "
    user = gets.chomp.downcase.to_sym
    input = nil
    if PASSWORDS.has_key?(user)
      loop do
        puts "Enter your password or type \"exit\" to choose a different user"
        input = gets.chomp
        break puts "Welcome!" if PASSWORDS[user] == input
        break if input == "exit" || input == "Exit"
        puts "Wrong Password!"
      end
      break if PASSWORDS[user] == input
    else
      puts "That user does not exist"
    end
  end
      
      
# Dividing Numbers
  def valid_number?(number)
    number.to_i.to_s == number
  end
  
  number1 = nil
  number2 = nil
  
  loop do
    puts "Enter a number!"
    number1 = gets.chomp
    if valid_number?(number1)
      break
    end
    puts "This must be an integer!"
  end
  
  loop do
    puts "Enter another number!"
    number2 = gets.chomp
    if valid_number?(number2) && number2.to_i > 0
      break
    end
    puts "This must be an integer and greater than zero!"
  end
  
  puts "#{number1} divided by #{number2} is #{number1.to_i / number2.to_i}"
  
# Launch School Printer Part 2
  loop do
    iterations = nil
    
    puts "How many lines would you like me to print? (Q to quit)"
    iterations = gets.chomp.downcase
    
    if iterations == "q"
      break
    elsif iterations != iterations.to_i.to_s
      puts "**You need to type an integer!**"
    elsif iterations.to_i < 3
      puts "** That's not enough lines! **"
    else
      iterations.to_i.times do
        puts "Launchschool is the best!"
      end
    end
    
  end
  
# Opposites Attract

  def valid_input(num)
    num == num.to_i.to_s && num.to_i !=0
  end
  
  number1 = nil
  number2 = nil
  
  puts "Enter two numbers, one must be positive and one must be negative."

  loop do
    
    loop do
      puts "Enter the first number: "
      number1 = gets.chomp
      break if valid_input(number1)
      puts "** This must be a non zero integer! **"
    end
    
    loop do
      puts "Enter the second number: "
      number2 = gets.chomp
      break if valid_input(number2)
      puts "** This must be a non zero integer! **"
    end
    
    number1 = number1.to_i
    number2 = number2.to_i
    
    if (number1 > 0 && number2 < 0) || (number1 < 0 && number2 > 0)
      break
    end
    puts "** One number must be positive and one number must be negative! **"
  end
  
  puts "#{number1} + #{number2} = #{number1 + number2}"