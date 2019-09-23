# 1
  # get array
  # return int
  # 
  # sum of the sums of 1st, 1st + 2nd, 1st + 2nd + 3rd ...
  # 
  # initialize an empty array
  # initialize total local variable and set to 0
  # iterate through argument array
  #   add num to new array
  #   add sum of new array to total
  # return total
  
  def sum_of_sums(arr)
    running_arr = []
    total = 0
    arr.each do |num|
      running_arr << num
      total += running_arr.sum
    end
    total
  end
  
  # arr_size = array size
  # add last num 1 time
  # second to last 2 times
  # 
  # initialize counter = 1
  # initialize total = 0
  # arr_size times 
  #   add arr[-index] index times
  #   add one to counter
  
  def sum_of_sums(arr)
    total = 0
    arr.size.times do |i|
      total += arr[-i - 1] * (i + 1)
    end
    total
  end
  
# 2
  def user_inputs(type)
    puts ">> Enter a #{type}"
    gets.chomp
  end
  
  def madlibs
    noun = user_inputs('noun')
    verb = user_inputs('verb')
    adjective = user_inputs('adjective')
    adverb = user_inputs('adverb')
    
    puts "There was a #{noun} that liked to #{verb} and was #{adjective} at doing it #{adverb}."
  end
  
# 3
  # get string
  # return array
  # 
  # array of all leading strings from the string
  # 
  # initialize new_str local variable and assign an empty string object to it
  # initialize arr local variable and assign an empty array object to it
  # iterate through each character in the string passed as an argument
  #   add character to new_str
  #   add new_str to arr
  # return arr
  
  def substrings_at_start(str)
    new_str = ''
    arr = []
    str.each_char do |char|
      new_str += char
      arr << new_str
    end
    arr
  end
  
# 4
  # get string
  # return array
  # 
  # return an array of every string within the argument string
  # 
  # initialize return array
  # add array from index 0 to end thru substrings_at_start
  # add array from index 1 to end thru substrings_at_start
  # add array from index 2 to end thru substrings_at_start
  # return new array flattened
  
  def substrings(str)
    new_arr = []
    str.size.times do |i|
      new_arr << substrings_at_start(str[i..-1])
    end
    new_arr.flatten
  end
  
# 5
  # get string
  # return array
  # 
  # create palendrome? - find palemdromes
  #   get string
  #   return boolean
  #   
  #   initialize counter as 0
  #   until counter > half string size
  #     get string[counter] and string[-counter - 1]
  #       if equal keep going
  #       else return false
  #     add 1 to counter 
  # 
  # substrings = get all substrings
  # select from substrings
  #   palendrome?
  
  def palendrome?(str)
    counter = 0

    while counter < str.size / 2
      return false if str[counter] != str[(-counter) - 1]
      counter += 1
    end

    true
  end
  
  def palindromes(str)
    alpha_chars = str.downcase.delete('^[a-z]')
    substrings_array = substrings(alpha_chars)
    
    substrings_array.select { |string| (string.size > 1) && palendrome?(string) }
  end
  
# 6
  # get two numbers 
  # return a string for all numbers between the inputs
  # 
  # iterate through range
  #   if num %3 == 0
  #     add Fizz
  #   if num % 5 == 0
  #     add Buzz
  #   print num if neither
  
  def fizzbuzz(first, last)
    list = []
    (first..last).each do |num|
      to_print = ''
      to_print << 'Fizz' if num % 3 == 0
      to_print << 'Buzz' if num % 5 == 0
      list << (to_print.empty? ? num.to_s : to_print)
    end
    puts list.join(', ')
  end
  
# 7
  # get string
  # return string
  # 
  # initialize return string
  # iterate through characters
  # add to return string twice
  # return string
  
  def repeater(str)
    doubled_str = ''
    str.each_char { |char| doubled_str << char << char }
    doubled_str
  end
  
# 8
  # get string
  # return string
  # 
  # initialize constanants
  #   all letters - vouels
  # 
  # double all constanants
  #   itterate through chars
  #     double if constanant
  #     single if not
  # 
  
  def double_consonants(str)
    str.chars.map do |char|
      (char.downcase =~ /[a-z&&[^aeiou]]/) ? char * 2 : char
    end.join
  end
  
# 9
  # get integer
  # return integer
  # 
  # convert input to string
  # reverse string
  # convert to integer
  # output integer
  
  def reversed_number(int)
    int.to_s.reverse.to_i
  end
  
# 10
  # get string
  # return string
  # 
  # get middle
  #   string size / 2
  # add to return
  # add middle + 1 if size is even
  
  def center_of(str)
    center = str.size / 2
    
    middle = str[center]
    middle.prepend(str[center - 1]) if str.size.even?
    
    middle
  end
  
p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'