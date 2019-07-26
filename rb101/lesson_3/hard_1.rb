# Question 1
  # undefined local variable error
  # the argument passed into the conditionaal is false therefore the code in the
  # block wont run
  # WRONG
  # greeting = nil
  # a variable can be initialized in an if block even if the code initializing
  # it doesnt run. 
  
# Question 2
  # {:a => 'hi there'}
  # because variables are used as pointers in ruby, the informal_greeting is 
  # pointed at the same object as :a. this object is a string which is mutable.
  # the #<< method is mutating so it adds ' there' to the original object.
  
# Question 3
  # A
    # one is one
    # two is two
    # three is three
  # B
    # one is one
    # two is two
    # three is three
  # C
    # one is two
    # two is three
    # three is one
    
# Question 4
  def is_an_ip_number?(num)
    /\d\d?\d?/.match(num) && num.to_i.between?(0, 255)
  end

  def dot_separated_ip_address?(input_string)
    dot_separated_words = input_string.split(".")
    return false unless dot_separated_words.length == 4
    
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_an_ip_number?(word)
    end
    
    return true
  end
  
  ip_address = '1.1.j.40'
  
  p dot_separated_ip_address?(ip_address)