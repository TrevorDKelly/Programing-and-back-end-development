# 1
  # if string is empty return 0
  # loop through each character
  #   get the ascii value
  #   add to total
  # return total
  
  def ascii_value(str)
    total = 0
    
    str.each_char { |letter| total += letter.ord }
    
    total
  end

# 2
  #get integer
  #if positive
  #  cehck if under MAX (1440)
  #  hours = num / 60
  #  remainder = minutes
  #  put hours:minutes
  #else
  #  check if under MAX *-1
  #  hours = 23 - (num / 60)
  #  munutes = 60 - remainder

  HOURS_IN_DAY = 24
  MINUTES_IN_HOUR = 60
  DAY_IN_MINUTES = 1440
  BASE_TIME = Time.new(2019, 8, 25)
  
  def time_of_day(num)
    days, one_day = num.divmod(DAY_IN_MINUTES)
    hours, minutes = one_day.divmod(MINUTES_IN_HOUR)
    time = BASE_TIME + (60 * 60 * 24 * days)
    day = time.strftime("%A")
    format("#{day} %02d:%02d", hours, minutes)
  end
  
# 3
  # get string
  # find hours and minutes
    # get the first 2
    # convert to int
    # get last 2
    # convert to int
  # hours * 60 + minutes
  # (result - minutes in day)
  
  def after_midnight(time)
    hours = (time[0] + time[1]).to_i
    minutes = (time[3] + time[4]).to_i
    
    hours == 24 ? 0 : hours * 60 + minutes
  end
  
  def before_midnight(time)
    minutes = after_midnight(time)
    
    minutes == 0 ? 0 : DAY_IN_MINUTES - minutes
  end
  
# 4
  #split sentence
  #get each word
  #  get first and last letter
  #  set first to last
  #  set last to first
  #join string with space
  
  def swap(str)
    new_words = str.split.map do |word|
                  first = word[0]
                  last = word[-1]
                  
                  word[0] = last
                  word[-1] = first
                  
                  word
    end
    
    new_words.join(' ')
  end
   
  # The method will not work if the arguments passed into it are the objects at
  # the first and last indices of the word. in the method definition, the 
  # = method is called on a, b. this reassigns the local variables a and b 
  # therefore they are no longer pointing at the object that was passed into
  # the method as an argument. This means the original object held in the local
  # variable word is not mutated
  
# 5
  # get string
  # find any non letter characters
  #   replace with space
  #   remove extra spaces
  # 
  # use regex
  #   find one or more non letter characters
  #   replace with space
  
  def cleanup(string)
    string.gsub(/[^a-zA-Z]+/, " ")
  end
  
  ALPHABET = ('a'..'z')
  
  def cleanup2(string)
    new_string = ''

    string.split('').each do |char|
      if ALPHABET.include?(char.downcase)
        new_string << char
      else
        new_string << ' ' unless new_string[-1] == ' '
      end
    end

    new_string
  end
  
# 6
  # get string
  # output hash
  # 
  # initiate hash
  # loop through each word 
  #   get letter count
  #   if the count is there
  #     add 1 to count
  #   else
  #     new count = 1
  # return hash
  
  def word_sizes(string)
    hsh = Hash.new(0)
    string.split.each do |word|
                  count = word.count('a-zA-Z')
                  hsh[count] += 1
                  end
    hsh
  end

# 7
  def word_sizes2(string)
    hsh = Hash.new(0)
    string.split.each do |word|
      characters = word.delete('^a-zA-Z')
      hsh[characters] += 1
    end
    hsh
  end
  
# 8
  # get array
  # return array
  # 
  # constant array in order of alphabet
  # 
  # initiate hash
  # iterate though input array
  #   hash iteration = constant iteration index
  # sort hash by value
  # get hash keys
  
  NUMBER_ALPHA_ORDER = [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 
                        7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
  
  def alphabetic_number_sort(number_array)
    hsh = Hash.new
    
    number_array.each do |number|
      hsh[number] = NUMBER_ALPHA_ORDER.index(number)
    end
    
    hsh.sort_by {|_, v| v }.to_h.keys
  end
  
  WORD_NUMBERS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)
  
  def alphabetic_number_sort2(numbers)
    numbers.sort { |a, b| WORD_NUMBERS[a] <=> WORD_NUMBERS[b] }
  end

# 9 
  # initiate return string
  # go through all characters
  #   if char == previous then next
  #   else add char to string
  # return string

  def crunch(string)
    no_duplicates = ''
    string.each_char do |letter|
      no_duplicates << letter unless letter == no_duplicates[-1]
    end
    no_duplicates
  end
  
# 10
  MAX_LINE_WIDTH = 76
  
  def get_line_end(string, start_line_at)
    end_line_at = start_line_at + MAX_LINE_WIDTH
      
    loop do
      break if string[end_line_at] == nil
      break if string[end_line_at].match(/\s/)
      end_line_at -= 1
    end
    
    end_line_at - 1
  end
      
  def create_text_lines(string)
    lines = []
    start_line_at = 0
    line_number = 0
  
    while string[start_line_at] != nil
      end_line_at = get_line_end(string, start_line_at)
      
      lines[line_number] = string[start_line_at..end_line_at]
      line_number += 1
      start_line_at = end_line_at + 2
    end
    
    lines
  end
  
  def get_width(lines)
    width = 0
    lines.each do |line|
      width = line.size if line.size > width
    end
    width
  end
  
  def display_box_top(width)
    puts "+-" + ('-' * width) + '-+'
    puts "| " + (' ' * width) + ' |'
  end
  
  def display_box_botom(width)
    puts "| " + (' ' * width) + ' |'
    puts "+-" + ('-' * width) + '-+'
  end

  def print_in_box(string)
    lines = create_text_lines(string)
    width = get_width(lines)
    
    display_box_top(width)
    lines.each do |line|
      puts "| " + line + (' ' * (width - line.size)) + ' |'
    end
    display_box_botom(width)
  end
  
# 11
  def spin_me(str)
    str.split.each do |word|
      word.reverse!
    end.join(" ")
  end
  
  # does the string passed as an argument to the spin_me method get mutated?
  # 
  # On line 266 the split method is invoked on the local variable string. this 
  # returns an array object which is a separate object.
  # 
  # The string that is passed into this method as an argument is assigned to the
  # local variable str. the split method is invoked on str with no arguments and
  # returns an array. this array object has the each method invoked on it with a
  # block passed as an argument. on each iteration, the next object in the array
  # is assigned to the local variable word. within the block the object held by
  # the word variable has the reverse! method invoked on it. this mutated the
  # object being held by the local variable word. this is the same object as the
  # corresponding object in the array, but it is not the same object as was
  # passed to the local variable str upon method invocation. the original object
  # is not changed.
  # 
  # the spin_me method is defined on line 265 with one paramiter. the object
  # passed into the method as an argument is assigned to the local variable str.
  # on line 266 the local variable str has the split method invoked on it with no
  # arguments. this method returns a new array. this new array has the each 
  # method invoked on it and the block passed to the each method mutates each 
  # object in the array. The original object held in the local variable str 
  # is not changed.