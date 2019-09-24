# 1
  # get array, hash
  # output string
  # 
  # initialize name and assign arry joined with space to it
  # initialize title and ocupation and assign hash values t othem
  # 
  # print interpolated string
  
  def greetings(name_array, job_hash)
    name = name_array.join(' ')
    title = job_hash[:title]
    occupation = job_hash[:occupation]
    
    puts "Hello #{name}! It's good to have a #{title} #{occupation} around."
  end
  
# 2
  # get int
  # return int
  # 
  # define double_num?
  #   convert to string
  #   return false if size is odd
  #   find middle
  #   true if start..middle == middle..end
  #   else false
  #     
  # define twice
  #   retrun num if double_num?
  #   return num * 2 in not
  
  def double_num?(int)
    string_int = int.to_s
    return false if string_int.size.odd?
    half = string_int.size / 2
    string_int[0, half] == string_int[half, half]
  end
  
  def twice(int)
    double_num?(int) ? int : int * 2
  end

# 3
  def negative(num)
    num < 1 ? num : -num
  end
  
# 4
  def sequence(num)
    first, last = [num, 0].sort
    (first..last).to_a.reject { |x| x == 0 }
  end
  
# 5
  def uppercase?(str)
    str.upcase == str
  end
  
# 6
  # get string
  # return array of strings
  # 
  # initialize return array
  # split sentence into words
  # iterate through words
  #   get word size
  #   add 'word + word size' to return array
  # return array
  
  def word_lengths(str)
    str.split.each_with_object([]) do |word, arr|
      arr << "#{word} #{word.size}"
    end
  end
  
# 7
  def swap_name(name)
    name.split.reverse.join(', ')
  end
  
# 8
  #get int, int
  #return array
  #
  #initialize return array
  #initialize runner as 0
  #count times 
  #  add sequence num to runner
  #  add runner to retrun array
  #return array
  
  def sequence(count, multiple)
    multiples = []
    count.times do |i|
      multiples << multiple * (i + 1)
    end
    multiples
  end
  
# 9
  # get 3 ints
  # return string
  # 
  # get average
  #   sum / size
  # get grade letter of average
  #   case for average
  
  def get_grade(*grades)
    case grades.sum / grades.size
    when 80..89 then 'B'
    when 70..79 then 'C'
    when 60..69 then 'D'
    when 0..59  then 'F'
    else             'A'
    end
  end
  
# 10
  # get nested array
  # return array
  # 
  # initiate return array
  # iterate through nested array
  #   count times add fruit to return array
  #     indexed reference
  # retrun array
  
  def buy_fruit(nested_arr)
    nested_arr.each_with_object([]) do |arr, list|
      arr[1].times { list << arr[0] }
    end
  end
  
  p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]