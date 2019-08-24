# 1

  age = rand(20..200)
  
  puts "Enter a name:"
  name = gets.chomp.capitalize
  name = "Tony" if name == ''
  puts "#{name} is #{age} years old"
  
# 2
  SMETER_TO_SFEET = 10.7639
  puts 'Enter the width of the room in feet'
  w = gets.chomp.to_f
  puts 'Enter the length of the room in feet'
  l = gets.chomp.to_f

  area_ft = (l * w).round(2)
  area_in = (area_ft * 144).round(2)
  area_cm = (area_in * 929.03).round(2)
  
  puts "The area of the room is #{area_ft} square feet " +
        "(#{area_in} square inches) (#{area_cm} square centimeters)"
  
# 3 Tip Calculator
  puts "What is the bill?"
  bill = gets.chomp.to_f
  puts "What is the tip percentage?"
  tip_percent = gets.chomp.to_f
  
  tip_amount = ((tip_percent / 100) * bill).round(2)
  
  bill_with_tip = bill + tip_amount
  
  puts "Tip amount: $%0.2f" % [tip_amount]
  puts "Total bill: $%0.2f" % [bill_with_tip]
 
# 4 
  year = Time.now.year
  
  puts "What is your age?"
  age = gets.chomp.to_i
  puts "When would you like to retire?"
  retire_age = gets.chomp.to_i
  
  years_to_retirement = retire_age - age
  retirement_year = retire_age - age + year
  
  puts "It is #{year} and you will retire in #{retirement_year}"
  puts "you are #{years_to_retirement} years away from retiring"
   
# 5
  def display_greeting(name)
    if name.split('').last == '!'
      cap_name = name.chop.upcase
      puts "HELLO #{cap_name}. I'M EXCITED TO MEET YOU."
    else
      puts "Hello #{name}"
    end
  end
  
  puts "Enter your name:"
  name = gets.chomp.capitalize
  
  display_greeting(name)

# 6 
  for num in (1..99)
    puts num if num.odd?
  end
  
  (1..99).each { |num| puts num if num.odd? }
  
# 7 
  for num in (1..99)
    puts num if num.even?
  end
  
  (1..99).each { |num| puts num if num.even? }

# 8
  def calc_sum(num)
    (1..num).inject(:+)
  end
  
  def calc_product(num)
    (1..num).inject(:*)
  end
  
  def prompt(str)
    puts ">> " + str
  end
  
  num = 0
  prompt "Enter an integer greater than 0"
  loop do
    num = gets.chomp.to_i
    break if num > 0
    puts "** NOT VALID INPUT **"
  end
  
  answer = ''
  prompt "Enter 's' to calculate the sum, or 'p' to calculate the product"
  loop do
    answer = gets.chomp.downcase
    break if %w(s p).include?(answer)
    puts "** NOT VALID INPUT **"
  end
  
  if answer == 's'
    puts "The sum of integers between 1 and #{num} is #{calc_sum(num)}."
  else
    puts "The product of integers between 1 and #{num} is #{calc_product(num)}."
  end
  
# 9
  # This will print BOB /n BOB
  # the name variable points to the object 'Bob'
  # when save_name is assigned to name it gets the same object. 
  # upcase! is a mutating method so the object is changed which is what both
  # variables are pointing to
  
# 10
  # this will upcase the names in array2
  # the each method assigns each string object to the variable value
  # that object is then moved into array2
  # the second each then mutates the objects in the array
  # the objects are mutated and are tehsame objects in array2