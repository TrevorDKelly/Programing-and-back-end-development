# 1
  # input:  two arrays
  # output: one array
  # 
  # initialize local variable counter and assign it the value 0
  # initialize return_array and assign an empty array to it
  # loop
  #   move object at index 'counter' of array 1 into return_array
  #   move object at index 'counter' of array 2 into return_array
  #   add 1 to counter
  #   break if counter == array 1 size
  # return return_array
  
  def interleave(arr1, arr2)
    counter = 0
    return_array = []
    
    loop do
      break if counter >= arr1.size
      return_array << arr1[counter] << arr2[counter]
      counter +=1
    end
    
    return_array
  end
  
  def interleave(arr1, arr2)
    arr1.zip(arr2).flatten
  end
  
# 2
  # get string
  # return hash
  # 
  # create constants for upper and lower case
  # initialize hash with 3 symbols as keys all with value of 0
  #   :lowercase, :uppercase, :other
  # iterate through each character of the string paramiter
  #   if lowercase add 1 to :lowercase value ....
  # return hash
  
  LOWERCASE = ('a'..'z')
  UPPERCASE = ('A'..'Z')
  
  def letter_case_count(str)
    count = { lowercase: 0, uppercase: 0, neither: 0 }
    
    str.each_char do |char|
      case
      when LOWERCASE.include?(char) then count[:lowercase] += 1
      when UPPERCASE.include?(char) then count[:uppercase] += 1
      else                               count[:neither] += 1
      end
    end
    
    count
  end
  
# 3
  # get string
  # return new string
  # 
  # split sentence by spaces
  # for each word
  #   get first character
  #     upcase
  # join words with space
  
  def word_cap(str)
    str.split.map(&:capitalize).join(' ')
  end
  
  TO_CAP = ('a'..'z').zip('A'..'Z').to_h
  
  def word_cap(str)
    previous_char = ' '
    new_str = ''
    str.downcase.each_char do |char|
      if previous_char == ' ' && TO_CAP.keys.include?(char)
        new_str << TO_CAP[char]
      else
        new_str << char
      end
      previous_char = char
    end
    
    new_str
  end
  
  def word_cap(str)
    str.downcase.split.map do |word|
      word[0] = word[0].upcase
      word
    end.join(' ')
  end
  
# 4
  # create capitals constant
  # initialize return_string variable
  # loop through characters
  #   if capitals has letter
  #     add downcase version to return_sting
  #   else
  #     add upcase version to return_sting
  # return_string
  
  def swapcase(str)
    new_str = ''
    str.each_char do |char|
      char =~ /[A-Z]/ ? new_str << char.downcase : new_str << char.upcase
    end
    new_str
  end
  
# 5
  # get string
  # return new string
  # 
  # capitalize every other character
  # ignore numbers
  # count special characters and spaces but dont change them
  # 
  # downcase the input
  # initialize local variable to_cap and assign the boolean value true to it
  # split string into individual characters
  #   loop through characters
  #     if to_cap is true
  #       capitalize
  #     swap to_cap
  #   join characters
  
  def staggered_case(str, start_with = 'up')
    to_cap = start_with == 'up' ? false : true
    
    new_str = str.downcase.split('').map do |char|
                to_cap = !to_cap
                to_cap ? char.upcase : char
              end
    
    new_str.join
  end
  
  def staggered_case(str)
    str.split('').map.with_index { |char, i| i.even? ? char.upcase : char.downcase }.join
  end
  
# 6
  def staggered_case(str, start_with = 'up', count_non_alpha = true)
    to_cap = start_with == 'up' ? false : true
    
    new_str = str.downcase.split('').map do |char|
                if !count_non_alpha
                  next char if char =~ /[^a-z]/
                end
                to_cap = !to_cap
                to_cap ? char.upcase : char
              end
    
    new_str.join
  end
  
# 7
  # get array
  # return string
  # 
  # multiply all numbers in array together
  # divide by size of array
  # round output to 3 decimals
  # 
  # initialize local variable m_average
  #   assign to it the value of array multipled toether / array size
  # puts 'average is' + m_average rounded to 3 decimals
  
  def show_multiplicative_average(arr)
    m_average = arr.inject(&:*) / arr.size.to_f
    
    puts format("The average is %.3f", m_average)
  end
  
# 8
  # get two arrays
  # return 1 array
  # 
  # multiply numbers in array with number at same index of other array
  # 
  # iterate through first array with index
  #   item * array2[index]
  # return new array
  
  def multiply_list(arr1, arr2)
    arr1.map.with_index { |num, i| num * arr2[i] }
  end
  
  def multiply_list(arr1, arr2)
    arr1.zip(arr2).map { |arr| arr.inject(&:*) }
  end
  
# 9
  # get two arrays
  # return 1 array
  # 
  # multiply each number in one array by each nubmer in seocnd array
  # add all results to a new array
  # sort the new array
  # 
  # initialize local variable results and assign empty array to it
  # loop through arr1
  #   loop thru arr 2
  #     multiply arr1 object by arr2
  #     add result to results array
  # return sorted results
  
  def multiply_all_pairs(arr1, arr2)
    results = []
    
    arr1.each { |num1| arr2.each { |num2| results << num1 * num2 } }
    
    results.sort
  end
  
# 10
  def penultimate(str)
    str.split[-2]
  end
  
  
  
  # Middle Word
  #  edge cases
  #    even number of words
  #      which one to take
  #    only 1 word
  #    no words
  #    words with special characters like hyphens
  
  # get string
  # return string
  # 
  # initialize local variable str_arr and assign to it the return of the input string split into words
  # get number of words
  #   if even
  #     get two middle words
  #       str_arr / 2 & str / 2 + 1
  #   if odd
  #     get middle word
  #       str_arr / 2
  
  def middle_word(str)
    str_arr = str.split
    return '' if str_arr.empty?
    half_num = (str_arr.size / 2)
    
    if str_arr.size.even?
      "#{str_arr[half_num - 1]} #{str_arr[half_num]}"
    else
      "#{str_arr[half_num]}"
    end
  end
  
  p middle_word('last word')
  p middle_word('Launch School is great!')
  p middle_word('this is a test of the method')
  p middle_word('  a a ')
