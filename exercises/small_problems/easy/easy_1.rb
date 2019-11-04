# 1
  def repeat(str, times)
    while times > 0
      puts str
      times -= 1
    end
  end

# 2
  def is_odd?(num)
    num % 2 == 1
  end
  
# 3
  def digit_list(num)
    list = []
    
    num.to_s.each_char do |n|
      list << n.to_i
    end
    
    list
  end
  
# 4
  def count_occurrences(arr)
    count = {}
    
    arr.each do |element|
      count[element.downcase] = arr.count(element.downcase)
    end
    
    count.each { |element, number| puts "#{element} = #{number}" }
  end
  
# 5
  # input = string
  # output = sting
  # implied
    # case does not change
    # nothing outpu, only returned
  # Question
    # how to handle punctuation
    # mutate original object?
  # Algorithm
    # split sentence by word into an array
    # reverse order of array
    # join into a sentence
    # return sentence
    
  def reverse_sentence(sentence)
    sentence.split.reverse.join(' ')
  end

# 6
  # input  = string
  # output = string
  # explicit
    # words over 4 letters long should be reversed
    # spaces stay if there is more than one word
  # Implied
    # capitalization is not changed
    # output is returned not printed
    # word order stays the same
  # questions
    # mutate origina object?
  # algorithm
    # split sentence to array of words
    # look at each word
      # leave if under 5 letters
      # if over 5
        # split into array of letters
        # reverse order of letters
        # join into word again
    # join array into sentence
    # return sentence
  
  def reverse_words(sentence)
    new_sentence = sentence.split.map do |word|
                     word.size < 5 ? word : word.reverse
                   end
  
    new_sentence.join(' ')
  end
  
  entry = 'Test sentence'
  
  reverse_words(entry)
  
# 7
  # input = positive integer
  # output = string of 101010
  # explicit
    # string starts with 1
  # implied
    # returns, does not print
  # Algorithm
    # make string variable
    # 1_or_0 = 1
    # loop
      # if 1_or_0 == 1
        # string gets 1
        # change to 0
      # else
        # string gets 0
        # change to 1
      # take 1 from number
      # break if number is 0
    # string
    
  def stringy(num, start_at = 1)
    string = ''

    case start_at
    when 1 then first, second = '1','0'
    when 0 then first, second = '0','1'
    else        return 'Second argument must be either 1 or 0'
    end
    
    num.times do |index|
      index.even? ? string << first : string << second
    end

    string
  end
  
  stringy(num)
  
# 8
  def average(array)
    array.sum.to_f / array.length
  end
  
  arr = [1, 5, 20, 9]
  
  average(arr)
  
# 9
  def sum(number)
    number.to_s.chars.map(&:to_i).reduce(:+)
  end
  
# 10
  # inputs = integer, boolean
  # output = integer
  # explicit
    # if boolean is false, output is 0
    # bonus is half the salary
  # implied
    # return, not print
  # questions
    # rounding numbers?
    # cehck inputs?
  # algorithm
    # check boolean
      # if false return 0
      # if true return half of salary
      
  def calculate_bonus(salary, gets_bonus)
    gets_bonus ? salary / 2 : 0
  end
  
  