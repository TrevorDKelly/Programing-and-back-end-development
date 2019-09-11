# 1
  # get float
  #   check if between 0..360
  # calc degrees
  #   float to_i
  # calc minutes
  #   (float % 1) * 60 to_i
  # calc second
  #   (float % .01) * 60 to_i
  # return string
  #   '% (degrees : munutes : seconds)'

  DEGREE = "\xC2\xB0"

  def dms1(angle)
    return 'Invalit Input' if !angle.between?(0, 360)
    
    degrees = angle.to_i
    minutes = ((angle % 1) * 60)
    seconds = ((minutes % 1) * 60).to_i
    
    format("(#{degrees}#{DEGREE}%02d'%02d\")", minutes.to_i, seconds)
  end
  
  SECONDS_PER_MINUTE = 60
  MINUTES_PER_DEGREE = 60
  SECONDS_PER_DEGREE = SECONDS_PER_MINUTE * SECONDS_PER_MINUTE
  MAX_DEGREES_IN_SECONDS = 360 * SECONDS_PER_DEGREE
  
  def dms(angle)
    total_seconds = (angle * SECONDS_PER_DEGREE) % MAX_DEGREES_IN_SECONDS
    degrees, seconds_left = total_seconds.divmod(SECONDS_PER_DEGREE)
    minutes, seconds = seconds_left.divmod(SECONDS_PER_MINUTE)
    
    format("#{degrees}#{DEGREE}%02d'%02d\"", minutes, seconds)
  end
  
# 2
  # delete vowels
  # input: array of strings
  # output: array of strings
  # maintain capitalizetion\
  
  #create vowel constant
  #iterate thru array map
  #  delete vowels
  #  
  
  VOWELS = 'aAeEiIoOuU'
  
  def remove_vowels(array)
    array.map { |word| word.delete(VOWELS) }
  end
  
# 3
  # get int
  # return int
  # 
  # initiate fib_index = 2
  # initiate first_num = 1
  # initiate second_num = 1
  # 
  # loop
  #   fib_index += 1
  #   third = first + second
  #   first = second
  #   second = third
  #   
  #   break if second size = input
  # 
  # return fib index
  
  # array solution
  # loop
  #   arr << (arr[-1] + arr[-2])
  #   break if arr.last.to_i
  
  def find_fibonacci_index_by_length2(digits)
    fib_index = 2
    first = 1
    second = 1
    
    loop do
      fib_index += 1
      first, second = [second, (first + second)]
      break if second.to_s.size >= digits
    end
    
    fib_index
  end
  
  def find_fibonacci_index_by_length(digits)
    numbers = [1, 1]
    
    loop do
      numbers << (numbers[-1] + numbers[-2])
      break if numbers.last.to_s.size >= digits
    end
    
    numbers.size
  end

# 4
  # get half array length
  # that many times do
  #   first = last & last = first
  #     second = second to last
  #       ....
  # return array
  # 
  # initiate index
  # arry size/2 times do
  #   array[index], array[-1 - index] = switch
  #   index + 1
  # end
  # return array
  
  def reverse!(arr)
    index = 0
    (arr.size / 2).times do
      arr[index], arr[-1 - index] = arr[-1 - index], arr[index]
      index += 1
    end
    arr
  end

# 5
  # get array
  # return new array
  # 
  # create new array
  # loop through input array
  #   add object to front of new array
  # return new array

  def reverse(arr)
    reversed_array = []
    arr.each { |obj| reversed_array.unshift(obj) }
    reversed_array
  end
  
  def reverse(arr)
    arr.inject([]) { |rev, obj| rev.unshift(obj) }
  end
  
# 6
  # get 2 arrays
  # return 1 array
  # 
  # initialize new arrya
  # add arr1 and arr2 to new array
  # flatten
  # uniq
  
  def merge(arr1, arr2)
    new_arr = arr1 + arr2
    new_arr.flatten.uniq
  end
  
# 7
  # get array
  # return two arrays
  # 
  # initialize arr1
  # initialize arr2
  # initialize middle as half of array rounded up
  # iterate thru array
  #   if index is <= middle
  #     add to arr1
  #   else
  #     add to arr2
  # return [arr1,arr2]
  
  def halvsies(array)
    arr1, arr2 = [], []
    middle = (array.size / 2.0).round
    
    array.each_with_index do |obj, index|
      index < middle ? arr1 << obj : arr2 << obj
    end
    
    [arr1, arr2]
  end
  
# 8 
  # get array
  # return obj
  # 
  # create uniq array
  # loop thru index numbers
  #   object at index of input == object at index of uniq array
  #   break when false
  # return object at index of input
  
  def find_dup(arr)
    no_dup = arr.uniq
    index = 0
    
    loop do
      break if arr[index] != no_dup[index]
      index += 1
    end
    
    arr[index]
  end
  
# 9
  # get array, obj
  # return boolean
  # 
  # initialize boolean and assign its value to false
  # iterate thru array
  #   check iteration value against obj argument
  #   if equal return true
  #   else next
  
  def include?(array, check_for)
    array.each { |obj| return true if obj == check_for }
    false
  end
  
# 10
  # get int
  # return print triangle
  # 
  # initialize row and assign integer 1 to it
  # int times print
  #   rigth aligned with int width print row number of stars
  
  # get the corner
  # 
  # if corner 1 
  #   stars => full, first, dropping
  #   spaces => one, second, growing
  # if corner 2
  #   stars => full, second, dropping
  #   spaces => one, first, growing
  # if corner 3
  #   stars => one, first, growing
  #   spaces => full, second, dropping
  # if corner 4
  #   stars => one, second, growing
  #   spaces => full, first, dropping
  #   
  # check the corner and assign
  #   what prints first, second
  #   is what prints first full or 1
  #   is what prints second full or 1
  #   is what prints first growing or dropping
  #   is what prints first growing or dropping
  
  
    
  def triangle(rows, corner)
    case corner
    when 1
      first, second, change_by, count = '*', ' ', -1, rows
    when 2
      first, second, change_by, count = ' ', '*', 1, 0
    when 3
      first, second, change_by, count = '*', ' ', 1, 1
    when 4
      first, second, change_by, count = ' ', '*', -1, (rows - 1)
    end
    
    rows.times do
      puts (first * count).ljust(rows, second)
      count += change_by
    end
  end
  
  triangle(7, 1)