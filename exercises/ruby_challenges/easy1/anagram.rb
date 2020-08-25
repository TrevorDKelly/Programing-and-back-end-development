class Anagram
  def initialize(word)
    @word = word
  end

  def match2(potential_anagrams)
    letters = @word.downcase.split('').sort
    matches = []

    potential_anagrams.each do |potential_anagram|
      next if potential_anagram.downcase == @word.downcase
      potential_letters = potential_anagram.downcase.split('').sort

      matches << potential_anagram if potential_letters == letters
    end
    
    matches
  end

  def match(given_words)
    word_counts = create_counts_hash(@word)
    
    given_words.select do |given|
      next if @word.size != given.size || @word.downcase == given.downcase

      word_counts == create_counts_hash(given)
    end
  end

  def create_counts_hash(word)
    word = word.downcase
    word.chars.each_with_object({}) do |letter, hash|
      hash[letter] = word.count(letter)
    end
  end
end

# have word
# get potential matches
# return array of matches
# 
# dont match with the exact word
# capital leters dont match their lowercase
# return empty array if no matches
# must be same length with exact same letters
# 
# split word to letters an sort
# initailize return array
# iterate thru remaining potential matches
#   next if exact match 
#   split and sort
#   check match with split sorted word
#   add to return array if match
# return array
