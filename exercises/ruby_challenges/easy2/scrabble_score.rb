# have scores chart
# get string
# return int
#
# return the total value of the letters of the given string based on the scoring chart
#
# chart - hash
#   score => [l e t t e r s]
#
# total score = 0
# iterate thru hash
#   count how many letter in the word are in the value array
#     word to chars
#     chars  count { value array include letter }
#   total += score * count
#
# return total

class Scrabble
  LETTER_VALUES = {
    1 => %w(a e i o u l n r s t),
    2 => %w(d g),
    3 => %w(b c m p),
    4 => %w(f h v w y),
    5 => %w(k),
    8 => %w(j x),
    10 => %w(q z)
  }

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.class != String || @word.match(/[^a-zA-Z]/)
    @word.downcase!

    LETTER_VALUES.reduce(0) do |word_score, (value, letters)|
      count = @word.chars.count { |char| letters.include?(char) }
      word_score += (count * value)
    end
  end

  def self.score(word)
    Scrabble.new(word).score
  end
end

