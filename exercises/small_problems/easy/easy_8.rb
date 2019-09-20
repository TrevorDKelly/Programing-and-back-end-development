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
  
  p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]