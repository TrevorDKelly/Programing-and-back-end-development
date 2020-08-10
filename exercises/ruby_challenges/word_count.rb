class Phrase
  def initialize(string)
    @string = string
  end

  def word_count
    counts = Hash.new(0)
    @string.downcase.split(/[^a-z0-9\']+/) do |word|
      word = remove_quotes(word)
      counts[word] += 1
    end
    counts
  end

  def remove_quotes(string)
    string.sub(/\A(['"])(.+)\1\z/, '\2')
  end
end

# have sentence
# return hash
#
# count the occurences of words in the given string
# return is all lowercase
# numvers are words
# apostrophies incluced
#   this includes words surounded by single quote
# periods and other special chars dont count
#
# include souble quote?
#
# split to words, iterate,
#   if in hash, add 1 to value
#   else add to hash with value of 1
#
