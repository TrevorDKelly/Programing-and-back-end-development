# 1 searching 101
=begin
  get 6 numbers from user
    5 times
      get number
      add number to array
    get last number
      cehck if it's in the array
=end
  def prompt(str)
    puts "==> " + str
  end
  
  NUMS_WITH_ORDINALS = %w(1st 2nd 3rd 4th 5th)
  
  numbers = []
  
  NUMS_WITH_ORDINALS.each do |iteration|
    prompt "Enter the #{iteration} number:"
    number = 0
    loop do
      number = gets.chomp
      break if number == number.to_i.to_s
      prompt "** Invalid input please only enter integers **"
    end
    numbers << number.to_i
  end
  
  number = 0
  prompt "Enter the last number"
  loop do
    number = gets.chomp
    break if number == number.to_i.to_s
    prompt "** Invalid input please only enter integers **"
  end
  number = number.to_i
  
  included_or_not = numbers.include?(number) ? 'does' : 'does not'
  
  puts "The number #{number} #{included_or_not} appear in #{numbers}"

# 2 
  OPERATIONS = [:+, :-, :*, :/, :%, :**]
  
  puts "Enter the first number:"
  num1 = gets.chomp.to_i
  puts "Enter the second number:"
  num2 = gets.chomp.to_i
  
  OPERATIONS.each do |sym|
    puts "==> #{num1} #{sym} #{num2} = #{num1.send(sym, num2)}"
  end

# 3
  puts "Enter a word or sentence:"
  input = gets.chomp
  
  count = input.split.join.size
  
  puts "There are #{count} characters in \"#{input}\""

# 4
  def multiply(num1, num2)
    num1 * num2
  end

# 5
  def square(num)
    multiply(num, num)
  end
  
  def cubed(num, power)
    total = num
    (power - 1).times { total = multiply(total, num) }
    total
  end

# 6
  def xor(arg1, arg2)
    return false if arg1 && arg2
    arg1 || arg2
  end

# 7
  def oddities(arr)
    odds = []
    arr.each_with_index { |item, index| odds << item if (index + 1).odd? }
    odds
  end
  
  def evens(arr)
    even_arr = []
    count = 0
    while count <= array.length
      even_arr << arr[count]
      count += 2
    end
    even_arr
  end

# 8
  def palindrome?(input)
    input == input.reverse
  end
  
# 9
  def real_palindrome?(input)
    sig_chars = input.downcase.delete('^a-z0-9')
    palindrome?(sig_chars)
  end

# 10
  def palindrome_number?(num)
    str = num.to_s
    loop do
      break if str.split.first != 0
      str.split.pop
    end
    palindrome?(str)
  end
  