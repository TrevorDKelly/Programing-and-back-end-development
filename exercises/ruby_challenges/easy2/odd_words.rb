
#
# get string
# return string
#
# given a sentence, return that sentence with all words separated by one space and odd indexed words reversed.
#
# letters not numbers/ special chars
# handling bad imput
# more than one sentence
# what to do if there are more than 20 letters in a row
#
# reverse = false
# last _is space = true
# retru nstring = ''
# reversed word = ''
#
# iterate thu chars.
#   if period
#     add reverse word
#     add period
#     return string
#   if a space
#     next if last was a space
#     reverse = !reverse
#     if not reversed at this point
#       add reversed word to string
#       erase revered word
#     add space to return string
#     last_is_space = true
#   else if reversed word
#     add letter to front of revered word
#   else
#     add letter to end of string
#
#
# check letter
#   if space
#     add t ostring
#     flip reverse

def reverse_odd_words(sentence)
  changed_sentence = ''

  reverse_word = ''
  reversing = false
  last_was_space = true

  sentence.chars.each do |char|
    case char
    when '.'
      char_is_period(changed_sentence, last_was_space, reverse_word)
    when ' '
      char_is_space(reversing, changed_sentence, reverse_word, last_was_space)
      last_was_space = true
      reversing = !reversing
    else
      char_is_letter(reversing, reverse_word, changed_sentence, last_was_space, char)
      last_was_space = false
    end
  end
  changed_sentence
end

def char_is_period(changed_sentence, last_was_space, reverse_word)
  changed_sentence[-1] = '' if last_was_space
  changed_sentence << reverse_word
  changed_sentence << '.'
end

def char_is_space(reversing, changed_sentence, reverse_word, last_was_space)
  return if last_was_space
  if reversing
    changed_sentence << reverse_word
    reverse_word = ''
  end
  changed_sentence << ' '
end

def char_is_letter(reversing, reverse_word, changed_sentence, last_was_space, char)
  if reversing
    reverse_word.prepend(char)
  else
    changed_sentence << char
  end
end

#####################################
#####################################
#####################################

def reverse_odd_word(sentence)

end

iterate thru letters

