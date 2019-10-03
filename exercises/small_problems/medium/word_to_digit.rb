# get string
# return string
# 
# 
# initialize numbers hash
#   word number => numeric
# convert string to array
# iterate through array - map
#   if word is number
#     return nemeric
#   else
#     retrun word
# join with space

# initialize previous boolean false
# initialize return string
# iterate through split string
#   if a word number
#     change to digit
#     previous = true
# 


NUMBERS = { 'one' => '1', 'two' => '2', 'three' => '3',
            'four' => '4', 'five' => '5', 'six' => '6',
            'seven' => '7', 'eight' => '8', 'nine' => '9',
            'zero' => '0'}

def word_to_digit(str)
  str.split.map do |word|
    alpha_word = word.downcase.delete('^[a-z]')
    if NUMBERS.keys.include?(alpha_word)
      word.delete(alpha_word).prepend(NUMBERS[alpha_word])
    else
      word
    end
  end.join(' ')
end

def word_to_digit!(str)
  NUMBERS.keys.each do |word|
    str.gsub!(/\b#{word}\b/, NUMBERS[word])
  end
  str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
