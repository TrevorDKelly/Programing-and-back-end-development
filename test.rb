# palendrome determiner
#
# get string
# return boolean
#
# case insensitive
# ignore non letter chars
#
# ignore non letters
#   ignore as if not there or maintain for spacing
#     "foo1o2of"
#
# gub all non letters w/ ''
# index reference - start to middle with end to middle
#   itereate 0 to half
#     test index v -(index + 1)
#     return false if not the same letter
#
#   return true

LETTERS = ('a'..'z').to_a
def palindrome(string)
  string = string.downcase.chars.select do |char|
             LETTERS.include?(char)
           end
  string = string.join

  (0..(string.size / 2)).each do |index|
    return false unless string[index] == string[-(index + 1)]
  end

  true
end

def pal(s)
  forward = ''
  reverse = ''
  s.downcase.chars.each do |char|
    next unless LETTERS.include?(char)
    forward = forward + char
    reverse = char + reverse
  end
  forward == reverse
end

fail_strings = %w(test abc 1abc a1bccbaa)
pass_strings = %w(testtset 1abba 1b1ab a\ a)

fail_strings.each do |s|
  p s if pal(s)
end

pass_strings.each do |s|
  p s unless pal(s)
end


